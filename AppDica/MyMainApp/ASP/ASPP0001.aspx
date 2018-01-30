<%@ Page Title="" Language="C#" MasterPageFile="~/MasterInicio.Master" AutoEventWireup="true" CodeBehind="ASPP0001.aspx.cs" Inherits="MyMainApp.ASPP0001" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="CPHPrincipal">

    <form id="form1" runat="server" class="form-horizontal">
        <%--fin tab ENTREGABLE--%>
        <div class="text-center">
            <%--fin contenido tab--%>
            <asp:Label ID="LblTitulo" runat="server" Text="Registro Aspirante" Font-Bold="True" Font-Size="18pt"></asp:Label>
        </div>
        <%--fin container-fluid--%>
        
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div ALIGN="RIGHT">
            <asp:Button ID="BtnFicha" runat="server" Text="Ver Ficha" />
        </div>
        <div class="container-fluid">
            <div id="content">
                <asp:Panel ID="Panel1" runat="server" Width="100%">
                    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="6" BorderColor="#66CCFF" ScrollBars="Vertical" Height="375px" Width="100%">

                        <ajaxToolkit:TabPanel runat="server" HeaderText="DATOS GENERALES" ID="TabPanel1" Width="100%">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPDatoGeneral" runat="server"><triggers><asp:AsyncPostBackTrigger ControlID="BtnGuardarDatoGeneral" /></triggers><ContentTemplate><br /><div class="form-group"><asp:Label ID="Label37" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="ESTADO:"></asp:Label><div class="col-md-6"><asp:TextBox ID="TxtEstado" runat="server" class="form-control" ReadOnly="True"></asp:TextBox></div></div><div class="form-group"><asp:Label ID="Label1" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOMBRES:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtNombre" runat="server" class="form-control" ReadOnly="True"></asp:TextBox></div><asp:Label ID="Label3" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="APELLIDOS:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtApellido" runat="server" class="form-control" ReadOnly="True"></asp:TextBox></div></div><div class="form-group"><asp:Label ID="Label2" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="FECHA NACIMIENTO:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtFechNac" runat="server" class="form-control" ReadOnly="True"></asp:TextBox></div><asp:Label ID="Label5" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="EDAD:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtEdad" runat="server" class="form-control" ReadOnly="True"></asp:TextBox></div></div><div class="form-group"><asp:Label ID="Label4" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="TELÉFONO (CASA):"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtTelCasa" runat="server" AutoCompleteType="Disabled" class="form-control" onkeypress="return Documentos(event);" onPaste="return Documentos(event);"></asp:TextBox></div><asp:Label ID="Label41" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="TELÉFONO (CELULAR):"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtTelCel" runat="server" AutoCompleteType="Disabled" class="form-control" onkeydown="return Documentos(event);" onPaste="return Documentos(event);"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTelCel" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="DatoGeneral">Llenar Telefono Celular</asp:RequiredFieldValidator></div></div><div class="form-group"><asp:Label ID="Label6" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NIT:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtNit" runat="server" class="form-control" onkeypress="return Documentos(event);" onPaste="return Documentos(event);" ReadOnly="True"></asp:TextBox></div></div><div class="form-group"><asp:Label ID="Label29" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DUI:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtDui" runat="server" AutoCompleteType="Disabled" class="form-control" onkeypress="return Documentos(event);" onPaste="return Documentos(event);" TargetControlID="TxtDui"></asp:TextBox></div><asp:Label ID="Label30" runat="server" class="control-label  col-sm-3" Font-Bold="True" readonly="" Text="EMAIL:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtEmail" runat="server" AutoCompleteType="Disabled" class="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtEmail" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="DatoGeneral">Llenar email</asp:RequiredFieldValidator></div></div><div class="form-group"><asp:Label ID="Label7" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="SEXO:"></asp:Label><div class="col-md-3"><asp:RadioButtonList ID="RadioSexo" runat="server" RepeatDirection="Horizontal"><asp:ListItem Selected="True" Value="F">&#160;FEMENINO&#160;&#160;&#160;</asp:ListItem><asp:ListItem Value="M">&#160;MASCULINO</asp:ListItem>
                                    </asp:RadioButtonList></div><asp:Label ID="Label31" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="TIPO ASPIRANTE:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtTipoAspirante" runat="server" class="form-control" ReadOnly="True"></asp:TextBox></div></div><div class="form-group"><asp:Label ID="Label8" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="TRATAMIENTO:"></asp:Label><div class="col-md-3"><asp:DropDownList ID="CboTratamiento" runat="server" class="form-control" DataTextField="DS_TITULO" DataValueField="ID">
                                    </asp:DropDownList></div><asp:Label ID="Label26" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="DISCAPACIDAD 1:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtDiscapacidad1" runat="server" AutoCompleteType="Disabled" class="form-control" onkeypress="return soloLetras(event);" onPaste="return soloLetras(event);"></asp:TextBox></div></div><div class="form-group"><asp:Label ID="Label32" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DISCAPACIDAD 2:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtDiscapacidad2" runat="server" AutoCompleteType="Disabled" class="form-control" onkeypress="return soloLetras(event);" onPaste="return soloLetras(event);"></asp:TextBox></div><asp:Label ID="Label34" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="DISCAPACIDAD 3:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtDiscapacidad3" runat="server" AutoCompleteType="Disabled" class="form-control" onkeypress="return soloLetras(event);" onPaste="return soloLetras(event);"></asp:TextBox></div></div><div class="form-group"><asp:Label ID="Label38" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="PAIS:"></asp:Label><div class="col-md-3"><asp:DropDownList ID="CboPais" runat="server" AutoPostBack="True" class="form-control" DataTextField="DS_PAIS" DataValueField="ID" OnSelectedIndexChanged="CboPais_SelectedIndexChanged">
                                    </asp:DropDownList></div></div><div class="form-group"><asp:Label ID="Label17" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DEPARTAMENTO:"></asp:Label><div class="col-md-3"><asp:DropDownList ID="CboDepartamento" runat="server" AutoPostBack="True" class="form-control" DataTextField="DS_DEPARTAMENTO" DataValueField="ID" OnSelectedIndexChanged="CboDepartamento_SelectedIndexChanged">
                                        </asp:DropDownList></div><asp:Label ID="Label23" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="MUNICIPIO:"></asp:Label><div class="col-md-3"><asp:DropDownList ID="CboMunicipio" runat="server" class="form-control" DataTextField="DS_MUNICIPIO" DataValueField="ID">
                                            </asp:DropDownList></div></div><div class="form-group"><asp:Label ID="Label18" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DIRECCIÓN:"></asp:Label><div class="col-md-8"><asp:TextBox ID="TxtDireccion" runat="server" AutoCompleteType="Disabled" class="form-control" TextMode="MultiLine"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TxtDireccion" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="DatoGeneral">Llenar Direccion</asp:RequiredFieldValidator></div></div><div class="form-group"><asp:Label ID="Label45" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOTA QI:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtNotaQI" runat="server" class="form-control" ReadOnly="True"></asp:TextBox></div></div><div class="form-group"><asp:Label ID="Label46" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="OBSERVACIONES QI:"></asp:Label><div class="col-md-8"><asp:TextBox ID="TxtObservacionQI" runat="server" class="form-control" ReadOnly="True" TextMode="MultiLine"></asp:TextBox></div></div><asp:Panel ID="PanelRepresentante" runat="server" Visible="false"><div align="center"><asp:Label ID="LblTitulo0" runat="server" Font-Bold="True" Font-Size="14pt" Text="DATOS REPRESENTANTE LEGAL"></asp:Label></div><br /><div class="form-group"><asp:Label ID="Label15" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOMBRES:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtNombreR" runat="server" AutoCompleteType="Disabled" class="form-control" onkeypress="return soloLetras(event);" onPaste="return soloLetras(event);"></asp:TextBox></div><asp:Label ID="Label16" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="APELLIDOS:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TextApellidoR" runat="server" AutoCompleteType="Disabled" class="form-control" onkeypress="return soloLetras(event);" onPaste="return soloLetras(event);"></asp:TextBox></div></div><div class="form-group"><asp:Label ID="Label24" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="SEXO:"></asp:Label><div class="col-md-3"><asp:RadioButtonList ID="RadioSexoR" runat="server" RepeatDirection="Horizontal"><asp:ListItem Value="F">&#160;FEMENINO&#160;&#160;&#160;</asp:ListItem><asp:ListItem Value="M">&#160;MASCULINO</asp:ListItem>
                                    </asp:RadioButtonList></div><asp:Label ID="Label35" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="FECHA NACIMIENTO:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TextFechNacR" runat="server" class="form-control" TextMode="Date"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextFechNacR" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="DatoGeneral">Llene la fecha de nacimiento de representante</asp:RequiredFieldValidator></div></div><div class="form-group"><asp:Label ID="Label10" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DUI:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TextDuiR" runat="server" AutoCompleteType="Disabled" class="form-control" onkeydown="return Documentos(event);" onPaste="return Documentos(event);"></asp:TextBox></div><asp:Label ID="Label13" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NIT:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TextNitR" runat="server" AutoCompleteType="Disabled" class="form-control" onkeydown="return Documentos(event);" onPaste="return Documentos(event);"></asp:TextBox></div></div><div class="form-group"><asp:Label ID="Label11" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="EMAIL:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TextEmailR" runat="server" AutoCompleteType="Disabled" class="form-control" TextMode="Email"></asp:TextBox></div><asp:Label ID="Label14" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="TELÉFONO:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TextTelR" runat="server" AutoCompleteType="Disabled" class="form-control" onkeydown="return Documentos(event);" onPaste="return Documentos(event);"></asp:TextBox></div></div><div class="form-group"><asp:Label ID="Label25" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DIRECCIÓN:"></asp:Label><div class="col-md-8"><asp:TextBox ID="TextDireccionR" runat="server" AutoCompleteType="Disabled" class="form-control" TextMode="MultiLine"></asp:TextBox></div></div><div class="form-group"><asp:Label ID="Label36" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="TRATAMIENTO:"></asp:Label><div class="col-md-3"><asp:DropDownList ID="CboTratamientoRepresentante" runat="server" class="form-control" DataTextField="DS_TITULO" DataValueField="ID">
                                    </asp:DropDownList></div></div></asp:Panel><br /><div align="center"><asp:Button ID="BtnGuardarDatoGeneral" runat="server" class="btn btn-primary" OnClick="BtnGuardarDatoGeneral_Click" Text="GUARDAR" ValidationGroup="DatoGeneral" />&#160;</div><br />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            
