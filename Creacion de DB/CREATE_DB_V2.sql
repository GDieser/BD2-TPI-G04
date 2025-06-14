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
    IdTipoMembresia BIGINT NOT NULL, -- Cambie tipo a BIGINT por error de Tipos
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
--vista_topNCanciones: Vista que muestra las canciones mas reproducidas en forma descendente
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

--Jacob Fredes
--7 
--trg_registrarReproduccion: al registrar una reproducción, actualiza el contador de la canción.

--Vamos a necesitar crear una columna en la tabla Contenido
ALTER TABLE Contenido
ADD ContadorReproducciones INT NOT NULL DEFAULT 0;

-- Se activará después de una inserción en la tabla HistorialReproduccion, y se encargará de incrementar el contador de la canción reproducida:

CREATE TRIGGER trg_registrarReproduccion
ON HistorialReproduccion
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualiza el contador por cada contenido reproducido (por si son múltiples inserciones)
    UPDATE c
    SET c.ContadorReproducciones = c.ContadorReproducciones + r.cant
    FROM Contenido c
    INNER JOIN (
        SELECT IdContenido, COUNT(*) AS cant
        FROM inserted
        GROUP BY IdContenido
    ) r ON c.Id = r.IdContenido;
END;
GO

--8).
/*   Tamara FrÍas
    vista_comentariosRecientes: 
        Muestra los comentarios hechos por lo usuarios,con el título(del contenido)
        y la fecha, ordenados de forma DESC para que los comentarios más nuevos 
        aparezcan primero.
        */

CREATE VIEW vista_comentariosRecientes AS
SELECT 
    c.Id AS IdComentario,
    u.NombreUsuario,
    ct.Titulo AS Contenido,
    c.Comentario,
    c.FechaComentario
FROM Comentarios c
JOIN Usuario u ON c.IdUsuario = u.Id
JOIN Contenido ct ON c.IdContenido = ct.Id
ORDER BY c.FechaComentario DESC;
GO


/*    trg_limitarPuntuacion: 
        Este trigger evita que un usuario vuelva a calificar un contenido,
        para evitar duplicados y así no afectar al sistema de puntajes.
        */

CREATE TRIGGER trg_limitarPuntuacion
ON Calificaciones
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS(
        SELECT 1
        FROM Calificaciones c
        JOIN inserted i ON c.IdUsuario =i.IdUsuario AND c.IdContenido = i.IdContenido
    )
    BEGIN
    PRINT "Ya existe una calificación para este contenido."
    RETURN;
    END

    INSERT INTO Calificaciones(IdUsuario, IdContenido, Puntuacion, Fecha)
    SELECT IdUsuario,IdContenido,Puntucion,Fecha
    FROM inserted;
END;
GO    











--SCRIPTS DE INSERCIÓN:

-- 1 Artistas
	
INSERT INTO Artista (Nombre, Apellido, NombreArtistico, FechaNacimiento, ImagenPerfil)
VALUES
('Luis', 'Martínez', 'LuMart', '1990-04-15', 'luis.jpg'),
('María', 'Gómez', 'MariGo', '1987-08-10', 'maria.jpg'),
('Carlos', 'Díaz', 'CarlBeat', '1992-01-22', 'carlos.jpg'),
('Ana', 'López', 'AnaLuna', '1995-06-30', 'ana.jpg'),
('José', 'Fernández', 'JFer', '1985-09-14', 'jose.jpg'),
('Laura', 'Pérez', 'LauPop', '1993-12-02', 'laura.jpg'),
('Ricardo', 'Ramírez', 'RickR', '1988-03-18', 'ricardo.jpg'),
('Daniela', 'Suárez', 'DaniS', '1991-07-24', 'daniela.jpg'),
('Fernando', 'Castro', 'FerCast', '1983-05-05', 'fernando.jpg'),
('Cecilia', 'Ríos', 'CeciR', '1996-11-20', 'cecilia.jpg'),
('Tomás', 'Moreno', 'Tomo', '1994-02-12', 'tomas.jpg'),
('Sofía', 'Núñez', 'SofiBeats', '1997-10-06', 'sofia.jpg'),
('Martín', 'Vega', 'Mave', '1990-01-01', 'martin.jpg'),
('Andrea', 'Herrera', 'AndHer', '1992-09-19', 'andrea.jpg'),
('Lucas', 'Cabrera', 'LuCab', '1989-04-09', 'lucas.jpg'); 
;

-- Usuarios

