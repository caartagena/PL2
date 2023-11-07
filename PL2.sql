
CREATE DATABASE Cine;
\c Cine

CREATE TABLE Peliculas (
    Titulo VARCHAR(255) PRIMARY KEY,
    Idioma VARCHAR(50),
    Calificacion_MPA VARCHAR(10),
    Anio INT,
    Duracion INT
);


CREATE TABLE Personal (
    Nombre VARCHAR(100) PRIMARY KEY,
    Anio_Nacimiento INT,
    Anio_Muerte INT
);


CREATE TABLE Directores (
);


CREATE TABLE Actores (

);


CREATE TABLE Guionista (
   
);


CREATE TABLE Criticas (
    Critico VARCHAR(100) PRIMARY KEY,
    Puntuacion INT,
    Texto TEXT,
    Titulo_Pelicula VARCHAR(255),
    FOREIGN KEY (Titulo_Pelicula) REFERENCES Peliculas(Titulo)
);


CREATE TABLE PaginaWeb (
    URL VARCHAR(255) PRIMARY KEY,
    Tipo VARCHAR(50),
    Titulo_Pelicula VARCHAR(255),
    FOREIGN KEY (Titulo_Pelicula) REFERENCES Peliculas(Titulo)
);


CREATE TABLE Caratulas (
    Tamanio INT,
    Nombre VARCHAR(255) PRIMARY KEY,
    Titulo_Pelicula VARCHAR(255),
    URL_PaginaWeb VARCHAR(255),
    FOREIGN KEY (Titulo_Pelicula) REFERENCES Peliculas(Titulo),
    FOREIGN KEY (URL_PaginaWeb) REFERENCES PaginaWeb(URL)
);