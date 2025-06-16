USE BD2_TPI_G04
GO

INSERT INTO Idioma(Nombre) VALUES ('Ingles'), ('Español'), ('Portugues')
INSERT INTO Rol(Nombre) VALUES ('USER'), ('ADMIN')

INSERT INTO Usuario (NombreUsuario, Nombre, Apellido, Email, Pass, FechaNacimiento, Pais, FotoPerfil, IdIdioma, IdRol)
VALUES ('dp_user', 'Thomas', 'Bangalter', 'dp@music.com', '1234', '1990-01-01', 'Francia', NULL, 1, 1);

INSERT INTO Artista (Nombre, Apellido, NombreArtistico, FechaNacimiento, ImagenPerfil)
VALUES ('Thomas', 'Bangalter', 'Daft Punk', '1975-01-03', NULL);

INSERT INTO Interprete (Nombre, FechaConsolidacion, Tipo, Descripcion)
VALUES ('Daft Punk', '1993-01-01', 'Duo', 'Dúo francés de música electrónica');

INSERT INTO InterpreteArtista (IdInterprete, IdArtista)
VALUES (1, 1);

INSERT INTO GeneroMusical (Nombre, Descripcion)
VALUES ('Electronic', 'Música electrónica');

INSERT INTO TipoContenido (Nombre, Descripcion)
VALUES ('Canción', 'Pista musical');

INSERT INTO Idioma (Nombre)
VALUES ('Inglés');

INSERT INTO Productora (Nombre, PaisOrigen, Web, Logo, IdAdministrador)
VALUES ('Columbia Records', 'EE.UU.', 'https://www.columbiarecords.com', NULL, 1);

SELECT * FROM Interprete
SELECT * FROM InterpretePorAlbum

INSERT INTO Album (Titulo, IdProductora, FechaLanzamiento, Portada, IdGenero, IdTipoContenido)
VALUES ('Random Access Memories', 3, '2013-05-17', 'https://upload.wikimedia.org/wikipedia/en/a/a7/Random_Access_Memories.jpg', 1, 1);

SELECT * FROM Album

INSERT INTO InterpretePorAlbum (IdInterprete, IdAlbum)
VALUES (1, 4);

select * from Album

-- REVISAR LOS ID's DE IDALBUM, IDPRODUCTORA E IDUSUARIODUEÑO OJOOOOO!!
INSERT INTO Contenido (Titulo, IdTipoContenido, IdAlbum, IdGenero, IdProductora, FechaLanzamiento, Duracion, Portada, IDUsuarioDueño, FormatoArchivo, Descripcion, Activo)
VALUES 
('Give Life Back to Music', 1, 4, 1, 3, '2013-05-17', 272, 'cover1.jpg', 1, 'mp3', 'Track 1', 1),
('The Game of Love', 1, 4, 1, 3, '2013-05-17', 330, 'cover2.jpg', 1, 'mp3', 'Track 2', 1),
('Giorgio by Moroder', 1, 4, 1, 3, '2013-05-17', 546, 'cover3.jpg', 1, 'mp3', 'Track 3', 1),
('Within', 1, 4, 1, 3, '2013-05-17', 223, 'cover4.jpg', 1, 'mp3', 'Track 4', 1),
('Instant Crush', 1, 4, 1, 3, '2013-05-17', 337, 'cover5.jpg', 1, 'mp3', 'Track 5', 1),
('Lose Yourself to Dance', 1, 4, 1, 3, '2013-05-17', 335, 'cover6.jpg', 1, 'mp3', 'Track 6', 1),
('Touch', 1, 4, 1, 3, '2013-05-17', 512, 'cover7.jpg', 1, 'mp3', 'Track 7', 1),
('Get Lucky', 1, 4, 1, 3, '2013-05-17', 369, 'cover8.jpg', 1, 'mp3', 'Track 8', 1),
('Beyond', 1, 4, 1, 3, '2013-05-17', 295, 'cover9.jpg', 1, 'mp3', 'Track 9', 1),
('Motherboard', 1, 4, 1, 3, '2013-05-17', 309, 'cover10.jpg', 1, 'mp3', 'Track 10', 1);

INSERT INTO ContenidoInterprete (IdContenido, IdInterprete)
SELECT Id, 1 FROM Contenido;

SELECT * FROM Usuario
SELECT * FROM Idioma
SELECT * FROM Contenido

UPDATE Contenido
SET Portada = 'https://upload.wikimedia.org/wikipedia/en/a/a7/Random_Access_Memories.jpg'
WHERE Titulo = 'Random Access Memories';

UPDATE Contenido
SET Portada = 'https://i.scdn.co/image/ab67616d0000b273b4f5b5b5b5b5b5b5b5b5b5b5'
WHERE Titulo = 'Give Life Back to Music';

