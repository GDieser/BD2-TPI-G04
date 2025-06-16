using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Servicio;
using Dominio;

namespace App_Musica_BD2_TPI
{
    public partial class ListaTopCanciones : System.Web.UI.Page
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
            //Aca ver que verson usar por el cambio de Jacob

            string query = "SELECT id_cancion, Titulo, FechaLanzamiento, Duracion, Descripcion, Genero, TotalReproducciones FROM vista_topCanciones";
            DataTable tabla = datos.ObtenerTabla(query);
            gvContenido.DataSource = tabla;
            gvContenido.DataBind();
            gvContenido.Visible = true;
        }
    }
}