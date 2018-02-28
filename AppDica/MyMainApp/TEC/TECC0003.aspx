<%@ Page Title="" Language="C#" MasterPageFile="~/MasterProceso.master" AutoEventWireup="true" CodeBehind="TECC0003.aspx.cs" Inherits="MyMainApp.TEC.TECC0003" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <asp:Panel ID="Panel1" runat="server" Width="100%">
        <form id="form1" runat="server" class="form-horizontal">
            <%--inicio formulario--%>
            <div class="text-center">
                <%--  div titulo--%>
                <asp:Label ID="LblTitulo" runat="server" Text="Contratos" Font-Bold="True" Font-Size="18pt"></asp:Label>
            </div>
            <%--fin div titulo--%>
            <div class="container-fluid">
                <div id="content">
                    <%--inicio container-fluid--%>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <ajaxtoolkit:TabContainer id="TabContainer1" runat="server" activetabindex="0" bordercolor="#66CCFF" scrollbars="Vertical" height="375px" width="100%">
                        <ajaxtoolkit:TabPanel runat="server" HeaderText="LISTA DE CONTRATOS" ID="TabPanel1" Width="100%">
                            <ContentTemplate>
                            <asp:UpdatePanel ID="UPListaContrato" runat="server">
                            <ContentTemplate><%--inicio contenido tab--%>
                                <asp:Panel ID="PanelListaContratos" runat="server"><br />
                             <asp:TextBox ID="TxtIdPasantia" runat="server" Visible="false"></asp:TextBox>
                                    <div align="center">
                                        <asp:Label ID="Label59" runat="server" Font-Size="14pt" Text="LISTADO DE EMPRESA/PASANTIA"></asp:Label>
                                    </div>
                                    <br />
                            <asp:GridView ID="GVListaPasantia" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID" OnSelectedIndexChanged="GVListaPasantia_SelectedIndexChanged">
                           <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    
                                    <asp:BoundField HeaderText="EMPRESA" DataField="DS_NOMBRE_EMPRESA" />
                                    <asp:BoundField HeaderText="PASANTIA" DataField="NOMBRE_PASANTIA" />
                                    <asp:TemplateField HeaderText="VER PASANTES">
                                        <ItemTemplate>
                                           <asp:Button ID="BtnVerEntregable" runat="server" CommandName="Select" Text="Ver Pasantes"  />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                              </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <sortedascendingcellstyle backcolor="#F5F7FB" />
                                <sortedascendingheaderstyle backcolor="#6D95E1" />
                                <sorteddescendingcellstyle backcolor="#E9EBEF" />
                                <sorteddescendingheaderstyle backcolor="#4870BE" /></asp:GridView><br />
                    </asp:Panel><%--fin PanelListaContratos--%>
                                <asp:Panel ID="PanelListaAspirantePasantia" runat="server" Visible="false">
                                    <asp:TextBox ID="TxtIdAspirante" runat="server" Visible="false"></asp:TextBox>
                                    <div align="center">
                                        <asp:Label ID="Label60" runat="server" Font-Size="14pt" Text="LISTA DE ASPIRANTES EN PASANTIA"></asp:Label>
                                     </div>
                                    <div align="left">
                                        <asp:Button ID="BtnRegresarEmpresa" runat="server" Text="ATRAS" class="btn btn-primary" CausesValidation="False" OnClick="BtnRegresarEmpresa_Click" />
                                    </div>
                                    <br />
                                    <asp:GridView ID="GVListaAspirantePasantia" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID" OnSelectedIndexChanged="GVListaAspirantePasantia_SelectedIndexChanged">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="NOMBRE_COMPLETO" HeaderText="NOMBRE COMPLETO" />
                                            <asp:TemplateField HeaderText="VER CONTRATO">
                                                <ItemTemplate>
                                           <asp:Button ID="BtnVerContrato" runat="server" CommandName="Select" Text="Ver Contrato"  />
                                        </ItemTemplate>
                                            </asp:TemplateField>
                                          </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>

                                </asp:Panel>
                                <asp:Panel ID="PanelContratoPasante" runat="server" Visible="false">
                                   <p align="center"> <asp:Label ID="LblAcuerdo" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium">
                                        Acuerdo de pasantía no remunerada del proyecto PIXELS CAPS VIDEOJUEGOS<br /> con la empresa {{nombre_empresa}}
                                        y el pasante {{nombre_pasante}}.
                                    </asp:Label></p>
                                    <br />
                                    <asp:TextBox ID="TxtIdPasante" runat="server" Visible="false"></asp:TextBox>
                                    <br />
                                    <div class="form-group">
                                                <asp:Label ID="Label76" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE DE LA EMPRESA:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtNombreEmpresa" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label77" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="RESPONSABLE:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtResponsable" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>
                                    <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label73" runat="server" Font-Bold="True" Text="DIRECCIÓN:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtDireccionR" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                    <div class="form-group">
                                                <asp:Label ID="Label1" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="TELÉFONO:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtTelResponsable" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label2" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="CORREO ELECTRÓNICO:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtCorreoR" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div><br />
                                    <div class="form-group">
                                                <asp:Label ID="Label3" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE DE EL/LA PASANTE:"></asp:Label>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="TxtNombrePasante" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                   </div>
                                    <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label4" runat="server" Font-Bold="True" Text="DIRECCIÓN:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtDireccionPasante" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                    <div class="form-group">
                                                <asp:Label ID="Label5" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="TELÉFONOS DE CONTACTO:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtTelefonoPasante" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label6" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="CORREO ELECTRÓNICO:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtCorreoPasante" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div><br />
                                    <asp:Label ID="LblClausula1" runat="server" Text="Label">
                                        CLAUSULA PRIMERA – OBJETO: El presente contrato tiene por objeto la realización de pasantías no remuneradas con la finalidad de incrementar la práctica y 
                                        el adiestramiento de {{nombre_pasante}} del programa de formación PIXELS CAPS VIDEOJUEGOS con la empresa {{nombre_empresa}}
                                         y los principales objetivos de la pasantía son los siguientes:
                                    </asp:Label><br /><br />
                                    <ol>
                                        <li>Realizar procedimientos y actividades acordes con sus conocimientos, habilidades y destrezas profesionales. </li>
                                        <li>Capacitar en el conocimiento de características básicas de una relación laboral.</li>
                                        <li>Formar al pasante en aspectos  que le serán de utilidad en su posterior búsqueda laboral.</li>
                                        <li>Ofrecer la posibilidad de conocer y manejar tecnologías actualizadas.</li>
                                    </ol><br />
                                    <asp:Label ID="LblClausula2" runat="server" Text="Label">
                                        CLAUSULA SEGUNDA - OBLIGACIONES DE LAS PARTES: con la empresa {{nombre_empresa}} a) Realizar un seguimiento del pasante durante la pasantía, orientar
                                         y evaluar su desempeño;  b) Hacer que el pasante cumpla con el reglamento establecido por {{nombre_empresa}} durante su permanencia en el mismo; 
                                        c) Establecer y definir un cronograma de actividades o tareas asignadas al pasante d) Informar a la DICA  cualquier falta que cometa el pasante que atente contra 
                                        la empresa y a la persona asignada para dar seguimiento a la pasantía; Por su parte, {{nombre_pasante}} tendrá las siguientes obligaciones: 
                                        a) Cumplir con el cronograma de actividades o tareas estipuladas por la persona asignada a dar seguimiento; b) Cumplir con los horarios que ha definido el 
                                        pasante que asistirá a realizar la pasantía; c) Cumplir con los lineamientos internos de la empresa, d) Informar vía correo electrónico si por motivos académicos
                                         o de salud no pueden asistir, debe adjuntar constancia, y tiene como máximo 3 permisos durante la pasantía; f) Realizar un informe final con el trabajo que han 
                                        realizado en la pasantía y dejar copia a la empresa; g) Toda propiedad intelectual generada por el pasante durante la realización de la pasantía es propiedad de {{nombre_empresa}}.
                                    </asp:Label><br /><br />
                                    <asp:Label ID="LblClausula3" runat="server" Text="Label">
                                        CLAUSULA TERCERA – DURACIÓN: la pasantía dará inicio del {{fecha_inicio_pasantia}} hasta {{fecha_fin_pasantia}} del presente año. {{nombre_pasante}} debe de cumplir 
                                        entre 10 a 15 horas de trabajo distribuidas entre la semana.
                                    </asp:Label><br /><br />
                                    <asp:Label ID="LblClausula4" runat="server" Text="Label">
                                        CLAUSULA CUARTA - TERMINACIÓN DEL CONTRATO: El presente contrato terminará por: a) vencimiento del plazo de ejecución, b) bajo rendimiento o faltas disciplinarias
                                         en que incurra el pasante a criterio de la empresa, de manera oportuna debe informar de manera inmediata a la DICA, para proceder a la terminación del contrato.
                                         d) Por incumplimiento de lo acordado previstas por cada una de las partes.
                                    </asp:Label><br /><br />
                                    <asp:Label ID="LblClausula5" runat="server" Text="Label">
                                        CLAUSULA QUINTA: {{nombre_empresa}} no asumirá responsabilidad alguna por hechos derivados de accidentes de trabajo, de enfermedad profesional y otros de similar naturaleza.
                                    </asp:Label><br /><br />
                                    <asp:Label ID="LblClausula6" runat="server" Text="Label">
                                        CLAUSULA SEXTA - AUSENCIA DE LA RELACIÓN LABORAL: Por su naturaleza netamente académica, esta práctica no genera ningún tipo de relación laboral, civil o administrativa de parte del  
                                        {{nombre_empresa}} para con el o la pasante.
                                    </asp:Label><br /><br />
                                    <asp:Label ID="LblFinal" runat="server" Text="Label">
                                        En fe de lo anterior y por estar de acuerdo, firmamos el presente acuerdo de pasantía no remunerada, en la ciudad de San Salvador a los {{19 días del mes de junio del año dos mil diecisiete}}. 
                                    </asp:Label><br /><br /><br /><br />
                                    <div class="form-group">
                                                <asp:Label ID="Label7" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text=" ___________________________________________"></asp:Label>
                                                <div class="col-md-3">
                                                    
                                                </div>
                                                <asp:Label ID="Label8" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text=" ___________________________________________"></asp:Label>
                                                <div class="col-md-3">
                                                    
                                                </div>
                                            </div> 
                                    <div class="form-group">
                                                <asp:Label ID="LblResponsable" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="">{{nombre_responsable}}</asp:Label>
                                                <div class="col-md-3">
                                                
                                                </div>
                                                <asp:Label ID="LblPasante" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="">{{nombre_pasante}}</asp:Label>
                                                <div class="col-md-3">
                                                    
                                                </div>
                                            </div> 
                                    <div class="form-group">
                                                <asp:Label ID="LblEmpresa" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="">{{nombre_empresa}}</asp:Label>
                                                <div class="col-md-3">
                                                
                                                </div>
                                                <asp:Label ID="Label10" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="Pasante"></asp:Label>
                                                <div class="col-md-3">
                                                    
                                                </div>
                                            </div>
                                </asp:Panel>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                     </ContentTemplate>
                        </ajaxtoolkit:TabPanel>
                        <%--fin tab datos--%>
                        <%--fin tab datos--%>
                    </ajaxtoolkit:TabContainer>
                    <%--fin tab habilidades--%>
                </div>
                <%--fin contenido tab--%>
            </div>
            <%--fin container-fluid--%>
        </form>
        <%--fin formulario--%>
    </asp:Panel>
</asp:Content>