UPDATE Contenido
SET Portada = 'https://i.scdn.co/image/ab67616d0000b273c4f5c5c5c5c5c5c5c5c5c5c5'
WHERE Titulo = 'The Game of Love';

UPDATE Contenido
SET Portada = 'https://i.scdn.co/image/ab67616d0000b273d4f5d5d5d5d5d5d5d5d5d5d5'
WHERE Titulo = 'Giorgio by Moroder';

UPDATE Contenido
SET Portada = 'https://i.scdn.co/image/ab67616d0000b273e4f5e5e5e5e5e5e5e5e5e5e5'
WHERE Titulo = 'Within';

UPDATE Contenido
SET Portada = 'https://i.scdn.co/image/ab67616d0000b273f4f5f5f5f5f5f5f5f5f5f5f5'
WHERE Titulo = 'Instant Crush';

UPDATE Contenido
SET Portada = 'https://i.scdn.co/image/ab67616d0000b273g4f5g5g5g5g5g5g5g5g5g5'
WHERE Titulo = 'Lose Yourself to Dance';

UPDATE Contenido
SET Portada = 'https://i.scdn.co/image/ab67616d0000b273h4f5h5h5h5h5h5h5h5h5h5'
WHERE Titulo = 'Touch';

UPDATE Contenido
SET Portada = 'https://i.scdn.co/image/ab67616d0000b273i4f5i5i5i5i5i5i5i5i5i5'
WHERE Titulo = 'Get Lucky';

UPDATE Contenido
SET Portada = 'https://i.scdn.co/image/ab67616d0000b273j4f5j5j5j5j5j5j5j5j5j5'
WHERE Titulo = 'Beyond';

UPDATE Contenido
SET Portada = 'https://i.scdn.co/image/ab67616d0000b273k4f5k5k5k5k5k5k5k5k5k5'
WHERE Titulo = 'Motherboard';

select * from usuario

-- PROBANDO QUERIES PARA ADO.NET
SELECT 
    c.Id AS IdContenido,
    c.Titulo AS Titulo,
    i.Nombre AS NombreInterprete,
    a.Titulo AS NombreAlbum,
    g.Nombre AS NombreGenero,
    c.Duracion AS DuracionSegundos,
	COUNT (hr.IdContenido) AS Reproducciones
FROM Contenido c
LEFT JOIN ContenidoInterprete ci ON c.Id = ci.IdContenido
LEFT JOIN Interprete i ON ci.IdInterprete = i.Id
LEFT JOIN Album a ON c.IdAlbum = a.Id
LEFT JOIN GeneroMusical g ON c.IdGenero = g.Id
LEFT JOIN HistorialReproduccion hr ON hr.IdContenido = c.Id
GROUP BY c.Id, c.Titulo, i.Nombre, a.Titulo, g.Nombre, c.Duracion
ORDER BY Reproducciones DESC;


select * from Contenido

--- Jabob

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


--German

--Insert Tipo mem

-- Membresía Básica
INSERT INTO TipoMembresia (Nombre, Precio, PlazoDuracion, Descripcion)
VALUES ('Básica', 4.99, 30, 'Acceso a música ilimitada con anuncios y calidad estándar (128kbps)');

-- Membresía Premium
INSERT INTO TipoMembresia (Nombre, Precio, PlazoDuracion, Descripcion)
VALUES ('Premium', 9.99, 30, 'Música sin anuncios, calidad alta (320kbps) y opción de descarga');

-- Membresía Familiar
INSERT INTO TipoMembresia (Nombre, Precio, PlazoDuracion, Descripcion)
VALUES ('Familiar', 14.99, 30, 'Plan para hasta 6 usuarios con todas las ventajas Premium y control parental');

--uSER 1 = 1.3.4.5 // USER 2 = 2.6

--(TEMPORAL OJO CON IDS)
SELECT * FROM ContenidoPorPlaylist
SELECT * FROM Contenido

INSERT INTO ContenidoPorPlaylist (IdPlaylist, IdContenido) VALUES (1, 21)
INSERT INTO ContenidoPorPlaylist (IdPlaylist, IdContenido) VALUES (1, 25)
INSERT INTO ContenidoPorPlaylist (IdPlaylist, IdContenido) VALUES (1, 26)
INSERT INTO ContenidoPorPlaylist (IdPlaylist, IdContenido) VALUES (1, 24)

INSERT INTO ContenidoPorPlaylist (IdPlaylist, IdContenido) VALUES (4, 25)
INSERT INTO ContenidoPorPlaylist (IdPlaylist, IdContenido) VALUES (4, 22)
INSERT INTO ContenidoPorPlaylist (IdPlaylist, IdContenido) VALUES (4, 29)
INSERT INTO ContenidoPorPlaylist (IdPlaylist, IdContenido) VALUES (4, 30)