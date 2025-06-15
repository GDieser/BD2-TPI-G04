using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Servicio;

namespace App_Musica_BD2_TPI
{
    public partial class Productora : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarIdAdministrador();
            }
            lblMensaje.Text = "";
        }

        private void CargarIdAdministrador()
        {
            Usuario usuario = Session["UsuarioActivo"] as Usuario;
            if (usuario != null)
            {
                hfIDUsuarioDuenio.Value = usuario.Id.ToString();
            }
            else
            {
                
                hfIDUsuarioDuenio.Value = "4";
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string nombre = txtNombre.Text.Trim();
                string pais = txtPais.Text.Trim();
                string web = txtWeb.Text.Trim();
                string logo = txtLogo.Text.Trim();
                int idAdmin = int.Parse(hfIDUsuarioDuenio.Value);

                if (string.IsNullOrEmpty(nombre))
                {
                    lblMensaje.CssClass = "text-danger";
                    lblMensaje.Text = "El nombre es obligatorio.";
                    return;
                }

                string query = @"
                    INSERT INTO Productora (Nombre, PaisOrigen, Web, Logo, IdAdministrador)
                    VALUES (@Nombre, @Pais, @Web, @Logo, @IdAdmin);
                ";

                AccesoDatos datos = new AccesoDatos();
                var parametros = new List<System.Data.SqlClient.SqlParameter>
                {
                    new System.Data.SqlClient.SqlParameter("@Nombre", nombre),
                    new System.Data.SqlClient.SqlParameter("@Pais", pais),
                    new System.Data.SqlClient.SqlParameter("@Web", web),
                    new System.Data.SqlClient.SqlParameter("@Logo", logo),
                    new System.Data.SqlClient.SqlParameter("@IdAdmin", idAdmin)
                };

                datos.EjecutarConsulta(query, parametros);

                lblMensaje.CssClass = "text-success";
                lblMensaje.Text = "🎉 Album guardado correctamente.";

                LimpiarFormulario();
            }
            catch (Exception ex)
            {
                lblMensaje.CssClass = "text-danger";
                lblMensaje.Text = "❌ Error al guardar el Album: " + ex.Message;
            }
        }
        private void LimpiarFormulario()
        {
            txtNombre.Text = "";
            txtPais.Text = "";
            txtWeb.Text = "";
            txtLogo.Text = "";
        }
    }
}
