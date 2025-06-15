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
    public partial class AgregarContenidoPlaylist : System.Web.UI.Page
    {
        AccesoDatos datos = new AccesoDatos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCanciones();
            }
        }

        private void CargarCanciones()
        {
            //string query = "SELECT Id, Titulo, Artista FROM Contenido WHERE Activo = 1";

            string query = @"
                            SELECT 
                                c.Id AS Id,
                                c.Titulo AS Titulo,
                                i.Nombre AS Artista
                            FROM Contenido c
                            LEFT JOIN ContenidoInterprete ci ON c.Id = ci.IdContenido
                            LEFT JOIN Interprete i ON ci.IdInterprete = i.Id
                            WHERE c.Activo = 1;";


            DataTable tabla = datos.ObtenerTabla(query);

            gvCanciones.DataSource = tabla;
            gvCanciones.DataBind();
        }

        protected void gvCanciones_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Agregar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow fila = gvCanciones.Rows[index];
                long idContenido = Convert.ToInt64(gvCanciones.DataKeys[index].Value);

                if (Session["IdPlaylistCreada"] == null)
                {
                    throw new Exception("No se encontró el Id de la playlist en la sesión.");
                }
                long idPlaylist = Convert.ToInt64(Session["IdPlaylistCreada"]);

                
                List<SqlParameter> parametros = new List<SqlParameter>()
                {
                    new SqlParameter("@IdPlaylist", idPlaylist),
                    new SqlParameter("@IdContenido", idContenido)
                };

                try
                {
                    string resultadoSP = datos.EjecutarSPConMensaje("sp_agregarCancionAPlaylist", parametros);

                    
                    string script = $"alert('{resultadoSP.Replace("'", "\\'")}');";
                    ClientScript.RegisterStartupScript(this.GetType(), "mensajeSP", script, true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "error",
                        $"alert('Error al agregar canción: {ex.Message}');", true);
                }

            }
        }
    }
}