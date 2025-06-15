<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListaPlaylist.aspx.cs" Inherits="App_Musica_BD2_TPI.ListaPlaylist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="table-responsive">
            <br />
            <h1>Playlist de la comunidad</h1>

            <%if (Session["Usuario"] != null)
                {  %>
            <a href="FormularioPlaylist.aspx" class="btn btn-primary">Agregar nueva Playlist</a>
            <a href="MisPlaylist.aspx" class="btn btn-primary">Mis Playlist</a>
            <%} %>

            <hr />
            <br />
            <asp:GridView ID="dgvPlaylists" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover table-bordered align-middle text-center"
                GridLines="None" EmptyDataText="No hay playlists públicas disponibles." DataKeyNames="Id">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                    <asp:BoundField DataField="FechaCreacion" HeaderText="Fecha de Creación" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Creador" HeaderText="Creado por" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink
                                ID="lnkVer"
                                runat="server"
                                CssClass="btn btn-info btn-sm"
                                NavigateUrl='<%# "Playlist.aspx?id=" + Eval("Id") %>'>
                    Ver detalles
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
    </div>


</asp:Content>