</ContentTemplate>
                        
</ajaxToolkit:TabPanel>
                    <%--  </div>
                        <%--fin tab datos--%>
                    <%--<div class="tab-pane " id="Escol">--%>
                    <%--inicio tab informacion adicional--%>
                     <ajaxToolkit:TabPanel runat="server" HeaderText="ESCOLARIDAD" ID="TabPanel2">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPEscolaridad" runat="server"><triggers><asp:AsyncPostBackTrigger ControlID="BtnEscolaridadGuardar" /></triggers><ContentTemplate><br /><div class="form-group"><asp:Label ID="Label47" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="CATEGORIA ESCOLARIDAD:"></asp:Label><div class="col-md-3"><asp:DropDownList ID="CboCategoriaEscolaridad" runat="server" AutoPostBack="True" class="form-control" DataTextField="DS_ESCOLARIDAD" DataValueField="ID" OnSelectedIndexChanged="CboCategoriaEscolaridad_SelectedIndexChanged">
                                    </asp:DropDownList></div><asp:Label ID="Label19" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NIVEL EDUCATIVO:"></asp:Label><div class="col-md-3"><asp:DropDownList ID="CboNivelEducativo" runat="server" AutoPostBack="True" class="form-control" DataTextField="DS_ANIO" DataValueField="ID">
                                        </asp:DropDownList></div></div><div class="form-group"><asp:Label ID="Label28" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="OPCION ACADEMICA:"></asp:Label><div class="col-md-9"><asp:DropDownList ID="CboOpcionAcademica" runat="server" class="form-control" DataTextField="DS_CARRERA" DataValueField="ID">
                                        </asp:DropDownList></div></div><div class="form-group"><asp:Label ID="Label20" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="INSTITUCION EDUCATIVA:"></asp:Label><div class="col-md-3"><asp:DropDownList ID="CboInstitucion" runat="server" class="form-control" DataTextField="DS_CENTRO_ESCOLAR" DataValueField="ID">
                                        </asp:DropDownList></div><asp:Label ID="Label21" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="OTRA INSTITUCION:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtOtraInstitucion" runat="server" AutoCompleteType="Disabled" class="form-control"></asp:TextBox></div></div><div class="form-group"><asp:Label ID="Label27" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="PAIS:"></asp:Label><div class="col-md-3"><asp:DropDownList ID="CboPaisEscolaridad" runat="server" class="form-control" DataTextField="DS_PAIS" DataValueField="ID">
                                    </asp:DropDownList></div><asp:Label ID="Label39" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="AÑO DE FINALIZACION:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtAnioFin" runat="server" AutoCompleteType="Disabled" class="form-control" TextMode="Number"></asp:TextBox></div></div><div class="form-group"><asp:Label ID="Label44" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="PROMEDIO DE NOTAS:"></asp:Label><div class="col-md-3"><asp:TextBox ID="TxtNotas" runat="server" AutoCompleteType="Disabled" class="form-control" ControlToValidate="TxtNotas"></asp:TextBox></div></div><br /><div align="center"><asp:Button ID="BtnEscolaridadGuardar" runat="server" class="btn btn-primary" OnClick="BtnEscolaridadGuardar_Click" Text="GUARDAR" />&#160;<asp:Button ID="BtnEscolaridadCancelar" runat="server" CausesValidation="False" class="btn btn-primary" Text="CANCELAR" /></div><br /><asp:GridView ID="GVEscolaridad" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GVEscolaridad_RowDeleting" Width="100%"><AlternatingRowStyle BackColor="White" /><Columns><asp:TemplateField HeaderText="" Visible="False"><ItemTemplate><asp:TextBox ID="TxtIDEscolaridad" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:TextBox>
                                    </ItemTemplate>
                                    </asp:TemplateField><asp:BoundField DataField="DS_ESCOLARIDAD" HeaderText="ESCOLARIDAD" />
                                    <asp:BoundField DataField="DS_ANIO" HeaderText="NIVEL" />
                                    <asp:BoundField DataField="DS_CARRERA" HeaderText="OPCIÓN ACADÉMICA" /><asp:BoundField DataField="DS_CENTRO_ESCOLAR" HeaderText="INSTITUCIÓN EDUCATIVA" /><asp:BoundField DataField="DS_OTRA" HeaderText="OTRA INSTITUCIÓN" /><asp:BoundField DataField="DS_PAIS" HeaderText="PAÍS" /><asp:BoundField DataField="NM_ANIO_FIN" HeaderText="AÑO FIN" /><asp:BoundField DataField="NM_PROMEDIO_NOTA" HeaderText="PROMEDIO" /><asp:TemplateField HeaderText="Eliminar"><ItemTemplate><asp:Button ID="BtnEliminarEscolaridad" runat="server" CommandName="Delete" OnClientClick="return confirm('¿Desea eliminar este archivo?');" Text="Eliminar" />
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
                                    <sorteddescendingheaderstyle backcolor="#4870BE" />
                                    </asp:GridView><br />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            
