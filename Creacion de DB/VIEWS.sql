USE BD2_TPI_G04
GO

--Darian Hiebl
--3) v1 
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

--German D
--3) v2
--vista_topNCanciones: Vista que muestra las canciones mas reproducidas en forma descendente
CREATE VIEW vista_topCanciones AS
SELECT TOP 100
    c.Id AS id_cancion,
    c.Titulo,
    c.FechaLanzamiento,
    c.Duracion,
    c.Descripcion,
    g.Nombre AS Genero,
    c.ContadorReproducciones AS TotalReproducciones
FROM Contenido c
INNER JOIN GeneroMusical g ON g.Id = c.IdGenero
WHERE c.Activo = 1
ORDER BY 
    c.ContadorReproducciones DESC;
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
--No se puede ejecutar el ORDER BY en la vista directamente, alternativ:

--Alternativa 
CREATE VIEW vista_comentariosRecientes AS
SELECT 
    c.Id AS IdComentario,
    c.IdContenido,  -- Agregar para ver por contenido, si no, trae todos los registros --
    u.NombreUsuario,
    ct.Titulo AS Contenido,
    c.Comentario,
    c.FechaComentario
FROM Comentarios c
JOIN Usuario u ON c.IdUsuario = u.Id
JOIN Contenido ct ON c.IdContenido = ct.Id;

SELECT * FROM vista_comentariosRecientes
ORDER BY FechaComentario DESC;

GO
