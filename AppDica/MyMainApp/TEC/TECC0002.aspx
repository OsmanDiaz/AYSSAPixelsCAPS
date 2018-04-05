<%@ Page Title="" Language="C#" MasterPageFile="~/MasterProceso.master" AutoEventWireup="true" CodeBehind="TECC0002.aspx.cs" Inherits="MyMainApp.TEC.TECC0002" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <asp:Panel ID="Panel1" runat="server" Width="100%">
        <form id="form1" runat="server" class="form-horizontal">
            <%--inicio formulario--%>
            <div class="text-center">
                <%--  div titulo--%>
                <asp:Label ID="LblTitulo" runat="server" Text="TABLERO DE CONTROL - EMPRESA" Font-Bold="True" Font-Size="18pt"></asp:Label>
            </div>
            <%--fin div titulo--%>
            <div class="container-fluid">
                <div id="content">
                    <%--inicio container-fluid--%>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <br />
                    <%--                    <div class="form-group">
                        <asp:Label ID="Label34" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="PERIODO:"></asp:Label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="CboPeriodoEmpresa" runat="server" class="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>--%>
                    <ajaxtoolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" BorderColor="#66CCFF" Height="375px" ScrollBars="Vertical" Width="100%">

                        <ajaxtoolkit:TabPanel ID="TabPanelGeneral" runat="server" HeaderText="MONITOREO">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPGeneral" runat="server">
                                    <ContentTemplate>
                                        <br />
                                        <asp:TextBox ID="TxtAdvertencia" runat="server" Visible="False"></asp:TextBox>
                                        <asp:TextBox ID="TxtIdEntregable" runat="server" Visible="False"></asp:TextBox><asp:TextBox ID="TxtIdAspirante" runat="server" Visible="False"></asp:TextBox><asp:TextBox ID="TxtCorreo" runat="server" Visible="False"></asp:TextBox><asp:TextBox ID="TxtIdConsultoria" runat="server" Visible="False"></asp:TextBox><asp:TextBox ID="TxtIdEmpresa" runat="server" Visible="False"></asp:TextBox><asp:TextBox ID="TxtIdPasantia" runat="server" Visible="False"></asp:TextBox><asp:TextBox ID="TxtTipoEntregable" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%" Visible="false"></asp:TextBox><asp:TextBox ID="TxtIdActividadAspirante" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%" Visible="false"></asp:TextBox><asp:Panel ID="PanelGeneral" runat="server">
                                            <center><h3>Informacion Proyectos</h3></center>
                                            <asp:GridView ID="GVListaGeneral" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID" OnSelectedIndexChanged="GVListaGeneral_SelectedIndexChaged">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TxtIdProyectosGV" runat="server" Text='<%#Eval("ID_CONSULTORIA")%>' Visible="false"></asp:TextBox></ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="EMPRESA" DataField="DS_NOMBRE_EMPRESA" />
                                                    <asp:BoundField HeaderText="BANDERA" DataField="BANDERA" Visible="false" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# string.Concat("~/images/buttons/",Eval("BANDERA"), ".png")%>' Width="25px" /></ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnGeneral" runat="server" CommandName="Select"
                                                                Text="Informacion" />
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
                                        <asp:Panel ID="PanelListadoProyectoEntregable" runat="server" Visible="false">
                                            <center><h3>Información Entregables</h3></center>
                                            <br />
                                            <asp:GridView ID="GVlistaEntregab" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID_CONSULTORIA,DS_TIPO,ID_CONSULTORIA_ENTREGABLE" OnSelectedIndexChanged="GVListaEntregables1_SelectedIndexChanged">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TxtIdEntregableGV" runat="server" Text='<%#Eval("ID_CONSULTORIA_ENTREGABLE")%>' Visible="false"></asp:TextBox></ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="PROYECTO" DataField="DS_NOMBRE_CONSULTORIA" />
                                                    <asp:BoundField HeaderText="NOMBRE ENTREGABLE" DataField="DS_ENTREGABLE" />
                                                    <asp:BoundField HeaderText="ADVERTENCIA" DataField="MSJ" />
                                                    <asp:BoundField HeaderText="TIPO" DataField="DS_TIPO" />
                                                    <asp:BoundField HeaderText="BANDERA" DataField="BANDERA" Visible="false" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# string.Concat("~/images/buttons/",Eval("BANDERA"), ".png")%>' Width="25px" /></ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnProyecto" runat="server" CommandName="Select"
                                                                Text="Informacion Proyecto" />
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
                                            <br />
                                            <div align="center">
                                                <asp:Button ID="BtnAtrasListaEntregab" runat="server" Text="ATRAS" class="btn btn-primary" CausesValidation="False" OnClick="BtnAtrasListaEntregab_Click" /></div>
                                        </asp:Panel>
                                        <asp:Panel ID="PanelInfoEmpre" runat="server" Visible="False">
                                            <br />
                                            <div align="center">
                                                <asp:Label ID="Label30" runat="server" Text="INFORMACION EMPRESA" Font-Size="14pt"></asp:Label></div>
                                            <div class="form-group">
                                                <asp:Label ID="Label31" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE EMPRESA:"></asp:Label><div class="col-md-9">
                                                    <asp:TextBox ID="TxtNEmpresa" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox></div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label32" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE CONTACTO:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtNContacto" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox></div>
                                                <asp:Label ID="Label33" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="EMAIL CONTACTO:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtEContacto" runat="server" class="form-control" Enabled="False" Width="100%"></asp:TextBox></div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label35" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="TELEFONO CONTACTO:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtTelContacto" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox></div>
                                                <asp:Label ID="Label36" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NIT EMPRESA:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtNitEmpresa1" runat="server" class="form-control" Enabled="False" Width="100%"></asp:TextBox></div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label37" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="TELEFONO EMPRESA:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtTelEmpresa" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox></div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label38" runat="server" Font-Bold="True" Text="DIRECCION:"></asp:Label><div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtDirEmpresa" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox></div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label39" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE REPRESENTANTE LEGAL:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtNRepresentante" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox></div>
                                                <asp:Label ID="Label40" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="EMAIL REPRESENTANTE LEGAL:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtERepresentante" runat="server" class="form-control" Enabled="False" Width="100%"></asp:TextBox></div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label41" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NIT REPRESENTANTE LEGAL:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtNitRepresentante" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox></div>
                                                <asp:Label ID="Label42" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="DUI REPRESENTANTE LEGAL:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtDuiRepresentante" runat="server" class="form-control" Enabled="False" Width="100%"></asp:TextBox></div>
                                            </div>
                                            <div align="center">
                                                <asp:Button ID="Button1" runat="server" Text="ATRAS" class="btn btn-primary" CausesValidation="False" OnClick="BtnAtrasInfoEmpre_Click" /></div>
                                            <br />
                                        </asp:Panel>

                                        <!-- INICIO PANEL DE INFORMACION DEL ENTREGABLE -->
                                        <asp:Panel ID="PanelInfoEntregable" runat="server" Visible="False">
                                            <br />
                                            <div align="center">
                                                <asp:Label ID="Label43" runat="server" Text="INFORMACION ENTREGABLE" Font-Size="14pt"></asp:Label></div>
                                            <div class="form-group">
                                                <asp:Label ID="Label44" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE EMPRESA:"></asp:Label><div class="col-md-9">
                                                    <asp:TextBox ID="TxtNombreEmpresa1" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox></div>
                                            </div>
                                            <asp:Panel ID="PanelPEntregableActivity" runat="server" Visible="False">
                                                <div class="form-group">
                                                    <asp:Label ID="Label45" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE CONTACTO:"></asp:Label><div class="col-md-3">
                                                        <asp:TextBox ID="TxtContacto" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox></div>
                                                    <asp:Label ID="Label46" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="EMAIL CONTACTO:"></asp:Label><div class="col-md-3">
                                                        <asp:TextBox ID="TxtEmailCon" runat="server" class="form-control" Enabled="False" Width="100%"></asp:TextBox></div>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="Label47" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE CONSULTORIA:"></asp:Label><div class="col-md-3">
                                                        <asp:TextBox ID="TxtConsultoria" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox></div>
                                                    <asp:Label ID="Label48" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="ENTREGABLE:"></asp:Label><div class="col-md-3">
                                                        <asp:TextBox ID="TxtEntregable" runat="server" class="form-control" Enabled="False" Width="100%"></asp:TextBox></div>
                                                </div>
                                                <div align="center">
                                                    <asp:Button ID="BtnAtrasConsultoriaEntregable" runat="server" Text="ATRAS" class="btn btn-primary" CausesValidation="False" OnClick="BtnAtrasConEnt_Click" /></div>
                                                    <asp:Button ID="BtnEnviarCorreo" runat="server" Text="ENVIAR CORREO" class="btn btn-primary" CausesValidation="False" OnClick="BtnEnviarCorreo_Click" /></div>
                                                <br />
                                            </asp:Panel>
                                            <!-- FIN  PANEL DE INFORMACION DEL ENTREGABLE -->

                                            <asp:Panel ID="PanelPasantiaActivity" runat="server" Visible="False">
                                                <div class="form-group">
                                                    <asp:Label ID="Label55" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE EVALUADOR:"></asp:Label><div class="col-md-3">
                                                        <asp:TextBox ID="TxtNombreEval" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox></div>
                                                    <asp:Label ID="Label56" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="EMAIL EVALUADOR:"></asp:Label><div class="col-md-3">
                                                        <asp:TextBox ID="TxtEmailEval" runat="server" class="form-control" Enabled="False" Width="100%"></asp:TextBox></div>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="Label50" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE PASANTIA:"></asp:Label><div class="col-md-3">
                                                        <asp:TextBox ID="TxtPasantiaName" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox></div>
                                                    <asp:Label ID="Label54" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="ACTIVIDAD:"></asp:Label><div class="col-md-3">
                                                        <asp:TextBox ID="TxtActividad" runat="server" class="form-control" Enabled="False" Width="100%"></asp:TextBox></div>
                                                </div>
                                                <br />
                                                <asp:GridView ID="GVlistaActividadPasantia" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID, ID_ASPIRANTE" OnSelectedIndexChanged="GVlistaActividadPasantia_SelectedIndexChanged">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="TxtIdEntregableGV" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:TextBox></ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="ID" DataField="ID" Visible="false" />
                                                        <asp:BoundField HeaderText="ASPIRANTE" DataField="NOMBRE_ASPIRANTE" />
                                                        <asp:BoundField HeaderText="ADVERTENCIA" DataField="MSJ" />
                                                        <asp:BoundField HeaderText="BANDERA" DataField="BANDERA" Visible="false" />
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# string.Concat("~/images/buttons/",Eval("BANDERA"), ".png")%>' Width="25px" /></ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Button ID="BtnProyecto" runat="server" CommandName="Select"
                                                                    Text="Enviar Notificación" />
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
                                                <br />
                                                <div align="center">
                                                    <asp:Button ID="BtnAtrasPasantiaActividad" runat="server" Text="ATRAS" class="btn btn-primary" CausesValidation="False" OnClick="BtnAtrasPasAct_Click" /></div>
                                                <br />
                                            </asp:Panel>
                                        </asp:Panel>
                                        <asp:Panel ID="Panel2" runat="server" Visible="false">
                                            <div class="form-group">
                                                <asp:Label ID="Label2" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE DE EMPRESA:"></asp:Label><div class="col-md-9">
                                                    <asp:TextBox ID="TxtEmpresa" runat="server" ReadOnly="True" class="form-control"></asp:TextBox></div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label3" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="DURACIÓN DE PASANTIA:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtDuracion" runat="server" ReadOnly="True" class="form-control"></asp:TextBox></div>
                                                <asp:Label ID="Label4" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="FECHA INICIO:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtFechaInicio" runat="server" ReadOnly="True" class="form-control"></asp:TextBox></div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label9" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE DE EVALUADOR:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtEvaluador" runat="server" ReadOnly="True" class="form-control"></asp:TextBox></div>
                                                <asp:Label ID="Label5" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="AREA DE PASANTIA:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtAreaPasantia" runat="server" ReadOnly="True" class="form-control"></asp:TextBox></div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label6" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="SUCURSAL:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtSucursal" runat="server" ReadOnly="True" class="form-control"></asp:TextBox></div>
                                                <asp:Label ID="Label7" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="ESTADO:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtEstado" runat="server" ReadOnly="True" class="form-control"></asp:TextBox></div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label8" runat="server" Font-Bold="True" Text="DESCRIPCION DE PASANTIA:"></asp:Label><div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtDescripPasantia" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" ReadOnly="True"></asp:TextBox></div>
                                            </div>
                                        </asp:Panel>
                                        <br />
                                        <asp:Panel ID="PanelListaEntregables" runat="server">
                                            <asp:GridView ID="GVListaEntregable" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="NOMBRE ENTREGABLE" />
                                                    <asp:BoundField HeaderText="FECHA DE ENTREGA" />
                                                    <asp:BoundField HeaderText="DESCRIPCION" />
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
                                        <br />
                                        <asp:Panel ID="PanelEntregables" runat="server" Visible="false">
                                            <asp:GridView ID="GVEntregables" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID" OnSelectedIndexChanged="GVListaEntregables_SelectedIndexChanged">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TxtIdEntregableGV" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:TextBox></ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="NOMBRE ENTREGABLE" DataField="DS_ENTREGABLE" />
                                                    <asp:BoundField HeaderText="FECHA DE ENTREGA" DataField="FECH_ENTREGA_ENT" />
                                                    <asp:BoundField HeaderText="DURACION" DataField="DS_DURACION_ENT" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnProyecto" runat="server" CommandName="Select"
                                                                Text="Informacion Proyecto" />
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
                                        <br />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </ajaxtoolkit:TabPanel>





                        <%--fin tab datos--%>
                        <ajaxtoolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="PASANTIAS">
                            <HeaderTemplate>PASANTIAS</HeaderTemplate>
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPPasantias" runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="PanelListadoPasantia" runat="server">
                                            <br />
                                            <center><h3>Listado de Pasantias</h3></center>
                                            <br />
                                            <asp:GridView ID="GVListaPasantia" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GVListaPasantia_SelectedIndexChaged" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TxtIdPasantiaGV" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:TextBox></ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="NOMBRE_PASANTIA" HeaderText="NOMBRE PASANTIA" />
                                                    <asp:BoundField DataField="DS_AREA" HeaderText="AREA PASANTIA" />
                                                    <asp:BoundField DataField="DS_NOMBRE_EMPRESA" HeaderText="NOMBRE EMPRESA" />
                                                    <asp:BoundField DataField="DS_SUCURSAL" HeaderText="SUCURSAL" />
                                                    <asp:BoundField DataField="NM_VACANTES" HeaderText="VACANTES" />
                                                    <asp:BoundField DataField="DS_DURACION" HeaderText="DURACION (DIAS)" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnPasantia" runat="server" CommandName="Select" Text="Informacion Pasantia" /></ItemTemplate>
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
                                        <asp:Panel ID="PanelListadoAspPas" runat="server" Visible="false">
                                            <br />
                                            <div align="center">
                                                <asp:Label ID="Label13" runat="server" Font-Size="14pt" Text="INFORMACION PASANTIA"></asp:Label></div>
                                            <br />
                                            <div class="form-group">
                                                <asp:Label ID="Label18" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE EMPRESA:"></asp:Label><div class="col-md-9">
                                                    <asp:TextBox ID="TxtNombreEmpresaPasantia" runat="server" AutoCompleteType="Disabled" class="form-control" Enabled="False" Width="100%"></asp:TextBox></div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label19" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE PASANTIA:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtNombrePas" runat="server" AutoCompleteType="Disabled" class="form-control" Enabled="False" Width="100%"></asp:TextBox></div>
                                                <asp:Label ID="Label20" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="AREA DE PASANTIA:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtArea" runat="server" class="form-control" Enabled="False" Width="100%"></asp:TextBox></div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label21" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="SUCURSAL:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtSucursalPasantia" runat="server" AutoCompleteType="Disabled" class="form-control" Enabled="False" Width="100%"></asp:TextBox></div>
                                                <asp:Label ID="Label22" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="VACANTES:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtVacantes" runat="server" class="form-control" Enabled="False" Width="100%"></asp:TextBox></div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label23" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="DESCRIPCION PASANTIA:"></asp:Label><div class="col-md-9">
                                                    <asp:TextBox ID="TxtDescPasantia" runat="server" AutoCompleteType="Disabled" class="form-control" Enabled="False" TextMode="MultiLine" Width="100%"></asp:TextBox></div>
                                            </div>
                                            <br />
                                            <hr>
                                                <br />
                                                <div align="center">
                                                    <asp:Label ID="Label24" runat="server" Font-Size="14pt" Text="ESCOLARIDAD REQUERIDA"></asp:Label></div>
                                                <br />
                                                <div class="form-group">
                                                    <asp:Label ID="Label26" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="ESCOLARIDAD:"></asp:Label><div class="col-md-3">
                                                        <asp:TextBox ID="TxtEscolaridad" runat="server" AutoCompleteType="Disabled" class="form-control" Enabled="False" Width="100%"></asp:TextBox></div>
                                                    <asp:Label ID="Label27" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NIVEL:"></asp:Label><div class="col-md-3">
                                                        <asp:TextBox ID="TxtEstudio" runat="server" class="form-control" Enabled="False" Width="100%"></asp:TextBox></div>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="Label25" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="CARRERA:"></asp:Label><div class="col-md-9">
                                                        <asp:TextBox ID="TxtCarrera" runat="server" AutoCompleteType="Disabled" class="form-control" Enabled="False" Width="100%"></asp:TextBox></div>
                                                </div>
                                                <br />
                                                <hr>
                                                    <br />
                                                    <div align="center">
                                                        <asp:Label ID="Label28" runat="server" Font-Size="14pt" Text="HABILIDADES REQUERIDAS"></asp:Label></div>
                                                    <br />
                                                    <asp:GridView ID="GVHabilidadesPasantia" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                        <AlternatingRowStyle BackColor="White" />
                                                        <Columns>
                                                            <asp:BoundField DataField="DS_CATEGORIA_HABILIDAD" HeaderText="CATEGORIA" />
                                                            <asp:BoundField DataField="DS_HABILIDAD_CONOCIMIENTO" HeaderText="CONOCIMIENTO" />
                                                            <asp:BoundField DataField="DS_NIVEL_CONOCIMIENTO" HeaderText="NIVEL DE CONOCIMIENTO" />
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
                                                    <br />
                                                    <hr />
                                                    <br />
                                                    <div align="center">
                                                        <asp:Label ID="Label29" runat="server" Font-Size="14pt" Text="ASIGNACIÓN DE ASPIRANTES"></asp:Label></div>
                                                    <br />
                                                    <asp:Panel ID="PanelAspirantes" runat="server" Visible="true">
                                                        <asp:GridView ID="GVAsignacionAspirantes" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_aspirante" EmptyDataText="No existen registros" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GVAsignacionAspirantes_SelectedIndexChanged" Width="100%">
                                                            <AlternatingRowStyle BackColor="White" />
                                                            <Columns>
                                                                <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE ASPIRANTE" />
                                                                <asp:BoundField DataField="Edad" HeaderText="EDAD" />
                                                                <asp:BoundField DataField="discapacidad" HeaderText="DISCAPACIDAD" />
                                                                <asp:BoundField DataField="Semejanzas" HeaderText="COINCIDENCIA" />
                                                                <asp:TemplateField HeaderText="ASIGNAR">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BtnAsignarPasantia" runat="server" CommandName="Select" Text="Asignar" /></ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Ver Aspirante" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BtnVerAspirante" runat="server" CommandName="Select" Text="Ver Aspirante" /></ItemTemplate>
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
                                                        <br />
                                                        <br />
                                                        <asp:GridView ID="GVAspirantes" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" EmptyDataText="No existen registros" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GVAspirantes_SelectedIndexChanged" Width="100%">
                                                            <AlternatingRowStyle BackColor="White" />
                                                            <Columns>
                                                                <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE ASPIRANTE" />
                                                                <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" />
                                                                <asp:TemplateField HeaderText="ACTIVIDADES">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BtnVerActividades" runat="server" CommandName="Select" Text="Ver Actividades" /></ItemTemplate>
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
                                                        <br />
                                                    </asp:Panel>
                                                    <div align="center">
                                                        <asp:Button ID="BtnAtras" runat="server" CausesValidation="False" class="btn btn-primary" OnClick="BtnRegresarPasantia_Click" Text="ATRAS" /></div>
                                                    <br />
                                                </hr>
                                            </hr>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </ajaxtoolkit:TabPanel>
                        <%--fin tab datos--%>

                        <ajaxtoolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="RESULTADOS DE ENCUESTA POR EMPRESA">
                            <HeaderTemplate>RESULTADOS DE ENCUESTA SEMANAL</HeaderTemplate>
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPResultadoEncuesta" runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="PanelResultado" runat="server" Visible="false">
                                            <br />
                                            <center><h3>Resultados de Encuesta</h3></center>
                                            <br />
                                              <asp:Label ID="lblResultadoEncuesta" runat="server" Visible="false"></asp:Label>
                                            <div align="left">
                                                <asp:Button ID="BtnRegresarPasantia" runat="server" Text="REGRESAR" class="btn btn-primary" CausesValidation="False" OnClick="BtnRegresarPasantia_Click1"/>
                                            </div><br />
                                            <asp:GridView ID="GVResultadoPreg1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="PREGUNTA_1" HeaderText="PREGUNTA">
                                                        <ItemStyle Font-Size="Small" Width="450px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R1_M" HeaderText="% MUY BUENA">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R1_B" HeaderText="% BUENA">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R1_R" HeaderText="% REGULAR">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R1_L" HeaderText="% MALA">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
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
                                            <br />
                                            <asp:GridView ID="GVResultadoPreg2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="PREGUNTA" DataField="PREGUNTA_2">
                                                        <ItemStyle Font-Size="Small" Width="450px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="MUY BUENA" DataField="R2_M">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="BUENA" DataField="R2_B">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="REGULAR" DataField="R2_R">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="MALA" DataField="R2_L">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
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
                                            <br />
                                            <asp:GridView ID="GVResultadoPreg3" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="PREGUNTA_3" HeaderText="PREGUNTA">
                                                        <ItemStyle Font-Bold="False" Font-Size="Small" Width="450px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R3_M" HeaderText="MUY BUENA">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R3_B" HeaderText="BUENA">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R3_R" HeaderText="REGULAR">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R3_L" HeaderText="MALA">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
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
                                            <br />
                                            <asp:GridView ID="GVResultadoPreg4" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="PREGUNTA_4" HeaderText="PREGUNTA">
                                                        <ItemStyle Font-Size="Small" Width="450px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R4_A" HeaderText="ADECUADO">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R4_O" HeaderText="OBSOLETO">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
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
                                            <br />
                                            <asp:GridView ID="GVResultadoPreg5" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="PREGUNTA_5" HeaderText="PREGUNTA">
                                                        <ItemStyle Width="450px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R5_M" HeaderText="MUY BUENA">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R5_B" HeaderText="BUENA">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R5_R" HeaderText="REGULAR">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R5_L" HeaderText="MALA">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
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
                                            <br />
                                            <asp:GridView ID="GVResultadoPreg6" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="PREGUNTA_6" HeaderText="PREGUNTA">
                                                        <ItemStyle Font-Size="Small" Width="450px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R6_M" HeaderText="MUY BUENA">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R6_B" HeaderText="BUENA">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R6_R" HeaderText="REGULAR">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="R6_L" HeaderText="MALA">
                                                        <ItemStyle Font-Bold="True" />
                                                    </asp:BoundField>
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
                                            <br />
                                            <br />
                                        </asp:Panel>
                                        <asp:Panel ID="PanelListaEmpresa" runat="server">
                                            <asp:TextBox ID="TxtIdEmpresaE" runat="server"  Visible="False"></asp:TextBox>
                                            <br />
                                            <center><h3>Lista de Empresas</h3></center>
                                            <br />
                                            
                                            <asp:GridView ID="GVListaEmpresaEncuesta" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GVListaEmpresaEncuesta_SelectedIndexChanged">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="DS_NOMBRE_EMPRESA" HeaderText="NOMBRE EMPRESA" />
                                                    <asp:BoundField DataField="DS_NOMBRE_CONTACTO" HeaderText="NOMBRE CONTACTO" />
                                                    <asp:BoundField DataField="DS_EMAIL_CONTACTO" HeaderText="EMAIL DE CONTACTO" />
                                                    <asp:BoundField DataField="DS_TELEFONO_CONTACTO" HeaderText="TEL. DE CONTACTO" />
                                                    <asp:TemplateField HeaderText="VER PASANTIAS">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnVerPasantia" runat="server" CommandName="Select"
                                                                Text="Ver Pasantias" />
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
                                        
                                        <br />
                                        <asp:Panel ID="PanelListaPasantiaE" runat="server" Visible="false">
                                            <asp:TextBox ID="TxtIdPasantiaE" runat="server" Visible="False"></asp:TextBox>
                                            <center><h3>Lista de Pasantias</h3></center>
                                            <br />
                                            <div align="left">
                                                <asp:Button ID="BtnRegresarEmpresa" runat="server" Text="REGRESAR" class="btn btn-primary" CausesValidation="False" OnClick="BtnRegresarEmpresa_Click"/>
                                            </div><br />
                                            <asp:GridView ID="GVListaPasantiasE" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="ID" OnSelectedIndexChanged="GVListaPasantiasE_SelectedIndexChanged" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="NOMBRE_PASANTIA" HeaderText="PASANTIA" />
                                                    <asp:BoundField DataField="DS_NOMBRE_EVAL" HeaderText="NOMBRE EVALUADOR" />
                                                    <asp:BoundField DataField="DS_DURACION" HeaderText="DURACION (DIAS)" />
                                                    <asp:TemplateField HeaderText="VER RESULTADOS">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnVerResultado" runat="server" CommandName="Select"
                                                                Text="Ver Resultados" />
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
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </ajaxtoolkit:TabPanel>

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

