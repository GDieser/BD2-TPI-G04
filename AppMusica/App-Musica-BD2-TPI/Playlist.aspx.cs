using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Servicio;
using Dominio;
using System.Web.Services.Description;
using System.Data;
using System.Data.SqlClient;

namespace App_Musica_BD2_TPI
{
    public partial class Playlist : System.Web.UI.Page
    {
        protected Usuario usuario;
        AccesoDatos datos = new AccesoDatos();
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["Usuario"];

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    long idPlaylist;
                    if (long.TryParse(Request.QueryString["id"], out idPlaylist))
                    {
                        CargarCanciones(idPlaylist);
                    }
                }

            }
        }

        private void CargarCanciones(long idPlaylist)
        {
            string query = @"
                            SELECT 
                                c.Id AS IdContenido,
                                c.Titulo AS Titulo,
                                i.Nombre AS NombreInterprete,
                                a.Titulo AS NombreAlbum,
                                g.Nombre AS NombreGenero,
                                c.Duracion AS DuracionSegundos,
                                COUNT(hr.IdContenido) AS Reproducciones
                            FROM Contenido c
                            INNER JOIN ContenidoPorPlaylist cpp ON cpp.IdContenido = c.Id
                            LEFT JOIN ContenidoInterprete ci ON c.Id = ci.IdContenido
                            LEFT JOIN Interprete i ON ci.IdInterprete = i.Id
                            LEFT JOIN Album a ON c.IdAlbum = a.Id
                            LEFT JOIN GeneroMusical g ON c.IdGenero = g.Id
                            LEFT JOIN HistorialReproduccion hr ON hr.IdContenido = c.Id
                            WHERE cpp.IdPlaylist = @idPlaylist
                            GROUP BY c.Id, c.Titulo, i.Nombre, a.Titulo, g.Nombre, c.Duracion
                            ORDER BY Reproducciones DESC";

            List<SqlParameter> parametros = new List<SqlParameter>()
            {
                new SqlParameter("@idPlaylist", idPlaylist)
            };

            DataTable dt = datos.ObtenerTabla(query, parametros);

            gvCanciones.DataSource = dt;
            gvCanciones.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Session["IdPlaylistCreada"] = Request.QueryString["id"];
            Response.Redirect("AgregarContenidoPlaylist.aspx");
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

                long idPlaylist = Convert.ToInt64(Request.QueryString["id"]);

                CargarCanciones(idPlaylist);

                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Reproducción registrada');", true);
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Session["IdPlaylistCreada"] = Request.QueryString["id"];

            if (Session["IdPlaylistCreada"] == null)
            {
                throw new Exception("No se encontró el Id de la playlist en la sesión.");
            }

            long idPlaylist = Convert.ToInt64(Request.QueryString["id"]);


            List<SqlParameter> parametros = new List<SqlParameter>()
                {
                    new SqlParameter("@IdPlaylist", idPlaylist)
                };

            try
            {
                string resultadoSP = datos.EjecutarSPConMensaje("sp_eliminarPlaylist", parametros);


                string script = $"alert('{resultadoSP.Replace("'", "\\'")}');";
                ClientScript.RegisterStartupScript(this.GetType(), "mensajeSP", script, true);
                Response.Redirect("MisPlaylist.aspx");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "error",
                    $"alert('Error al borrar playlist: {ex.Message}');", true);
            }


        }

        protected void btnDuracion_Click(object sender, EventArgs e)
        {
            Session["IdPlaylistCreada"] = Request.QueryString["id"];

            if (Request.QueryString["id"] == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "error", "alert('No se encontró el ID de la playlist.');", true);
                return;
            }

            long idPlaylist = Convert.ToInt64(Request.QueryString["id"]);
            Session["IdPlaylistCreada"] = idPlaylist;

            try
            {
                int duracionTotal = CalcularDuracionTotalPlaylist(idPlaylist);

                string mensaje = $"Duración total: {duracionTotal} segundos";
                ClientScript.RegisterStartupScript(this.GetType(), "duracion", $"alert('{mensaje}');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "error", $"alert('Error: {ex.Message}');", true);
            }
        }

        private int CalcularDuracionTotalPlaylist(long idPlaylist)
        {
            string query = "SELECT dbo.fn_duracionTotalPlaylist(@IdPlaylist)";

            List<SqlParameter> parametros = new List<SqlParameter>
            {
                new SqlParameter("@IdPlaylist", idPlaylist)
            };

            object resultado = datos.EjecutarConsultaEscalar(query, parametros);
            return Convert.ToInt32(resultado);
        }

        
    }

}