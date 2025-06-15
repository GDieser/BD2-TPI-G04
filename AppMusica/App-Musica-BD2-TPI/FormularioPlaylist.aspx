<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormularioPlaylist.aspx.cs" Inherits="App_Musica_BD2_TPI.FormularioPlaylist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager runat="server" ID="ScriptManager1" />

    <div class="container">
        <div class="table-responsive">
            <br />
            <h2>Crear nueva Playlist</h2>
            <br />
            <asp:Label Text="" ID="lblMensaje" runat="server" />
            <hr />
            <asp:Panel runat="server" ID="panelCrearPlaylist" CssClass="border p-3 mb-3">
                <div class="mb-3">
                    <asp:Label AssociatedControlID="txtNombre" runat="server" Text="Nombre de la Playlist" />
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <asp:Label AssociatedControlID="ddlEsPublica" runat="server" Text="Visibilidad" />
                    <asp:DropDownList runat="server" ID="ddlEsPublica" CssClass="form-select">
                        <asp:ListItem Text="Pública" Value="true" />
                        <asp:ListItem Text="Privada" Value="false" />
                    </asp:DropDownList>
                </div>

                <div class="mb-3">
                    <asp:Label AssociatedControlID="txtDescripcion" runat="server" Text="Descripción" />
                    <asp:TextBox runat="server" ID="txtDescripcion" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <asp:Label AssociatedControlID="txtImagenUrl" runat="server" Text="URL de Imagen" />
                    <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control" />
                </div>

                <asp:Button runat="server" ID="btnCrearPlaylist" Text="Crear Playlist" CssClass="btn btn-primary" OnClick="btnCrearPlaylist_Click" />
            </asp:Panel>
        </div>
    </div>

</asp:Content>
