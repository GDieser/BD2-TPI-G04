using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Servicio;
using Dominio;
using System.Data.SqlClient;

namespace App_Musica_BD2_TPI
{
    public partial class MisPlaylist : System.Web.UI.Page
    {
        AccesoDatos datos = new AccesoDatos();
        Usuario usuario = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["Usuario"];
            if (!IsPostBack)
            {
                CargarMisPlaylist();
            }
        }

        private void CargarMisPlaylist()
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
            WHERE p.IdAdministrador = @id";

            List<SqlParameter> parametros = new List<SqlParameter>()
            {
                 new SqlParameter("@id", usuario.Id)
            };

            DataTable tabla = datos.ObtenerTabla(query, parametros);

            dgvPlaylists.DataSource = tabla;
            dgvPlaylists.DataBind();
        }
    }
}