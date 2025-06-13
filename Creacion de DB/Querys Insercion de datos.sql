USE BD2_TPI_G04
GO

INSERT INTO Idioma(Nombre) VALUES ('INGLES'), ('ESPAÑOL'), ('PORTUGUES')
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
VALUES ('Columbia Records', 'EE.UU.', 'https://www.columbiarecords.com', NULL, 4);

SELECT * FROM TipoContenido

INSERT INTO Album (Titulo, IdProductora, FechaLanzamiento, Portada, IdGenero, IdTipoContenido)
VALUES ('Random Access Memories', 4, '2013-05-17', 'https://upload.wikimedia.org/wikipedia/en/a/a7/Random_Access_Memories.jpg', 1, 1);

SELECT * FROM Album

INSERT INTO InterpretePorAlbum (IdInterprete, IdAlbum)
VALUES (1, 1);
-- REVISAR LOS ID's DE IDALBUM, IDPRODUCTORA E IDUSUARIODUEÑO OJOOOOO!!
INSERT INTO Contenido (Titulo, IdTipoContenido, IdAlbum, IdGenero, IdProductora, FechaLanzamiento, Duracion, Portada, IDUsuarioDueño, FormatoArchivo, Descripcion, Activo)
VALUES 
('Give Life Back to Music', 1, 5, 1, 4, '2013-05-17', 272, 'cover1.jpg', 4, 'mp3', 'Track 1', 1),
('The Game of Love', 1, 5, 1, 4, '2013-05-17', 330, 'cover2.jpg', 4, 'mp3', 'Track 2', 1),
('Giorgio by Moroder', 1, 5, 1, 4, '2013-05-17', 546, 'cover3.jpg', 4, 'mp3', 'Track 3', 1),
('Within', 1, 5, 1,4, '2013-05-17', 223, 'cover4.jpg', 4, 'mp3', 'Track 4', 1),
('Instant Crush', 1, 5, 1, 4, '2013-05-17', 337, 'cover5.jpg', 4, 'mp3', 'Track 5', 1),
('Lose Yourself to Dance', 1, 5, 1, 4, '2013-05-17', 335, 'cover6.jpg', 4, 'mp3', 'Track 6', 1),
('Touch', 1, 5, 1, 4, '2013-05-17', 512, 'cover7.jpg', 4, 'mp3', 'Track 7', 1),
('Get Lucky', 1, 5, 1, 4, '2013-05-17', 369, 'cover8.jpg', 4, 'mp3', 'Track 8', 1),
('Beyond', 1, 5, 1, 4, '2013-05-17', 295, 'cover9.jpg', 4, 'mp3', 'Track 9', 1),
('Motherboard', 1, 5, 1, 4, '2013-05-17', 309, 'cover10.jpg', 4, 'mp3', 'Track 10', 1);

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