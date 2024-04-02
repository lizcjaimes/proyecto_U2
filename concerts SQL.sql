CREATE TABLE fans (
    id_fan SERIAL PRIMARY KEY,
    fan_names VARCHAR(255) NOT NULL,
    surnames VARCHAR(255) NOT NULL,
    age INT,
    concert_genre VARCHAR(255),
    fan_location VARCHAR(255),
    phone VARCHAR(20)
);

CREATE TABLE singers (
    id_singer SERIAL PRIMARY KEY,
    singer_name VARCHAR(255) NOT NULL,
    musical_genre VARCHAR(255) NOT NULL,
	quantity_available INTEGER NOT NULL
);

CREATE TABLE concerts (
    id_concert SERIAL PRIMARY KEY,
    id_fan INTEGER REFERENCES fans(id_fan),
    concert_name VARCHAR(255) NOT NULL,
    concert_date DATE NOT NULL,
    place VARCHAR(255) NOT NULL,
    sold_ticket BOOLEAN NOT NULL DEFAULT FALSE	
);

CREATE TABLE tickets_sold (
    id_concert INTEGER REFERENCES concerts(id_concert),
    id_singer INTEGER REFERENCES singers(id_singer),
    PRIMARY KEY (id_concert, id_singer)
);


INSERT INTO fans (fan_names, surnames, age, concert_genre, fan_location, phone)
VALUES
    ('Estrella de la Luz', 'Trujillo Quijano', 17, 'Pop', 'Cancun, Mexico', '998-488-6632'),
    ('Maria Mercedes', 'Lopez Gonzalez', 19, 'Kpop', 'Campeche, Mexico', '998-199-5544'),
    ('David Byron', 'Cevallos Montero', 20, 'Rock', 'Oaxaca, Mexico', '998-278-6522'),
    ('Luis Gonzalo', 'Balcazar Campoverde', 22, 'Hip hop', 'Chiapas, Mexico', '998-377-3255'),
    ('Noemi Fernanda', 'Campos Mendieta', 21, 'Pop', 'Merida, Mexico', '998-487-2022'),
    ('Jaime Eduardo', 'Cardenas Molina', 25, 'Rock', 'Cancun, Mexico', '998-166-5050'),
    ('Carlos Daniel', 'Novillo Jara', 27, 'Country', 'Monterrey, Mexico', '998-240-7769'),
    ('Johanna Sofia', 'Perez Cabrera', 19, 'Kpop', 'Jalisco, Mexico', '998-326-6041'),
    ('Juan Jose', 'Ortega Vintimilla', 23, 'Pop', 'Monterrey, Mexico', '998-151-1002'),
    ('Diana Lucia', 'Martinez Cepeda', 18, 'Country', 'Mexico City, Mexico', '998-264-5389');

select * from fans;

INSERT INTO singers (singer_name, musical_genre, quantity_available) 
values 
	('Taylor Swift','Country', 5000),
	('Harry Styles','Pop', 2500),
	('(G)-IDLE','Kpop', 1000),
	('Lana del rey','Pop', 4000),
	('Ariana Grande','Pop', 5000),
	('KISS','Rock', 5000),
	('Blackpink','Kpop', 4000),
	('Eminem','Hip hop', 3000);
	
select * from singers;	
	
INSERT INTO concerts(id_fan, concert_name, concert_date, place, sold_ticket)
VALUES
	(1,'The Eras Tour','2024/09/09', 'Foro Sol', true),
	(2,'Sweetener World Tour','2024/09/10', 'Friends Arena', true),
	(4,'Just Me (G)I-dle World Tour','2024/12/01', 'Groupana Stadium', true),
	(5,'Love On Tour','2024/06/29', 'Paris la Défense Arena', true),
	(7,'End of the Road World Tour','2024/05/12', 'Civic Auditorium', false),
	(1,'Lana del Rey Tour','2024/11/09', 'Amsterdam Arena', true);

select * from concerts;

INSERT INTO tickets_sold(id_concert, id_singer)
VALUES
	(1,1),
	(2,5),
	(3,3),
	(4,2);

select * from tickets_sold;