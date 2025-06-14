<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PerfiUsuario.aspx.cs" Inherits="App_Musica_BD2_TPI.PerfiUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row justify-content-center align-items-center mt-4 mb-4">
            <div class="col-12 col-sm-10 col-md-8 col-lg-7">
                <div class="card shadow rounded-4 p-4 border-0">
                    <div class="card-body">
                        <div class="mb-4 text-center">
                            <asp:Panel runat="server" CssClass="container mt-4">
                                <h2>Mi Perfil</h2>

                                <div class="mb-3">
                                    <asp:Label runat="server" Text="Foto de Perfil:" />
                                    <asp:Image runat="server" ID="imgFotoPerfil" CssClass="img-thumbnail" Width="150px" />
                                </div>

                                <div class="mb-3">
                                    <asp:Label runat="server" Text="Nombre de Usuario:" />
                                    <asp:Label runat="server" ID="lblNombreUsuario" CssClass="form-control" />
                                </div>

                                <div class="mb-3">
                                    <asp:Label runat="server" Text="Nombre:" />
                                    <asp:Label runat="server" ID="lblNombre" CssClass="form-control" />
                                </div>

                                <div class="mb-3">
                                    <asp:Label runat="server" Text="Apellido:" />
                                    <asp:Label runat="server" ID="lblApellido" CssClass="form-control" />
                                </div>

                                <div class="mb-3">
                                    <asp:Label runat="server" Text="Email:" />
                                    <asp:Label runat="server" ID="lblEmail" CssClass="form-control" />
                                </div>

                                <div class="mb-3">
                                    <asp:Label runat="server" Text="Fecha de Nacimiento:" />
                                    <asp:Label runat="server" ID="lblFechaNacimiento" CssClass="form-control" />
                                </div>

                                <div class="mb-3">
                                    <asp:Label runat="server" Text="Idioma (ID):" />
                                    <asp:Label runat="server" ID="lblIdioma" CssClass="form-control" />
                                </div>

                                <div class="mb-3">
                                    <asp:Label runat="server" Text="Rol (ID):" />
                                    <asp:Label runat="server" ID="lblRol" CssClass="form-control" />
                                </div>

                                <div class="mb-3">
                                    <asp:Label runat="server" Text="Membresia:" />
                                    <asp:Label runat="server" ID="lblMembresia" CssClass="form-control" />
                                    <br />

                                    <asp:Button ID="btnContratar" OnClick="btnContratar_Click" CssClass="btn btn-primary" Text="Contratar" runat="server" />


                                </div>

                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
