<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="App_Musica_BD2_TPI.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div class="row justify-content-center align-items-center mt-4 mb-4">
            <div class="col-12 col-sm-8 col-md-6 col-lg-4">

                <div class="card shadow rounded-4 p-4 border-0">
                    <div class="card-body">
                        <asp:Panel runat="server" CssClass="container mt-5">
                            <h2>Login</h2>
                            <div class="mb-3">
                                <asp:Label runat="server" AssociatedControlID="txtUsuario" Text="Usuario" />
                                <asp:TextBox runat="server" ID="txtUsuario" CssClass="form-control" />
                            </div>
                            <div class="mb-3">
                                <asp:Label runat="server" AssociatedControlID="txtPassword" Text="Contraseña" />
                                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" />
                            </div>
                            <asp:Button runat="server" ID="btnLogin" OnClick="btnLogin_Click" Text="Ingresar" CssClass="btn btn-primary" />

                            <div class="text-center">
                                <br />
                                <p>¿No sos usuario? <a href="Registrar.aspx">¡Registrate aca!</a></p>
                            </div>
                            <div class="text-center">
                                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                            </div>

                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
