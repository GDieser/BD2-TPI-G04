

USE BD2_TPI_G04
GO

-- fn_duracionTotalPlaylist: Funcion que devuelve la duracion en segundos de la playlist ingresada como parametro

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
