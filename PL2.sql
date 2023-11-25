DELETE FROM Actores;
DELETE FROM Caratulas;
DELETE FROM Criticas;
DELETE FROM Directores_Peliculas;
DELETE FROM Guionistas_Peliculas;
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

CREATE TABLE if not exists Directores (
    Nombre_Director VARCHAR(100) PRIMARY KEY
);

CREATE TABLE if not exists Actores (
    Nombre_Actor VARCHAR(100) PRIMARY KEY
);

CREATE TABLE if not exists Guionista (
    Nombre_Guionista VARCHAR(100) PRIMARY KEY
);

CREATE TABLE if not exists Peliculas (
    Titulo VARCHAR(255) PRIMARY KEY,
    Idioma VARCHAR(50),
    Calificacion_MPA VARCHAR(10),
    Anio INT,
    Duracion INT,
    FOREIGN KEY (Nombre_Directores) REFERENCES Personal(Nombre)
);

CREATE TABLE if not exists Criticas (
    Critico VARCHAR(100) PRIMARY KEY,
    Puntuacion INT,
    Texto TEXT,
    Titulo_Pelicula VARCHAR(255),
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
    Tamanio INT,
    Nombre VARCHAR(255) PRIMARY KEY,
    Titulo_Pelicula VARCHAR(255),
    URL_PaginaWeb VARCHAR(255),
    Anio_Pelicula INT,
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
    PRIMARY KEY (Anio_Pelicula, Titulo_Pelicula),
    FOREIGN KEY (Anio_Pelicula, Titulo_Pelicula) REFERENCES Peliculas(Anio, Titulo)
);




-- Copiar datos
CREATE TABLE if not exists Actores_Intermedio (
    Anio_Pelicula TEXT,
    Titulo_Pelicula TEXT,
    Nombre TEXT,
    Anio_Nacimiento TEXT,
    Anio_Muerte TEXT,
    Papel TEXT
);

CREATE TABLE if not exists Caratulas_Intermedio (
    Tamanio TEXT,
    Nombre TEXT,
    Titulo_Pelicula TEXT,
    URL_PaginaWeb TEXT,
    Anio_Pelicula TEXT
);

CREATE TABLE if not exists Criticas_Intermedio (
    Critico TEXT,
    Puntuacion TEXT,
    Texto TEXT,
    Titulo_Pelicula TEXT,
    Anio_Pelicula TEXT,
    URL_PaginaWeb TEXT
);

CREATE TABLE if not exists Directores_Peliculas_Intermedio (
    Nombre_Director TEXT,
    Titulo_Pelicula TEXT,
    Anio_Pelicula TEXT
);

CREATE TABLE if not exists Guionistas_Peliculas_Intermedio (
    Nombre_Guionista TEXT,
    Titulo_Pelicula TEXT,
    Anio_Pelicula TEXT
);

CREATE TABLE if not exists Peliculas_Intermedio (
    Titulo TEXT,
    Idioma TEXT,
    Calificacion_MPA TEXT,
    Anio TEXT,
    Duracion TEXT
);

\COPY Actores_Intermedio FROM '/Users/juancartagena/Desktop/Uah/Bases_Datos/Laboratorio/actores_peliculas.csv' DELIMITER ',';
\COPY Caratulas_Intermedio FROM '/Users/juancartagena/Desktop/Uah/Bases_Datos/Laboratorio/caratulas.csv' DELIMITER ',';
\COPY Criticas_Intermedio FROM '/Users/juancartagena/Desktop/Uah/Bases_Datos/Laboratorio/criticas.csv' DELIMITER ',';
\COPY Directores_Peliculas_Intermedio FROM '/Users/juancartagena/Desktop/Uah/Bases_Datos/Laboratorio/directores_peliculas.csv' DELIMITER ',';
\COPY Guionistas_Peliculas_Intermedio FROM '/Users/juancartagena/Desktop/Uah/Bases_Datos/Laboratorio/guionistas_peliculas.csv';
\COPY Peliculas_Intermedio FROM '/Users/juancartagena/Desktop/Uah/Bases_Datos/Laboratorio/peliculas.csv' DELIMITER ',';


INSERT INTO Actores (Nombre_Actor)
SELECT Nombre FROM Actores_Intermedio;

INSERT INTO Caratulas (Tamanio, Nombre, Titulo_Pelicula, URL_PaginaWeb, Anio_Pelicula)
SELECT Tamanio, Nombre, Titulo_Pelicula, URL_PaginaWeb, Anio_Pelicula FROM Caratulas_Intermedio;

INSERT INTO Criticas (Critico, Puntuacion, Texto, Titulo_Pelicula, Anio_Pelicula, URL_PaginaWeb)
SELECT Critico, Puntuacion, Texto, Titulo_Pelicula, Anio_Pelicula, URL_PaginaWeb FROM Criticas_Intermedio;

INSERT INTO Directores_Peliculas (Nombre_Director, Titulo_Pelicula, Anio_Pelicula)
SELECT Nombre_Director, Titulo_Pelicula, Anio_Pelicula FROM Directores_Peliculas_Intermedio;

INSERT INTO Guionistas_Peliculas (Nombre_Guionista, Titulo_Pelicula, Anio_Pelicula)
SELECT Nombre_Guionista, Titulo_Pelicula, Anio_Pelicula FROM Guionistas_Peliculas_Intermedio;

INSERT INTO Peliculas (Titulo, Idioma, Calificacion_MPA, Anio, Duracion, Nombre_Directores)
SELECT Titulo, Idioma, Calificacion_MPA, Anio, Duracion, NULL FROM Peliculas_Intermedio;


SELECT * FROM Actores_Intermedio;
SELECT * FROM Caratulas_Intermedio;
SELECT * FROM Criticas_Intermedio;
SELECT * FROM Directores_Peliculas_Intermedio;
SELECT * FROM Guionistas_Peliculas;
SELECT * FROM Peliculas;
