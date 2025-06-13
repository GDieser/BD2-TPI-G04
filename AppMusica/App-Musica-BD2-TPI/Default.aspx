<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="App_Musica_BD2_TPI.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mb-3 ms-5 me-5">
        <h3>Listado de canciones</h3>

    
            <asp:Button ID="btnAgregar" runat="server"  CssClass="btn btn-warning " Text ="➕ Agregar" OnClick="btnAgregar_Click" />
</div>
    <div class="d-flex align-items-center justify-content-center">
        <asp:GridView ID="gvCanciones" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCommand="gvCanciones_RowCommand">
            <Columns>
                <asp:BoundField DataField="IdContenido" HeaderText="ID" />
                <asp:BoundField DataField="Titulo" HeaderText="Título" />
                <asp:BoundField DataField="NombreInterprete" HeaderText="Intérprete" />
                <asp:BoundField DataField="NombreAlbum" HeaderText="Álbum" />
                <asp:BoundField DataField="NombreGenero" HeaderText="Género" />
                <asp:BoundField DataField="DuracionSegundos" HeaderText="Duración" />
                <asp:BoundField DataField="Reproducciones" HeaderText="Reproducciones" />
                <asp:TemplateField HeaderText="Acción">
                    <ItemTemplate>
                        <asp:Button ID="btnReproducir" runat="server" Text="▶️ Reproducir" CommandName="Reproducir" CommandArgument='<%# Eval("IdContenido") %>' CssClass="btn btn-primary" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
