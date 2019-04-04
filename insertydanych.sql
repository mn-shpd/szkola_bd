use Szkola

INSERT INTO Profile VALUES
('A', 'Humanistyczny'),
('B', 'Matematyczno-fizyczny')

INSERT INTO Klasy VALUES
(1, 'A'),
(1, 'B'),
(2, 'A'),
(2, 'B'),
(3, 'A'),
(3, 'B')

INSERT INTO Uczniowie VALUES
('Jan','Kowalski', 1, '95020403876', '1995-02-04', 'Kochanowskiego', 50, '80-402', 'Gdansk'),
('Marcin','Szczucki', 1, '95031208764', '1995-03-31', 'Grunwaldzka', 42, '80-430', 'Gdansk'),
('Ewelina','Makowiecka', 1, '94022003876', '1995-02-20', 'Dzielna', 12, '50-502', 'Sopot'),
('Katarzyna','Nosowska', 1, '95092005534', '1995-09-20', 'Biala', 4, '80-200', 'Gdansk'),
('Wojciech','Zorawski', 1, '95120905344', '1995-12-09', 'Polska', 21, '80-190', 'Gdynia'),
('Kamil','Nowy', 2, '95040555534', '1995-04-05', 'Mala', 50, '80-230', 'Gdansk'),
('Jan','Bielski', 2, '95081533334', '1995-08-15', 'Duza', 80, '50-239', 'Sopot'),
('Magdalena','Wrzosk', 2, '95013029534', '1995-01-30', 'Brytyjska', 50, '80-555', 'Gdansk'),
('Patryk','Wojcik', 2, '95110705324', '1995-11-07', 'Malownicza', 22, '50-666', 'Sopot'),
('Natalia','Kowalska', 2, '95052305534', '1995-05-23', 'Sembrzyckiego', 15, '80-012', 'Gdansk'),
('Marta','Pewna', 3, '94042005034', '1994-04-20', 'Drzewna', 23, '80-902', 'Gdansk'),
('Szymon','Szary', 3, '94063005834', '1994-06-30', 'Istna', 2, '80-304', 'Gdansk'),
('Wojciech','Solidny', 3, '94071505224', '1994-07-15', 'Warszawska', 18, '50-111', 'Sopot'),
('Jadwiga','Pastuszka', 3, '94083005134', '1994-08-30', 'Marszalkowska', 12, '50-521', 'Sopot'),
('Natalia','Niepewna', 3, '94062398765', '1994-06-23', 'Mokotowska', 23, '80-333', 'Gdansk'),
('Jacek','Rzodkiewicz', 4, '94122005134', '1994-12-20', 'Znana', 80, '80-354', 'Gdansk'),
('Tomasz','Rzodkiewicz', 4, '94122005144', '1994-12-20', 'Znana', 80, '80-354', 'Gdansk'),
('Pawel','Maslany', 4, '94102405664', '1994-10-24', 'Zawodna', 4, '50-121', 'Sopot'),
('Franciszek','Mazur', 4, '94031705254', '1994-03-17', 'Mickiewicza', 66, '80-904', 'Gdansk'),
('Paulina','Brzoza', 4, '94071505511', '1994-07-15', 'Ustrojowa', 100, '20-555', 'Gdynia'),
('Krzysztof','Lewandowski', 5, '93011905302', '1993-01-19', 'Piwna', 42, '80-708', 'Gdansk'),
('Maurycy','Piecewski', 5, '93112905311', '1993-11-29', 'Ogarna', 50, '20-321', 'Gdynia'),
('Monika','Czarna', 5, '93032203432', '1993-03-22', 'Piwna', 21, '80-999', 'Gdansk'),
('Ewelina','Jakubowska', 5, '93050302752', '1993-05-03', 'Oparta', 78, '50-708', 'Sopot'),
('Daniel','Majewski', 5, '93022801112', '1993-02-28', 'Piastowska', 100, '80-502', 'Gdansk'),
('Szymon','Zberezny', 6, '93111804471', '1993-11-18', 'Nowowiejska', 80, '20-222', 'Gdynia'),
('Krzysztof','Zawodny', 6, '93062003331', '1993-06-20', 'Miejska', 120, '20-521', 'Gdynia'),
('Matylda','Wierna', 6, '93011702411', '1993-01-17', 'Serowa', 5, '20-452', 'Gdynia'),
('Filip','Marudny', 6, '93032703331', '1993-03-27', 'Nowowiejska', 8, '80-372', 'Gdansk'),
('Aleksandra','Nasza', 6, '93040403331', '1993-04-04', 'Staropolska', 7, '80-144', 'Gdansk')

