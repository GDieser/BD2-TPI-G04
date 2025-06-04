--CREATE DATABASE BD2_TPI_G04

--USE BD2_TPI_G04
--GO

--CREATE TABLE TipoMembresia(
--	Id INT IDENTITY(1,1) PRIMARY KEY,
--	Nombre varchar(50) NOT NULL,
--	Precio DECIMAL NOT NULL,
--	PlazoDuracion INT NOT NULL,
--	Descripcion VARCHAR(255)
--);

--CREATE TABLE GeneroMusical(
--	Id INT IDENTITY(1,1) PRIMARY KEY,
--	Nombre varchar(50) NOT NULL,
--	Descripcion VARCHAR(255)
--);

--CREATE TABLE TipoContenido(
--	Id INT IDENTITY(1,1) PRIMARY KEY,
--	Nombre varchar(50) NOT NULL,
--	Descripcion VARCHAR(255)
--);

--CREATE TABLE Artista(
--	Id INT IDENTITY(1,1) PRIMARY KEY,
--	Nombre varchar(50) NOT NULL,
--	Apellido varchar(50) NOT NULL,
--	NombreArtistico varchar(85) NOT NULL,
--	FechaNacimiento DATE,
--	ImagenPerfil VARCHAR(255)
--);

--CREATE TABLE Idioma(
--	Id INT IDENTITY(1,1) PRIMARY KEY,
--	Nombre varchar(50) NOT NULL,
--);

--CREATE TABLE Interprete(
--	Id INT IDENTITY(1,1) PRIMARY KEY,
--	Nombre varchar(85) NOT NULL,
--	FechaConsolidacion DATE NOT NULL,
--	Tipo varchar(30) NOT NULL,
--	Descripcion TEXT,
--);
---- se agrega tabla Rol para darle consistencia a la entidad Usuario
--CREATE TABLE Rol(
--	Id INT IDENTITY(1,1) PRIMARY KEY,
--	Nombre VARCHAR(25) UNIQUE NOT NULL
--);

--CREATE TABLE Usuario(
--	Id BIGINT PRIMARY KEY IDENTITY(1,1),
--	NombreUsuario VARCHAR(50) NOT NULL UNIQUE,
--	Nombre VARCHAR(50) NOT NULL,
--	Apellido VARCHAR(50) NOT NULL,
--	Email VARCHAR(60) NOT NULL UNIQUE,
--	Pass VARCHAR(255) NOT NULL,
--	FechaNacimiento DATE,
--	Pais VARCHAR(50),
--	FotoPerfil VARCHAR(255),

--	IdIdioma INT,
--	IdRol INT, /* Agregue el ROL para tener en una misma talba los tipos de usuario */

--	FOREIGN KEY (IdIdioma) REFERENCES Idioma(Id),
--	FOREIGN KEY (IdRol) REFERENCES Rol(Id)
--);

--CREATE TABLE ArtistaSeguido(
--	IdUsuario BIGINT NOT NULL,
--	IdArtista INT NOT NULL,

--	PRIMARY KEY (IdUsuario, IdArtista),
--	FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
--	FOREIGN KEY (IdArtista) REFERENCES Artista(Id)
--);

--CREATE TABLE Productora(
--	Id BIGINT PRIMARY KEY IDENTITY(1,1),
--	Nombre VARCHAR(85) NOT NULL UNIQUE,
--	PaisOrigen VARCHAR(85),
--	Web VARCHAR(255),
--	Logo VARCHAR(255),

--	IdAdministrador BIGINT NOT NULL,

--	FOREIGN KEY (IdAdministrador) REFERENCES Usuario(Id)
--);

--CREATE TABLE Playlist(
--	Id BIGINT PRIMARY KEY IDENTITY(1,1) UNIQUE, 
--	Nombre VARCHAR(50) NOT NULL,
--	EsPublica BIT NOT NULL DEFAULT 1,
--	Descripcion VARCHAR(255),
--	ImagenURL VARCHAR(255),
--	FechaCreacion DATE NOT NULL DEFAULT GETDATE(),

--	IdAdministrador BIGINT NOT NULL,
--	FOREIGN KEY (IdAdministrador) REFERENCES Usuario(Id),
--	UNIQUE (IdAdministrador, Nombre)
--);

