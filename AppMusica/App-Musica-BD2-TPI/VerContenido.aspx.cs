using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Servicio;
using Dominio;

namespace App_Musica_BD2_TPI
{
    public partial class VerContenido : System.Web.UI.Page
    {
        protected Usuario usuario;
        AccesoDatos datos = new AccesoDatos();
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["Usuario"];

            if (!IsPostBack)
            {
                CargarCanciones();
            }
        }


        private void CargarCanciones()
        {
            AccesoDatos datos = new AccesoDatos();
            string query = @"
                            SELECT 
                                c.Id AS IdContenido,
                                c.Titulo AS Titulo,
                                c.ContadorReproducciones AS ContadorView,
                                i.Nombre AS NombreInterprete,
                                a.Titulo AS NombreAlbum,
                                g.Nombre AS NombreGenero,
                                c.Duracion AS DuracionSegundos,
                                COUNT (hr.IdContenido) AS Reproducciones
                            FROM Contenido c
                            LEFT JOIN ContenidoInterprete ci ON c.Id = ci.IdContenido
                            LEFT JOIN Interprete i ON ci.IdInterprete = i.Id
                            LEFT JOIN Album a ON c.IdAlbum = a.Id
                            LEFT JOIN GeneroMusical g ON c.IdGenero = g.Id
                            LEFT JOIN HistorialReproduccion hr ON hr.IdContenido = c.Id
                            GROUP BY c.Id, c.Titulo, i.Nombre, c.ContadorReproducciones, a.Titulo, g.Nombre, c.Duracion
                            ORDER BY Reproducciones DESC;";
            DataTable dt = datos.ObtenerTabla(query);
            gvCanciones.DataSource = dt;
            gvCanciones.DataBind();
        }

        protected void gvCanciones_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Reproducir")
            {
                long idContenido = Convert.ToInt64(e.CommandArgument);
                //ContadorDeReproduccion(idContenido); /// Acá usamos el trigger de Jacob ahora, chetardo
                SimularReproduccion(idContenido);
            }
        }

        private void SimularReproduccion(long idContenido)
        {
            //long idUsuario = ObtenerIdUsuarioLogueado();
            long idUsuario = usuario.Id; // Tenemos qeu traer el IDUSuario una vez que hagamos el login

            Random rnd = new Random();
            int tiempoReproduccion = rnd.Next(0, 300);

            if (tiempoReproduccion > 30)
            {
                string insertQuery = @"
                            INSERT INTO 
                                HistorialReproduccion (IdUsuario, IdContenido, TiempoReproduccion)
                            VALUES 
                                (@IdUsuario, @IdContenido, @TiempoReproduccion)"
                ;

                List<SqlParameter> parametros = new List<SqlParameter>
                {
                    new SqlParameter("@IdUsuario", idUsuario),
                    new SqlParameter("@IdContenido", idContenido),
                    new SqlParameter("@TiempoReproduccion", tiempoReproduccion)
                };

                AccesoDatos datos = new AccesoDatos();
                datos.EjecutarConsulta(insertQuery, parametros);
                CargarCanciones();

                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Reproducción registrada');", true);
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contenido.aspx");
        }

        //Ejemplo nuevo campo tabla contenido
        private void ContadorDeReproduccion(long idContenido)
        {
            string insertQuery = @"
                            SELECT ContadorReproducciones FROM Contenido WHERE Id = @IdUsuario"
            ;

            List<SqlParameter> parametros = new List<SqlParameter>
            {
                 new SqlParameter("@IdUsuario", idContenido)
            };

            DataTable dt = datos.ObtenerTabla(insertQuery, parametros);
            int cantidad = 1;

            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];

                cantidad += Convert.ToInt32(row["ContadorReproducciones"]);

            }
            else
            {
                Console.WriteLine("No se encontró el contenido con el ID especificado");
            }

            insertQuery = @"
                            UPDATE Contenido SET ContadorReproducciones = @cantidad WHERE Id = @IdUsuario"
            ;

            List<SqlParameter> param = new List<SqlParameter>
            {
                 new SqlParameter("@IdUsuario", idContenido),
                 new SqlParameter("@cantidad", cantidad)
            };

            datos.EjecutarConsulta(insertQuery, param);

        }

        protected void gvCanciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            long idContenido = (long)gvCanciones.SelectedDataKey.Value;

            Response.Redirect("DetalleContenido.aspx?id="+idContenido);


        }
    }

}