</ContentTemplate>
            
</ajaxToolkit:TabPanel>
                    <%-- </div>--%>
                      <ajaxToolkit:TabPanel runat="server" HeaderText="HABILIDADES" ID="TabPanel3">
                            <ContentTemplate>
                                <div id="Habilidad" class="tab-pane">
                                    <asp:UpdatePanel ID="UPHabilidad" runat="server"><triggers><asp:AsyncPostBackTrigger ControlID="GVHabilidad" /></triggers><ContentTemplate><br /><div class="form-group"><asp:Label ID="Label9" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="CONOCIMIENTO EN:"></asp:Label><div class="col-md-3"><asp:DropDownList ID="CboCategoriaHabilidad" runat="server" AutoPostBack="True" class="form-control" DataTextField="DS_CATEGORIA_HABILIDAD" DataValueField="ID" OnSelectedIndexChanged="CboCategoriaHabilidad_SelectedIndexChanged">
                                        </asp:DropDownList></div><asp:Label ID="Label12" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="TIPO DE CONOCIMIENTO:"></asp:Label><div class="col-md-3"><asp:DropDownList ID="CboConocimiento" runat="server" class="form-control" DataTextField="DS_HABILIDAD_CONOCIMIENTO" DataValueField="ID">
                                            </asp:DropDownList></div></div><div class="form-group"><asp:Label ID="Label33" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NIVEL:"></asp:Label><div class="col-md-3"><asp:DropDownList ID="CboNivel" runat="server" class="form-control" DataTextField="DS_NIVEL_CONOCIMIENTO" DataValueField="ID">
                                            </asp:DropDownList></div></div><div align="center"><asp:Button ID="BtnGuardarHabilidad" runat="server" class="btn btn-primary" OnClick="BtnGuardarHabilidad_Click" Text="GUARDAR" />&#160;<asp:Button ID="BtnCancelarHabilidad" runat="server" CausesValidation="False" class="btn btn-primary" Text="CANCELAR" /></div><br /><asp:GridView ID="GVHabilidad" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GVHabilidad_RowDeleting" Width="100%"><AlternatingRowStyle BackColor="White" /><Columns><asp:TemplateField HeaderText="" Visible="false"><ItemTemplate><asp:TextBox ID="TxtIDHabilidad" runat="server" Text='<%#Eval("ID")%>' Visible="False"></asp:TextBox>
                                        </ItemTemplate>
                                        </asp:TemplateField><asp:BoundField DataField="DS_CATEGORIA_HABILIDAD" HeaderText="CONOCIMIENTO" /><asp:BoundField DataField="DS_HABILIDAD_CONOCIMIENTO" HeaderText="TIPO DE CONOCIMIENTO" /><asp:BoundField DataField="DS_NIVEL_CONOCIMIENTO" HeaderText="NIVEL" /><asp:TemplateField HeaderText="Eliminar"><ItemTemplate><asp:Button ID="BtnEliminarConocimiento" runat="server" CommandName="Delete" OnClientClick="return confirm('¿Desea eliminar este archivo?');" Text="Eliminar" />
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
                                        <sorteddescendingheaderstyle backcolor="#4870BE" />
                                        </asp:GridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            
