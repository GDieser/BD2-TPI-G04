using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Servicio;

namespace App_Musica_BD2_TPI
{
    public partial class Interprete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarArtistas();
            }
        }

        private void CargarArtistas()
        {
            string query = "SELECT Id, NombreArtistico FROM Artista ORDER BY Nombre";

            try
            {
                AccesoDatos datos = new AccesoDatos();
                DataTable dt = datos.ObtenerTabla(query);

                ddlArtistas.DataSource = dt;
                ddlArtistas.DataTextField = "NombreArtistico";
                ddlArtistas.DataValueField = "Id";
                ddlArtistas.DataBind();

                ddlArtistas.Items.Insert(0, new ListItem("-- Seleccionar Artista --", "0"));
            }
            catch (Exception ex)
            {
                throw new Exception("Error al cargar artistas: " + ex.Message);
            }
        }

        protected void btnAgregarArtista_Click(object sender, EventArgs e)
        {
            string idSeleccionado = ddlArtistas.SelectedValue;
            string nombreSeleccionado = ddlArtistas.SelectedItem.Text;

            if (idSeleccionado != "0")
            {
                bool yaExiste = false;
                foreach (ListItem item in lstArtistasSeleccionados.Items)
                {
                    if (item.Value == idSeleccionado)
                    {
                        yaExiste = true;
                        break;
                    }
                }
                if (!yaExiste)
                {
                    lstArtistasSeleccionados.Items.Add(new ListItem(nombreSeleccionado, idSeleccionado));
                }
            }
        }



        protected void btnRemoverArtista_Click(object sender, EventArgs e)
        {
            List<ListItem> seleccionadosParaEliminar = new List<ListItem>();

            foreach (ListItem item in lstArtistasSeleccionados.Items)
            {
                if (item.Selected)
                {
                    seleccionadosParaEliminar.Add(item);
                }
            }

            foreach (ListItem item in seleccionadosParaEliminar)
            {
                lstArtistasSeleccionados.Items.Remove(item);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();

                string insertInterprete = @"
                    INSERT INTO Interprete (Nombre, FechaConsolidacion, Tipo, Descripcion)
                    VALUES (@Nombre, @FechaConsolidacion, @Tipo, @Descripcion);
                    SELECT CONVERT(INT, SCOPE_IDENTITY()) AS UltimoId;";

                List<SqlParameter> parametros = new List<SqlParameter>
                    {
                        new SqlParameter("@Nombre", txtNombre.Text),
                        new SqlParameter("@FechaConsolidacion", DateTime.Parse(txtFecha.Text)),
                        new SqlParameter("@Tipo", ddlTipo.SelectedValue),
                        new SqlParameter("@Descripcion", txtDescripcion.Text)
                    };

                DataTable dt = datos.ObtenerTabla(insertInterprete, parametros);
                int idInterprete = Convert.ToInt32(dt.Rows[0]["UltimoId"]);

                foreach (ListItem artista in lstArtistasSeleccionados.Items)
                {
                    string insertRelacion = @"
                    INSERT INTO InterpreteArtista (IdInterprete, IdArtista)
                    VALUES (@IdInterprete, @IdArtista);";

                    List<SqlParameter> parametrosRelacion = new List<SqlParameter>
                        {
                            new SqlParameter("@IdInterprete", idInterprete),
                            new SqlParameter("@IdArtista", artista.Value)
                        };

                    datos.EjecutarConsulta(insertRelacion, parametrosRelacion);
                }

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
            txtFecha.Text = "";
            ddlTipo.ClearSelection();
            txtDescripcion.Text = "";
            ddlArtistas.ClearSelection();
            lstArtistasSeleccionados.Items.Clear();

        }
    }
}