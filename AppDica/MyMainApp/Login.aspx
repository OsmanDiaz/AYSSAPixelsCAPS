<%@ Page Title="" Language="C#" MasterPageFile="~/MasterInicio.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyMainApp.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPHPrincipal" runat="server">
      <div class="row" style="margin-top: 20px">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            <form id="form1" runat="server">
                    <h2>Inicio de Sesión</h2>
                    <hr class="colorgraph">
                    <div class="form-group">
                        <asp:TextBox ID="txtUsuario" runat="server" class="form-control input-lg" placeholder="Ingrese su Usuario sin guiones"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredUsuario" runat="server" ErrorMessage="Usuario requerido" ControlToValidate="txtUsuario" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPassword" runat="server" class="form-control input-lg" placeholder="Ingrese su Password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Contraseña Requerida" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <hr class="colorgraph">
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <asp:Button ID="BtnInicioSesion" class="btn btn-primary" data-color="info" runat="server" Text="Iniciar Sesión" OnClick="BtnInicioSesion_Click"  />
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <asp:Button ID="BtnRegistrarme" class="btn btn-primary" data-color="info" runat="server" Text="Registrarme" OnClick="BtnRegistrarme_Click" CausesValidation="False" />
                        </div>
                    </div>
            </form>
        </div>
    </div>

    <br />
</asp:Content>