</ContentTemplate>
            
</ajaxToolkit:TabPanel>
                    <%--fin tab habilidades--%>
                    <%--<div class="tab-pane" id="Destre">--%>
                    <%--inicio tab destrezas--%>
                      <ajaxToolkit:TabPanel runat="server" HeaderText="DESTREZAS" ID="TabPanel4">
                           <ContentTemplate>
                               <asp:UpdatePanel ID="UPDestreza" runat="server">
                                   <triggers>
                                       <asp:AsyncPostBackTrigger ControlID="BtnGuardarDestreza" />
                                   </triggers>
                                   <ContentTemplate><br />
                                       <div class="form-group">
                                           <asp:Label ID="Label42" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DESTREZA:"></asp:Label>
                                           <div class="col-md-3">
                                               <asp:DropDownList ID="CboDestreza" runat="server" class="form-control" DataTextField="DS_DESTREZA" DataValueField="ID">
                                   </asp:DropDownList>
                                           </div>
                                       </div>
                                       <div align="center">
                                           <asp:Button ID="BtnGuardarDestreza" runat="server" class="btn btn-primary" OnClick="BtnGuardarDestreza_Click" Text="GUARDAR" />&#160;<asp:Button ID="BtnCancelarDestreza" runat="server" CausesValidation="False" class="btn btn-primary" Text="CANCELAR" /></div><br />
                                   <asp:GridView ID="GVDestreza" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GVDestreza_RowDeleting" Width="100%"><AlternatingRowStyle BackColor="White" />
                                       <Columns>
                                           <asp:TemplateField HeaderText="" Visible="false">
                                   <ItemTemplate><asp:TextBox ID="TxtIDDestreza" runat="server" Text='<%#Eval("ID")%>' Visible="False"></asp:TextBox>
                                   </ItemTemplate>
                                   </asp:TemplateField><asp:BoundField DataField="DS_DESTREZA" HeaderText="DESTREZA" /><asp:TemplateField HeaderText="Eliminar"><ItemTemplate><asp:Button ID="BtnEliminarDestreza" runat="server" CommandName="Delete" OnClientClick="return confirm('¿Desea eliminar este archivo?');" Text="Eliminar" />
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
                                   <sorteddescendingheaderstyle backcolor="#4870BE" />
                                   </asp:GridView>
                                   </ContentTemplate>
                               </asp:UpdatePanel>
                           
