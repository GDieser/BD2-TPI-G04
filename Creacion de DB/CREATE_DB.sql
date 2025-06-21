--Grupo 04 

CREATE DATABASE BD2_TPI_G04
GO 

USE BD2_TPI_G04
GO

CREATE TABLE TipoMembresia(
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
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
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,	
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
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,		
    Nombre varchar(85) NOT NULL,
    FechaConsolidacion DATE NOT NULL,
    Tipo varchar(30) NOT NULL,
    Descripcion TEXT,							
);

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
    IdRol INT, 

    FOREIGN KEY (IdIdioma) REFERENCES Idioma(Id),
    FOREIGN KEY (IdRol) REFERENCES Rol(Id)
);

CREATE TABLE UsuarioMembresia (
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
    IdUsuario BIGINT NOT NULL,
    IdTipoMembresia BIGINT NOT NULL,
    FechaInicio DATE NOT NULL DEFAULT GETDATE(),
    FechaVencimiento DATE NOT NULL,
    Activa BIT NOT NULL DEFAULT 1,
    
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
    FOREIGN KEY (IdTipoMembresia) REFERENCES TipoMembresia(Id)
);

CREATE TABLE ArtistaSeguido(
    IdUsuario BIGINT NOT NULL,
    IdArtista BIGINT NOT NULL,			
	
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
    Id BIGINT PRIMARY KEY IDENTITY(1,1), 
    Nombre VARCHAR(50) NOT NULL,						
    EsPublica BIT NOT NULL DEFAULT 1,					
    Descripcion VARCHAR(255),							
    ImagenURL VARCHAR(255),								
    FechaCreacion DATE NOT NULL DEFAULT GETDATE(),		
    IdAdministrador BIGINT NOT NULL,		
	
    FOREIGN KEY (IdAdministrador) REFERENCES Usuario(Id),
    UNIQUE (IdAdministrador, Nombre)
);

CREATE TABLE Album(										
    Id BIGINT PRIMARY KEY IDENTITY(1,1),
    Titulo VARCHAR(85) NOT NULL,						
    IdProductora BIGINT NOT NULL,						
    FechaLanzamiento DATE NOT NULL,						
    Portada VARCHAR(255) NOT NULL,						
    IdGenero INT NOT NULL,
    IdTipoContenido INT NOT NULL,

    FOREIGN KEY (IdGenero) REFERENCES GeneroMusical(Id),
    FOREIGN KEY (IdTipoContenido) REFERENCES TipoContenido(Id),
    FOREIGN KEY (IdProductora) REFERENCES Productora(Id)
);

CREATE TABLE Contenido(
    Id BIGINT PRIMARY KEY IDENTITY(1,1),  
    Titulo VARCHAR(50) NOT NULL,		
    IdTipoContenido INT NOT NULL,
    IdAlbum BIGINT NOT NULL,
    IdGenero INT NOT NULL,
    IdProductora BIGINT NOT NULL,
    FechaLanzamiento DATE,						
    Duracion INT NOT NULL,						
    Portada VARCHAR(255) NOT NULL,				
    FechaSubida DATE NOT NULL DEFAULT GETDATE(),					
    IDUsuarioDueño BIGINT NOT NULL,				
    FormatoArchivo VARCHAR(20),					
    Descripcion VARCHAR(255),					
    Activo BIT NOT NULL DEFAULT 1,
	ContadorReproducciones INT NOT NULL DEFAULT 0,
	
    FOREIGN KEY (IdTipoContenido) REFERENCES TipoContenido(Id),
    FOREIGN KEY (IdAlbum) REFERENCES Album(Id),
    FOREIGN KEY (IdGenero) REFERENCES GeneroMusical(Id),
    FOREIGN KEY (IdProductora) REFERENCES Productora(Id),
    FOREIGN KEY (IDUsuarioDueño) REFERENCES Usuario(Id)
);

CREATE TABLE InterpretePorAlbum(                 
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdInterprete BIGINT NOT NULL,
    IdAlbum BIGINT NOT NULL,

    FOREIGN KEY (IdInterprete) REFERENCES Interprete(Id),
    FOREIGN KEY (IdAlbum) REFERENCES Album(Id)
);

CREATE TABLE InterpreteArtista(                       
    Id BIGINT PRIMARY KEY IDENTITY(1,1),
    IdInterprete BIGINT NOT NULL,
    IdArtista BIGINT NOT NULL,
    FechaSalida DATE,				
    Observaciones VARCHAR(255),		

    FOREIGN KEY (IdInterprete) REFERENCES Interprete(Id),
    FOREIGN KEY (IdArtista) REFERENCES Artista(Id)
);		

CREATE TABLE ContenidoFavorito(
    IdUsuario BIGINT NOT NULL,
    IdContenido BIGINT NOT NULL,						
    FechaMarcado DATE NOT NULL DEFAULT GETDATE(),		
    PRIMARY KEY(IdUsuario,IdContenido), 

    FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
    FOREIGN KEY (IdContenido) REFERENCES Contenido(Id)
);

CREATE TABLE Comentarios(
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdUsuario BIGINT NOT NULL,		
    IdContenido BIGINT NOT NULL,		
    Comentario VARCHAR(2048) NOT NULL,	
    FechaComentario DATE NOT NULL DEFAULT GETDATE(),	

    FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
    FOREIGN KEY (IdContenido) REFERENCES Contenido(Id)
);

CREATE TABLE Calificaciones(
    Id BIGINT PRIMARY KEY IDENTITY(1,1),
    IdUsuario BIGINT NOT NULL,							
    IdContenido BIGINT NULL,
    Puntuacion INT NOT NULL,					
    Fecha DATE NOT NULL DEFAULT GETDATE(),	
	
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
    IdPlaylist BIGINT NOT NULL,		
    IdContenido BIGINT NOT NULL,		

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
    IdUsuario BIGINT NOT NULL,		
    IdContenido BIGINT NOT NULL,	
    FechaReproduccion DATE NOT NULL DEFAULT GETDATE(),		
    TiempoReproduccion INT NOT NULL,	
	
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
    FOREIGN KEY (IdContenido) REFERENCES Contenido(Id) 
);
