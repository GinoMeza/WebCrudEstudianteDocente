<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmAlumno.aspx.cs" Inherits="CapaPresentacion.frmAlumno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>Mantenimiento de la tabla alumno</p>
    <p>
        CodAlumno <asp:TextBox runat="server" ID="txtCodAlumno"></asp:TextBox>
        <asp:Button Text="Buscar" runat="server" Id="btnBuscar" CssClass="btn btn-info" OnClick="btnBuscar_Click"/>
    </p>
    <p>
        APaterno <asp:TextBox runat="server" ID="txtAPaterno"></asp:TextBox>
    </p>
    <p>
        AMaterno <asp:TextBox runat="server" ID="txtAMaterno"></asp:TextBox>
    </p>
    <p>
        Nombres <asp:TextBox runat="server" ID="txtNombres"></asp:TextBox>
    </p>
    <p>
        CodUsuario <asp:TextBox runat="server" ID="txtCodUsuario"></asp:TextBox>
    </p>
    <p>
        Contraseña <asp:TextBox runat="server" ID="txtContrasena" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        Confirmar Contraseña <asp:TextBox runat="server" Id="txtConfirmarContrasena" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        CodEscuela <asp:TextBox runat="server" ID="txtCodEscuela" />
    </p>
    <p>
        <asp:Button Text="Agregar" runat="server" Id="btnAgregar" CssClass="btn btn-primary" OnClientClick="return confirmarGuardar();" OnClick="btnAgregar_Click"/>
        <asp:Button Text="Eliminar" runat="server" Id="btnEliminar" CssClass="btn btn-warning" OnClick="btnEliminar_Click" OnClientClick="return confirm('¿Está seguro de que desea eliminar este alumno?');"/>
        <asp:Button Text="Actualizar" runat="server" Id="btnActualizar" CssClass="btn btn-warning" OnClientClick="return confirmarActualizar();" OnClick="btnActualizar_Click"/>
        <asp:Button Text="Listar" runat="server" Id="btnListar" CssClass="btn btn-info" OnClick="btnListar_Click" />
    </p>
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
