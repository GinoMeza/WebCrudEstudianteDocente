using System;
using System.Web.UI;
using CapaEntidad;
using CapaNegocio;

namespace CapaPresentacion
{
    public partial class frmDocente : System.Web.UI.Page
    {
        private void Listar()
        {
            DocenteBL docenteBL = new DocenteBL();
            gvDocente.DataSource = docenteBL.Listar();
            gvDocente.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Listar();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string contrasena = txtContrasena.Text.Trim();
            string confirmacion = txtConfirmarContrasena.Text.Trim();

            if (contrasena != confirmacion)
            {
                lblMensaje.Text = "Las contraseñas no coinciden. Verifique.";
                return;
            }

            Docente docente = new Docente
            {
                CodDocente = txtCodDocente.Text.Trim(),
                APaterno = txtAPaterno.Text.Trim(),
                AMaterno = txtAMaterno.Text.Trim(),
                Nombres = txtNombres.Text.Trim(),
                CodUsuario = txtCodUsuario.Text.Trim(),
                Contrasena = txtContrasena.Text.Trim()
            };

            DocenteBL docenteBL = new DocenteBL();
            if (docenteBL.Agregar(docente))
                Listar();
            lblMensaje.Text = docenteBL.Mensaje;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string codDocente = txtCodDocente.Text.Trim();
            DocenteBL docenteBL = new DocenteBL();
            if (docenteBL.Eliminar(codDocente))
                Listar();
            lblMensaje.Text = docenteBL.Mensaje;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string codDocente = txtCodDocente.Text.Trim();
            DocenteBL docenteBL = new DocenteBL();
            gvDocente.DataSource = docenteBL.Buscar(codDocente);
            gvDocente.DataBind();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string contrasena = txtContrasena.Text.Trim();
            string confirmacion = txtConfirmarContrasena.Text.Trim();

            if (contrasena != confirmacion)
            {
                lblMensaje.Text = "Las contraseñas no coinciden. Verifique.";
                return;
            }

            Docente docente = new Docente
            {
                CodDocente = txtCodDocente.Text.Trim(),
                APaterno = txtAPaterno.Text.Trim(),
                AMaterno = txtAMaterno.Text.Trim(),
                Nombres = txtNombres.Text.Trim(),
                Contrasena = txtContrasena.Text.Trim()
            };

            DocenteBL docenteBL = new DocenteBL();
            if (docenteBL.Actualizar(docente))
                Listar();
            lblMensaje.Text = docenteBL.Mensaje;
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            Listar();
        }
    }
}
