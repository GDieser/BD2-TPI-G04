<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Productora.aspx.cs" Inherits="App_Musica_BD2_TPI.Productora" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="container mt-4">
                <h3 class="text-center mb-4">Nueva Productora</h3>
                <asp:Panel ID="pnlForm" runat="server" CssClass="border p-4 rounded">

                   
                    <asp:HiddenField ID="hfIDUsuarioDuenio" runat="server" />

                    
                    <div class="form-group">
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="control-label" />
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" MaxLength="100" />
                    </div>

                   
                    <div class="form-group">
                        <asp:Label ID="lblPais" runat="server" Text="País de Origen:" CssClass="control-label" />
                        <asp:TextBox ID="txtPais" runat="server" CssClass="form-control" MaxLength="50" />
                    </div>

                   
                    <div class="form-group">
                        <asp:Label ID="lblWeb" runat="server" Text="Sitio Web:" CssClass="control-label" />
                        <asp:TextBox ID="txtWeb" runat="server" CssClass="form-control" MaxLength="100" />
                    </div>

                   
                    <div class="form-group">
                        <asp:Label ID="lblLogo" runat="server" Text="URL del Logo:" CssClass="control-label" />
                        <asp:TextBox ID="txtLogo" runat="server" CssClass="form-control" MaxLength="255" />
                    </div>

                   
                    <div class="form-group text-center mt-4">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar Productora" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                    </div>

                   
                    <div class="form-group text-center">
                        <asp:Label ID="lblMensaje" runat="server" Text="" CssClass="" EnableViewState="false" />
                    </div>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
