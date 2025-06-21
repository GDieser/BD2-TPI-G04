

USE BD2_TPI_G04
GO

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

GO

-- sp_agregarCancionAPlaylist agrega una canción a una playlist, validando que no esté repetida.

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