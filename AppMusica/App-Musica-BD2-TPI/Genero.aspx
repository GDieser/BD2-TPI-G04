<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Genero.aspx.cs" Inherits="App_Musica_BD2_TPI.Genero" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="container mt-4">
                <h3 class="text-center mb-4">Nuevo Genero</h3>
                <asp:Panel ID="pnlForm" runat="server" CssClass="border p-4 rounded">

                    
                    <div class="form-group">
                        <asp:Label ID="lblTitulo" runat="server" Text="Nombre:" CssClass="control-label" />
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" MaxLength="100" />
                    </div>

                   
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="Descripcion:" CssClass="control-label" />
                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" MaxLength="100" />
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
