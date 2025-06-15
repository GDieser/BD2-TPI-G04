<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AgregarContenidoPlaylist.aspx.cs" Inherits="App_Musica_BD2_TPI.AgregarContenidoPlaylist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="table-responsive">
            <br />
            <h1>Elegí tus canciones favoritas</h1>
            <hr />
            <div class="d-flex align-items-center justify-content-center">
                <asp:GridView ID="gvCanciones" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover table-bordered align-middle text-center" DataKeyNames="Id" OnRowCommand="gvCanciones_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" />
                        <asp:BoundField DataField="Titulo" HeaderText="Título" />
                        <asp:BoundField DataField="Artista" HeaderText="Artista" />
                        <asp:ButtonField ButtonType="Button" CommandName="Agregar" Text="Agregar" />
                    </Columns>
                </asp:GridView>
                <asp:Label Text="" ID="lblMensaje" runat="server" />
            </div>
        </div>
    </div>

</asp:Content>
