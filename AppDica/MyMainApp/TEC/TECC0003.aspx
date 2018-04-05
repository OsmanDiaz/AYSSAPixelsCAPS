<%@ Page Title="" Language="C#" MasterPageFile="~/MasterProceso.master" AutoEventWireup="true" CodeBehind="TECC0003.aspx.cs" Inherits="MyMainApp.TEC.TECC0003" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
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
                                <%--<asp:Panel ID="PanelListaContratos" runat="server"><br />
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
                    </asp:Panel><--%><%--fin PanelListaContratos--%>
                                <asp:Panel ID="PanelListaAspirantePasantia" runat="server">
                                    <asp:TextBox ID="TxtIdAspirante" runat="server" Visible="false"></asp:TextBox>
                             <asp:TextBox ID="TxtIdPasantia" runat="server" Visible="false"></asp:TextBox>
                                    <br />
                                    <div align="center">
                                        <asp:Label ID="Label60" runat="server" Font-Size="14pt" Text="LISTA DE ASPIRANTES EN PASANTIA"></asp:Label>
                                     </div><br />
                                    <%--<div align="left">
                                        <asp:Button ID="BtnRegresarEmpresa" runat="server" Text="ATRAS" class="btn btn-primary" CausesValidation="False" OnClick="BtnRegresarEmpresa_Click" />
                                    </div>--%>
                                    
                                    <asp:GridView ID="GVListaAspirantePasantia" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID,ID_PASANTIA" OnSelectedIndexChanged="GVListaAspirantePasantia_SelectedIndexChanged">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="NOMBRE_COMPLETO" HeaderText="NOMBRE COMPLETO" />
                                            <asp:BoundField DataField="DS_NOMBRE_EMPRESA" HeaderText="EMPRESA" />
                                            <asp:BoundField DataField="NOMBRE_PASANTIA" HeaderText="PASANTIA" />
                                            <asp:TemplateField HeaderText="VER CONTRATO">
                                                <ItemTemplate>
                                           <asp:Button ID="BtnContrato" runat="server" CommandName="Select" Text="Ver Contrato"  />
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
                                <asp:Panel ID="PanelContratoPasante" runat="server" Visible="true">
                                   <p align="center"><br />
                                                <asp:Label ID="LblAcuerdo" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium">
                                        Acuerdo de pasantía no remunerada del proyecto PIXELS CAPS VIDEOJUEGOS
                                                </asp:Label>
                                            </p><br />
                                            <div align="left">
                                        <asp:Button ID="BtnReporteContrato" runat="server" Text="Descargar Contrato" class="btn btn-primary" CausesValidation="False"  />
                                       <asp:Button ID="BtnAtras" runat="server" Text="Regresar" class="btn btn-primary" CausesValidation="False" OnClick="BtnAtras_Click"  />
                                    </div><br />    
                                            <div class="form-group">
                                                <asp:Label ID="Label76" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOMBRE DE LA EMPRESA:"></asp:Label>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="TxtNombreEmpresa" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label77" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="RESPONSABLE:"></asp:Label>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="TxtResponsable" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-2" ID="Label73" runat="server" Font-Bold="True" Text="DIRECCIÓN:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtDireccionR" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label1" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="TELÉFONO:"></asp:Label>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="TxtTelResponsable" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label2" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="CORREO ELECTRÓNICO:"></asp:Label>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="TxtCorreoR" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>
                                    <br />
                                            <div class="form-group">
                                                <asp:Label ID="Label3" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOMBRE DE EL/LA PASANTE:"></asp:Label>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="TxtNombrePasante" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-2" ID="Label4" runat="server" Font-Bold="True" Text="DIRECCIÓN:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtDireccionPasante" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label5" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="TELÉFONOS DE CONTACTO:"></asp:Label>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="TxtTelefonoPasante" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label6" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="CORREO ELECTRÓNICO:"></asp:Label>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="TxtCorreoPasante" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>
                                    <asp:Panel ID="PanelReporteC" runat="server" CssClass="modalPopup" Height="527px">
                                                <br />
                                                <center>
                                                    <rsweb:ReportViewer ID="RVContrato" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="427px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="75%" style="margin-right: 0px" >
                                                        <LocalReport ReportPath="TEC\RptContratoPasante.rdlc"></LocalReport>
                                                    </rsweb:ReportViewer></center>
                                            <div align="center">
                                                    <br />
                                                    <asp:Button ID="BtnCerrarInforme" runat="server" Text="Cerrar"  />
                                                </div>
                                            </asp:Panel>
                                            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="PanelReporteC" BackgroundCssClass="modalBackround" TargetControlID="BtnReporteContrato" CancelControlID="BtnCerrarInforme"></ajaxToolkit:ModalPopupExtender>
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

