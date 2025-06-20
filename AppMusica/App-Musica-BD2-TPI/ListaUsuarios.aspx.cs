using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Servicio;

namespace App_Musica_BD2_TPI
{
    public partial class ListaUsuarios : System.Web.UI.Page
    {
        AccesoDatos datos = new AccesoDatos();
        protected Usuario usuario;
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
                CargarUsuariosAdmin();
            }
        }

        private void CargarUsuariosAdmin()
        {
            string query = @"
        SELECT 
            U.Id, 
            U.Nombre, 
            U.Apellido, 
            U.Email, 
            U.NombreUsuario, 
            U.Pais,
            CAST(
            CASE 
                WHEN EXISTS (
                    SELECT 1 
                    FROM UsuarioMembresia UM 
                    WHERE UM.IdUsuario = U.Id AND UM.Activa = 1
                ) THEN 1
                ELSE 0
            END AS BIT
        ) AS MembresiaActiva
        FROM Usuario U
        WHERE U.IdRol = 1";

            DataTable tabla = datos.ObtenerTabla(query);

            gvAdmins.DataSource = tabla;
            gvAdmins.DataBind();
        }


        protected void gvAdmins_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idSeleccionado = Convert.ToInt32(gvAdmins.SelectedDataKey.Value);
            //despues
            //Response.Redirect("DetalleUsuario.aspx?id=" + idSeleccionado);
            Response.Redirect("Default.aspx");
        }

        protected void btnUsuariosActivos_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListaUsuarioMembresia.aspx");
        }

    }
}