<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmSistemaDocente.aspx.cs" Inherits="CapaPresentacion.frmSistemaDocente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Bienvenido docente al sistema</h1>
    <asp:Label ID="lblDocente" runat="server"></asp:Label>
    <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesion" OnClick="btnCerrarSesion_Click"/>
</asp:Content>