</ContentTemplate>
            
</ajaxToolkit:TabPanel>
                    <%--fin tab habilidades--%>
                    <%--<div class="tab-pane" id="Destre">--%>
                    <%--<div class="tab-pane" id="Doc">
                            <%--inicio tab DOCUMENTOS--%>
                     <ajaxToolkit:TabPanel runat="server" HeaderText="DOCUMENTOS" ID="TabPanel5">
                            <ContentTemplate>
                                <asp:Panel ID="Panel5" runat="server"><br /><asp:UpdatePanel ID="UPDocumento" runat="server" UpdateMode="Conditional"><triggers><asp:AsyncPostBackTrigger ControlID="BtnGuardarDocumento" /></triggers>
                                    <ContentTemplate><div class="form-group"><asp:Label ID="Label43" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="TIPO DOCUMENTO:"></asp:Label><div class="col-md-3"><asp:DropDownList ID="CboTipoDocumento" runat="server" class="form-control" DataTextField="DS_TIPO_DOCUMENTO" DataValueField="ID">
                                    </asp:DropDownList></div><div class="form-group"><asp:Label ID="Label22" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="ADJUNTAR DOCUMENTOS:"></asp:Label><div class="col-md-3"><ajaxToolkit:AsyncFileUpload ID="FileDocumento" runat="server" FailedValidation="False" OnUploadedComplete="FileDocumento_UploadedComplete" PersistFile="True" /></div></div></div><div class="form-group"><asp:Label ID="Label40" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DESCRIPCION:"></asp:Label><div class="col-md-8"><asp:TextBox ID="TxtDescripcionDocumento" runat="server" AutoCompleteType="Disabled" class="form-control" TextMode="MultiLine"></asp:TextBox></div></div><div align="center"><asp:Button ID="BtnGuardarDocumento" runat="server" class="btn btn-primary" OnClick="BtnGuardarDocumento_Click" Text="GUARDAR" />&#160;<asp:Button ID="BtnCancelarDocumento" runat="server" CausesValidation="False" class="btn btn-primary" Text="CANCELAR" /></div><br /><asp:GridView ID="GVDocumento" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GVDocumento_RowDeleting" Width="100%"><AlternatingRowStyle BackColor="White" /><Columns><asp:TemplateField HeaderText="" Visible="false"><ItemTemplate><asp:TextBox ID="TxtIDDocumento" runat="server" Text='<%#Eval("ID")%>' Visible="False"></asp:TextBox>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                        <asp:BoundField DataField="DS_TIPO_DOCUMENTO" HeaderText="TIPO DOCUMENTO" />
                                        <asp:BoundField DataField="DS_DOCUMENTO" HeaderText="DESCRIPCION" />
                                        <asp:BoundField DataField="FECH_CREA" HeaderText="FECHA" />
                                    <asp:TemplateField HeaderText="Descargar">
                                            <ItemTemplate>
                                                <a href='<%# "http://"+Request.Url.Authority +"/ASP/Documentos/"+Eval("URL_DOCUMENTO") %>' target="_blank">Descargar</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Eliminar">
                                            <ItemTemplate>
                                                <asp:Button ID="BtnEliminarDocumento" runat="server" CommandName="Delete" OnClientClick="return confirm('¿Desea eliminar este archivo?');" Text="Eliminar" />
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
                                    <sorteddescendingheaderstyle backcolor="#4870BE" />
                                    </asp:GridView>
                                    </ContentTemplate>
                                    </asp:UpdatePanel></asp:Panel>


                            
