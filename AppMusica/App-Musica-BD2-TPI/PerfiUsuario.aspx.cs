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


                    if (usuario.IdIdioma == 1)
                    {
                        lblIdioma.Text = "Ingles";
                    }
                    else if(usuario.IdIdioma == 2)
                    {
                        lblIdioma.Text = "Español";
                    }
                    else
                    {
                        lblIdioma.Text = "Portugues";
                    }

                    if(usuario.IdRol == 1)
                    {
                        lblRol.Text = "Usuario";
                    }
                    else
                    {
                        lblRol.Text = "Administrador";
                    }

                    if(usuario.Membresia)
                    {
                        lblMembresia.Text = "Membresia Activa, Vencimiento: " + usuario.EstadoMembresia.FechaVencimiento.Value.ToString("yyyy-MM-dd");
                        btnContratar.Enabled = false;
                    }
                    else
                    {
                        lblMembresia.Text = "Su membresia venció o no se encuentra activa";
                    }

                    imgFotoPerfil.ImageUrl = usuario.FotoPerfil;
                }
                else
                {

                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void btnContratar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContratarMembresia.aspx");
        }
    }
}