--CREATE TABLE album(
--	Id INT PRIMARY KEY IDENTITY(1,1) UNIQUE,
--	Titulo VARCHAR(85) NOT NULL,
--	IdProductora INT NOT NULL,
--	FechaLanzamiento DATE NOT NULL, 
--	Portada VARCHAR(255) NOT NULL,
--	IdGenero INT NOT NULL FOREIGN KEY (IdGenero) REFERENCES GeneroMusical(Id),
--	IdTipoContenido INT NOT NULL FOREIGN KEY (IdTipoContenido) REFERENCES TipoContenido(Id),
	
--);

--CREATE TABLE Contenido(
--	Id INT PRIMARY KEY IDENTITY(1,1),
--	Titulo VARCHAR(50) NOT NULL,
--	IdTipoContenido INT NOT NULL FOREIGN KEY (IdTipoContenido) REFERENCES TipoContenido(Id),
--	IdAlbum INT NOT NULL FOREIGN KEY (IdAlbum) REFERENCES Album(Id),
--	IdGenero INT NOT NULL FOREIGN KEY (IdGenero) REFERENCES GeneroMusical(Id),
--	IdProductora INT NOT NULL FOREIGN KEY (IdProductora) REFERENCES Productora(Id),
--	FechaLanzamiento DATE, 
--	Duracion INT NOT NULL,
--	Portada VARCHAR(255) NOT NULL,
--	FechaSubida DATE NOT NULL,
--	IDUsuarioDueño INT NOT NULL,
--	FormatoArchivo VARCHAR(20)
--	Descripcion VARCHAR(255),
--	Activo BIT NOT NULL DEFAULT 1, 	
--);

--CREATE TABLE interpretePorAlbum(
--	Id INT PRIMARY KEY IDENTITY(1,1) UNIQUE,
--	IdInterprete BIGINT UNIQUE NOT NULL FOREIGN KEY (IdInterprete) REFERENCES Interprete(Id),
--	IdAlbum BIGINT UNIQUE NOT NULL FOREIGN KEY (IdAlbum) REFERENCES Album(Id),
	
--);

--CREATE TABLE interpreteArtista(
--	Id BIGINT PRIMARY KEY IDENTITY(1,1) UNIQUE,
--	IdInterprete BIGINT UNIQUE NOT NULL FOREIGN KEY (IdInterprete) REFERENCES Interprete(Id),
--	IdArtista BIGINT NOT NULL FOREIGN KEY (IdArtista) REFERENCES Artista(Id),
--	Fecha_Salida DATE,
--	Observaciones VARCHAR(255),	
--);
--------------------------------------------------------
--CREATE TABLE ContenidoFavorito(
--	IdUsuario BIGINT NOT NULL,
--	IdContenido BIGINT NOT NULL,
--	FechaMarcado DATE NOT NULL DEFAULT GETDATE(),
--	PRIMARY KEY(IdUsuario,IdContenido), --AMBAS SON PK Y UNIQUE, NO ES COMPATIBLES
	
--	FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
--	FOREIGN KEY (IdContenido) REFERENCES Contenido(Id)
	
--);

--CREATE TABLE Comentarios(
--	Id INT PRIMARY KEY IDENTITY(1,1),
--	IdUsuario BIGINT NOT NULL,
--	IdContenido BIGINT NULL,
--	Comentario VARCHAR(2048) NOT NULL,
--	FechaComentario DATE NOT NULL DEFAULT GETDATE(),

--	FOREIGN KEY (IdUsuarios) REFERENCES Usuarios(Id),
--	FOREIGN KEY (IdContenido) REFERENCES Contenido(Id)
--);

--CREATE TABLE Calificaciones(
--	Id BIGINT PRIMARY KEY IDENTITY(1,1),
--	IdUsuario BIGINT NOT NULL,							
--	IdContenido INT NULL,
--	Puntuacion INT NOT NULL,					
--	Fecha DATE NOT NULL DEFAULT GETDATE(),		

--	FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
--	FOREIGN KEY (IdContenido) REFERENCES Contenido(Id)
--	);

