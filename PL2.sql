\pset pager off
DROP TABLE Actores;
DROP TABLE Caratulas;
DROP TABLE Personal;
DROP TABLE Directores;
DROP TABLE Guionistas_Peliculas;
DROP TABLE Peliculas;
DROP TABLE Guionizan;
DROP TABLE Actuan;
DROP TABLE Alojadas;
DROP TABLE Genero;

DELETE FROM Actores;
DELETE FROM Caratulas;
DELETE FROM Criticas;
DELETE FROM Directores;
DELETE FROM Guionista;
DELETE FROM Peliculas;
DELETE FROM Actores_Intermedio;
DELETE FROM Caratulas_Intermedio;
DELETE FROM Criticas_Intermedio;
DELETE FROM Directores_Peliculas_Intermedio;
DELETE FROM Guionistas_Peliculas_Intermedio;
DELETE FROM Peliculas_Intermedio;

CREATE TABLE if not exists Personal (
    Nombre VARCHAR(100) PRIMARY KEY,
    Anio_Nacimiento INT,
    Anio_Muerte INT
);

CREATE TABLE IF NOT EXISTS Directores (
    Nombre_Director VARCHAR(100) PRIMARY KEY,
    Titulo_Pelicula VARCHAR(100),
    Anio_Pelicula INT,
    Anio_Nacimiento INT, 
    Anio_Muerte INT,
    FOREIGN KEY(Titulo_Pelicula) REFERENCES Peliculas(Titulo)
);

CREATE TABLE if NOT EXISTS Actores (
    anio_pelicula INT,
    Titulo_Pelicula VARCHAR(100),
    nombre_actor VARCHAR(100) PRIMARY KEY,
    Anio_Nacimiento INT,
    Anio_Muerte INT,
    Papel VARCHAR(100),
    FOREIGN KEY(Titulo_Pelicula) REFERENCES Peliculas(Titulo)
);

CREATE TABLE if not exists Guionistas_Peliculas (
    Nombre_Guionista VARCHAR(100) PRIMARY KEY,
    Titulo_Pelicula VARCHAR(100),
    Anio_Pelicula INT,
    FOREIGN KEY(Titulo_Pelicula) REFERENCES Peliculas(Titulo)
);

CREATE TABLE IF NOT EXISTS Peliculas (
    Titulo VARCHAR(255) PRIMARY KEY,
    Idioma VARCHAR(50),
    Calificacion_MPA VARCHAR(10),
    Anio INT,
    Duracion INT,
    FOREIGN KEY (Nombre_Director) REFERENCES Personal(Nombre)
);

CREATE TABLE if not exists Criticas (
    Critico VARCHAR(100) PRIMARY KEY,
    Titulo_Pelicula VARCHAR(255),
    Texto VARCHAR(255),
    Puntuacion INT,
    Anio_Pelicula INT,
    URL_PaginaWeb VARCHAR(255),
    FOREIGN KEY (Titulo_Pelicula) REFERENCES Peliculas(Titulo),
    FOREIGN KEY (URL_PaginaWeb) REFERENCES PaginaWeb(URL)
);

CREATE TABLE if not exists PaginaWeb (
    URL VARCHAR(255) PRIMARY KEY,
    Tipo VARCHAR(50),
    Titulo_Pelicula VARCHAR(255),
    FOREIGN KEY (Titulo_Pelicula) REFERENCES Peliculas(Titulo)
);

CREATE TABLE if not exists Caratulas (
    Anio_Pelicula INT,
    Titulo_Pelicula VARCHAR(255),
    titulo_anio VARCHAR(100),
    Nombre VARCHAR(255) PRIMARY KEY,
    URL_PaginaWeb VARCHAR(255),
    Tamanio VARCHAR(100),
    FOREIGN KEY (Titulo_Pelicula) REFERENCES Peliculas(Titulo),
    FOREIGN KEY (URL_PaginaWeb) REFERENCES PaginaWeb(URL)
);

CREATE TABLE if not exists Guionizan (
    Nombre_Guionista VARCHAR(100),
    Titulo_Pelicula VARCHAR(255),
    Anio_Pelicula INT,
    PRIMARY KEY (Nombre_Guionista, Titulo_Pelicula),
    FOREIGN KEY (Titulo_Pelicula) REFERENCES Peliculas(Titulo)
);

CREATE TABLE if not exists Actuan (
    Nombre_Actor VARCHAR(100),
    Papel VARCHAR(100),
    Titulo_Pelicula VARCHAR(255),
    Anio_Pelicula INT,
    PRIMARY KEY (Nombre_Actor, Titulo_Pelicula),
    FOREIGN KEY (Titulo_Pelicula) REFERENCES Peliculas(Titulo)
);

CREATE TABLE if not exists Alojadas (
    Nombre_Caratula VARCHAR(255),
    Titulo_Pelicula VARCHAR(255),
    Anio_Pelicula INT,
    URL_PaginaWeb VARCHAR(255),
    Fecha DATE,
    PRIMARY KEY (Nombre_Caratula, Titulo_Pelicula, URL_PaginaWeb),
    FOREIGN KEY (Titulo_Pelicula) REFERENCES Peliculas(Titulo),
    FOREIGN KEY (URL_PaginaWeb) REFERENCES PaginaWeb(URL)
);

CREATE TABLE if not exists Generos (
    Genero VARCHAR(50),
    Anio_Pelicula INT,
    Titulo_Pelicula VARCHAR(255),
    PRIMARY KEY (Titulo_Pelicula),
    FOREIGN KEY (Titulo_Pelicula) REFERENCES Peliculas(Titulo)
);

