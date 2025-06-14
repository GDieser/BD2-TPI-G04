using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Servicio;
using Dominio;
using System.Data;
using System.Data.SqlClient;

namespace App_Musica_BD2_TPI
{
    public partial class Login : System.Web.UI.Page
    {
        AccesoDatos datos = new AccesoDatos();
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Usuario usuario = null;

            string user = txtUsuario.Text;
            string password = txtPassword.Text;

            string consulta = "SELECT * FROM Usuario WHERE NombreUsuario = @user AND Pass = @pass";

            List<SqlParameter> parametros = new List<SqlParameter>()
            {
                new SqlParameter("@user", user),
                new SqlParameter("@pass", password)
            };

            DataTable tablaUsuario = datos.ObtenerTabla(consulta, parametros);

            if (tablaUsuario.Rows.Count > 0)
            {
                DataRow fila = tablaUsuario.Rows[0];
                usuario = new Usuario
                {
                    Id = Convert.ToInt32(fila["Id"]),
                    NombreUsuario = fila["NombreUsuario"].ToString(),
                    Pass = fila["Pass"].ToString(),
                    Nombre = fila["Nombre"].ToString(),
                    Apellido = fila["Apellido"].ToString(),
                    Email = fila["Email"].ToString(),
                    FechaNacimiento = Convert.ToDateTime(fila["FechaNacimiento"]),
                    FotoPerfil = fila["FotoPerfil"].ToString(),
                    IdIdioma = Convert.ToInt32(fila["IdIdioma"]),
                    IdRol = Convert.ToInt32(fila["IdRol"])
                };
                datos.cerrarConexion();

                UsuarioMembresia membresia = null;
                long iduser = usuario.Id;
                string con = "SELECT IdUsuario, IdTipoMembresia, FechaInicio, FechaVencimiento, Activa FROM UsuarioMembresia WHERE IdUsuario = @iduser";

                List<SqlParameter> par = new List<SqlParameter>()
                {
                    new SqlParameter("@iduser", iduser),
                };

                DataTable tabla = datos.ObtenerTabla(con, par);

                if (tabla.Rows.Count > 0)
                {
                    DataRow mem = tabla.Rows[0];
                    membresia = new UsuarioMembresia
                    {
                        IdUsuario = usuario.Id,
                        IdTipoMembresia = Convert.ToInt32(mem["IdTipoMembresia"]),
                        FechaInicio = Convert.ToDateTime(mem["FechaInicio"]),
                        FechaVencimiento = Convert.ToDateTime(mem["FechaVencimiento"]),
                        Activa = Convert.ToBoolean(mem["Activa"]),
                    };

                    usuario.EstadoMembresia = membresia;
                    usuario.Membresia = Convert.ToBoolean(mem["Activa"]);
                }
                else
                {
                    usuario.Membresia = false;
                }

                //Aca forzamos, pero podria ser por un update de ultima conexio o algo asi
                string forzarTrigger = @"
                    UPDATE UsuarioMembresia 
                    SET IdUsuario = IdUsuario 
                    WHERE IdUsuario = @iduser";

                List<SqlParameter> triggerParams = new List<SqlParameter>
                {
                        new SqlParameter("@iduser", usuario.Id)
                };
                //trg_finMembresia

                datos.EjecutarConsulta(forzarTrigger, triggerParams);


                Session["Usuario"] = usuario;
                Response.Redirect("Default.aspx");

            }
            else
            {
                lblError.ForeColor = System.Drawing.Color.Red;
                if (usuario == null)
                    lblError.Text = "Usuario o contraseña invalidos";
            }
        }
    }
}