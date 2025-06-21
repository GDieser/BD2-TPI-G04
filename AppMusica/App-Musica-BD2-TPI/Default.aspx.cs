using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Servicio;

namespace App_Musica_BD2_TPI
{
    public partial class Default : System.Web.UI.Page
    {
        AccesoDatos datos = new AccesoDatos();
        protected void Page_Load(object sender, EventArgs e)
        {
            

            string queryAlbum = @"
                            SELECT Titulo, Portada, I.Nombre FROM Album A 
                            INNER JOIN InterpretePorAlbum IA ON IA.IdAlbum = A.Id 
                            INNER JOIN Interprete I ON I.Id = IA.IdInterprete;";
             

            rptAlbumes.DataSource = datos.ObtenerTabla(queryAlbum);
            rptAlbumes.DataBind();

            string queryArtista = @"
                            SELECT NombreArtistico, ImagenPerfil FROM Artista;";

            rptArtistas.DataSource = datos.ObtenerTabla(queryArtista);
            rptArtistas.DataBind();

            string queryPlaylist = @"
                            SELECT Nombre, Descripcion, ImagenURL FROM Playlist WHERE EsPublica = 1;";

            rptPlaylists.DataSource = datos.ObtenerTabla(queryPlaylist);
            rptPlaylists.DataBind();
        }
        
    }
}