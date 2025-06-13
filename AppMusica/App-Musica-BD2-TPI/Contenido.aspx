<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Contenido.aspx.cs" Inherits="App_Musica_BD2_TPI.Contenido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h3 class="text-center mb-4">Formulario para Cargar Contenido</h3>
        <asp:Panel ID="pnlForm" runat="server" CssClass="border p-4 rounded">

            <div class="form-group">
                <asp:Label ID="lblTitulo" runat="server" Text="Título:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblInterprete" runat="server" Text="Intérprete:" CssClass="control-label"></asp:Label>
                <div class="input-group">
                    <asp:DropDownList ID="lstInterpete" runat="server" CssClass="form-control"></asp:DropDownList>
                    <div class="input-group-append">
                        <asp:Button ID="btnAddInterprete" runat="server" Text="+" CssClass="btn btn-secondary" OnClick="btnAddInterprete_Click" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="lblTipoContenido" runat="server" Text="Tipo de Contenido:" CssClass="control-label"></asp:Label>
                <div class="input-group">
                    <asp:DropDownList ID="lstTipoContenido" runat="server" CssClass="form-control"></asp:DropDownList>
                    <div class="input-group-append">
                        <asp:Button ID="btnAddTipoContenido" runat="server" Text="+" CssClass="btn btn-secondary" OnClick="btnAddTipoContenido_Click" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="lblAlbum" runat="server" Text="Álbum:" CssClass="control-label"></asp:Label>
                <div class="input-group">
                    <asp:DropDownList ID="lstAlbum" runat="server" CssClass="form-control"></asp:DropDownList>
                    <div class="input-group-append">
                        <asp:Button ID="btnAddAlbum" runat="server" Text="+" CssClass="btn btn-secondary" OnClick="btnAddAlbum_Click" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="lblGenero" runat="server" Text="Género:" CssClass="control-label"></asp:Label>
                <div class="input-group">
                    <asp:DropDownList ID="lstGenero" runat="server" CssClass="form-control"></asp:DropDownList>
                    <div class="input-group-append">
                        <asp:Button ID="btnAddGenero" runat="server" Text="+" CssClass="btn btn-secondary" OnClick="btnAddGenero_Click" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="lblProductora" runat="server" Text="Productora:" CssClass="control-label"></asp:Label>
                <div class="input-group">
                    <asp:DropDownList ID="lstProductora" runat="server" CssClass="form-control"></asp:DropDownList>
                    <div class="input-group-append">
                        <asp:Button ID="btnAddProductora" runat="server" Text="+" CssClass="btn btn-secondary" OnClick="btnAddProductora_Click" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="lblFechaLanzamiento" runat="server" Text="Fecha de Lanzamiento:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="txtFechaLanzamiento" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblDuracion" runat="server" Text="Duración (seg):" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="txtDuracion" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblPortada" runat="server" Text="Portada (URL):" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="txtPortada" runat="server" CssClass="form-control" MaxLength="255"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblFormatoArchivo" runat="server" Text="Formato Archivo:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="txtFormatoArchivo" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblDescripcion" runat="server" Text="Descripción:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" MaxLength="255"></asp:TextBox>
            </div>

            <asp:HiddenField ID="hfIDUsuarioDuenio" runat="server" />

            <div class="form-group text-center">
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
            </div>
            <div class="form-group text-center">
                <asp:Label ID="lblMensaje" runat="server" Text="" CssClass="" EnableViewState="false"></asp:Label>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
