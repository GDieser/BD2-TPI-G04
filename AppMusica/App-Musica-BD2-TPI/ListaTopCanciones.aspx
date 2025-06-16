<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListaTopCanciones.aspx.cs" Inherits="App_Musica_BD2_TPI.ListaTopCanciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="table-responsive">
            <br />
            <h1>Top Contenido más Escuchado</h1>
            <hr />
            <br />

            <asp:GridView ID="gvContenido" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover table-bordered align-middle text-center" Visible="false">
                <Columns>
                    <asp:BoundField DataField="id_cancion" HeaderText="Id" />
                    <asp:BoundField DataField="Titulo" HeaderText="Titulo" />
                    <asp:BoundField DataField="FechaLanzamiento" HeaderText="Fecha Lanzamiento" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Duracion" HeaderText="Duracion" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                    <asp:BoundField DataField="Genero" HeaderText="Genero" />
                    <asp:BoundField DataField="TotalReproducciones" HeaderText="Total Reproducciones" />
                </Columns>
            </asp:GridView>
            <a href="VerContenido.aspx" class="btn btn-primary">Volver atrás</a>

        </div>
    </div>

</asp:Content>