-- Copiar datos
CREATE TABLE if not exists Actores_Intermedio (
    anio_pelicula TEXT,
    Titulo_Pelicula TEXT,
    nombre_actor TEXT,
    Anio_Nacimiento TEXT,
    Anio_Muerte TEXT,
    Papel TEXT
);

CREATE TABLE if not exists Caratulas_Intermedio (
    Anio_Pelicula TEXT,
    Titulo_Pelicula TEXT,
    titulo_anio TEXT,
    Nombre TEXT,    
    URL_PaginaWeb TEXT,
    Tamanio TEXT
);

CREATE TABLE if not exists Criticas_Intermedio (
    Anio_Pelicula TEXT,
    Titulo_Pelicula TEXT,
    Titulo_Anio TEXT,
    Critico TEXT,
    Puntuacion TEXT,
    Texto TEXT,
    URL_PaginaWeb TEXT
);

CREATE TABLE if not exists Directores_Peliculas_Intermedio (
    Anio_Pelicula TEXT,
    Titulo_Pelicula TEXT,
    Nombre_Director TEXT,
    Anio_Nacimiento TEXT,
    Anio_Muerte TEXT
);

CREATE TABLE IF NOT EXISTS Guionistas_Peliculas_Intermedio (
    Anio_Pelicula TEXT,
    Titulo_Pelicula TEXT,
    Nombre_Guionista TEXT,
    Anio_Nacimiento TEXT,
    Anio_Muerte TEXT
);


CREATE TABLE if not exists Peliculas_Intermedio (
    Anio TEXT,
    Titulo TEXT,
    Tipo TEXT,
    Idioma TEXT,
    Duracion TEXT,
    Calificacion_MPA TEXT
);

\COPY Actores_Intermedio FROM '/Users/juancartagena/Desktop/Uah/Bases_Datos/Laboratorio/actores_peliculas.csv' WITH CSV DELIMITER E'\t';
\COPY Caratulas_Intermedio FROM '/Users/juancartagena/Desktop/Uah/Bases_Datos/Laboratorio/caratulas.csv' WITH CSV DELIMITER E'\t';
\COPY Criticas_Intermedio FROM '/Users/juancartagena/Desktop/Uah/Bases_Datos/Laboratorio/criticas.csv' WITH CSV DELIMITER E'\t';
\COPY Directores_Peliculas_Intermedio FROM '/Users/juancartagena/Desktop/Uah/Bases_Datos/Laboratorio/directores_peliculas.csv' WITH CSV DELIMITER E'\t';
\COPY Guionistas_Peliculas_Intermedio FROM '/Users/juancartagena/Desktop/Uah/Bases_Datos/Laboratorio/guionistas_peliculas.csv' WITH CSV DELIMITER E'\t';
\COPY Peliculas_Intermedio FROM '/Users/juancartagena/Desktop/Uah/Bases_Datos/Laboratorio/peliculas.csv' WITH CSV DELIMITER E'\t';

SELECT * FROM Actores;
SELECT * FROM Caratulas_Intermedio;
SELECT * FROM Directores_Peliculas_Intermedio;
SELECT * FROM Guionistas_Peliculas;
SELECT * FROM Peliculas_Intermedio;

INSERT INTO Actores (anio_pelicula, Titulo_Pelicula, nombre_actor, Anio_Nacimiento, Anio_Muerte, Papel)
SELECT CAST(anio_pelicula AS INTEGER), Titulo_Pelicula, nombre_actor, CAST(Anio_Nacimiento AS INTEGER), CAST(Anio_Muerte AS INTEGER), Papel FROM Actores_Intermedio;

INSERT INTO Caratulas (Anio_Pelicula,Titulo_Pelicula,titulo_anio, Nombre, URL_PaginaWeb,Tamanio )
SELECT  CAST(Anio_Pelicula AS INTEGER),Titulo_Pelicula,titulo_anio, Nombre , URL_PaginaWeb, Tamanio FROM Caratulas_Intermedio;

INSERT INTO Criticas (Critico, Titulo_Pelicula,Puntuacion, Texto , Anio_Pelicula, URL_PaginaWeb)
SELECT Critico, Titulo_Pelicula, CAST(Puntuacion AS INT),  Texto, CAST(Anio_Pelicula AS INT), URL_PaginaWeb FROM Criticas_Intermedio;

INSERT INTO Directores (Nombre_Director, Titulo_Pelicula, Anio_Pelicula, Anio_Nacimiento, Anio_Muerte)
SELECT Nombre_Director, Titulo_Pelicula, CAST(Anio_Pelicula AS INTEGER), CAST(Anio_Nacimiento AS INTEGER), CAST(Anio_Muerte AS INTEGER) FROM Directores_Peliculas_Intermedio;

INSERT INTO Guionistas_Peliculas (Nombre_Guionista, Titulo_Pelicula, Anio_Pelicula)
SELECT Nombre_Guionista, Titulo_Pelicula, CAST(Anio_Pelicula AS INTEGER) FROM Guionistas_Peliculas_Intermedio;

INSERT INTO Peliculas (Titulo, Idioma, Calificacion_MPA, Anio, Duracion)
SELECT Titulo, Idioma, Calificacion_MPA, CAST(Anio AS INTEGER), CAST(Duracion AS INTEGER) FROM Peliculas_Intermedio;

