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
using System.Collections;

namespace App_Musica_BD2_TPI
{
    public partial class DetalleContenido : System.Web.UI.Page
    {
        AccesoDatos datos = new AccesoDatos();
        protected Usuario usuario;
        Dominio.Contenido contenido;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["Usuario"];

            if (usuario == null || !usuario.Membresia)
            {
                Session.Add("error", "Acceso no permitido");
                Response.Redirect("Error.aspx");
            }

            if (!IsPostBack)
            {
                CargarDatos();

                contenido = new Dominio.Contenido();

                contenido = (Dominio.Contenido)Session["Contenido"];

                if (contenido != null)
                {

                    lblTitulo.Text = contenido.Titulo;
                    lblFechaSubida.Text = "Subido el: " + contenido.FechaSubida.ToString("dd/MM/yyyy");
                    lblDescripcion.Text = contenido.Descripcion;

                }
                CargarComentarios();
            }
        }


        public void CargarDatos()
        {
            long idContenido = Convert.ToInt64(Request.QueryString["id"]);

            string insertQuery = @"
                                SELECT 
                                    Id, 
                                    Titulo, 
                                    IdTipoContenido, 
                                    IdAlbum, 
                                    IdGenero, 
                                    IdProductora, 
                                    FechaLanzamiento, 
                                    Duracion, 
                                    Portada, 
                                    FechaSubida, 
                                    IDUsuarioDueño, 
                                    FormatoArchivo, 
                                    Descripcion, 
                                    Activo, 
                                    ContadorReproducciones 
                                FROM Contenido WHERE Id = @idContenido"
            ;

            List<SqlParameter> parametros = new List<SqlParameter>
            {
                 new SqlParameter("@idContenido", idContenido)
            };

            DataTable dt = datos.ObtenerTabla(insertQuery, parametros);

            if (dt.Rows.Count > 0)
            {
                DataRow fila = dt.Rows[0];
                Dominio.Contenido contenido = new Dominio.Contenido
                {
                    Id = Convert.ToInt64(fila["Id"]),
                    Titulo = fila["Titulo"].ToString(),
                    IdTipoContenido = Convert.ToInt32(fila["IdTipoContenido"]),
                    IdAlbum = Convert.ToInt64(fila["IdAlbum"]),
                    IdGenero = Convert.ToInt32(fila["IdGenero"]),
                    IdProductora = Convert.ToInt64(fila["IdProductora"]),
                    FechaLanzamiento = Convert.ToDateTime(fila["FechaLanzamiento"]),
                    Duracion = Convert.ToInt32(fila["Duracion"]),
                    Portada = fila["Portada"].ToString(),
                    FechaSubida = Convert.ToDateTime(fila["FechaSubida"]),
                    IdUsuarioDueño = Convert.ToInt64(fila["IDUsuarioDueño"]),
                    FormatoArchivo = fila["FormatoArchivo"].ToString(),
                    Descripcion = fila["Descripcion"].ToString(),
                    Activo = Convert.ToBoolean(fila["Activo"]),
                    ContadorReproducciones = Convert.ToInt32(fila["ContadorReproducciones"])

                };

                Session["Contenido"] = contenido;
            }

        }

        public void CargarComentarios()
        {
            long idContenido = Convert.ToInt64(Request.QueryString["id"]);

            string query = @"
                SELECT 
                    IdComentario AS Id,
                    NombreUsuario,
                    Comentario,
                    FechaComentario
                FROM vista_comentariosRecientes
                WHERE IdContenido = @idContenido
                ORDER BY FechaComentario DESC";

            List<SqlParameter> parametros = new List<SqlParameter>
            {
                new SqlParameter("@idContenido", idContenido)
            };

            DataTable dt = datos.ObtenerTabla(query, parametros);

            rptComentarios.DataSource = dt;
            rptComentarios.DataBind();

        }

        protected void btnEnviarComentario_Click(object sender, EventArgs e)
        {
            string comentario = txtNuevoComentario.Text;
            long idUsuario = usuario.Id;
            long idContenido = Convert.ToInt64(Request.QueryString["id"]);

            string insertQuery = @"
                               INSERT INTO Comentarios
                                (IdUsuario, IdContenido, Comentario, FechaComentario) 
                               VALUES(@idUsuario, @idContenido, @comentario, GETDATE());"
            ;

            List<SqlParameter> parametros = new List<SqlParameter>
            {
                 new SqlParameter("@idUsuario", idUsuario),
                 new SqlParameter("@idContenido", idContenido),
                 new SqlParameter("@comentario", comentario)
            };

            try
            {
                datos.EjecutarConsulta(insertQuery, parametros);

                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error al registrar comentario: " + ex.Message + "');</script>");
            }

        }

        protected void btnEnviarCalificacion_Click(object sender, EventArgs e)
        {
            
            long idUsuario = usuario.Id;
            long idContenido = Convert.ToInt64(Request.QueryString["id"]);
            int puntuacion = ddlPuntuacion.SelectedIndex;


            List<SqlParameter> parametros = new List<SqlParameter>
            {
                 new SqlParameter("@idUsuario", idUsuario),
                 new SqlParameter("@idContenido", idContenido),
                 new SqlParameter("@puntuacion", puntuacion)
            };

            string existeQuery = @"
                        SELECT COUNT(*) 
                        FROM Calificaciones 
                        WHERE IdUsuario = @idUsuario AND IdContenido = @idContenido";

            int existe = Convert.ToInt32(datos.ObtenerValor(existeQuery, parametros));
            //Es a modo de ejemplo, no supe como traer el comentario de trigger :C
            if (existe > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Ya existe una calificación para este contenido.');", true);
            }
            else
            {
                List<SqlParameter> insertParametros = new List<SqlParameter>
                {
                    new SqlParameter("@idUsuario", idUsuario),
                    new SqlParameter("@idContenido", idContenido),
                    new SqlParameter("@puntuacion", puntuacion)
                };

                string insertQuery = @"
                    INSERT INTO Calificaciones(IdUsuario, IdContenido, Puntuacion, Fecha) 
                    VALUES (@idUsuario, @idContenido, @puntuacion, GETDATE())";

                datos.EjecutarConsulta(insertQuery, insertParametros);

                Response.Redirect(Request.RawUrl);
            }
        }
    }
}