using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class frmSistemaDocente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TipoUsuario"] == null)
            {
                Response.Redirect("frmLogin");
            }
            else { lblDocente.Text = "Bienvenido Alumno: " + Session["CodUsuario"]; }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("TipoUsuario");
            Session.Remove("CodUsuario");
            Response.Redirect("frmLogin.aspx");
        }
    }
}