--CREATE TABLE Letra(
--	Id INT PRIMARY KEY IDENTITY(1,1),
--	IdContenido BIGINT NULL,
--	IdIdioma INT NULL,
--	TextoLetra TEXT NULL,

--	FOREIGN KEY (IdContenido) REFERENCES Contenido(Id),
--	FOREIGN KEY (IdIdioma) REFERENCES Idioma(Id)
--);

--CREATE TABLE ContenidoPorPlaylist(
--	Id INT PRIMARY KEY IDENTITY(1,1),
--	IdPlaylist BIGINT NOT NULL,		
--	IdContenido INT NOT NULL,		

--	FOREIGN KEY (IdPlaylist) REFERENCES Playlist(Id),
--	FOREIGN KEY (IdContenido) REFERENCES Contenido(Id)
--);

--CREATE TABLE ContenidoInterprete(
--	Id BIGINT PRIMARY KEY IDENTITY(1,1),
--	IdContenido INT NOT NULL,
--	IdInterprete INT NOT NULL,

--	FOREIGN KEY (IdContenido) REFERENCES Contenido(Id),
--	FOREIGN KEY (IdInterprete) REFERENCES Interprete(Id)
--);

--CREATE TABLE HistorialReproduccion(
--	Id BIGINT PRIMARY KEY IDENTITY(1,1),
--	IdUsuario BIGINT NOT NULL,
--	IdContenido INT NOT NULL,
--	FechaReproduccion DATE NOT NULL DEFAULT GETDATE(),
--	TiempoReproduccion INT NOT NULL,

--	FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
--	FOREIGN KEY (IdContenido) REFERENCES Contenido(Id) 
--);




--CREATE DATABASE BD2_TPI_G04

USE BD2_TPI_G04
GO

CREATE TABLE TipoMembresia(
	Id BIGINT IDENTITY(1,1) PRIMARY KEY, --BIGINT
	Nombre varchar(50) NOT NULL,   ---ACEPTA NULO
	Precio DECIMAL NOT NULL,   ---ACEPTA NULO
	PlazoDuracion INT NOT NULL,   --ACEPTA NULO
	Descripcion VARCHAR(255)    --ACEPTA NULO
);

CREATE TABLE GeneroMusical(
	Id INT IDENTITY(1,1) PRIMARY KEY,     ---PK ULTIMO
	Nombre varchar(50) NOT NULL,		  --ACEPTA NULO
	Descripcion VARCHAR(255)			  --ACEPTA NULO
);

CREATE TABLE TipoContenido(
	Id INT IDENTITY(1,1) PRIMARY KEY,		---PK ULTIMO
	Nombre varchar(50) NOT NULL,			--ACEPTA NULO
	Descripcion VARCHAR(255)				--ACEPTA NULO
);

CREATE TABLE Artista(
	Id BIGINT IDENTITY(1,1) PRIMARY KEY,	---PK ULTIMO
	Nombre varchar(50) NOT NULL,
	Apellido varchar(50) NOT NULL,
	NombreArtistico varchar(85) NOT NULL,
	FechaNacimiento DATE,					--ACEPTA NULO
	ImagenPerfil VARCHAR(255)				--ACEPTA NULO
);

CREATE TABLE Idioma(
	Id INT IDENTITY(1,1) PRIMARY KEY,		--PK ULTIMO
	Nombre varchar(50) NOT NULL,
);

CREATE TABLE Interprete(
	Id BIGINT IDENTITY(1,1) PRIMARY KEY,		--PK ULTIMO
	Nombre varchar(85) NOT NULL,
	FechaConsolidacion DATE NOT NULL,
	Tipo varchar(30) NOT NULL,
	Descripcion TEXT,							--ACEPTA NULO
);
-- se agrega tabla Rol para darle consistencia a la entidad Usuario
CREATE TABLE Rol(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(25) UNIQUE NOT NULL
);

CREATE TABLE Usuario(
	Id BIGINT PRIMARY KEY IDENTITY(1,1),
	NombreUsuario VARCHAR(50) NOT NULL UNIQUE,		--ACEPTA NULO
	Nombre VARCHAR(50) NOT NULL,					--ACEPTA NULO
	Apellido VARCHAR(50) NOT NULL,					--ACEPTA NULO
	Email VARCHAR(60) NOT NULL UNIQUE,				--ACEPTA NULO
	Pass VARCHAR(255) NOT NULL,						--ACEPTA NULO
	FechaNacimiento DATE,							--ACEPTA NULO
	Pais VARCHAR(50),								--ACEPTA NULO
	FotoPerfil VARCHAR(255),						--ACEPTA NULO
	IdIdioma INT,									--ACEPTA NULO
	IdRol INT, /* Agregue el ROL para tener en una misma talba los tipos de usuario */

	FOREIGN KEY (IdIdioma) REFERENCES Idioma(Id),
	FOREIGN KEY (IdRol) REFERENCES Rol(Id)
);

