<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ContratarMembresia.aspx.cs" Inherits="App_Musica_BD2_TPI.ContratarMembresia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="container">
        <div class="row justify-content-center align-items-center mt-4 mb-4">
            <div class="col-12 col-sm-8 col-md-6 col-lg-4">

                <div class="card shadow rounded-4 p-4 border-0">
                    <div class="card-body">
                        <h2>Contratar Membresía</h2>

                        <div class="mb-3">
                            <asp:Label runat="server" Text="Selecciona una membresía:" AssociatedControlID="ddlMembresias" />
                            <asp:DropDownList runat="server" ID="ddlMembresias" AutoPostBack="true" OnSelectedIndexChanged="ddlMembresias_SelectedIndexChanged" CssClass="form-select" />
                        </div>

                        <asp:UpdatePanel runat="server" ID="upDetalle">
                            <ContentTemplate>
                                <asp:Panel runat="server" ID="panelDetalle" Visible="false" CssClass="border p-3 bg-light mb-3">
                                    <h4>Detalles de la membresía</h4>
                                    <p>
                                        <strong>Precio:</strong>
                                        <asp:Label ID="lblPrecio" runat="server" />
                                    </p>
                                    <p><strong>Duración:</strong> 30 días</p>
                                    <p>
                                        <strong>Descripción:</strong>
                                        <asp:Label ID="lblDescripcion" runat="server" />
                                    </p>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <asp:Button runat="server" ID="btnContratar" Text="Contratar" CssClass="btn btn-success" OnClick="btnContratar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
