--CREATE DATABASE BD2_TPI_G04

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
-- se agrega tabla Rol para darle consistencia a la entidad Usuario
CREATE TABLE Rol(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(25) UNIQUE NOT NULL
);

CREATE TABLE Usuario(
	Id BIGINT PRIMARY KEY IDENTITY(1,1),
	NombreUsuario VARCHAR(50) NOT NULL UNIQUE,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Email VARCHAR(60) NOT NULL UNIQUE,
	Pass VARCHAR(255) NOT NULL,
	FechaNacimiento DATE,
	Pais VARCHAR(50),
	FotoPerfil VARCHAR(255),

	IdIdioma INT,
	IdRol INT, /* Agregue el ROL para tener en una misma talba los tipos de usuario */

	FOREIGN KEY (IdIdioma) REFERENCES Idioma(Id),
	FOREIGN KEY (IdRol) REFERENCES Rol(Id)
);

CREATE TABLE ArtistaSeguido(
	IdUsuario BIGINT NOT NULL,
	IdArtista INT NOT NULL,

	PRIMARY KEY (IdUsuario, IdArtista),
	FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
	FOREIGN KEY (IdArtista) REFERENCES Artista(Id)
);

CREATE TABLE Productora(
	Id BIGINT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(85) NOT NULL UNIQUE,
	PaisOrigen VARCHAR(85),
	Web VARCHAR(255),
	Logo VARCHAR(255),

	IdAdministrador BIGINT NOT NULL,

	FOREIGN KEY (IdAdministrador) REFERENCES Usuario(Id)
);

CREATE TABLE Playlist(
	Id BIGINT PRIMARY KEY IDENTITY(1,1) UNIQUE,
	Nombre VARCHAR(50) NOT NULL,
	EsPublica BIT NOT NULL DEFAULT 1,
	Descripcion VARCHAR(255),
	ImagenURL VARCHAR(255),
	FechaCreacion DATE NOT NULL DEFAULT GETDATE(),

	IdAdministrador BIGINT NOT NULL,
	FOREIGN KEY (IdAdministrador) REFERENCES Usuario(Id),
	UNIQUE (IdAdministrador, Nombre)
);

CREATE TABLE album(
	Id INT PRIMARY KEY IDENTITY(1,1) UNIQUE,
	Titulo VARCHAR(85) NOT NULL,
	IdProductora INT NOT NULL,
	FechaLanzamiento DATE NOT NULL, 
	Portada VARCHAR(255) NOT NULL,
	IdGenero INT NOT NULL FOREIGN KEY (IdGenero) REFERENCES GeneroMusical(Id),
	IdTipoContenido INT NOT NULL FOREIGN KEY (IdTipoContenido) REFERENCES TipoContenido(Id),
	
);

CREATE TABLE Contenido(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Titulo VARCHAR(50) NOT NULL,
	IdTipoContenido INT NOT NULL FOREIGN KEY (IdTipoContenido) REFERENCES TipoContenido(Id),
	IdAlbum INT NOT NULL FOREIGN KEY (IdAlbum) REFERENCES Album(Id),
	IdGenero INT NOT NULL FOREIGN KEY (IdGenero) REFERENCES GeneroMusical(Id),
	IdProductora INT NOT NULL FOREIGN KEY (IdProductora) REFERENCES Productora(Id),
	FechaLanzamiento DATE, 
	Duracion INT NOT NULL,
	Portada VARCHAR(255) NOT NULL,
	FechaSubida DATE NOT NULL,
	IDUsuarioDueño INT NOT NULL,
	FormatoArchivo VARCHAR(20)
	Descripcion VARCHAR(255),
	Activo BIT NOT NULL DEFAULT 1, 	
);

CREATE TABLE interpretePorAlbum(
	Id INT PRIMARY KEY IDENTITY(1,1) UNIQUE,
	IdInterprete BIGINT UNIQUE NOT NULL FOREIGN KEY (IdInterprete) REFERENCES Interprete(Id),
	IdAlbum BIGINT UNIQUE NOT NULL FOREIGN KEY (IdAlbum) REFERENCES Album(Id),
	
);

CREATE TABLE interpreteArtista(
	Id BIGINT PRIMARY KEY IDENTITY(1,1) UNIQUE,
	IdInterprete BIGINT UNIQUE NOT NULL FOREIGN KEY (IdInterprete) REFERENCES Interprete(Id),
	IdArtista BIGINT NOT NULL FOREIGN KEY (IdArtista) REFERENCES Artista(Id),
	Fecha_Salida DATE,
	Observaciones VARCHAR(255),	
);

