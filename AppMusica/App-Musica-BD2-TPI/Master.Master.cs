using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using static System.Collections.Specialized.BitVector32;
using Servicio;


namespace App_Musica_BD2_TPI
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected Usuario usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                usuario = (Usuario)Session["Usuario"];

                if (Page is Login || usuario != null)
                {
                    btnLogin.Visible = false;
                    btnPerfil.Enabled = true;
                }
                
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Response.Redirect("Default.aspx");
        }
    }
}