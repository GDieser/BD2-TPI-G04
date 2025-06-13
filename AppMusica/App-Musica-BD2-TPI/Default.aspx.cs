using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Servicio;

namespace App_Musica_BD2_TPI
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                            GROUP BY c.Id, c.Titulo, i.Nombre, a.Titulo, g.Nombre, c.Duracion
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
                SimularReproduccion(idContenido);
            }
        }

        private void SimularReproduccion(long idContenido)
        {
            //long idUsuario = ObtenerIdUsuarioLogueado();
            long idUsuario = 4; // Tenemos qeu traer el IDUSuario una vez que hagamos el login

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
    }
}