<%@ Page Title="" Language="C#" MasterPageFile="~/MasterInicio.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="MyMainApp.Registro" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="CPHPrincipal">
    <form id="form1" runat="server" class="form-horizontal">
        <div align="center">
            <asp:Label ID="LblTitulo" runat="server" Text="Registro Aspirantes y Consultores" Font-Bold="True" Font-Size="20pt"></asp:Label>
        </div>
        <br />
        <asp:Panel ID="Panel1" runat="server">
            <div class="container-fluid"> <%--contenido de todo el texto  --%>
                <div  class="col-md-6">
                    <asp:Label ID="Label1" runat="server" Text="Para iniciar su proceso de inscripción es necesario que tome en cuenta las indicaciones siguientes:"></asp:Label>
            <br />
                
            <p class="text-justify">
                <ol><%--inicio numerales--%>
                    <li>Debe tomar en cuenta que para el perfil Estudiante solo puede aplicar si se encuentra entre 16 y 30 años; y para el 
                        perfil Profesor entre 25 y 35 años de edad.</li><br />
                    <li>Contar con la siguiente documentación al momento de inscripción:</li>
                    <ul>
                        <li>Certificación de notas</li>
                        <li>Título universitario</li>
                        <li>Curriculum</li>
                    </ul><br />
                    <li>Si es menor de edad, contar con los documentos del representante legal:</li>
                    <ul>
                        <li>DUI</li>
                        <li>NIT</li>
                        <li>Teléfono</li>
                        <li>Correo</li>
                    </ul><br />
                    <li>Cuenta con 15 días para completar su información, de lo contrario deberá registrarse nuevamente.</li>
                </ol><%--fin numerales--%><br />
                <p>
                </p>
                <p>
                </p>
                </p></div>
            <div  class="col-md-6">
                <div class="form-group">
                    <asp:Label class="control-label  col-sm-3" ID="Label8" runat="server" Text="TIPO PERSONA:" Font-Bold="True"></asp:Label>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="CboTipoAspitante" runat="server" class="form-control" DataTextField="DS_TIPO_ASPIRANTE" DataValueField="ID">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="CboTipoAspitante" ErrorMessage="Seleccionar Tipo Persona" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                    </div>
                <div class="form-group">
                     <asp:Label class="control-label  col-sm-3" ID="Label2" runat="server" Text="NIT:" Font-Bold="True"></asp:Label>
                <div class="col-md-8">
                    <asp:TextBox class="form-control" ID="TxtNIT" runat="server" onPaste="return soloNumeros(event);" onkeypress="return soloNumeros(event);" AutoCompleteType="Disabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Llenar NIT sin guiones" ControlToValidate="TxtNIT" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
                    </div>
                <div class="form-group">
                    <asp:Label class="control-label  col-sm-3" ID="Label6" runat="server" Text="FECHA NACIMIENTO:" Font-Bold="True"></asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox class="form-control" ID="TxtFechaNacimiento" runat="server" TextMode="Date" AutoCompleteType="Disabled"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Llenar Fecha Nacimiento" ControlToValidate="TxtFechaNacimiento" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>                
                 </div>
                <div class="form-group">
                     <asp:Label class="control-label  col-sm-3" ID="Label3" runat="server" Text="NOMBRES:" Font-Bold="True"></asp:Label>
                <div class="col-md-8">
                    <asp:TextBox class="form-control" ID="TxtNombres" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Llenar Nombres" ControlToValidate="TxtNombres" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
                     </div>
                <div class="form-group">
                    <asp:Label class="control-label  col-sm-3" ID="Label4" runat="server" Text="APELLIDOS:" Font-Bold="True"></asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox class="form-control" ID="TxtApellidos" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Llenar Apellidos" ControlToValidate="TxtApellidos" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>               
                </div>
                <div class="form-group">
                    <asp:Label class="control-label  col-sm-3" ID="Label5" runat="server" Text="EMAIL:" Font-Bold="True"></asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox class="form-control" ID="TxtEmail" runat="server" TextMode="Email" AutoCompleteType="Disabled"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Llenar Email" ControlToValidate="TxtEmail" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                    </div>
                </div>
            <div class="form-group">
            <div align="center">
                <asp:Button ID="BtnInicioRegistro" runat="server" Text="INICIAR REGISTRO" class="btn btn-primary" OnClick="BtnInicioRegistro_Click"/></div></div>  
           </div>
        </asp:Panel>
    </form>

</asp:Content>

