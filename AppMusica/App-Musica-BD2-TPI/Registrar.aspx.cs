using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Servicio;

namespace App_Musica_BD2_TPI
{
    public partial class Registrar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            AccesoDatos datos = new AccesoDatos();

            string rutaFoto = txtFoto.Text; 

            int idIdioma = 1;
            switch (ddlIdioma.SelectedValue)
            {
                case "es": idIdioma = 2; break;
                case "pt": idIdioma = 3; break;
            }

            List<SqlParameter> parametros = new List<SqlParameter>()
            {
                new SqlParameter("@NombreUsuario", txtUsuario.Text),
                new SqlParameter("@Nombre", txtNombre.Text),
                new SqlParameter("@Apellido", txtApellido.Text),
                new SqlParameter("@Email", txtEmail.Text),
                new SqlParameter("@Pass", txtPassword.Text),
                new SqlParameter("@FechaNacimiento", DateTime.Parse(txtFechaNacimiento.Text)),
                new SqlParameter("@Pais", ddlPais.SelectedItem.Text),
                new SqlParameter("@FotoPerfil", rutaFoto),
                new SqlParameter("@IdIdioma", idIdioma),
                new SqlParameter("@IdRol", 1) 
            };

            string query = @"
                INSERT INTO Usuario
                (NombreUsuario, Nombre, Apellido, Email, Pass, FechaNacimiento, Pais, FotoPerfil, IdIdioma, IdRol)
                VALUES
                (@NombreUsuario, @Nombre, @Apellido, @Email, @Pass, @FechaNacimiento, @Pais, @FotoPerfil, @IdIdioma, @IdRol)
                ";

            try
            {
                datos.EjecutarConsulta(query, parametros);

                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error al registrar el usuario: " + ex.Message + "');</script>");
            }
        }
    }
}