INSERT INTO Usuario (NombreUsuario, Nombre, Apellido, Email, Pass, FechaNacimiento, Pais, FotoPerfil, IdIdioma, IdRol)
VALUES
('juan123', 'Juan', 'Pérez', 'juan@gmail.com', 'pass123', '1995-05-10', 'Argentina', 'juan.jpg', 1, 1),
('maria_g', 'María', 'García', 'maria@gmail.com', 'pass123', '1992-08-15', 'Chile', 'maria.jpg', 1, 1),
('lucas22', 'Lucas', 'Rodríguez', 'lucas@gmail.com', 'pass123', '1990-12-01', 'México', 'lucas.jpg', 1, 1),
('ana_lo', 'Ana', 'López', 'ana@gmail.com', 'pass123', '1998-04-20', 'Colombia', 'ana.jpg', 1, 1),
('tomi98', 'Tomás', 'Fernández', 'tomas@gmail.com', 'pass123', '1996-07-30', 'Uruguay', 'tomas.jpg', 1, 1),
('sofia_b', 'Sofía', 'Benítez', 'sofia@gmail.com', 'pass123', '1999-03-25', 'Argentina', 'sofia.jpg', 1, 1),
('daniel_t', 'Daniel', 'Torres', 'daniel@gmail.com', 'pass123', '1985-11-13', 'Perú', 'daniel.jpg', 1, 1),
('carla_h', 'Carla', 'Herrera', 'carla@gmail.com', 'pass123', '1993-06-05', 'Chile', 'carla.jpg', 1, 1),
('leo_b', 'Leandro', 'Bustos', 'leandro@gmail.com', 'pass123', '1989-09-28', 'Argentina', 'leo.jpg', 1, 1),
('flor_c', 'Florencia', 'Cruz', 'florencia@gmail.com', 'pass123', '1997-01-17', 'Ecuador', 'flor.jpg', 1, 1),
('martin_r', 'Martín', 'Ramírez', 'martin@gmail.com', 'pass123', '1994-10-12', 'Paraguay', 'martin.jpg', 1, 1),
('vale_m', 'Valentina', 'Mendoza', 'valentina@gmail.com', 'pass123', '1992-02-09', 'Argentina', 'valen.jpg', 1, 1),
('fede_c', 'Federico', 'Correa', 'fede@gmail.com', 'pass123', '1987-12-31', 'Chile', 'fede.jpg', 1, 1),
('romi_v', 'Romina', 'Vega', 'romina@gmail.com', 'pass123', '1995-08-08', 'México', 'romina.jpg', 1, 1),
('gabi_p', 'Gabriel', 'Paredes', 'gabriel@gmail.com', 'pass123', '1991-03-14', 'Argentina', 'gabriel.jpg', 1, 1);

-- Playlist

INSERT INTO Playlist (Nombre, EsPublica, Descripcion, ImagenURL, FechaCreacion, IdAdministrador)
VALUES
('Rock Clásico', 1, 'Los mejores clásicos del rock', 'rock.jpg', GETDATE(), 1),
('Pop Hits', 1, 'Canciones pop más escuchadas', 'pop.jpg', GETDATE(), 2),
('Relajación', 0, 'Playlist para relajarte', 'relax.jpg', GETDATE(), 3),
('Fiesta Latina', 1, 'Temas para bailar toda la noche', 'fiesta.jpg', GETDATE(), 4),
('Workout', 1, 'Motivación para entrenar', 'gym.jpg', GETDATE(), 5),
('Estudio Chill', 0, 'Para estudiar tranquilo', 'study.jpg', GETDATE(), 6),
('Románticas', 1, 'Canciones para enamorados', 'love.jpg', GETDATE(), 7),
('Indie Latino', 1, 'Lo mejor del indie regional', 'indie.jpg', GETDATE(), 8),
('Jazz Nights', 0, 'Jazz para la noche', 'jazz.jpg', GETDATE(), 9),
('Trap Argento', 1, 'Trap nacional', 'trap.jpg', GETDATE(), 10),
('Top 2025', 1, 'Top de este año', 'top2025.jpg', GETDATE(), 11),
('Metal Total', 1, 'Para sacudir la cabeza', 'metal.jpg', GETDATE(), 12),
('Música para dormir', 0, 'Canciones suaves para dormir', 'sleep.jpg', GETDATE(), 13),
('Hits de los 80', 1, 'Lo mejor de los 80', '80s.jpg', GETDATE(), 14),
('Electro Beats', 1, 'Electrónica para todos', 'electro.jpg', GETDATE(), 15);

-- Albumes 

INSERT INTO Album (Titulo, IdProductora, FechaLanzamiento, Portada, IdGenero, IdTipoContenido)
VALUES
('Energía', 1, '2022-05-10', 'energia.jpg', 1, 1),
('Atardecer', 1, '2021-11-20', 'atardecer.jpg', 2, 1),
('Misterio', 1, '2020-08-15', 'misterio.jpg', 3, 1),
('Corazones Rotos', 1, '2023-01-01', 'corazones.jpg', 4, 1),
('Ritmo Latino', 1, '2019-07-25', 'ritmolatino.jpg', 5, 1),
('Electro Shock', 1, '2024-04-12', 'electro.jpg', 6, 1),
('Sin Miedo', 1, '2018-10-30', 'sinmiedo.jpg', 1, 1),
('Universo', 1, '2020-03-03', 'universo.jpg', 2, 1),
('Raíces', 1, '2021-06-06', 'raices.jpg', 3, 1),
('Luz y Sombra', 1, '2022-09-19', 'luzsombra.jpg', 4, 1),
('Alma Rebelde', 1, '2023-02-28', 'alma.jpg', 5, 1),
('Neón', 1, '2020-12-12', 'neon.jpg', 6, 1),
('Pasado y Futuro', 1, '2021-01-15', 'pasado.jpg', 1, 1),
('Respira', 1, '2024-07-07', 'respira.jpg', 2, 1),
('Eclipse', 1, '2022-03-22', 'eclipse.jpg', 3, 1);













