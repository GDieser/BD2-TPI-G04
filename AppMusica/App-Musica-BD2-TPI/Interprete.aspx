<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Interprete.aspx.cs" Inherits="App_Musica_BD2_TPI.Interprete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="container mt-4">
                <h3 class="text-center mb-4">Nuevo Intérprete</h3>
                <asp:Panel ID="pnlForm" runat="server" CssClass="border p-4 rounded">

                    <div class="form-group">
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="control-label" />
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" MaxLength="100" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblFecha" runat="server" Text="Fecha de Consolidación:" CssClass="control-label" />
                        <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" TextMode="Date" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblTipo" runat="server" Text="Tipo:" CssClass="control-label" />
                        <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Solista" Value="Solista" />
                            <asp:ListItem Text="Grupo" Value="Grupo" />
                            <asp:ListItem Text="Dúo" Value="Duo" />
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblDescripcion" runat="server" Text="Descripción:" CssClass="control-label" />
                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" MaxLength="255" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblArtista" runat="server" Text="Artista:" CssClass="control-label" />
                        <div class="input-group">
                            <asp:DropDownList ID="ddlArtistas" runat="server" CssClass="form-control" />
                            <div class="input-group-append">
                                <asp:Button ID="btnAgregarArtista" runat="server" Text="+" CssClass="btn btn-secondary" OnClick="btnAgregarArtista_Click" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblSeleccionados" runat="server" Text="Artistas seleccionados:" CssClass="control-label" />
                        <asp:ListBox ID="lstArtistasSeleccionados" runat="server" CssClass="form-control" />
                    </div>

                    <div class="form-group">
                        <asp:HyperLink ID="linkCrearArtista" runat="server" NavigateUrl="Artista.aspx" Text="Crear nuevo artista" Target="_blank" CssClass="btn btn-outline-primary" />
                        <asp:Button ID="btnRemoverArtista" runat="server" Text="Remover Artista" CssClass="btn btn-secondary" OnClick="btnRemoverArtista_Click" />

                    </div>

                    <div class="form-group text-center">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar Intérprete" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                    </div>
                    <div class="form-group text-center">
                        <asp:Label ID="lblMensaje" runat="server" Text="" CssClass="" EnableViewState="false"></asp:Label>
                    </div>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>