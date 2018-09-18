-- Morando Nicolò
-- Student Example

CREATE TABLE Studente (
    Matricola INTEGER PRIMARY KEY, 
    Cognome CHAR(20), 
    Nome CHAR(20), 
    Sesso CHAR(1),
    Provincia CHAR(20),
    DataDiNascita CHAR(20),
    Classe CHAR(1),
    Sezione CHAR(2)
);

CREATE TABLE Aula (
    CodAula CHAR(4) PRIMARY KEY,
    Classe CHAR(1),
    Sezione CHAR(20)
);


-- INSERT IN STUDENT TABLE
INSERT INTO Studente VALUES (01, 'Vladmir', 'Putin', 'M', 'Mosca', '2000', '5', 'FF'); 
INSERT INTO Studente VALUES (02, 'Tony', 'Marpione', 'M', 'Verona', '2000', '5', 'FF'); 
INSERT INTO Studente VALUES (03, 'Nikola', 'Vito', 'M', 'Vicenza', '2000', '5', 'FE'); 
INSERT INTO Studente VALUES (04, 'Antonucci', 'Erica', 'F', 'Genova', '2000', '5', 'FF'); 
INSERT INTO Studente VALUES (05, 'Sasso', 'Riccardo', 'M', 'Verona', '1999', '4', 'EI'); 

SELECT * FROM Studente WHERE Classe LIKE '5';


-- INSERT IN AULA TABLE
INSERT INTO Aula VALUES ('L142', '5', 'FF');
INSERT INTO Aula VALUES ('L147', '5', 'FE');
INSERT INTO Aula VALUES ('L148', '4', 'EI');

-- STUDENT FOR CITY
SELECT * FROM Studente S JOIN Aula a ON(S.Classe = a.Classe and S.Sezione = A.Sezione) WHERE CodAula = 'L142' and Provincia = 'Verona';

-- NUMBER OF STUDENTS FOR CITY
CREATE VIEW pStud as SELECT Provincia, COUNT(*) as nStud FROM Studente GROUP BY Provincia;
CREATE VIEW numMax as SELECT MAX(nStud) as maximum = nStud;
SELECT Provincia FROM pStud INNER JOIN numMax on maximum = nStud;

-- NUMBER OF MALE STUDENT BORN IN 1999
SELECT * FROM Studente WHERE Classe = '4' and Sesso = 'M' and DataDiNascita = '1999';