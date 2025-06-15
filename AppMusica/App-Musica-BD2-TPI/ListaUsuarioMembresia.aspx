<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListaUsuarioMembresia.aspx.cs" Inherits="App_Musica_BD2_TPI.ListaUsuarioMembresia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="table-responsive">
            <br />
            <h1>Lista de Usuarios - Membresias Activas</h1>
            <hr />
            <br />

            <asp:GridView ID="gvUsuariosActivos" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover table-bordered align-middle text-center" Visible="false">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="NombreUsuario" HeaderText="Usuario" />
                    <asp:BoundField DataField="FechaVencimiento" HeaderText="Vence el" DataFormatString="{0:dd/MM/yyyy}" />
                </Columns>
            </asp:GridView>
            <a href="ListaUsuarios.aspx" class="btn btn-primary">Volver atrás</a>

        </div>
    </div>


</asp:Content>
