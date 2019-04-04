use Szkola
---------WIDOKI----------

--1. Srednie ocen wszystkich uczniow dla semestru pierwszego
CREATE VIEW SrednieOcen_1
AS
SELECT UczenID, CAST(AVG(CAST(Ocena AS DECIMAL(3,2))) AS DECIMAL(3,2)) AS Srednia FROM Oceny
WHERE Semestr = 1
GROUP BY UczenID

--SELECT * FROM SrednieOcen_1

--2. Srednie ocen wszystkich uczniow dla semestru drugiego
CREATE VIEW SrednieOcen_2
AS
SELECT UczenID, CAST(AVG(CAST(Ocena AS DECIMAL(3,2))) AS DECIMAL(3,2)) AS Srednia FROM Oceny
WHERE Semestr = 2
GROUP BY UczenID

--SELECT * FROM SrednieOcen_2

--3. Uczniowie, ktorzy maja w drugim semestrze srednia ocen wyzsza niz pierwszym
CREATE VIEW UczniowieProgres
AS
SELECT A.UczenID, (U.Imie + ' ' + U.Nazwisko) AS 'Imie i nazwisko', (CAST(K.NumerKlasy AS NCHAR(1)) + K.ProfilID) AS Klasa
FROM SrednieOcen_2 A JOIN Uczniowie U
ON A.UczenID = U.UczenID
JOIN Klasy K ON U.KlasaID = K.KlasaID
WHERE A.Srednia > (SELECT B.Srednia FROM SrednieOcen_1 B WHERE B.UczenID = A.UczenID)

--SELECT * FROM UczniowieProgres

--4. Liczba uczniow pochodzacych z poszczegolnych miejscowosci
CREATE VIEW LiczbaUczniow_Miejscowosc
AS
SELECT Miejscowosc, COUNT(*) AS LiczbaUczniow FROM Uczniowie
GROUP BY Miejscowosc

--SELECT * FROM LiczbaUczniow_Miejscowosc

--5. Statystyka prezentujaca liczbe wystawionych ocen niedostatecznych w podziale na dwa semestry
CREATE VIEW LiczbaJedynek
AS
SELECT Semestr, COUNT(*) AS LiczbaJedynek FROM Oceny
WHERE Ocena = 1
GROUP BY Semestr

--SELECT * FROM LiczbaJedynek

--6. Statystyka prezentujaca informacje o uczniach i przedmiotach, z ktorych wychodzi im negatywna ocena caloroczna
CREATE VIEW Uczniowie_NDST
AS
SELECT O.UczenID, (U.Imie + ' ' + U.Nazwisko) AS 'Imie i nazwisko', (CAST(K.NumerKlasy AS NCHAR(1)) + K.ProfilID) AS Klasa, P.NazwaPrzedmiotu
FROM Oceny O JOIN Uczniowie U ON O.UczenID = U.UczenID
JOIN Przedmioty P ON O.PrzedmiotID = P.PrzedmiotID
JOIN Klasy K ON U.KlasaID = K.KlasaID
WHERE (SELECT AVG(Ocena) FROM Oceny WHERE UczenID = O.UczenID AND PrzedmiotID = O.PrzedmiotID) = 1

--SELECT * FROM Uczniowie_NDST

--7. Statystyka prezentujaca informacje o uczniach i przedmiotach, z ktorych otrzymali oni ocene niedostateczna
--w pierwszym semestrze, a w nastepnym nie poprawili sie na tyle, aby uzyskac pozytywna ocene caloroczna.
CREATE VIEW Uczniowie_Brak_Poprawy
AS
SELECT O.UczenID, (U.Imie + ' ' + U.Nazwisko) AS 'Imie i nazwisko', (CAST(K.NumerKlasy AS NCHAR(1)) + K.ProfilID) AS Klasa, P.NazwaPrzedmiotu
FROM Oceny O JOIN Uczniowie U ON O.UczenID = U.UczenID
JOIN Przedmioty P ON O.PrzedmiotID = P.PrzedmiotID
JOIN Klasy K ON U.KlasaID = K.KlasaID
WHERE O.Ocena = 1 AND Semestr = 1 AND EXISTS (SELECT * FROM Oceny WHERE UczenID = O.UczenID AND PrzedmiotID = O.PrzedmiotID AND Semestr = 2 AND Ocena < 3)

--SELECT * FROM Uczniowie_Brak_Poprawy
--ORDER BY UczenID

--8. Statystyka prezentujaca informacje o 10 najlepszych uczniach (majacych najlepsze srednie w calej w szkole w drugim semestrze)
CREATE VIEW Najlepsza10
AS
SELECT TOP 10 U.Imie, U.Nazwisko, (CAST(K.NumerKlasy AS NCHAR(1)) + K.ProfilID) AS Klasa, S.Srednia
FROM SrednieOcen_2 S JOIN Uczniowie U
ON S.UczenID = U.UczenID JOIN Klasy K ON U.KlasaID = K.KlasaID
ORDER BY S.Srednia DESC

--SELECT * FROM Najlepsza10

--9. Ranking klas w szkole - informacje o klasie, profilu i lacznej sredniej wszystkich uczniow w poszczegolnych klasach.
CREATE VIEW Ranking
AS
SELECT (CAST(K.NumerKlasy AS NCHAR(1))+K.ProfilID) AS Klasa, P.NazwaProfilu, AVG(Srednia) SredniaKlasy FROM SrednieOcen_2 S JOIN Uczniowie U
ON S.UczenID = U.UczenID JOIN Klasy K ON U.KlasaID = K.KlasaID
JOIN Profile P ON K.ProfilID = P.ProfilID
GROUP BY (CAST(K.NumerKlasy AS NCHAR(1))+K.ProfilID), P.NazwaProfilu

--SELECT * FROM Ranking

--10. Informacje o ilosci zajec odbywajacych sie w tygodniu w podziale na konkretne przedmioty.
CREATE VIEW IleZajecWTygodniu
AS
SELECT NazwaPrzedmiotu, COUNT(*) AS IloscZajec FROM Zajecia Z JOIN Przedmioty P
ON Z.PrzedmiotID = P.PrzedmiotID
GROUP BY NazwaPrzedmiotu

--SELECT * FROM IleZajecWTygodniu
--ORDER BY IloscZajec
