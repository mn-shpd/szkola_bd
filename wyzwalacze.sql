--1. Wyzwalacz na tabeli Uczniowie, ktory po usunieciu danego ucznia kopiuje jego wszystkie oceny do nowoutworzonej tabeli OcenyTemp.
-- Wyzwalacz sprawdza, czy tabela zostala juz utworzona. Jesli nie, tworzy ja. W przeciwnym wypadku od razu przechodzi do kopiowania ocen.
CREATE TRIGGER Tr0 ON Uczniowie
INSTEAD OF DELETE
AS

	IF OBJECT_ID('dbo.OcenyTemp', 'U') IS NULL
		CREATE TABLE OcenyTemp
		(
		PrzedmiotID TINYINT,
		UczenID INT,
		Ocena TINYINT,
		Semestr TINYINT
		);

	INSERT INTO OcenyTemp
	SELECT * FROM Oceny
	WHERE UczenID IN (SELECT UczenID FROM deleted)

	DELETE FROM Uczniowie
	WHERE UczenID IN (SELECT UczenID FROM deleted)

	SELECT * FROM OcenyTemp
GO

--DELETE FROM Uczniowie
--WHERE UczenID IN (12)

--SELECT * FROM Uczniowie
--SELECT * FROM OcenyTemp
--SELECT * FROM Oceny

--2. Wyzwalacz na tabeli Klasy, ktory po usunieciu danej klasy kopiuje jej zajecia z calego tygodnia do nowoutworzonej tabeli ZajeciaTemp.
-- Ponadto, wyzwalacz kopiuje informacje o wszystkich uczniach nalezacych do tej klasy do nowoutworzonej tabeli UczniowieTemp.
-- Wyzwalacz kopiuje rowniez oceny wszystkich usunietych uczniow do tabeli OcenyTemp (wyzwalacz wyzwala inny wyzwalacz - TR0)
CREATE TRIGGER TR1 ON Klasy
INSTEAD OF DELETE
AS
	IF OBJECT_ID('dbo.ZajeciaTemp', 'U') IS NULL
		CREATE TABLE ZajeciaTemp
		(
		DzienID TINYINT,
		GodzinaID TINYINT,
		KlasaID TINYINT,
		PrzedmiotID TINYINT,
		Sala NVARCHAR(3)
		);
	IF OBJECT_ID('dbo.UczniowieTemp', 'U') IS NULL
		CREATE TABLE UczniowieTemp
		(
		UczenID INTEGER,
		Imie NVARCHAR(15),
		Nazwisko NVARCHAR(30),
		KlasaID TINYINT,
		PESEL NVARCHAR(30),
		DataUrodzenia DATE,
		Ulica NVARCHAR(40),
		NrDomu TINYINT,
		KodPocztowy NVARCHAR(6),
		Miejscowosc NVARCHAR(15)
		)

	INSERT INTO ZajeciaTemp
	SELECT * FROM Zajecia
	WHERE KlasaID IN (SELECT KlasaID FROM deleted)

	INSERT INTO UczniowieTemp
	SELECT * FROM Uczniowie
	WHERE KlasaID IN (SELECT KlasaID FROM deleted)

	DELETE FROM Uczniowie
	WHERE KlasaID IN (SELECT KlasaID FROM deleted)

	DELETE FROM Klasy
	WHERE KlasaID IN (SELECT KlasaID FROM deleted)

	SELECT * FROM ZajeciaTemp
	SELECT * FROM UczniowieTemp
GO

--DELETE FROM Klasy
--WHERE KlasaID = 1

--SELECT * FROM Uczniowie
--SELECT * FROM Oceny
--SELECT * FROM Zajecia

--3. Wyzwalacz na tabeli Dzien, ktory w momencie proby usuniecia z niej danych informuje o braku takiej mozliwosci wraz z wyjasnieniem.
CREATE TRIGGER TR2 ON Dzien
INSTEAD OF DELETE
AS
RAISERROR('Nie wolno usuwac danych z tabeli Dzien, poniewaz klucz glowny tej tabeli stanowi klucz obcy w tabeli Zajecia.', 5, 1)
GO

--DELETE FROM Dzien
--WHERE DzienID = 1