</ContentTemplate>
            
</ajaxToolkit:TabPanel>
                    <%--inicio tab ENTREGABLE--%>
                        
                      <ajaxToolkit:TabPanel runat="server" HeaderText="ENTREGABLE" ID="TabPanel7">
                           <ContentTemplate>
                               <asp:UpdatePanel ID="UUPEntregable" runat="server"><ContentTemplate>
                               <asp:Panel ID="PanelListaEntregable" runat="server"><br />                                   
                                       
                                           <asp:TextBox ID="TxtIdEntregable" runat="server" Text="0" Visible="False"></asp:TextBox>
                                           <asp:TextBox ID="TxtIdConsultoria" runat="server" Text="0" Visible="False"></asp:TextBox>
                                           <asp:TextBox ID="TxtNombreConsultoria" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <asp:GridView ID="GVEntregable" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GVEntregable_SelectedIndexChanged">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="TxtIdEntregableGV" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="ID" DataField="ID" />
                                                <asp:BoundField HeaderText="NOMBRE CONSULTORIA" DataField="DS_NOMBRE_CONSULTORIA" />
                                                <asp:BoundField HeaderText="NOMBRE DE PROYECTO" DataField="DS_ENTREGABLE" />
                                                <asp:BoundField HeaderText="FECHA DE ENTREGA" DataField="FECH_ENTREGA_ENT" />
                                                <asp:BoundField HeaderText="TIEMPO DE DESARROLLO " DataField="DS_DURACION_ENT" />
                                                <asp:TemplateField HeaderText="ENTREGABLES">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BtnVerEntregable" runat="server" CommandName="Select"
                                                            Text="Ver Entregables"  />
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
                               <asp:Panel ID="PanelEntregable" runat="server" Visible="False">
                                   <br />
                                          <div align="center">
                                                <asp:Label ID="Label63" runat="server" Text="Entregables" Font-Size="14pt"></asp:Label></div>
                                          <div class="form-group">
                                                <asp:Label ID="Label64" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE ENTREGABLE:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox ID="TxtNombreEntregable" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label65" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="DURACION EN DIAS:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtDuracionEntregable" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label66" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="FECHA DE ENTREGA:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtFechaEntregaEntregable" runat="server" class="form-control"  Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label67" runat="server" Font-Bold="True" Text="DESCRIPCION:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtDescripcion" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label50" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="ESTADO ENTREGABLE:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtEstadoEntregable" runat="server" class="form-control"  Enabled="False" Width="100%"></asp:TextBox>
                                                </div>  
                                            </div> 
                                            <div class="form-group">                                                
                                                <asp:Label ID="Label48" runat="server" class="control-label col-sm-3" Font-Bold="True" Text="ADJUNTAR ENTREGABLE:"></asp:Label>
                                                <div class="col-md-9">
                                                    <ajaxToolkit:AsyncFileUpload ID="FileEntregable" runat="server" FailedValidation="False" OnUploadedComplete="FileEntregable_UploadedComplete" PersistFile="True" />
                                                </div>                                                
                                            </div>                                             
                                            <br />
                                            <div align="center">
                                                <asp:Button ID="btnGuardarEntregable" runat="server" class="btn btn-primary" Text="GUARDAR" OnClick="BtnGuardarEntregableConsultoria_Click"/>
                                                &nbsp;<asp:Button ID="btnAtrasEnt" runat="server" Text="ATRAS" class="btn btn-primary" CausesValidation="False"/>
                                            </div>
                                            <br />
                                            <asp:GridView ID="GVEntregableAspirante" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="NOMBRE DE ENTREGABLE" DataField="DS_ENTREGABLE" />
                                                    <asp:BoundField HeaderText="FECHA DE ENTREGA" DataField="FECH_ENTREGA_ENT" />
                                                    <asp:BoundField HeaderText="DESCRIPCIÓN" DataField="DS_DESCRIPCION_ENT" />
                                                    <asp:TemplateField HeaderText="Descargar">
                                                        <ItemTemplate>
                                                            <a href='<%# "http://"+Request.Url.Authority +"/ASP/Entregables/"+Eval("DS_NOMBRE_CONSULTORIA")+"/"+Eval("URL_ENTREGABLE") %>' target="_blank">Descargar</a>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Eliminar">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BtnEliminarEntregable" runat="server" CommandName="Delete" OnClientClick="return confirm('¿Desea eliminar este archivo?');" Text="Eliminar" />
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
                                    </asp:Panel>
                            
