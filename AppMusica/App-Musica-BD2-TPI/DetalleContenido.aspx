<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DetalleContenido.aspx.cs" Inherits="App_Musica_BD2_TPI.DetalleContenido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container py-4">


        <div class="d-flex justify-content-center mb-4">
            <div class="ratio ratio-16x9" style="max-width: 800px;">
                <iframe src="https://www.youtube.com/embed/5jaT_8hy3Vg?si=QSwC3sjnbMW8KJrN"
                    title="YouTube video player"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    referrerpolicy="strict-origin-when-cross-origin"
                    allowfullscreen></iframe>
            </div>
        </div>


        <div class="mb-4 text-center">
            <asp:Label ID="lblTitulo" runat="server" CssClass="h3 text-dark d-block mb-2" Text="Título del Video"></asp:Label>
            <asp:Label ID="lblFechaSubida" runat="server" CssClass="text-muted d-block mb-2" Text="Subido el: 01/01/2023"></asp:Label>
            <asp:Label ID="lblDescripcion" runat="server" CssClass="text-white-50 d-block"
                Text="."></asp:Label>
        </div>


        <div class="mb-4">
            <asp:Label ID="lblCalificar" runat="server" CssClass="h5 text-dark d-block mb-2" Text="Calificar este contenido"></asp:Label>
            <div class="d-flex align-items-center gap-3">
                <asp:DropDownList ID="ddlPuntuacion" runat="server" CssClass="form-select w-auto">
                    
                    <asp:ListItem Value="1">1 - Muy malo</asp:ListItem>
                    <asp:ListItem Value="2">2 - Malo</asp:ListItem>
                    <asp:ListItem Value="3">3 - Regular</asp:ListItem>
                    <asp:ListItem Value="4">4 - Bueno</asp:ListItem>
                    <asp:ListItem Value="5">5 - Excelente</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnEnviarCalificacion" runat="server" OnClick="btnEnviarCalificacion_Click" Text="Enviar Calificación" CssClass="btn btn-info" />
            </div>
        </div>

        <div>
            <asp:Label ID="lblComentarios" runat="server" CssClass="h5 text-dark d-block mb-2" Text="Comentarios"></asp:Label>
            <asp:TextBox ID="txtNuevoComentario" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control mb-2"
                placeholder="Escribe tu comentario aquí..."></asp:TextBox>
            <asp:Button ID="btnEnviarComentario" runat="server" OnClick="btnEnviarComentario_Click" Text="Publicar Comentario" CssClass="btn btn-success" />
        </div>

        <div class="mt-4">
            <asp:Repeater ID="rptComentarios" runat="server">
                <ItemTemplate>
                    <div class="card mb-4 shadow-sm">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <strong><%# Eval("NombreUsuario") %></strong>
                                <small class="text-muted"><%# Eval("FechaComentario", "{0:dd/MM/yyyy}") %></small>
                            </div>
                            <hr />
                            <p class="card-text mb-0"><%# Eval("Comentario") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <hr />

    </div>

</asp:Content>
