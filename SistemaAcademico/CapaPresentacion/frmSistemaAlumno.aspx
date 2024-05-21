<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmSistemaAlumno.aspx.cs" Inherits="CapaPresentacion.frmSistemaAlumno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Bienvenido alumno al sistema</h1>
    <asp:Label ID="lblAlumno" runat="server"></asp:Label>
    <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesion" OnClick="btnCerrarSesion_Click" />
</asp:Content>