INSERT INTO Nauczyciele VALUES
('Franciszek','Brzozowski','60021690888', '1960-02-16'), --1
('Alicja','Ciunelis','55031790111', '1955-03-17'), -- 2
('Anna','Chojecka','70071590212', '1970-07-15'), -- 3
('Dariusz','Bujak','60021690888', '1960-02-16'), -- 4
('Anna','Dmitruk','60071990171', '1960-07-19'), -- 5
('Agnieszka','Kubinska','63051490248', '1963-05-14'), -- 6
('Pawel','Drobisz','79041990158', '1979-04-19'), --7
('Wioletta','Ewartowska','70111477321', '1970-11-14'), --8
('Iwona','Gesek','79120155555','1979-12-01'), --9
('Rafal','Grzebyk','77090790523', '1977-09-07'), --10
('Iwona','Jakimowicz','77031491218', '1977-03-14'), --- 11
('Ewa','Legucka','79061788554', '1979-06-17'), ---12
('Jolanta','Vetter','68080156291', '1968-08-01'), ---13
('Monika','Szczepanska','78041890221', '1978-04-18') --14

INSERT INTO Przedmioty VALUES
('Jezyk polski'),
('Matematyka'),
('Biologia'),
('Chemia'),
('Wychowanie fizyczne'),
('Jezyk niemiecki'),
('Fizyka'),
('Religia'),
('Jezyk angielski'),
('Historia'),
('Geografia'),
('Podstawy przedsiebiorczosci'),
('Wiedza o kulturze'),
('Informatyka')

INSERT INTO Uczy VALUES
(1, 9), (2, 5), (3, 2), (4, 3), (5, 7), (6, 6),
(7, 8), (8, 10), (9, 11), (10, 1), (11, 12), (12, 14),
(13, 13), (14, 4)

INSERT INTO Dzien VALUES
('Poniedzialek'),
('Wtorek'),
('Sroda'),
('Czwartek'),
('Piatek')

INSERT INTO Godziny VALUES
('8:00-8:45'),
('8:50-9:35'),
('9:40-10:25'),
('10:40-11:25'),
('11:30-12:15'),
('12:20-13:05'),
('13:10-13:55'),
('14:00-14:45')

INSERT INTO Zajecia VALUES
(1, 1, 1, 1, 101), (1, 2, 1, 2, 107), (1, 3, 1, 3, 108), (1, 4, 1, 4, 102),
(1, 1, 2, 2, 107), (1, 2, 2, 1, 101), (1, 3, 2, 4, 102), (1, 4, 2, 3, 108),
(1, 1, 3, 5, 15), (1, 2, 3, 6, 221), (1, 3, 3, 7, 222), (1, 4, 3, 8, 229),
(1, 1, 4, 6, 221), (1, 2, 4, 5, 15), (1, 3, 4, 8, 229), (1, 4, 4, 7, 222),
(1, 1, 5, 9, 321), (1, 2, 5, 10, 333), (1, 3, 5, 11, 343), (1, 4, 5, 12, 350),
(1, 1, 6, 10, 353), (1, 2, 6, 9, 321), (1, 3, 6, 12, 350), (1, 4, 6, 11, 343),

(2, 2, 1, 5, 15), (2, 3, 1, 6, 221), (2, 4, 1, 7, 222), (2, 5, 1, 8, 229),
(2, 2, 2, 6, 221), (2, 3, 2, 5, 15), (2, 4, 2, 8, 229), (2, 5, 2, 7, 222),
(2, 2, 3, 9, 321), (2, 3, 3, 10, 333), (2, 4, 3, 11, 343), (2, 5, 3, 12, 350),
(2, 2, 4, 10, 333), (2, 3, 4, 9, 321), (2, 4, 4, 12, 350), (2, 5, 4, 11, 343),
(2, 2, 5, 13, 55), (2, 3, 5, 14, 56), (2, 4, 5, 1, 101), (2, 5, 5, 2, 107),
(2, 2, 6, 14, 56), (2, 3, 6, 13, 55), (2, 4, 6, 2, 107), (2, 5, 6, 1, 101),