</ContentTemplate>
</asp:UpdatePanel>

                 
</ContentTemplate>
            
</ajaxToolkit:TabPanel>
                    <%--</div>--%>
                    <%--fin tab ENTREGABLE--%>


               <%--inicio tab PASANTIA  --%>
                      <ajaxToolkit:TabPanel runat="server" HeaderText="ACTIVIDAD PASANTIA" ID="TabPanel6">
                           <ContentTemplate>
                               <asp:UpdatePanel ID="UPACTPAS" runat="server"><ContentTemplate>
                               <asp:Panel ID="PanelListaPasantia" runat="server"><br />                                   
                                       
                                           <asp:TextBox ID="TxtIdActividadAspirante" runat="server" Text="0" Visible="False"></asp:TextBox>
                                           <asp:TextBox ID="TxtIdAspirante" runat="server" Text="0" Visible="False"></asp:TextBox>
                                           <asp:TextBox ID="TxtIdPasantiaActividad" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <asp:GridView ID="GVListaPasantia" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GVEntregable_SelectedIndexChanged">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="TxtIdEntregableGV" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="ID" DataField="ID" />
                                                <asp:BoundField HeaderText="NOMBRE PASANTIA" DataField="NOMBRE_PASANTIA" />
                                                <asp:BoundField HeaderText="ACTIVIDAD PASANTIA" DataField="DS_ACTIVIDAD" />
                                                <asp:BoundField HeaderText="DESCRIPCION ACTIVIDAD" DataField="DS_DESCRIPCION_ACT" />
                                                <asp:BoundField HeaderText="TIEMPO DE DESARROLLO" DataField="DS_DURACION_ACT" />
                                                <asp:BoundField HeaderText="FECHA DE ENTREGA" DataField="FECH_ENTREGA_ACT" />
                                                <asp:TemplateField HeaderText="ENTREGABLES">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BtnVerEntregable" runat="server" CommandName="Select"
                                                            Text="Ver Entregables"  />
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
                               <asp:Panel ID="Panel3" runat="server" Visible="False">
                                   <br />
                                          <div align="center">
                                                <asp:Label ID="Label49" runat="server" Text="Entregables" Font-Size="14pt"></asp:Label></div>
                                          <div class="form-group">
                                                <asp:Label ID="Label51" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE ACTIVIDAD:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox ID="TxtNombrePasantia" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label52" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="DURACION EN DIAS:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtDuracionActividad" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label53" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="FECHA DE ENTREGA:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtFechaEntrega" runat="server" class="form-control"  Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label54" runat="server" Font-Bold="True" Text="COMENTARIO:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtComentario" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Enabled="True" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label55" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="ESTADO ACTIVIDAD:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtEstadoActividad" runat="server" class="form-control"  Enabled="False" Width="100%"></asp:TextBox>
                                                </div>  
                                            </div> 
                                            <div class="form-group">                                                
                                                <asp:Label ID="Label56" runat="server" class="control-label col-sm-3" Font-Bold="True" Text="ADJUNTAR ENTREGABLE:"></asp:Label>
                                                <div class="col-md-9">
                                                    <ajaxToolkit:AsyncFileUpload ID="AsyncFileUpload1" runat="server" FailedValidation="False" OnUploadedComplete="FileEntregable_UploadedComplete" PersistFile="True" />
                                                </div>                                                
                                            </div>                                             
                                            <br />
                                            <div align="center">
                                                <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="GUARDAR" OnClick="BtnGuardarEntregableConsultoria_Click"/>
                                                &nbsp;<asp:Button ID="Button2" runat="server" Text="ATRAS" class="btn btn-primary" CausesValidation="False"/>
                                            </div>
                                            <br />
                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="NOMBRE DE ENTREGABLE" DataField="DS_ENTREGABLE" />
                                                    <asp:BoundField HeaderText="FECHA DE ENTREGA" DataField="FECH_ENTREGA_ENT" />
                                                    <asp:BoundField HeaderText="DESCRIPCIÓN" DataField="DS_DESCRIPCION_ENT" />
                                                    <asp:TemplateField HeaderText="Descargar">
                                                        <ItemTemplate>
                                                            <a href='<%# "http://"+Request.Url.Authority +"/ASP/Entregables/"+Eval("DS_NOMBRE_CONSULTORIA")+"/"+Eval("URL_ENTREGABLE") %>' target="_blank">Descargar</a>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Eliminar">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BtnEliminarEntregable" runat="server" CommandName="Delete" OnClientClick="return confirm('¿Desea eliminar este archivo?');" Text="Eliminar" />
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
                                    </asp:Panel>
                            
</ContentTemplate>
</asp:UpdatePanel>
                           </ContentTemplate>
                      </ajaxToolkit:TabPanel>
                    <%--</div>--%>
                    <%--fin tab ENTREGABLE--%>
                    </ajaxToolkit:TabContainer>
                    </asp:Panel>
            </div>
            <%--fin formulario--%>
        </div>
        
            <%--fin container-fluid--%>
         <asp:Panel ID="PanelFicha" runat="server" CssClass="modalPopup"  Height="527px">
        <br /><center>
        <rsweb:ReportViewer ID="RVFichaAspirante" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="427px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="75%" style="margin-right: 0px"><LocalReport ReportPath="ASP\RptFichaAspirante.rdlc"></LocalReport></rsweb:ReportViewer></center>
       <div align="center">
           <br /><asp:Button ID="BtnCerrarFicha" runat="server" Text="Cerrar" /></div>
             </asp:Panel>
          <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="PanelFicha" BackgroundCssClass="modalBackround" TargetControlID="BtnFicha" CancelControlID="BtnCerrarFicha"></ajaxToolkit:ModalPopupExtender>
 
    </form>
    <%--fin formulario--%>
</asp:Content>




