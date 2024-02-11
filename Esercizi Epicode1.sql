create schema Esercizi_Epicode;
create table store 
(codice_store integer not null,
indirizzo_fisico varchar(255),
numero_telefono float (50)
);

ALTER TABLE store
MODIFY COLUMN numero_telefono varchar(255);
-- guardo cosa ho caricato select * from store;
insert into store (codice_store, indirizzo_fisico, numero_telefono) values
(1, 'Via Roma 123, Milano', '+39 02 1234567'),
(2, 'Corso Italia 456, Roma', '+39 06 7654321'),
(3, 'Piazza San Marco 789, Venezia', '+39 041 9876543'),
(4, 'Viale degli Ulivi 234, Napoli', '+39 081 3456789'),
(5, 'Via Torino 567, Torino', '+39 011 8765432'),
(6, 'Corso Vittorio Emanuele 890, Firenze', '+39 055 2345678'),
(7, 'Piazza del Duomo 123, Bologna', '+39 051 8765432'),
(8, 'Via Garibaldi 456, Genova', '+39 041 8765455'),
(9, 'Lungarno Mediceo 789, Pisa', '+39 051 8765789'),
(10, 'Corso Cavour 101, Palermo','+39 051 1536478');

select * from store;
create table impiegato (
codice_fiscale varchar(255),
nome varchar(255),
titolo_di_studio varchar(255),
mail varchar(255)
);

insert into impiegato (codice_fiscale, nome, titolo_di_studio, mail) values
('ABC12345XYZ67890', 'Mario Rossi', 'Laurea in Economia', 'mario.rossi@email.com'),
('DEF67890XYZ12345', 'Anna Verdi', 'Diploma di Ragioneria', 'anna.verdi@email.com'),
('GHI12345XYZ67890', 'Luigi Bianchi', 'Laurea in Informatica', 'luigi.bianchi@email.com'),
('JKL67890XYZ12345', 'Laura Neri', 'Laurea in Lingue', 'laura.neri@email.com'),
('MNO12345XYZ67890', 'Andrea Moretti', 'Diploma di Geometra', 'andrea.moretti@email.com'),
('PQR67890XYZ12345', 'Giulia Ferrara', 'Laurea in Psicologia', 'giulia.ferrara@email.com'),
('STU12345XYZ67890', 'Marco Esposito', 'Diploma di Elettronica', 'marco.esposito@email.com'),
('VWX67890XYZ12345', 'Sara Romano', 'Laurea in Giurisprudenza', 'sara.romano@email.com'),
('YZA12345XYZ67890', 'Roberto De Luca', 'Diploma di Informatica', 'roberto.deluca@email.com'),
('BCD67890XYZ12345', 'Elena Santoro', 'Laurea in Lettere', 'elena.santoro@gmail.com');

select * from impiegato;

create table servizio_impiegato(
codice_fiscale varchar(255) not null,
codice_store integer not null,
data_inizio date,
data_fine date,
carica varchar(255)
);
drop table servizio_impiegato;

create table servizio_impiegato(
codice_fiscale varchar(255) not null,
codice_store integer not null,
data_inizio date,
data_fine date,
carica varchar(255),
unique (codice_fiscale, codice_store, data_inizio)
);

insert into servizio_impiegato (codice_fiscale, codice_store, data_inizio, data_fine, carica) values
('ABC12345XYZ67890', 1, '2023-01-01', '2023-12-31', 'Cassiere'),
('DEF67890XYZ12345', 2, '2023-02-01', '2023-11-30', 'Commesso'),
('GHI12345XYZ67890', 3, '2023-03-01', '2023-10-31', 'Magazziniere'),
('JKL67890XYZ12345', 4, '2023-04-01', '2023-09-30', 'Addetto alle vendite'),
('MNO12345XYZ67890', 5, '2023-05-01', '2023-08-31', 'Addetto alle pulizie'),
('PQR67890XYZ12345', 6, '2023-06-01', '2023-07-31', 'Commesso'),
('STU12345XYZ67890', 7, '2023-07-01', '2023-06-30', 'Commesso'),
('VWX67890XYZ12345', 8, '2023-08-01', '2023-05-31', 'Cassiere'),
('YZA12345XYZ67890', 9, '2023-09-01', '2023-04-30', 'Cassiere'),
('BCD67890XYZ12345', 10, '2023-10-01', '2023-03-31', 'Cassiere');

select * from servizio_impiegato;

create table videogioco(
titolo varchar(255),
sviluppatore varchar(255),
anno_distribuzione date not null,
costo_acquisto int,
genere varchar(255),
unique (titolo)
);
drop table videogioco;

create table videogioco(
titolo varchar(255),
sviluppatore varchar(255),
anno_distribuzione date not null,
costo_acquisto double,
genere varchar(255),
unique (titolo, sviluppatore, anno_distribuzione)
);

insert into videogioco (titolo, sviluppatore, anno_distribuzione, costo_acquisto, genere) values
("Fifa 2023", 'EA Sports', '2023-1-1', 49.99, 'Calcio'),
("Assassin's Creed: Valhalla", 'Ubisoft', '2020-1-1', 59.99, 'Action'),
("Super Mario Odyssey", 'Nintendo', '2017-1-1', 39.99, 'Platform'),
('The Last of Us Part II', 'Naughty Dog', '2020-1-1', 69.99, 'Action'),
('Cyberpunk 2077', 'CD Projekt Red', '2020-1-1', 49.99, 'RPG'),
("Animal Crossing: New Horizons", 'Nintendo', '2020-1-1', 54.99, 'Simulation'),
('Call of Duty: Warzone', 'Nintendo', '2020-1-1', 0.00, 'FPS'),
('The Legend of Zelda: Breath of the Wild', 'Infinity Ward', '2017-1-1', 59.99, 'Action-Adventure'),
('Fortnite', 'Epic Games', '2017-1-1', 0.00, 'Battle Royale'),
('Red Dead Redemption 2', 'Rockstar Games', '2018-1-1', 39.99, 'Action-Adventure');  

select * from videogioco;

update videogioco set costo_acquisto = 64.99 where titolo = 'Animal Crossing: New Horizons'

create table collocazione_videogioco(
ID_C int not null auto_increment primary key,
codice_store int,
titolo varchar(255)
);

insert into collocazione_videogioco(codice_store, titolo) values 
(10, "Fifa 2023"),
(8, "Assassin's Creed: Valhalla"),
(5, "Super Mario Odyssey"),
(7, 'The Last of Us Part II'),
(1, 'Cyberpunk 2077'),
(1, "Animal Crossing: New Horizons"),
(3, 'Call of Duty: Warzone'),
(6, 'The Legend of Zelda: Breath of the Wild'),
(2, 'Fortnite'),
(9, 'Red Dead Redemption 2');

select * from impiegato;

select * from impiegato where titolo_di_studio='Laurea in economia';
select * from servizio_impiegato as S join impiegato as D on S.codice_fiscale=D.codice_fiscale where  S.carica='Cassiere' or D.titolo_di_studio='Diploma in Informatica';
select S.carica, D.nome from servizio_impiegato as S join impiegato as D on S.codice_fiscale=D.codice_fiscale where data_inizio>'2023-01-01';
select distinct nome, titolo_di_studio from impiegato;
select * from impiegato where titolo_di_studio <> 'Laurea in Economia';
select * from servizio_impiegato where carica='Commesso' and data_inizio<'2023-07-01';
select titolo, sviluppatore from videogioco where anno_distribuzione='2020-01-01';
select * from collocazione_videogioco;
select titolo from collocazione_videogioco where ID_C='1' or ID_C='3' and codice_store='5';