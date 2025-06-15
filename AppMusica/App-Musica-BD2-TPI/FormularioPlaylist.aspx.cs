using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Servicio;

namespace App_Musica_BD2_TPI
{
    public partial class FormularioPlaylist : System.Web.UI.Page
    {
        AccesoDatos datos = new AccesoDatos();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCrearPlaylist_Click(object sender, EventArgs e)
        {
            Usuario usuario = Session["Usuario"] as Usuario;
            if (usuario == null || !usuario.Membresia)
            {
                lblMensaje.Text = "Debes estar logueado y tener una membresía activa para crear una playlist.";
                return;
            }

            string nombre = txtNombre.Text.Trim();
            string descripcion = txtDescripcion.Text.Trim();
            string imagenUrl = txtImagenUrl.Text.Trim();
            bool esPublica = Convert.ToBoolean(ddlEsPublica.SelectedValue);
            DateTime fecha = DateTime.Today;

            string query = @"INSERT INTO Playlist (Nombre, EsPublica, Descripcion, ImagenURL, FechaCreacion, IdAdministrador)
                     VALUES (@nombre, @esPublica, @descripcion, @imagenUrl, @fecha, @idAdmin);
                     SELECT SCOPE_IDENTITY();";

            List<SqlParameter> parametros = new List<SqlParameter>()
            {
                new SqlParameter("@nombre", nombre),
                new SqlParameter("@esPublica", esPublica),
                new SqlParameter("@descripcion", descripcion),
                new SqlParameter("@imagenUrl", imagenUrl),
                new SqlParameter("@fecha", fecha),
                new SqlParameter("@idAdmin", usuario.Id)
            };

            DataTable resultado = datos.ObtenerTabla(query, parametros);
            long idPlaylist = Convert.ToInt64(resultado.Rows[0][0]);

            Session.Remove("IdPlaylistCreada");
            Session["IdPlaylistCreada"] = idPlaylist;
            Response.Redirect("AgregarContenidoPlaylist.aspx");
        }

    }
}