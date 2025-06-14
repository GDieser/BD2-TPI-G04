using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace App_Musica_BD2_TPI
{
    public partial class PerfiUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Usuario"] != null)
                {
                    Usuario usuario = (Usuario)Session["Usuario"];

                    lblNombreUsuario.Text = usuario.NombreUsuario;
                    lblNombre.Text = usuario.Nombre;
                    lblApellido.Text = usuario.Apellido;
                    lblEmail.Text = usuario.Email;
                    lblFechaNacimiento.Text = usuario.FechaNacimiento.Value.ToString("yyyy-MM-dd");
                    lblIdioma.Text = usuario.IdIdioma.ToString();
                    lblRol.Text = usuario.IdRol.ToString();
                    imgFotoPerfil.ImageUrl = usuario.FotoPerfil;
                }
                else
                {

                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}