CREATE TABLE ArtistaSeguido(
	IdUsuario BIGINT NOT NULL,
	IdArtista BIGINT NOT NULL,						--ACEPTA NULO
	--FechaSeguimiento DATA NOT NULL DEFAULT GETDATE(),     --ACEPTA NULO
	PRIMARY KEY (IdUsuario, IdArtista),
	FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
	FOREIGN KEY (IdArtista) REFERENCES Artista(Id)
);

CREATE TABLE Productora(
	Id BIGINT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(85) NOT NULL UNIQUE,					--ACEPTA NULO
	PaisOrigen VARCHAR(85),								--ACEPTA NULO
	Web VARCHAR(255),									--ACEPTA NULO
	Logo VARCHAR(255),									--ACEPTA NULO

	IdAdministrador BIGINT NOT NULL,					--ACEPTA NULO  ---- NOMBRE ID USER

	FOREIGN KEY (IdAdministrador) REFERENCES Usuario(Id)      ---- NOMBRE ID USER
);

CREATE TABLE Playlist(
	Id BIGINT PRIMARY KEY IDENTITY(1,1), 
	Nombre VARCHAR(50) NOT NULL,						--ACEPTA NULO
	EsPublica BIT NOT NULL DEFAULT 1,					--ACEPTA NULO
	Descripcion VARCHAR(255),							--ACEPTA NULO
	ImagenURL VARCHAR(255),								--ACEPTA NULO
	FechaCreacion DATE NOT NULL DEFAULT GETDATE(),		--ACEPTA NULO

	IdAdministrador BIGINT NOT NULL,					--ACEPTA NULO -- NOMBRE ID USER
	FOREIGN KEY (IdAdministrador) REFERENCES Usuario(Id),
	UNIQUE (IdAdministrador, Nombre)
);

CREATE TABLE album(										--- NOMBRE MIN
	Id BIGINT PRIMARY KEY IDENTITY(1,1),
	Titulo VARCHAR(85) NOT NULL,						--ACEPTA NULO
	IdProductora INT NOT NULL,							--ACEPTA NULO
	FechaLanzamiento DATE NOT NULL,						--ACEPTA NULO
	Portada VARCHAR(255) NOT NULL,						--ACEPTA NULO
	IdGenero INT NOT NULL FOREIGN KEY (IdGenero) REFERENCES GeneroMusical(Id),
	IdTipoContenido INT NOT NULL FOREIGN KEY (IdTipoContenido) REFERENCES TipoContenido(Id),
	
);

CREATE TABLE Contenido(
	Id BIGINT PRIMARY KEY IDENTITY(1,1),  
	Titulo VARCHAR(50) NOT NULL,		--ACEPTA NULO
	IdTipoContenido INT NOT NULL FOREIGN KEY (IdTipoContenido) REFERENCES TipoContenido(Id),
	IdAlbum BIGINT NOT NULL FOREIGN KEY (IdAlbum) REFERENCES Album(Id),
	IdGenero INT NOT NULL FOREIGN KEY (IdGenero) REFERENCES GeneroMusical(Id),
	IdProductora BIGINT NOT NULL FOREIGN KEY (IdProductora) REFERENCES Productora(Id),
	FechaLanzamiento DATE,						--ACEPTA NULO
	Duracion INT NOT NULL,						--ACEPTA NULO
	Portada VARCHAR(255) NOT NULL,				--ACEPTA NULO
	FechaSubida DATE NOT NULL,					--ACEPTA NULO
	IDUsuarioDueño INT NOT NULL,				--ACEPTA NULO  ESTA REFERENCIADA EN EL DER
	FormatoArchivo VARCHAR(20),					--ACEPTA NULO
	Descripcion VARCHAR(255),					--ACEPTA NULO
	Activo BIT NOT NULL DEFAULT 1, 				--ACEPTA NULO
);

