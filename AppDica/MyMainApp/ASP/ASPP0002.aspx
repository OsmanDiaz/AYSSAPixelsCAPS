<%@ Page Title="" Language="C#" MasterPageFile="~/MasterInicio.Master" AutoEventWireup="true" CodeBehind="ASPP0002.aspx.cs" Inherits="MyMainApp.ASP.ASPP0002" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHPrincipal" runat="server">

    <form id="form1" runat="server">
        <p>

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UPEncuesta" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="BtnGuardarEncuesta" />
                </Triggers>
                <ContentTemplate>
            <p class="text-justify">
                <br />
                Estimados estudiantes, esta encuesta tiene como objetivo conocer su interés para ser parte de los jóvenes
                         que haran una <b>pasantía no remunerada</b>, la cual se desarrollará en {{fecha_inicio_pasantia}}, donde pondrán 
                        en práctica sus conocimientos y habilidades adquiridas en los módulos de formación con empresas ya constituidas 
                        dentro del programa PIXELS PRO y dentro del sector que elaboran videojuegos y los comercializan. Por tal motivo 
                        agradecemos que responda a cada uno de los siguientes ítems:
            </p>
        <br />
        <ol>
            <li style="font-weight: bold">Está interesado en participar en una pasantía no remunerada con una empresa salvadoreña que se dedica a elaborar videojuegos. </li>
            <br />
            <br />
            Si su respuesta es <b>SI</b>, marque la siguiente casilla y explique por qué le gustaría ser parte.
                   
                    <div class="form-group">
                        <div class="col-sm-1">
                            <asp:CheckBox ID="CBsi" runat="server" Text="SI-" TextAlign="Left" />
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox class="form-control" ID="TxtPregunta" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                        </div>
                    </div>
            <br />
            <br />
            <br />
            <br />
            Si su respuesta es <b>NO</b>, marque la siguiente casilla y explique el motivo del por qué no podría. Si su respuesta en NO, hasta aquí finaliza la encuesta.
                   
                    <div class="form-group">
                        <div class="col-sm-1">
                            <asp:CheckBox ID="CBno" runat="server" Text="NO-" TextAlign="Left" />
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox class="form-control" ID="TxtPregunta1" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                        </div>
                    </div>
            <br />
            <br />
            <br />
            <br />
            <li style="font-weight: bold">Indicar si tiene laptop personal y estaría dispuesto a utilizarla durante {{duracion_pasantia}} que durará
                            la pasantía, en caso que quiera formar parte de ella. </li>
            <div class="form-group">
                <div class="col-sm-10">
                    <asp:TextBox class="form-control" ID="TextBox1" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
            <li style="font-weight: bold">Si está interesado en participar en la pasantía ¿Cúal es su horario disponible?  </li>
            <br />
            Marcar los días que tiene disponible a la semana y las horas en las que se compromete llegar a la empresa donde desarrollará la pasantía (Mínimo 15 horas por semana).
        </ol>

        <br />
        <table class="table table-striped table-condensed table-bordered" style="font-weight: bold; text-align: center">
            <tr>
                <td>HORARIO</td>
                <td>LUNES</td>
                <td>MARTES</td>
                <td>MIERCOLES</td>
                <td>JUEVES</td>
                <td>VIERNES</td>
                <td>SABADO</td>
                <td>DOMINGO</td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="CBam" runat="server" Text="AM" TextAlign="Left"></asp:CheckBox></td>
                <td>
                    <asp:CheckBox ID="CBLunesA" runat="server"></asp:CheckBox></td>
                <td>
                    <asp:CheckBox ID="CBMartesA" runat="server"></asp:CheckBox></td>
                <td>
                    <asp:CheckBox ID="CBMiercolesA" runat="server"></asp:CheckBox></td>
                <td>
                    <asp:CheckBox ID="CBJuevesA" runat="server"></asp:CheckBox></td>
                <td>
                    <asp:CheckBox ID="CBViernesA" runat="server"></asp:CheckBox></td>
                <td>
                    <asp:CheckBox ID="CBSabadoA" runat="server"></asp:CheckBox></td>
                <td>
                    <asp:CheckBox ID="CBDomingoA" runat="server"></asp:CheckBox></td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="CBpm" runat="server" Text="PM" TextAlign="Left"></asp:CheckBox></td>
                <td>
                    <asp:CheckBox ID="CBLunesP" runat="server"></asp:CheckBox></td>
                <td>
                    <asp:CheckBox ID="CBMartesP" runat="server"></asp:CheckBox></td>
                <td>
                    <asp:CheckBox ID="CBMiercolesP" runat="server"></asp:CheckBox></td>
                <td>
                    <asp:CheckBox ID="CBJuevesP" runat="server"></asp:CheckBox></td>
                <td>
                    <asp:CheckBox ID="CBViernesP" runat="server"></asp:CheckBox></td>
                <td>
                    <asp:CheckBox ID="CBSabadoP" runat="server"></asp:CheckBox></td>
                <td>
                    <asp:CheckBox ID="CBDomingoP" runat="server"></asp:CheckBox></td>
            </tr>
        </table>
        <br />
        <div align="center">
            <asp:Button ID="BtnGuardarEncuesta" runat="server" class="btn btn-primary" Text="GUARDAR" ValidationGroup="Encuesta" />
        </div>
        <br />
        <br />
        Nombre del Estudiante: {{nombre_aspirante}}<br />
        <br />
        <p class="text-justify">
            Durante {{duracion_pasantia}} que durará la pasantía no remunerada, el estudiante debe
                        costear su transporte, no recibirá ningún pago de parte de la empresa donde realizará la pasantía y por su
                        cuenta debe correr el pago de su alimentación u otro tipo de gasto.
        </p>
        </ContentTemplate>


            </asp:UpdatePanel>
    </form>

</asp:Content>