(3, 3, 1, 9, 321), (3, 4, 1, 10, 333), (3, 5, 1, 11, 343), (3, 6, 1, 12, 350),
(3, 3, 2, 10, 333), (3, 4, 2, 9, 321), (3, 5, 2, 12, 350), (3, 6, 2, 11, 343),
(3, 3, 3, 13, 55), (3, 4, 3, 14, 56), (3, 5, 3, 1, 101), (3, 6, 3, 2, 107),
(3, 3, 4, 14, 56), (3, 4, 4, 13, 55), (3, 5, 4, 2, 107), (3, 6, 4, 1, 101),
(3, 3, 5, 3, 108), (3, 4, 5, 4, 102), (3, 5, 5, 5, 15), (3, 6, 5, 6, 221),
(3, 3, 6, 4, 102), (3, 4, 6, 3, 108), (3, 5, 6, 6, 221), (3, 6, 6, 5, 15),

(4, 4, 1, 13, 55), (4, 5, 1, 14, 56), (4, 6, 1, 1, 101), (4, 7, 1, 2, 107),
(4, 4, 2, 14, 56), (4, 5, 2, 13, 55), (4, 6, 2, 2, 107), (4, 7, 2, 1, 101),
(4, 4, 3, 3, 108), (4, 5, 3, 4, 102), (4, 6, 3, 5, 15), (4, 7, 3, 6, 221),
(4, 4, 4, 4, 102), (4, 5, 4, 3, 108), (4, 6, 4, 6, 221), (4, 7, 4, 5, 15),
(4, 4, 5, 7, 222), (4, 5, 5, 8, 229), (4, 6, 5, 9, 321), (4, 7, 5, 10, 333),
(4, 4, 6, 8, 229), (4, 5, 6, 7, 222), (4, 6, 6, 10, 333), (4, 7, 6, 9, 321),

(5, 5, 1, 3, 108), (5, 6, 1, 4, 102), (5, 7, 1, 5, 15), (5, 8, 1, 6, 221),
(5, 5, 2, 4, 102), (5, 6, 2, 3, 108), (5, 7, 2, 6, 221), (5, 8, 2, 5, 15),
(5, 5, 3, 7, 222), (5, 6, 3, 8, 229), (5, 7, 3, 10, 333), (5, 8, 3, 11, 343),
(5, 5, 4, 8, 229), (5, 6, 4, 7, 222), (5, 7, 4, 11, 343), (5, 8, 4, 10, 333),
(5, 5, 5, 11, 343), (5, 6, 5, 12, 350), (5, 7, 5, 13, 55), (5, 8, 5, 14, 56),
(5, 5, 6, 12, 350), (5, 6, 6, 11, 343), (5, 7, 6, 14, 56), (5, 8, 6, 13, 55)

INSERT INTO OcenyOpis VALUES
('Niedostateczny'),
('Dopuszczajacy'),
('Dostateczny'),
('Dobry'),
('Bardzo dobry'),
('Celujacy')

------ Generowanie ocen z 14 przedmiotow dla kazdego ucznia z uwzglednieniem podzialu na dwa semestry

DECLARE @uczenid INT
SET @uczenid = 1
DECLARE @przedmiotid INT
SET @przedmiotid = 1
DECLARE @ocena INT

WHILE (SELECT @uczenid) != 31
BEGIN
	WHILE (SELECT @przedmiotid) != 15
	BEGIN
		SELECT @ocena = 1 + ABS(Checksum(NewID()) % 6)
		INSERT INTO Oceny VALUES
		(@przedmiotid, @uczenid, @ocena, 1)
		SET @przedmiotid = @przedmiotid + 1
	END
	SET @przedmiotid = 1
	SET @uczenid = @uczenid + 1
END

SET @uczenid = 1

WHILE (SELECT @uczenid) != 31
BEGIN
	WHILE (SELECT @przedmiotid) != 15
	BEGIN
		SELECT @ocena = 1 + ABS(Checksum(NewID()) % 6)
		INSERT INTO Oceny VALUES
		(@przedmiotid, @uczenid, @ocena, 2)
		SET @przedmiotid = @przedmiotid + 1
	END
	SET @przedmiotid = 1
	SET @uczenid = @uczenid + 1
END

