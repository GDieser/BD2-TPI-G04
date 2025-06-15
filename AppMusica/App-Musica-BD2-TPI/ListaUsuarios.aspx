<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListaUsuarios.aspx.cs" Inherits="App_Musica_BD2_TPI.ListaUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="table-responsive">
            <br />
            <h1>Lista de Usuarios - Clientes</h1>
            <hr />
            <asp:GridView ID="gvAdmins" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover table-bordered align-middle text-center" OnSelectedIndexChanged="gvAdmins_SelectedIndexChanged" DataKeyNames="Id">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="NombreUsuario" HeaderText="Usuario" />
                    <asp:BoundField DataField="Pais" HeaderText="País" />
                    <asp:TemplateField HeaderText="Membresía Activa">
                        <ItemTemplate>
                            <%# (bool)Eval("MembresiaActiva") ? "Activo 🟢" : "Inactivo 🔴" %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowSelectButton="True" SelectText="Ver Detalles" HeaderText="Acciones" />
                </Columns>
            </asp:GridView>

            <br />
            <asp:Button ID="btnUsuariosActivos" runat="server" Text="Ver Usuarios con Membresía Activa" CssClass="btn btn-primary" OnClick="btnUsuariosActivos_Click" />
            <hr />
        </div>
    </div>

</asp:Content>
