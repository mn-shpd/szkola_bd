--1
SELECT D.DzienID, D.NazwaDnia, G.OdKtorejDoKtorej, P.NazwaPrzedmiotu, Z.Sala FROM Zajecia Z JOIN Dzien D ON Z.DzienID = D.DzienID
JOIN Godziny G ON Z.GodzinaID = G.GodzinaID JOIN Przedmioty P ON Z.PrzedmiotID = P.PrzedmiotID
WHERE KlasaID = 1
ORDER BY D.DzienID
GO

--2
SELECT CAST(AVG(CAST(Ocena AS DECIMAL(3,2))) AS DECIMAL(3,2)) FROM Oceny
WHERE UczenID = 1 AND Semestr = 1

--3
SELECT * FROM Uczniowie
WHERE Miejscowosc IN ('Gdansk','Sopot')

--4
SELECT P.NazwaPrzedmiotu, COUNT(O.Ocena) FROM Oceny O JOIN OcenyOpis OO
ON O.Ocena = OO.Ocena JOIN Uczniowie U
ON O.UczenID = U.UczenID JOIN Przedmioty P
ON O.PrzedmiotID = P.PrzedmiotID
WHERE U.KlasaID = 1 AND O.Ocena = 1 AND O.Semestr = 2
GROUP BY P.NazwaPrzedmiotu