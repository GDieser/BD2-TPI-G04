<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="VerContenido.aspx.cs" Inherits="App_Musica_BD2_TPI.VerContenido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div class="table-responsive">
            <br />
            <h1>Lista de Canciones</h1>
            <hr />
            <br />

            <%if (usuario != null && usuario.Membresia)
                { %>
            <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-warning " Text="➕ Agregar" OnClick="btnAgregar_Click" />
            <% } %>
        </div>
        <div class="d-flex align-items-center justify-content-center">
            <asp:GridView ID="gvCanciones" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover table-bordered align-middle text-center" OnRowCommand="gvCanciones_RowCommand" GridLines="None">

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
                            <%if (usuario != null && usuario.Membresia)
                                { %>
                            <asp:Button ID="btnReproducir" runat="server" Text="▶️ Reproducir" CommandName="Reproducir" CommandArgument='<%# Eval("IdContenido") %>' CssClass="btn btn-primary" />
                            <% } %>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </div>
    


</asp:Content>
