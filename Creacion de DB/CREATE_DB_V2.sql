--Grupo 04

CREATE DATABASE BD2_TPI_G04

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



--German Dieser
--1)
--sp_eliminarPlaylist: elimina una playlist y sus asociaciones.

CREATE PROCEDURE sp_eliminarPlaylist
    @IdPlaylist BIGINT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        
        DELETE FROM ContenidoPorPlaylist 
        WHERE IdPlaylist = @IdPlaylist;
        
        DELETE FROM Playlist 
        WHERE Id = @IdPlaylist;
        
        COMMIT TRANSACTION;

        PRINT 'Playlist eliminada';
    END TRY
    BEGIN CATCH
		ROLLBACK TRANSACTION;
            
        PRINT 'Error durante la eliminacion: ' + ERROR_MESSAGE();
    END CATCH
END;

--2)
--trg_finMembresia: al llegar la fecha de vencimiento, actualiza el estado de la membresía del usuario.

--Vamos a necesitar un tabla intermedia
CREATE TABLE UsuarioMembresia (
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
    IdUsuario BIGINT NOT NULL,
    IdTipoMembresia INT NOT NULL,
    FechaInicio DATE NOT NULL DEFAULT GETDATE(),
    FechaVencimiento DATE NOT NULL,
    Activa BIT NOT NULL DEFAULT 1,
    
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
    FOREIGN KEY (IdTipoMembresia) REFERENCES TipoMembresia(Id)
);


CREATE TRIGGER trg_finMembresia
ON UsuarioMembresia
AFTER INSERT, UPDATE
AS
BEGIN

    UPDATE UsuarioMembresia
    SET Activa = 0
    WHERE FechaVencimiento < GETDATE()
    AND Activa = 1;
    
    PRINT 'Se actualizo con exito.';
END;

GO

--Darian Hiebl
--3)
--vista_topNCanciones: Vista que muestra las canciones mas reproducidas en formas descendente
CREATE VIEW vista_topNCanciones AS
SELECT
    c.id AS id_cancion,
    c.titulo,
    c.FechaLanzamiento,
    c.duracion,
    c.descripcion,
    g.Nombre AS genero,
    COUNT(r.id) AS TotalReproducciones
FROM Contenido c
INNER JOIN GeneroMusical g ON g.id = c.IdGenero
INNER JOIN HistorialReproduccion r ON r.IdContenido = c.id
WHERE c.Activo = 1
GROUP BY 
    c.id, c.titulo, c.FechaLanzamiento, c.duracion, c.descripcion, g.Nombre
ORDER BY 
    TotalReproducciones DESC;
GO

--4) fn_duracionTotalPlaylist: Funcion que devuelve la duracion en segundos de la playlist ingresada como parametro
CREATE FUNCTION fn_duracionTotalPlaylist (@IdPlaylist BIGINT)
RETURNS INT
AS
BEGIN
    DECLARE @DuracionTotal INT;

    SELECT @DuracionTotal = SUM(c.duracion)
    FROM ContenidoPorPlaylist cp
    INNER JOIN Contenido c ON c.id = cp.IdContenido
    WHERE cp.IdPlaylist = @IdPlaylist;

    RETURN ISNULL(@DuracionTotal, 0);
END;

GO

--5) vista_usuariosActivos: usuarios con suscripciones activas, mostrando fecha de vencimiento.

--aca tmb necesitamos la tabla intermedia

CREATE VIEW vista_usuariosActivos AS
SELECT 
    U.Id AS IdUsuario,
    U.NombreUsuario,
    U.Nombre,
    U.Apellido,
    U.Email,
    UM.FechaVencimiento

FROM Usuario U INNER JOIN UsuarioMembresia um ON UM.IdUsuario = U.Id WHERE UM.Activa = 1;

go

--6) sp_agregarCancionAPlaylist agrega una canción a una playlist, validando que no esté repetida.

CREATE PROCEDURE sp_agregarCancionAPlaylist
    @IdPlaylist BIGINT,
    @IdContenido BIGINT
AS
BEGIN
    IF EXISTS (
        SELECT IdContenido
        FROM ContenidoPorPlaylist 
        WHERE IdPlaylist = @IdPlaylist AND IdContenido = @IdContenido
    )
    BEGIN
        PRINT 'Este contenido ya esta en la lista.';
        RETURN;
    END

    INSERT INTO ContenidoPorPlaylist (IdPlaylist, IdContenido)
    VALUES (@IdPlaylist, @IdContenido);

    PRINT 'Contenido agregado correctamente a la list.';
END;