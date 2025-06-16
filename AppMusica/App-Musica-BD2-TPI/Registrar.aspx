<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registrar.aspx.cs" Inherits="App_Musica_BD2_TPI.Registrar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row justify-content-center align-items-center mt-4 mb-4">
            <div class="col-12 col-sm-8 col-md-6 col-lg-5">
                <div class="card shadow rounded-4 p-4 border-0">
                    <div class="card-body">
                        <asp:Panel runat="server" CssClass="container mt-5">
                            <h2>Registro de Usuario</h2>

                            <div class="mb-3">
                                <asp:Label runat="server" AssociatedControlID="txtUsuario" Text="Nombre de usuario" />
                                <asp:TextBox runat="server" ID="txtUsuario" CssClass="form-control" />
                            </div>

                            <div class="mb-3">
                                <asp:Label runat="server" AssociatedControlID="txtNombre" Text="Nombre" />
                                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                            </div>

                            <div class="mb-3">
                                <asp:Label runat="server" AssociatedControlID="txtApellido" Text="Apellido" />
                                <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" />
                            </div>

                            <div class="mb-3">
                                <asp:Label runat="server" AssociatedControlID="txtEmail" Text="Email" />
                                <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control" />
                            </div>

                            <div class="mb-3">
                                <asp:Label runat="server" AssociatedControlID="txtPassword" Text="Contraseña" />
                                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" />
                            </div>

                            <div class="mb-3">
                                <asp:Label runat="server" AssociatedControlID="txtFechaNacimiento" Text="Fecha de Nacimiento" />
                                <asp:TextBox runat="server" ID="txtFechaNacimiento" TextMode="Date" CssClass="form-control" />
                            </div>

                            <div class="mb-3">
                                <asp:Label runat="server" AssociatedControlID="ddlPais" Text="País" />
                                <asp:DropDownList runat="server" ID="ddlPais" CssClass="form-select">
                                    <asp:ListItem Text="Argentina" Value="AR" />
                                    <asp:ListItem Text="Chile" Value="CL" />
                                    <asp:ListItem Text="Uruguay" Value="UY" />
                                    <asp:ListItem Text="México" Value="MX" />
                                </asp:DropDownList>
                            </div>

                            <div class="mb-3">
                                <asp:Label runat="server" AssociatedControlID="txtFoto" Text="Foto de Perfil" />
                                <asp:TextBox runat="server" ID="txtFoto" CssClass="form-control" />
                            </div>

                            <div class="mb-3">
                                <asp:Label runat="server" AssociatedControlID="ddlIdioma" Text="Idioma" />
                                <asp:DropDownList runat="server" ID="ddlIdioma" CssClass="form-select">

                                    <asp:ListItem Text="Inglés" Value="en" />
                                    <asp:ListItem Text="Español" Value="es" />
                                    <asp:ListItem Text="Portugués" Value="pt" />
                                </asp:DropDownList>
                            </div>

                            <asp:Button runat="server" ID="btnRegistrar" OnClick="btnRegistrar_Click" Text="Registrar" CssClass="btn btn-success" />
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
