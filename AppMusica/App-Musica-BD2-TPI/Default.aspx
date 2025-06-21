<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="App_Musica_BD2_TPI.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container text-center py-5">

        <h1 class="text-dark">🎵 Bienvenido a MiMúsica.com </h1>
        <p class="text-secondary">Tu lugar para descubrir nueva música, artistas y playlists épicas</p>


        <hr />

        <h2 class="titulo-seccion mb-4">Álbumes más populares</h2>
        <hr />
        
        <div class="d-flex overflow-auto gap-3 pb-3 px-2" style="white-space: nowrap;">

            <asp:Repeater ID="rptAlbumes" runat="server">
                <ItemTemplate>
                    <div class="card shadow-sm d-inline-block" style="min-width: 250px; max-width: 250px;">
                        <img src='<%# Eval("Portada") %>' class="card-img-top" alt="Álbum"
                            style="height: 160px; object-fit: cover;" />

                        <div class="card-body">
                            <h5 class="card-title" style="font-size: 1rem;"><%# Eval("Titulo") %></h5>
                            <p class="card-text text-muted" style="font-size: 0.9rem;"><%# Eval("Nombre") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
        <hr />
        <div class="container seccion">

            <h2 class="titulo-seccion">Artistas más escuchados</h2>
            <hr />
            
            <div class="d-flex overflow-auto gap-3 pb-2" style="white-space: nowrap;">
                <asp:Repeater ID="rptArtistas" runat="server">
                    <ItemTemplate>
                        <div style="min-width: 200px;" class="repeater-item d-inline-block">
                            <img src='<%# Eval("ImagenPerfil") %>' alt="Artista"
                                style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;" />
                            <div style="font-weight: bold; margin-top: 10px; font-size: 1.1rem;">
                                <%# Eval("NombreArtistico") %>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <hr />

        <h2 class="titulo-seccion mb-4">Playlists de la comunidad</h2>

        <div class="d-flex overflow-auto gap-3 pb-3 px-2" style="white-space: nowrap;">

            <asp:Repeater ID="rptPlaylists" runat="server">
                <ItemTemplate>
                    <div class="card shadow-sm d-inline-block" style="min-width: 250px; max-width: 250px;">
                        <img src='<%# Eval("ImagenURL") %>' class="card-img-top" alt="Playlist"
                            style="height: 160px; object-fit: cover;" />

                        <div class="card-body">
                            <h5 class="card-title" style="font-size: 1rem;"><%# Eval("Nombre") %></h5>

                            <p class="card-text text-muted" style="font-size: 0.9rem; max-height: 3.6em; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">
                                <%# Eval("Descripcion") %>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>


    </div>

</asp:Content>
