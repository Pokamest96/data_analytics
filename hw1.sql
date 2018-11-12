SELECT ('ФИО: Покаместов Александр Игоревич');
CREATE TABLE Persons(
id INT NOT NULL ,
fio TEXT NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE Films(
title TEXT NOT NULL,
id INT NOT NULL ,
country TEXT NOT NULL,
box_office INT NOT NULL,
release_year TIMESTAMP NOT NULL,
PRIMARY KEY(id)
);

INSERT INTO Films VALUES('Alien',1, 'USA',104931801, '1979/10/25');
INSERT INTO Films VALUES('Snatch.',2, 'USA',83557872,'2000/11/28');
INSERT INTO Films VALUES('The Dictator',3, 'USA',179379532,'2012/12/22');
INSERT INTO Films VALUES('Bruno',4, 'USA',138805831,'2009/10/27');
INSERT INTO Films VALUES('Scream',5, 'USA',173046663,'1996/11/30');

INSERT INTO Persons VALUES(1, 'Guy Ritchie');
INSERT INTO Persons VALUES(2, 'Sacha Baron Cohen');

CREATE TABLE Person2Content(
person_id INT NOT NULL ,
film_id INT NOT NULL ,
persontype TEXT NOT NULL,
FOREIGN KEY (person_id) REFERENCES Persons(id),FOREIGN KEY (film_id) REFERENCES Films(id));

INSERT INTO Person2Content VALUES(1,2, 'Director');
INSERT INTO Person2Content VALUES(2,3, 'Actor');
INSERT INTO Person2Content VALUES(2,4, 'Actor');
