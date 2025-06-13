using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Servicio;

namespace App_Musica_BD2_TPI
{
    public partial class Album : System.Web.UI.Page
    {
        AccesoDatos datos = new AccesoDatos();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDropDowns();
            }
        }

        private void CargarDropDowns()
        {
            ddlProductora.DataSource = datos.ObtenerTabla("SELECT Id, Nombre FROM Productora");
            ddlProductora.DataTextField = "Nombre";
            ddlProductora.DataValueField = "Id";
            ddlProductora.DataBind();
            ddlProductora.Items.Insert(0, new ListItem("-- Seleccionar Productora --", "0"));

            ddlGenero.DataSource = datos.ObtenerTabla("SELECT Id, Nombre FROM GeneroMusical");
            ddlGenero.DataTextField = "Nombre";
            ddlGenero.DataValueField = "Id";
            ddlGenero.DataBind();
            ddlGenero.Items.Insert(0, new ListItem("-- Seleccionar Genero --", "0"));

            ddlTipoContenido.DataSource = datos.ObtenerTabla("SELECT Id, Nombre FROM TipoContenido");
            ddlTipoContenido.DataTextField = "Nombre";
            ddlTipoContenido.DataValueField = "Id";
            ddlTipoContenido.DataBind();
            ddlTipoContenido.Items.Insert(0, new ListItem("-- Seleccionar Tipo de Contenido --", "0"));
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string titulo = txtTitulo.Text.Trim();
                string fecha = txtFecha.Text;
                string portada = txtPortada.Text.Trim();
                int idProductora = int.Parse(ddlProductora.SelectedValue);
                int idGenero = int.Parse(ddlGenero.SelectedValue);
                int idTipoContenido = int.Parse(ddlTipoContenido.SelectedValue);

                string insertQuery = $@"
                    INSERT INTO Album (Titulo, IdProductora, FechaLanzamiento, Portada, IdGenero, IdTipoContenido)
                    VALUES ('{titulo}', {idProductora}, '{fecha}', '{portada}', {idGenero}, {idTipoContenido});
                ";

                datos.EjecutarConsulta(insertQuery);

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
            txtTitulo.Text = string.Empty;
            txtFecha.Text = string.Empty;
            txtPortada.Text = string.Empty;
            ddlProductora.SelectedIndex = 0;
            ddlGenero.SelectedIndex = 0;
            ddlTipoContenido.SelectedIndex = 0;
        }

        protected void btnAddProductora_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productora.aspx");
        }

        protected void btnAddGenero_Click(object sender, EventArgs e)
        {
            Response.Redirect("Genero.aspx");
        }

        protected void btnAddTipoContenido_Click(object sender, EventArgs e)
        {
            Response.Redirect("TipoContenido.aspx");
        }
    }
}