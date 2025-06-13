<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Artista.aspx.cs" Inherits="App_Musica_BD2_TPI.Artista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h3 class="text-center mb-4">Formulario para Cargar Artista</h3>
        <asp:Panel ID="pnlFormArtista" runat="server" CssClass="border p-4 rounded">

            <div class="form-group">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblApellido" runat="server" Text="Apellido:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblNombreArtistico" runat="server" Text="Nombre Artístico:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="txtNombreArtistico" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de Nacimiento:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblImagenPerfil" runat="server" Text="Imagen de Perfil (URL):" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="txtImagenPerfil" runat="server" CssClass="form-control" MaxLength="255"></asp:TextBox>
            </div>

            <div class="form-group text-center">
                <asp:Button ID="btnGuardarArtista" runat="server" Text="Guardar" CssClass="btn btn-primary mt-4" OnClick="btnGuardarArtista_Click" />
            </div>

            <div class="form-group text-center">
                <asp:Label ID="lblMensaje" runat="server" Text="" CssClass="" EnableViewState="false"></asp:Label>
            </div>

        </asp:Panel>
    </div>
</asp:Content>
