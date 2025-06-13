using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Servicio;

namespace App_Musica_BD2_TPI
{
    public partial class Contenido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarListas();

                Usuario usuario = Session["UsuarioActivo"] as Usuario;
                if (usuario != null)
                {
                    hfIDUsuarioDuenio.Value = usuario.Id.ToString();
                }
                else
                {
                    // Mock con ID usuario = 4 (insercion desde BD)
                    hfIDUsuarioDuenio.Value = 4.ToString();
                }
            }

        }


        private void CargarListas()
        {
            AccesoDatos datos = new AccesoDatos();

            DataTable dtTipoContenido = datos.ObtenerTabla("SELECT Id, Nombre FROM TipoContenido");
            lstTipoContenido.DataSource = dtTipoContenido;
            lstTipoContenido.DataTextField = "Nombre";
            lstTipoContenido.DataValueField = "Id";
            lstTipoContenido.DataBind();

            DataTable dtAlbum = datos.ObtenerTabla("SELECT Id, Titulo FROM Album");
            lstAlbum.DataSource = dtAlbum;
            lstAlbum.DataTextField = "Titulo";
            lstAlbum.DataValueField = "Id";
            lstAlbum.DataBind();

            DataTable dtGenero = datos.ObtenerTabla("SELECT Id, Nombre FROM GeneroMusical");
            lstGenero.DataSource = dtGenero;
            lstGenero.DataTextField = "Nombre";
            lstGenero.DataValueField = "Id";
            lstGenero.DataBind();

            DataTable dtProductora = datos.ObtenerTabla("SELECT Id, Nombre FROM Productora");
            lstProductora.DataSource = dtProductora;
            lstProductora.DataTextField = "Nombre";
            lstProductora.DataValueField = "Id";
            lstProductora.DataBind();

            DataTable dtInterprete = datos.ObtenerTabla("SELECT Id, Nombre FROM Interprete");
            lstInterpete.DataSource = dtInterprete;
            lstInterpete.DataTextField = "Nombre";
            lstInterpete.DataValueField = "Id";
            lstInterpete.DataBind();
        }

        protected void btnAddTipoContenido_Click(object sender, EventArgs e)
        {
            Response.Redirect("TipoContenido.aspx");
        }

        protected void btnAddAlbum_Click(object sender, EventArgs e)
        {
            Response.Redirect("Album.aspx");
        }

        protected void btnAddGenero_Click(object sender, EventArgs e)
        {
            Response.Redirect("Genero.aspx");
        }

        protected void btnAddProductora_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productora.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string insertQuery = $@"
                INSERT INTO Contenido 
                (
                    Titulo, 
                    IdTipoContenido, 
                    IdAlbum, 
                    IdGenero, 
                    IdProductora, 
                    FechaLanzamiento, 
                    Duracion, 
                    Portada, 
                    IDUsuarioDueño, 
                    FormatoArchivo, 
                    Descripcion, 
                    Activo
                )
                VALUES 
                (
                    '{txtTitulo.Text}', 
                    {lstTipoContenido.SelectedValue}, 
                    {lstAlbum.SelectedValue}, 
                    {lstGenero.SelectedValue}, 
                    {lstProductora.SelectedValue}, 
                    '{txtFechaLanzamiento.Text}', 
                    {txtDuracion.Text}, 
                    '{txtPortada.Text}', 
                    {hfIDUsuarioDuenio.Value}, 
                    '{txtFormatoArchivo.Text}', 
                    '{txtDescripcion.Text}', 
                    1
                );
                SELECT CONVERT(INT, SCOPE_IDENTITY()) AS UltimoId;
                ";

                AccesoDatos datos = new AccesoDatos();

                DataTable dtUltimoId = datos.ObtenerTabla(insertQuery);
                int idContenido = Convert.ToInt32(dtUltimoId.Rows[0]["UltimoId"]);

                string insertQueryInterprete = $@"
                    INSERT INTO ContenidoInterprete (IdContenido, IdInterprete)
                    VALUES ({idContenido}, {lstInterpete.SelectedValue});
                    ";
                datos.EjecutarConsulta(insertQueryInterprete);

                lblMensaje.CssClass = "text-success";
                lblMensaje.Text = "🎉 Contenido guardado correctamente.";

                LimpiarFormulario();
            }
            catch (Exception ex)
            {
                lblMensaje.CssClass = "text-danger";
                lblMensaje.Text = "❌ Error al guardar el contenido: " + ex.Message;
            }
        }
        protected void btnAddInterprete_Click(object sender, EventArgs e)
        {
            Response.Redirect("Interprete.aspx");
        }

        private void LimpiarFormulario()
        {
            txtTitulo.Text = "";
            lstTipoContenido.SelectedIndex = -1;
            lstAlbum.SelectedIndex = -1;
            lstGenero.SelectedIndex = -1;
            lstProductora.SelectedIndex = -1;
            txtFechaLanzamiento.Text = "";
            txtDuracion.Text = "";
            txtPortada.Text = "";
            txtFormatoArchivo.Text = "";
            txtDescripcion.Text = "";
        }
    }
}