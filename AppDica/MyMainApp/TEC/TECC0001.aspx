<%@ Page Title="" Language="C#" MasterPageFile="~/MasterProceso.master" AutoEventWireup="true" CodeBehind="TECC0001.aspx.cs" Inherits="MyMainApp.TEC.TEC0001" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxtoolkit" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">

        <asp:Panel ID="Panel1" runat="server" Width="100%">
            <form id="form1" runat="server" class="form-horizontal">
                <%--inicio formulario--%>
                <div class="text-center">
                    <%--  div titulo--%>
                    <asp:Label ID="LblTitulo" runat="server" Text="Tablero de Control - Aspirante" Font-Bold="True" Font-Size="18pt"></asp:Label>
                </div>
                <%--fin div titulo--%>
                <div class="container-fluid">
                    <div id="content">
                        <%--inicio container-fluid--%>
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <br />
                        <div class="form-group">
                            <asp:Label ID="Label17" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="PERIODO:"></asp:Label>
                            <div class="col-md-3">
                                <asp:DropDownList ID="CboPeriodoAsignado" runat="server" class="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <ajaxtoolkit:TabContainer ID="TabContainer1" runat="server" activetabindex="1" bordercolor="#66CCFF" height="375px" scrollbars="Vertical" width="100%">
                            <ajaxtoolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="REGISTROS DE ASPIRANTES" Width="100%">
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UPRegistroAspirante" runat="server">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="CboPeriodoAsignado" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <%--inicio contenido tab--%><%--inicio tab datos--%>
                                            <br />
                                            <br />
                                            <asp:Panel ID="PanelRegistroAspirante" runat="server">
                                            <asp:TextBox ID="TxtIdAspirante" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <asp:GridView ID="GVRegistroAspirante" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GVRegistroAspirante_SelectedIndexChanged" DataKeyNames="ID">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="DS_COMPLETO" HeaderText="NOMBRE COMPLETO" />
                                                    <asp:BoundField DataField="DS_SEXO" HeaderText="SEXO" />
                                                    <asp:BoundField DataField="CD_ESTADO_ASPIRANTE" HeaderText="ESTADO" />
                                                    <asp:TemplateField HeaderText="REGISTRO IQ">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnAgregarIq" runat="server" CommandName="Select" Text="Agregar IQ" />
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
                                            <asp:Panel ID="PanelRegistroIq" runat="server" Visible="false">
                                                <div align="center">
                                                <asp:Label ID="Label63" runat="server" Text="Registro de Prueba Psicológica" Font-Size="14pt"></asp:Label>
                                                </div><br />
                                                <div class="form-group">
                                            <asp:Label ID="Label1" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOMBRES:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtNombre" runat="server" class="form-control" ReadOnly="True"></asp:TextBox></div>
                                            <asp:Label ID="Label3" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="APELLIDOS:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtApellido" runat="server" class="form-control" ReadOnly="True"></asp:TextBox></div>
                                        </div>
                                        <div class="form-group">
                                             <asp:Label ID="Label6" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NIT:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtNit" runat="server" class="form-control" onkeypress="return Documentos(event);" onPaste="return Documentos(event);" ReadOnly="True"></asp:TextBox></div>
                                         </div>
                                                 <div class="form-group">
                                                <asp:Label ID="Label64" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOTA DE COEFICIENTE:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtNotaIq" runat="server" class="form-control" AutoCompleteType="Disabled" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                                 <div class="form-group">
                                                     <asp:Label ID="Label43" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="TIPO DOCUMENTO:"></asp:Label><div class="col-md-3">
                                                    <asp:DropDownList ID="CboTipoDocumento" runat="server" class="form-control" DataTextField="DS_TIPO_DOCUMENTO" DataValueField="ID">
                                                    </asp:DropDownList>
                                                </div>
                                                    <asp:Label ID="Label22" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="ADJUNTAR DOCUMENTOS:"></asp:Label>
                                                    <div class="col-md-3">
                                                        
                                                        <ajaxtoolkit:AsyncFileUpload ID="FileDocumento" runat="server"  PersistFile="True" OnUploadedComplete="FileDocumento_UploadedComplete" />
                                                        
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                <asp:Label class="control-label  col-sm-2" ID="Label67" runat="server" Font-Bold="True" Text="OBSERVACION:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtObservacion" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                               
                                                <div align="center">
                                                <asp:Button ID="BtnGuardarNotaIq" runat="server" class="btn btn-primary" Text="GUARDAR" OnClick="BtnGuardarNotaIq_Click" />
                                                &nbsp;<asp:Button ID="BtnRegresar" runat="server" Text="REGRESAR" class="btn btn-primary" CausesValidation="False" OnClick="BtnRegresar_Click"/></div>
                                                <br />

                                            </asp:Panel>
                                            <br />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </ajaxtoolkit:TabPanel>
                            <%--fin tab datos--%>
                            <ajaxtoolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="ASPIRANTES ASIGNADOS">
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UPAsignados" runat="server">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="CboPeriodoAsignado" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <br />
                                            <br />
                                            <asp:GridView ID="GVAspiranteAsignado" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="NOMBRE COMPLETO" DataField="DS_COMPLETO" />
                                                    <asp:BoundField DataField="DS_NOMBRE_EMPRESA" HeaderText="EMPRESA" />
                                                    <asp:BoundField DataField="NOMBRE_PASANTIA" HeaderText="PASANTIA" />
                                                    <asp:BoundField HeaderText="ÁREA PASANTÍA" DataField="DS_AREA" />
                                                    <asp:BoundField DataField="FECH_INICIO_PASANTIA" HeaderText="FECHA INICIO" />
                                                    <asp:BoundField HeaderText="DURACIÓN PASANTÍA" DataField="DS_DURACION" />
                                                    <asp:BoundField HeaderText="EVALUADOR" DataField="DS_NOMBRE_EVAL" />
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
                                            <%--fin tab informacion adicional--%>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </ajaxtoolkit:TabPanel>
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

