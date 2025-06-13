using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Servicio;

namespace App_Musica_BD2_TPI
{
    public partial class Artista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnGuardarArtista_Click(object sender, EventArgs e)
        {
            try
            {
                string query = @"
                    INSERT INTO Artista (Nombre, Apellido, NombreArtistico, FechaNacimiento, ImagenPerfil)
                    VALUES (@Nombre, @Apellido, @NombreArtistico, @FechaNacimiento, @ImagenPerfil);
                ";

                List<SqlParameter> parametros = new List<SqlParameter>()
                {
                    new SqlParameter("@Nombre", txtNombre.Text.Trim()),
                    new SqlParameter("@Apellido", txtApellido.Text.Trim()),
                    new SqlParameter("@NombreArtistico", txtNombreArtistico.Text.Trim()),
                    new SqlParameter("@FechaNacimiento", DateTime.Parse(txtFechaNacimiento.Text)),
                    new SqlParameter("@ImagenPerfil", txtImagenPerfil.Text.Trim())
                };

                AccesoDatos datos = new AccesoDatos();
                datos.EjecutarConsulta(query, parametros);

                lblMensaje.CssClass = "text-success";
                lblMensaje.Text = "🎉 Artista guardado correctamente.";

                LimpiarFormulario();
            }
            catch (Exception ex)
            {
                lblMensaje.CssClass = "text-danger";
                lblMensaje.Text = "❌ Error al guardar el artista: " + ex.Message;
            }
        }

        private void LimpiarFormulario()
        {
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtNombreArtistico.Text = "";
            txtFechaNacimiento.Text = "";
            txtImagenPerfil.Text = "";
        }
    }
}