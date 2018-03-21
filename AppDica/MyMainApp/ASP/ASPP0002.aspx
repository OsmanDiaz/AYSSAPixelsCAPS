<%@ Page Title="" Language="C#" MasterPageFile="~/MasterInicio.Master" AutoEventWireup="true" CodeBehind="ASPP0002.aspx.cs" Inherits="MyMainApp.ASP.ASPP0002" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHPrincipal" runat="server">
    
    <form id="form1" runat="server">
        <p>

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            
        <asp:UpdatePanel ID="UPPanelEncuestaSemanal" runat="server">
            <ContentTemplate>
                <asp:Panel ID="PanelEncuestaPasante" runat="server" Visible="true">
                    <div align="center"><b>ENCUESTA SEMANAL</b></div>
                    <asp:TextBox ID="TxtIdAspirante" runat="server" Visible="False">0</asp:TextBox>
                    <asp:TextBox ID="TxtIdEncuesta" runat="server" Visible="False"></asp:TextBox>
                    <asp:TextBox ID="TxtIdEmpresaE" runat="server" Visible="False"></asp:TextBox>
                    <asp:TextBox ID="TxtIdPasantiaE" runat="server" Visible="False"></asp:TextBox>
                    <br />
                    <ol>
                    <li>Califica la atención brindada por la empresa encargada de haber desarrollado el módulo de PIXELS CAPS recién finalizado.</li>
                        <asp:RadioButtonList ID="RB1" runat="server">
                    <asp:ListItem Value="M">Muy Buena</asp:ListItem>
                    <asp:ListItem Value="B">Buena</asp:ListItem>
                    <asp:ListItem Value="R">Regular</asp:ListItem>
                    <asp:ListItem Value="L">Mala</asp:ListItem>
                        </asp:RadioButtonList>
                        
                    <li>Califique las clases impartidas durante el presente módulo</li>
                    <asp:RadioButtonList ID="RB2" runat="server">
                    <asp:ListItem Value="M">Muy Buena</asp:ListItem>
                    <asp:ListItem Value="B">Buena</asp:ListItem>
                    <asp:ListItem Value="R">Regular</asp:ListItem>
                    <asp:ListItem Value="L">Mala</asp:ListItem>
                    </asp:RadioButtonList>
                    <li>Califique las insatalaciones donde recibió las clases</li>
                        <asp:RadioButtonList ID="RB3" runat="server">
                     <asp:ListItem Value="M">Muy Buena</asp:ListItem>
                    <asp:ListItem Value="B">Buena</asp:ListItem>
                    <asp:ListItem Value="R">Regular</asp:ListItem>
                    <asp:ListItem Value="L">Mala</asp:ListItem>
                        </asp:RadioButtonList>
                    <li>Califique el hardware usado en las clases</li>
                        <asp:RadioButtonList ID="RB4" runat="server">
                     <asp:ListItem Value="A">Adecuado</asp:ListItem>
                    <asp:ListItem Value="O">Obsoleto</asp:ListItem>
                        </asp:RadioButtonList>
                    <li>Brinda tu opinión sobre el desempeño del facilitador del módulo</li>
                        <asp:RadioButtonList ID="RB5" runat="server">
                     <asp:ListItem Value="M">Muy Buena</asp:ListItem>
                    <asp:ListItem Value="B">Buena</asp:ListItem>
                    <asp:ListItem Value="R">Regular</asp:ListItem>
                    <asp:ListItem Value="L">Mala</asp:ListItem>
                        </asp:RadioButtonList>
                    <li>Brinda tu opinión sobre el desempeño del instructor del módulo</li>
                        <asp:RadioButtonList ID="RB6" runat="server">
                    <asp:ListItem Value="M">Muy Buena</asp:ListItem>
                    <asp:ListItem Value="B">Buena</asp:ListItem>
                    <asp:ListItem Value="R">Regular</asp:ListItem>
                    <asp:ListItem Value="L">Mala</asp:ListItem>
                        </asp:RadioButtonList>
                    </ol>
                    <div align="center">
                        <asp:Button ID="BtnGuardarEncuestaSemanalP" runat="server" class="btn btn-primary" Text="GUARDAR" ValidationGroup="Encuesta" OnClientClick="return confirm('¿Desea enviar los resultados?');" OnClick="BtnGuardarEncuestaSemanalP_Click" />
                    </div><br />
                </asp:Panel>
                <asp:Panel ID="PanelReporteEncuestaSemanal" runat="server" Visible="true">
                    <div align="center"><br /><br /><br />
                                             <asp:Button ID="BtnReporteEncSemanal" runat="server" Text="DESCARGAR REPORTE DE ENCUESTA SEMANAL" />
                                         </div><br />
                                            <asp:Panel ID="PanelReporteEncuesta" runat="server" CssClass="modalPopup" Height="527px">
                                             <br />
                                            <center>
                                          <rsweb:ReportViewer ID="RVEncuestaSemanal" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="427px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="75%" style="margin-right: 0px"><LocalReport ReportPath="ASP\RptEncuestaSemanal.rdlc"></LocalReport></rsweb:ReportViewer></center>
                                            <div align="center">
                                                <br />
                                                <asp:Button ID="BtnCerrarReporte" runat="server" Text="Cerrar" />
                                            </div>
                                        </asp:Panel>
                                        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="PanelReporteEncuesta" BackgroundCssClass="modalBackround" TargetControlID="BtnReporteEncSemanal" CancelControlID="BtnCerrarReporte"></ajaxToolkit:ModalPopupExtender>
                                        
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

</asp:Content>
