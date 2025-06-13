using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Servicio;

namespace App_Musica_BD2_TPI
{
    public partial class TipoContenido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string nombre = txtNombre.Text.Trim();
                string descripcion = txtDescripcion.Text.Trim();

                if (string.IsNullOrEmpty(nombre))
                {
                    lblMensaje.CssClass = "text-danger";
                    lblMensaje.Text = "El nombre es obligatorio.";
                    return;
                }

                string query = @"
                    INSERT INTO TipoContenido (Nombre, Descripcion)
                    VALUES (@Nombre, @Descripcion);
                ";

                AccesoDatos datos = new AccesoDatos();
                var parametros = new List<System.Data.SqlClient.SqlParameter>
                {
                    new System.Data.SqlClient.SqlParameter("@Nombre", nombre),
                    new System.Data.SqlClient.SqlParameter("@Descripcion", descripcion)
                };

                datos.EjecutarConsulta(query, parametros);

                lblMensaje.CssClass = "text-success";
                lblMensaje.Text = "🎉 Tipo Contenido guardado correctamente.";

                LimpiarFormulario();
            }
            catch (Exception ex)
            {
                lblMensaje.CssClass = "text-danger";
                lblMensaje.Text = "❌ Error al guardar el Tipo Contenido: " + ex.Message;
            }
        }

        private void LimpiarFormulario()
        {
            txtNombre.Text = "";
            txtDescripcion.Text = "";
        }
    }
}