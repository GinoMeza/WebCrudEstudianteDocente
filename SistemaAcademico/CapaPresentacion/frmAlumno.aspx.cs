using System;
using System.Web.UI;
using CapaEntidad;
using CapaNegocio;

namespace CapaPresentacion
{
    public partial class frmAlumno : System.Web.UI.Page
    {
        private void Listar()
        {
            AlumnoBL alumnoBL = new AlumnoBL();
            gvAlumno.DataSource = alumnoBL.Listar();
            gvAlumno.DataBind();
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

            Alumno alumno = new Alumno
            {
                CodAlumno = txtCodAlumno.Text.Trim(),
                APaterno = txtAPaterno.Text.Trim(),
                AMaterno = txtAMaterno.Text.Trim(),
                Nombres = txtNombres.Text.Trim(),
                CodUsuario = txtCodUsuario.Text.Trim(),
                Contrasena = txtContrasena.Text.Trim(),
                CodEscuela = txtCodEscuela.Text.Trim()
            };

            AlumnoBL alumnoBL = new AlumnoBL();
            if (alumnoBL.Agregar(alumno))
                Listar();
            lblMensaje.Text = alumnoBL.Mensaje;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string codAlumno = txtCodAlumno.Text.Trim();
            AlumnoBL alumnoBL = new AlumnoBL();
            if (alumnoBL.Eliminar(codAlumno))
                Listar();
            lblMensaje.Text = alumnoBL.Mensaje;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string codAlumno = txtCodAlumno.Text.Trim();
            AlumnoBL alumnoBL = new AlumnoBL();
            gvAlumno.DataSource = alumnoBL.Buscar(codAlumno);
            gvAlumno.DataBind();
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

            Alumno alumno = new Alumno
            {
                CodAlumno = txtCodAlumno.Text.Trim(),
                APaterno = txtAPaterno.Text.Trim(),
                AMaterno = txtAMaterno.Text.Trim(),
                Nombres = txtNombres.Text.Trim(),
                CodEscuela = txtCodEscuela.Text.Trim()
            };

            AlumnoBL alumnoBL = new AlumnoBL();
            if (alumnoBL.Actualizar(alumno))
                Listar();
            lblMensaje.Text = alumnoBL.Mensaje;
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            Listar();
        }
    }
}