CREATE TABLE interpretePorAlbum(                  --NOMBRE MIN
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdInterprete BIGINT UNIQUE NOT NULL FOREIGN KEY (IdInterprete) REFERENCES Interprete(Id),
	IdAlbum BIGINT UNIQUE NOT NULL FOREIGN KEY (IdAlbum) REFERENCES Album(Id),
	
);

CREATE TABLE interpreteArtista(                       -- NOM MIN
	Id BIGINT PRIMARY KEY IDENTITY(1,1),
	IdInterprete BIGINT UNIQUE NOT NULL FOREIGN KEY (IdInterprete) REFERENCES Interprete(Id),
	IdArtista BIGINT NOT NULL FOREIGN KEY (IdArtista) REFERENCES Artista(Id),
	Fecha_Salida DATE,				--ACEPTA NULO
	Observaciones VARCHAR(255),		--ACEPTA NULO
);		
------------------------------------------------------
CREATE TABLE ContenidoFavorito(
	IdUsuario BIGINT NOT NULL,
	IdContenido BIGINT NOT NULL,						--ACEPTA NULO
	FechaMarcado DATE NOT NULL DEFAULT GETDATE(),		--ACEPTA NULO
	PRIMARY KEY(IdUsuario,IdContenido), 
	
	FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
	FOREIGN KEY (IdContenido) REFERENCES Contenido(Id)
	
);

CREATE TABLE Comentarios(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdUsuario BIGINT NOT NULL,		--aceptaba nulos
	IdContenido BIGINT  NOT NULL,		--aceptaba nulos
	Comentario VARCHAR(2048) NOT NULL,	--aceptaba nulos
	FechaComentario DATE NOT NULL DEFAULT GETDATE(),	--aceptaba nulos

	FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
	FOREIGN KEY (IdContenido) REFERENCES Contenido(Id)
);

CREATE TABLE Calificaciones(
	Id BIGINT PRIMARY KEY IDENTITY(1,1),
	IdUsuario BIGINT NOT NULL,					--aceptaba nulos			
	IdContenido BIGINT NULL,
	Puntuacion INT NOT NULL,					--aceptaba nulos
	Fecha DATE NOT NULL DEFAULT GETDATE(),		--aceptaba nulos

	FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
	FOREIGN KEY (IdContenido) REFERENCES Contenido(Id)
	);
	
CREATE TABLE Letra(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdContenido BIGINT NULL,
	IdIdioma INT NULL,
	TextoLetra TEXT NULL,

	FOREIGN KEY (IdContenido) REFERENCES Contenido(Id),
	FOREIGN KEY (IdIdioma) REFERENCES Idioma(Id)
);

CREATE TABLE ContenidoPorPlaylist(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdPlaylist BIGINT NOT NULL,		--aceptaba nulos
	IdContenido BIGINT NOT NULL,		--aceptaba nulos

	FOREIGN KEY (IdPlaylist) REFERENCES Playlist(Id),
	FOREIGN KEY (IdContenido) REFERENCES Contenido(Id)
);

CREATE TABLE ContenidoInterprete(
	Id BIGINT PRIMARY KEY IDENTITY(1,1),
	IdContenido BIGINT NOT NULL,
	IdInterprete BIGINT NOT NULL,

	FOREIGN KEY (IdContenido) REFERENCES Contenido(Id),
	FOREIGN KEY (IdInterprete) REFERENCES Interprete(Id)
);

CREATE TABLE HistorialReproduccion(
	Id BIGINT PRIMARY KEY IDENTITY(1,1),
	IdUsuario BIGINT NOT NULL,		--ACEPTABA NULOS
	IdContenido BIGINT NOT NULL,		--ACEPTABA NULOS
	FechaReproduccion DATE NOT NULL DEFAULT GETDATE(),		--ACEPTABA NULOS
	TiempoReproduccion INT NOT NULL,		--ACEPTABA NULOS

	FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
	FOREIGN KEY (IdContenido) REFERENCES Contenido(Id) 
);


--- DEFINIR COMO REFERENCIA, NOMBRAR TABLAS(CON PRIMERA LETRA MAYUS O TODO MINUS), ORDEN DE CLAVE PRIMARIA