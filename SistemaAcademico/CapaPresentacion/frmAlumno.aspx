<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmAlumno.aspx.cs" Inherits="CapaPresentacion.frmAlumno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>Mantenimiento de la tabla alumno</p>
    <p>
        CodAlumno <asp:TextBox runat="server" ID="txtCodAlumno"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvCodAlumno" runat="server" ControlToValidate="txtCodAlumno" ErrorMessage="CodAlumno obligatorio" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="frvCodAlumnoEliminar" runat="server" ControlToValidate="txtCodAlumno" ErrorMessage="CodAlumno Requerido" ValidationGroup="Eliminar">*</asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvCodAlumnoBuscar" runat="server" ControlToValidate="txtCodAlumno" ErrorMessage="CodAlumno Obligatorio" ValidationGroup="Buscar">*</asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvCodAlumnoActualizar" runat="server" ControlToValidate="txtCodAlumno" ErrorMessage="CodAlumno Obligatorio" ValidationGroup="Actualizar">*</asp:RequiredFieldValidator>
        <asp:Button Text="Buscar" runat="server" Id="btnBuscar" CssClass="btn btn-info" OnClick="btnBuscar_Click" ValidationGroup="Buscar"/>
    </p>
    <p>
        APaterno <asp:TextBox runat="server" ID="txtAPaterno"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvAPaterno" runat="server" ControlToValidate="txtAPaterno" ErrorMessage="APaterno obligatorio" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
    </p>
    <p>
        AMaterno <asp:TextBox runat="server" ID="txtAMaterno"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvAMaterno" runat="server" ControlToValidate="txtAMaterno" ErrorMessage="AMaterno obligatorio" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
    </p>
    <p>
        Nombres <asp:TextBox runat="server" ID="txtNombres"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNombres" runat="server" ControlToValidate="txtNombres" ErrorMessage="Nombres obligatorio" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
    </p>
    <p>
        CodUsuario <asp:TextBox runat="server" ID="txtCodUsuario"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvCodUsuario" runat="server" ControlToValidate="txtCodUsuario" ErrorMessage="CodUsuario obligatorio" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
    </p>
    <p>
        Contraseña <asp:TextBox runat="server" ID="txtContrasena" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvContrasena" runat="server" ControlToValidate="txtContrasena" ErrorMessage="Contraseña Oblogatorio" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
    </p>
    <p>
        Confirmar Contraseña <asp:TextBox runat="server" Id="txtConfirmarContrasena" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvConfirmarContrasena" runat="server" ControlToValidate="txtConfirmarContrasena" ErrorMessage="Confirmar Contraceña Obligatorio" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cvContrasenas" runat="server" ControlToCompare="txtContrasena" ControlToValidate="txtConfirmarContrasena" ErrorMessage="Contraseña y Confirmar Contraseña tiene que ser iguales" ValidationGroup="Agregar">*</asp:CompareValidator>
        <asp:CompareValidator ID="cvConfirmarContrasenaActualizar" runat="server" ControlToCompare="txtContrasena" ControlToValidate="txtConfirmarContrasena" ErrorMessage="ConfirmarContraseña deve ser igual a Contraseña" ValidationGroup="Actualizar">*</asp:CompareValidator>
    </p>
    <p>
        CodEscuela <asp:TextBox runat="server" ID="txtCodEscuela" />
        <asp:RequiredFieldValidator ID="rfvCodEscuela" runat="server" ControlToValidate="txtCodEscuela" ErrorMessage="CodEscuela Obligatorio" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Button Text="Agregar" runat="server" Id="btnAgregar" CssClass="btn btn-primary" OnClientClick="return confirmarGuardar();" OnClick="btnAgregar_Click" ValidationGroup="Agregar"/>
        <asp:Button Text="Eliminar" runat="server" Id="btnEliminar" CssClass="btn btn-warning" OnClick="btnEliminar_Click" OnClientClick="return confirm('¿Está seguro de que desea eliminar este alumno?');" ValidationGroup="Eliminar"/>
        <asp:Button Text="Actualizar" runat="server" Id="btnActualizar" CssClass="btn btn-warning" OnClientClick="return confirmarActualizar();" OnClick="btnActualizar_Click" ValidationGroup="Actualizar"/>
        <asp:Button Text="Listar" runat="server" Id="btnListar" CssClass="btn btn-info" OnClick="btnListar_Click" />
    </p>
    <asp:ValidationSummary ID="ValidationSummary4" runat="server" ValidationGroup="Buscar" />
    <asp:ValidationSummary ID="ValidationSummary3" runat="server" ValidationGroup="Actualizar" />
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="Eliminar" />
    <asp:ValidationSummary ID="vsAgregar" runat="server" ValidationGroup="Agregar" />
    <p>
        <asp:GridView runat="server" ID="gvAlumno"></asp:GridView>
    </p>
    <p>
        <asp:Label Text="Mensaje" runat="server" ID="lblMensaje"/>
    </p>
    <script type="text/javascript">
        function confirmarGuardar() {
            var contrasena = document.getElementById('<%= txtContrasena.ClientID %>').value;
            var confirmacion = document.getElementById('<%= txtConfirmarContrasena.ClientID %>').value;
            if (contrasena !== confirmacion) {
                alert('Las contraseñas no coinciden. Por favor, verifique.');
                return false;
            }
            return confirm('¿Está seguro que desea agregar?');
        }
    </script>
    <script type="text/javascript">
        function confirmarActualizar() {
            var contrasena = document.getElementById('<%= txtContrasena.ClientID %>').value;
        var confirmacion = document.getElementById('<%= txtConfirmarContrasena.ClientID %>').value;
            if (contrasena !== confirmacion) {
                alert('Las contraseñas no coinciden. Por favor, verifique.');
                return false;
            }
            return confirm('¿Está seguro que desea actulizar la información de este alumno?');
        }
    </script>
</asp:Content>
