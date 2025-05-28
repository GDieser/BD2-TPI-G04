CREATE DATABASE BD2_TPI_G04

USE BD2_TPI_G04
GO

CREATE TABLE TipoMembresia(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Nombre varchar(50) NOT NULL,
	Precio DECIMAL NOT NULL,
	PlazoDuracion INT NOT NULL,
	Descripcion VARCHAR(255)
);

CREATE TABLE GeneroMusical(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Nombre varchar(50) NOT NULL,
	Descripcion VARCHAR(255)
);

CREATE TABLE TipoContenido(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Nombre varchar(50) NOT NULL,
	Descripcion VARCHAR(255)
);

CREATE TABLE Artista(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Nombre varchar(50) NOT NULL,
	Apellido varchar(50) NOT NULL,
	NombreArtistico varchar(85) NOT NULL,
	FechaNacimiento DATE,
	ImagenPerfil VARCHAR(255)
);

CREATE TABLE Idioma(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Nombre varchar(50) NOT NULL,
);

CREATE TABLE Interprete(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Nombre varchar(85) NOT NULL,
	FechaConsolidacion DATE NOT NULL,
	Tipo varchar(30) NOT NULL,
	Descripcion TEXT,
);