--4. Wyzwalacz na tabeli Profile, ktory po wstawieniu wierszy do tej tabeli wyswietla komunikat o identifykatorze i nazwie dodanego profilu oraz podpowiada, co nalezy zrobic dalej.
CREATE TRIGGER TR3 ON Profile
AFTER INSERT
AS
DECLARE @pid NCHAR(1)
DECLARE @nazwa VARCHAR(50)

SELECT @pid = ProfilID FROM inserted
SELECT @nazwa = NazwaProfilu FROM inserted

PRINT('Po dodaniu nowego profilu ' + @pid + ' o nazwie ' + @nazwa + ' nalezy zdefiniowac nowa klase w tabeli Klasy!')
GO

--INSERT INTO Profile VALUES
--('D', 'chemiczny')

--5. Wyzwalacz na tabeli Uczniowie, ktory po zaktualizowaniu danych ucznia wyswietla informacje o tym, ktore dane zostaly zmienione.
-- Ze wzgledu na fakt, ze instrukcje UPDATE mozna wykonac dla wielu wierszy konieczne jest przekopiowanie zaktualizowanych danych do
-- nowej tabeli z dodatkowym "kluczem glownym", ktory pozwala na iterowanie po poszczegolnych wierszach.
CREATE TRIGGER TR4 ON Uczniowie
AFTER UPDATE
AS

SET NOCOUNT ON

CREATE TABLE #temp
(
id INT IDENTITY(1,1),
UczenID INTEGER,
Imie NVARCHAR(15),
Nazwisko NVARCHAR(30),
KlasaID TINYINT,
PESEL NVARCHAR(30),
DataUrodzenia DATE,
Ulica NVARCHAR(40),
NrDomu TINYINT,
KodPocztowy NVARCHAR(6),
Miejscowosc NVARCHAR(15)
)

INSERT INTO #temp
SELECT * FROM inserted

DECLARE @id INT
SET @id = (SELECT TOP 1 id FROM #temp ORDER BY id)

DECLARE @uid INT
WHILE EXISTS (SELECT * FROM #temp WHERE id = @id)
BEGIN
	SET @uid = (SELECT UczenID FROM #temp WHERE id = @id)
	PRINT('Dla ucznia o ID: ' + CAST(@uid AS VARCHAR(1000)) + ' zaktualizowano nastepujace pozycje:')
	IF (SELECT UczenID FROM deleted WHERE UczenID = @uid) != (SELECT UczenID FROM inserted WHERE UczenID = @uid)
	PRINT(' UczenID ');
	IF (SELECT Imie FROM deleted WHERE UczenID = @uid) != (SELECT Imie FROM inserted WHERE UczenID = @uid)
	PRINT(' Imie ');
	IF (SELECT Nazwisko FROM deleted WHERE UczenID = @uid) != (SELECT Nazwisko FROM inserted WHERE UczenID = @uid)
	PRINT(' Nazwisko ');
	IF (SELECT KlasaID FROM deleted WHERE UczenID = @uid) != (SELECT KlasaID FROM inserted WHERE UczenID = @uid)
	PRINT(' KlasaID ');
	IF (SELECT PESEL FROM deleted WHERE UczenID = @uid) != (SELECT PESEL FROM inserted WHERE UczenID = @uid)
	PRINT(' PESEL ');
	IF (SELECT DataUrodzenia FROM deleted WHERE UczenID = @uid) != (SELECT DataUrodzenia FROM inserted WHERE UczenID = @uid)
	PRINT(' DataUrodzenia ');
	IF (SELECT Ulica FROM deleted WHERE UczenID = @uid) != (SELECT Ulica FROM inserted WHERE UczenID = @uid)
	PRINT(' Ulica ');
	IF (SELECT NrDomu FROM deleted WHERE UczenID = @uid) != (SELECT NrDomu FROM inserted WHERE UczenID = @uid)
	PRINT(' NrDomu ');
	IF (SELECT KodPocztowy FROM deleted WHERE UczenID = @uid) != (SELECT KodPocztowy FROM inserted WHERE UczenID = @uid)
	PRINT(' KodPocztowy ');
	IF (SELECT Miejscowosc FROM deleted WHERE UczenID = @uid) != (SELECT Miejscowosc FROM inserted WHERE UczenID = @uid)
	PRINT(' Miejscowosc ');
	
	SET @id = @id + 1
END
SET NOCOUNT OFF
GO

--UPDATE Uczniowie
--SET Miejscowosc = 'Lublinek', Imie = 'Waclaw'
--WHERE UczenID IN (7,8)