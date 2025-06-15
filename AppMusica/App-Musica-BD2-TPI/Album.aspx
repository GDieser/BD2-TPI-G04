<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Album.aspx.cs" Inherits="App_Musica_BD2_TPI.Album" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="container mt-4">
                <h3 class="text-center mb-4">Nuevo Álbum</h3>
                <asp:Panel ID="pnlForm" runat="server" CssClass="border p-4 rounded">

                    
                    <div class="form-group">
                        <asp:Label ID="lblTitulo" runat="server" Text="Título:" CssClass="control-label" />
                        <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control" MaxLength="100" />
                    </div>

                   
                    <div class="form-group">
                        <asp:Label ID="lblProductora" runat="server" Text="Productora:" CssClass="control-label" />
                        <div class="input-group">
                            <asp:DropDownList ID="ddlProductora" runat="server" CssClass="form-control" />
                            <div class="input-group-append">
                                <asp:Button ID="btnAddProductora" runat="server" Text="+" CssClass="btn btn-secondary" OnClick="btnAddProductora_Click" />
                            </div>
                        </div>

                       
                        <div class="form-group">
                            <asp:Label ID="lblFecha" runat="server" Text="Fecha de Lanzamiento:" CssClass="control-label" />
                            <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" TextMode="Date" />
                        </div>

                      
                        <div class="form-group">
                            <asp:Label ID="lblPortada" runat="server" Text="Portada (URL):" CssClass="control-label" />
                            <asp:TextBox ID="txtPortada" runat="server" CssClass="form-control" MaxLength="255" />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblGenero" runat="server" Text="Género:" CssClass="control-label" />
                            <div class="input-group">
                                <asp:DropDownList ID="ddlGenero" runat="server" CssClass="form-control" />
                                <div class="input-group-append">
                                    <asp:Button ID="btnAddGenero" runat="server" Text="+" CssClass="btn btn-secondary" OnClick="btnAddGenero_Click" />
                                </div>
                            </div>
                        </div>

                      
                        <div class="form-group">
                            <asp:Label ID="lblTipoContenido" runat="server" Text="Tipo de Contenido:" CssClass="control-label" />
                            <div class="input-group">
                                <asp:DropDownList ID="ddlTipoContenido" runat="server" CssClass="form-control" />
                                <div class="input-group-append">
                                    <asp:Button ID="btnAddTipoContenido" runat="server" Text="+" CssClass="btn btn-secondary" OnClick="btnAddTipoContenido_Click" />
                                </div>
                            </div>
                        </div>

                       
                        <div class="form-group text-center mt-4">
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Álbum" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                        </div>

                        <div class="form-group text-center">
                            <asp:Label ID="lblMensaje" runat="server" Text="" CssClass="" EnableViewState="false" />
                        </div>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
