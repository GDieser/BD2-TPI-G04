using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Servicio;

namespace App_Musica_BD2_TPI
{
    public partial class ListaUsuarioMembresia : System.Web.UI.Page
    {
        AccesoDatos datos = new AccesoDatos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarGrilla();
            }
        }

        public void cargarGrilla()
        {
            //Uso de vista_usuariosActivos: usuarios con suscripciones activas, mostrando fecha de vencimiento.

            string query = "SELECT Nombre, Apellido, Email, NombreUsuario, FechaVencimiento FROM vista_usuariosActivos";
            DataTable tabla = datos.ObtenerTabla(query);
            gvUsuariosActivos.DataSource = tabla;
            gvUsuariosActivos.DataBind();
            gvUsuariosActivos.Visible = true;
        }
    }
}