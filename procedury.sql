--1. Procedura zamieniajaca podana klase w formacie numerklasy/profil (np. 1A), a zwracajaca ID Klasy, bedacy liczba calkowita.
CREATE PROC P0 (@Klasa NCHAR(2), @KID TINYINT OUT)
AS
DECLARE @Nr TINYINT
DECLARE @Profil NCHAR(1)
SET @Nr = CAST((SELECT LEFT(@Klasa, 1)) AS TINYINT)
SET @Profil = (SELECT RIGHT(@Klasa, 1))

SELECT @KID = KlasaID FROM Klasy WHERE NumerKlasy = @Nr AND ProfilID = @Profil
GO

--2. Procedura otrzymujaca nazwe klasy (w formacie numerklasy/profil np. 1A), a zwracajaca plan lekcji tej klasy na caly tydzien.
-- Uzywa wczesniej zdefiniowanej procedury P0.
CREATE PROC P1 (@Klasa NCHAR(2))
AS
DECLARE @KID TINYINT
EXEC P0 @Klasa, @KID OUT

SELECT D.DzienID, D.NazwaDnia, G.OdKtorejDoKtorej, P.NazwaPrzedmiotu, Z.Sala FROM Zajecia Z JOIN Dzien D ON Z.DzienID = D.DzienID
JOIN Godziny G ON Z.GodzinaID = G.GodzinaID JOIN Przedmioty P ON Z.PrzedmiotID = P.PrzedmiotID
WHERE KlasaID = @KID
ORDER BY D.DzienID
GO

--EXEC P1 '1A'

--3. Procedura otrzymujaca imie, nazwisko, klase (format numerklasy/profil np. 1A), semestr, a zwracajaca oceny z poszczegolnych przedmiotow i srednia do zmiennej podanej jako parametr.
CREATE PROC P2 (@Imie NVARCHAR(15), @Nazwisko NVARCHAR(30), @Klasa NCHAR(2), @Sem TINYINT, @Srednia DECIMAL(3,2) OUT)
AS
DECLARE @KID TINYINT
EXEC P0 @Klasa, @KID OUT

DECLARE @UID INT
SELECT @UID = UczenID FROM Uczniowie
WHERE Imie = @Imie AND Nazwisko = @Nazwisko AND KlasaID = @KID

SELECT P.NazwaPrzedmiotu, O.Ocena FROM Oceny O JOIN Przedmioty P
ON O.PrzedmiotID = P.PrzedmiotID
WHERE O.Semestr = @Sem AND UczenID = @KID

SELECT @Srednia = CAST(AVG(CAST(Ocena AS DECIMAL(3,2))) AS DECIMAL(3,2)) FROM Oceny
WHERE Semestr = @Sem AND UczenID = @KID
GO

--DECLARE @xd DECIMAL(3,2)
--EXEC P2 'Jan','Kowalski','1A',1, @xd OUT
--SELECT @xd

--4. Procedura otrzymujaca identyfikator ucznia - zwracajaca wszystkie dane o nim.
CREATE PROC P3 (@ID INT)
AS
SELECT * FROM Uczniowie
WHERE UczenID = @ID
GO

--EXEC P3 4

--5. Procedura otrzymujaca nazwe przedmiotu, a zwracajaca imie i nazwisko nauczyciela prowadzacego oraz sale, w ktorej odbywaja sie te zajecia.
CREATE PROC P4 (@przedmiot NVARCHAR(50))
AS
SELECT DISTINCT (N.Imie + ' ' + N.Nazwisko) AS 'Imie i nazwisko', Sala FROM Uczy U
JOIN Nauczyciele N ON U.NauczycielID = N.NauczycielID JOIN Przedmioty P
ON U.PrzedmiotID = P.PrzedmiotID JOIN Zajecia Z ON P.PrzedmiotID = Z.PrzedmiotID
WHERE P.NazwaPrzedmiotu = @przedmiot
GO

--EXEC P4 'Biologia'

-- 6. Procedura pobierajaca imie i nazwisko nauczyciela, a zwracajaca w jednym wierszu wszystkie dni i godziny, kiedy odbywaja sie jego zajecia.
CREATE PROC P5 (@imie NVARCHAR(15), @nazwisko NVARCHAR(30))
AS
DECLARE @informacja NVARCHAR(1000)
SET @informacja = ''

SELECT @informacja = @informacja + D.NazwaDnia + ' ' + G.OdKtorejDoKtorej + '; ' FROM Zajecia Z JOIN Uczy U
ON Z.PrzedmiotID = U.PrzedmiotID JOIN Dzien D
ON Z.DzienID = D.DzienID JOIN Godziny G
ON Z.GodzinaID = G.GodzinaID JOIN Nauczyciele N
ON U.NauczycielID = N.NauczycielID
WHERE N.Imie = @imie AND N.Nazwisko = @nazwisko

SELECT @informacja
GO

--EXEC P5 'Alicja','Ciunelis'

--7. Usuwanie ucznia
CREATE PROC P6 (@id INT)
AS
IF EXISTS (SELECT * FROM Uczniowie WHERE UczenID = @id)
BEGIN
	DELETE FROM Uczniowie
	WHERE UczenID = @id
END
ELSE
RAISERROR('Uczen o identyfikatorze %d nie istnieje',1,2, @id)
GO

--EXEC P6 31
--EXEC P6 1

--8. Usuwanie nauczyciela
CREATE PROC P7 (@id INT)
AS
IF EXISTS (SELECT * FROM Nauczyciele WHERE NauczycielID = @id)
BEGIN
	DELETE FROM Nauczyciele
	WHERE NauczycielID = @id
END
ELSE
RAISERROR('Nauczyciel o identyfikatorze %d nie istnieje',1,3,@id)
GO

EXEC P7 1
--EXEC P7 1
