

USE BD2_TPI_G04
GO

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


--vista_usuariosActivos: usuarios con suscripciones activas, mostrando fecha de vencimiento.

CREATE VIEW vista_usuariosActivos AS
SELECT 
    U.Id AS IdUsuario,
    U.NombreUsuario,
    U.Nombre,
    U.Apellido,
    U.Email,
    UM.FechaVencimiento

FROM Usuario U INNER JOIN UsuarioMembresia um ON UM.IdUsuario = U.Id WHERE UM.Activa = 1;

GO

--vista_comentariosRecientes:  Muestra los comentarios hechos por lo usuarios,con el título(del contenido)
-- y la fecha, ordenados de forma DESC para que los comentarios más nuevos aparezcan primero.

CREATE VIEW vista_comentariosRecientes AS
SELECT 
    c.Id AS IdComentario,
    c.IdContenido,
    u.NombreUsuario,
    ct.Titulo AS Contenido,
    c.Comentario,
    c.FechaComentario
FROM Comentarios c
JOIN Usuario u ON c.IdUsuario = u.Id
JOIN Contenido ct ON c.IdContenido = ct.Id;



