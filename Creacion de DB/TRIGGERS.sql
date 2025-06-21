 

USE BD2_TPI_G04
GO

--trg_finMembresia: al llegar la fecha de vencimiento, actualiza el estado de la membresía del usuario.

--Vamos a necesitar un tabla intermedia

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

--trg_registrarReproduccion: al registrar una reproducción, actualiza el contador de la canción.

-- Se activará después de una inserción en la tabla HistorialReproduccion, y se encargará de incrementar el contador 
-- de la canción reproducida:

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

-- trg_limitarPuntuacion: Este trigger evita que un usuario vuelva a calificar un contenido, para evitar duplicados y así 
-- no afectar al sistema de puntajes.

CREATE TRIGGER trg_limitarPuntuacion
ON Calificaciones
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS(
        SELECT 1
        FROM Calificaciones c
        JOIN inserted i ON c.IdUsuario = i.IdUsuario AND c.IdContenido = i.IdContenido
    )
    BEGIN
    PRINT 'Ya existe una calificación para este contenido.'
    RETURN;
    END

    INSERT INTO Calificaciones(IdUsuario, IdContenido, Puntuacion, Fecha)
    SELECT IdUsuario,IdContenido,Puntuacion,Fecha
    FROM inserted;
END;

