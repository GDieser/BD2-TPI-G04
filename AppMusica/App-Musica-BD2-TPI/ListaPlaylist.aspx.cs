using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Servicio;

namespace App_Musica_BD2_TPI
{
    
    public partial class ListaPlaylist : System.Web.UI.Page
    {
        AccesoDatos datos = new AccesoDatos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPlaylistsPublicas();
            }
        }

        private void CargarPlaylistsPublicas()
        {
            string query = @"
            SELECT 
                p.Id,
                p.Nombre,
                p.Descripcion,
                p.FechaCreacion,
                u.NombreUsuario AS Creador
            FROM Playlist p
            INNER JOIN Usuario u ON p.IdAdministrador = u.Id
            WHERE p.EsPublica = 1";


            DataTable tabla = datos.ObtenerTabla(query);

            dgvPlaylists.DataSource = tabla;
            dgvPlaylists.DataBind();
        }
    }
}