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
    public partial class ContratarMembresia : System.Web.UI.Page
    {
        private List<Membresia> listaMembresias;
        AccesoDatos datos = new AccesoDatos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                CargarMembresias();
            }
        }

        private void CargarMembresias()
        {
            listaMembresias = new List<Membresia>();

            
            string query = "SELECT Id, Nombre, Precio, Descripcion FROM TipoMembresia";
            DataTable tabla = datos.ObtenerTabla(query);

            foreach (DataRow fila in tabla.Rows)
            {
                Membresia m = new Membresia()
                {
                    Id = Convert.ToInt32(fila["Id"]),
                    Nombre = fila["Nombre"].ToString(),
                    Precio = Convert.ToDecimal(fila["Precio"]),
                    Descripcion = fila["Descripcion"].ToString()
                };
                listaMembresias.Add(m);
            }

            ddlMembresias.DataSource = listaMembresias;
            ddlMembresias.DataTextField = "Nombre";
            ddlMembresias.DataValueField = "Id";
            ddlMembresias.DataBind();

            Session["MembresiasDisponibles"] = listaMembresias;

            ddlMembresias_SelectedIndexChanged(null, null);
        }

        protected void ddlMembresias_SelectedIndexChanged(object sender, EventArgs e)
        {
            var lista = (List<Membresia>)Session["MembresiasDisponibles"];

            var seleccionada = lista.FirstOrDefault(x => x.Id == int.Parse(ddlMembresias.SelectedValue));

            if (seleccionada != null)
            {
                lblPrecio.Text = $"${seleccionada.Precio}";
                lblDescripcion.Text = seleccionada.Descripcion;
                panelDetalle.Visible = true;
            }
        }

        protected void btnContratar_Click(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["Usuario"];
            if (usuario == null) return;

            int idMembresia = int.Parse(ddlMembresias.SelectedValue);

            DateTime fechaInicio = DateTime.Now;
            DateTime fechaFin = fechaInicio.AddDays(30);

            string queryInsert;
            List<SqlParameter> parametros;

            if (usuario.EstadoMembresia != null)
            {
                parametros = new List<SqlParameter>()
                {
                    new SqlParameter("@IdUsuario", usuario.Id),
                    new SqlParameter("@IdTipoMembresia", idMembresia),
                    new SqlParameter("@FechaInicio", fechaInicio),
                    new SqlParameter("@FechaVencimiento", fechaFin),
                    new SqlParameter("@Activo", true)
                };

                queryInsert = @"
                UPDATE UsuarioMembresia SET IdTipoMembresia = @IdTipoMembresia, FechaInicio = @FechaInicio, FechaVencimiento = @FechaVencimiento, Activa = @Activo WHERE IdUsuario = @IdUsuario;
               ";
            }
            else
            {
                parametros = new List<SqlParameter>()
                {
                    new SqlParameter("@IdUsuario", usuario.Id),
                    new SqlParameter("@IdTipoMembresia", idMembresia),
                    new SqlParameter("@FechaInicio", fechaInicio),
                    new SqlParameter("@FechaVencimiento", fechaFin),
                    new SqlParameter("@Activo", true)
                };

                queryInsert = @"
                INSERT INTO UsuarioMembresia (IdUsuario, IdTipoMembresia, FechaInicio, FechaVencimiento, Activa)
                VALUES (@IdUsuario, @IdTipoMembresia, @FechaInicio, @FechaVencimiento, @Activo)
               ";
            }

            datos.EjecutarConsulta(queryInsert, parametros);

            // Actualizar datos de ses
            usuario.Membresia = true;

            UsuarioMembresia nueva = new UsuarioMembresia()
            {
                IdUsuario = usuario.Id,
                IdTipoMembresia = idMembresia,
                FechaInicio = fechaInicio,
                FechaVencimiento = fechaFin,
                Activa = true
            };

            usuario.EstadoMembresia = nueva;

            Session["Usuario"] = usuario;

            Response.Redirect("PerfiUsuario.aspx");
        }

    }
}