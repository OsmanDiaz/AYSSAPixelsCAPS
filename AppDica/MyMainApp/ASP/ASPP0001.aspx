﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterInicio.Master" AutoEventWireup="true" CodeBehind="ASPP0001.aspx.cs" Inherits="MyMainApp.ASPP0001" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="CPHPrincipal">

    <form id="form1" runat="server" class="form-horizontal">
        <div class="text-center">
            <asp:Label ID="LblTitulo" runat="server" Text="Registro Aspirante" Font-Bold="True" Font-Size="18pt"></asp:Label>
        </div>
        <%--</div>--%>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div align="RIGHT">
            <asp:Button ID="BtnFicha" runat="server" Text="Ver Ficha" />
        </div>
        <div class="container-fluid">
            <div id="content">
                <asp:Panel ID="Panel1" runat="server" Width="100%">
                    <ajaxToolkit:TabContainer ID="TabAspirante" runat="server" ActiveTabIndex="10" BorderColor="#66CCFF" ScrollBars="Vertical" Height="375px" Width="100%">

                        <ajaxToolkit:TabPanel runat="server" HeaderText="DATOS GENERALES" ID="TabDatoGeneral" Width="100%">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPDatoGeneral" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnGuardarDatoGeneral" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <br />
                                        <div class="form-group">
                                            <asp:Label ID="Label37" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="ESTADO:"></asp:Label><div class="col-md-6">
                                                <asp:TextBox ID="TxtEstado" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label1" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOMBRES:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtNombre" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label3" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="APELLIDOS:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtApellido" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label2" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="FECHA NACIMIENTO:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtFechNac" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label5" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="EDAD:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtEdad" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label4" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="TELÉFONO (CASA):"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtTelCasa" runat="server" AutoCompleteType="Disabled" class="form-control" onkeypress="return Documentos(event);" onPaste="return Documentos(event);"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label41" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="TELÉFONO (CELULAR):"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtTelCel" runat="server" AutoCompleteType="Disabled" class="form-control" onkeydown="return Documentos(event);" onPaste="return Documentos(event);"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTelCel" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="DatoGeneral">Llenar Telefono Celular</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label6" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NIT:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtNit" runat="server" class="form-control" onkeypress="return Documentos(event);" onPaste="return Documentos(event);" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label29" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DUI:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtDui" runat="server" AutoCompleteType="Disabled" class="form-control" onkeypress="return Documentos(event);" onPaste="return Documentos(event);" TargetControlID="TxtDui"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label30" runat="server" class="control-label  col-sm-3" Font-Bold="True" readonly="" Text="EMAIL:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtEmail" runat="server" AutoCompleteType="Disabled" class="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtEmail" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="DatoGeneral">Llenar email</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label7" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="SEXO:"></asp:Label><div class="col-md-3">
                                                <asp:RadioButtonList ID="RadioSexo" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True" Value="F">&#160;FEMENINO&#160;&#160;&#160;</asp:ListItem>
                                                    <asp:ListItem Value="M">&#160;MASCULINO</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                            <asp:Label ID="Label31" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="TIPO ASPIRANTE:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtTipoAspirante" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label8" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="TRATAMIENTO:"></asp:Label><div class="col-md-3">
                                                <asp:DropDownList ID="CboTratamiento" runat="server" class="form-control" DataTextField="DS_TITULO" DataValueField="ID">
                                                </asp:DropDownList>
                                            </div>
                                            <asp:Label ID="Label26" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="DISCAPACIDAD 1:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtDiscapacidad1" runat="server" AutoCompleteType="Disabled" class="form-control" onkeypress="return soloLetras(event);" onPaste="return soloLetras(event);"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label32" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DISCAPACIDAD 2:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtDiscapacidad2" runat="server" AutoCompleteType="Disabled" class="form-control" onkeypress="return soloLetras(event);" onPaste="return soloLetras(event);"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label34" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="DISCAPACIDAD 3:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtDiscapacidad3" runat="server" AutoCompleteType="Disabled" class="form-control" onkeypress="return soloLetras(event);" onPaste="return soloLetras(event);"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label38" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="PAIS:"></asp:Label><div class="col-md-3">
                                                <asp:DropDownList ID="CboPais" runat="server" AutoPostBack="True" class="form-control" DataTextField="DS_PAIS" DataValueField="ID" OnSelectedIndexChanged="CboPais_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label17" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DEPARTAMENTO:"></asp:Label><div class="col-md-3">
                                                <asp:DropDownList ID="CboDepartamento" runat="server" AutoPostBack="True" class="form-control" DataTextField="DS_DEPARTAMENTO" DataValueField="ID" OnSelectedIndexChanged="CboDepartamento_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                            <asp:Label ID="Label23" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="MUNICIPIO:"></asp:Label><div class="col-md-3">
                                                <asp:DropDownList ID="CboMunicipio" runat="server" class="form-control" DataTextField="DS_MUNICIPIO" DataValueField="ID">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label18" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DIRECCIÓN:"></asp:Label><div class="col-md-8">
                                                <asp:TextBox ID="TxtDireccion" runat="server" AutoCompleteType="Disabled" class="form-control" TextMode="MultiLine"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TxtDireccion" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="DatoGeneral">Llenar Direccion</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label45" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOTA QI:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtNotaQI" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label46" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="OBSERVACIONES QI:"></asp:Label><div class="col-md-8">
                                                <asp:TextBox ID="TxtObservacionQI" runat="server" class="form-control" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                        <asp:Panel ID="PanelRepresentante" runat="server" Visible="false">
                                            <div align="center">
                                                <asp:Label ID="LblTitulo0" runat="server" Font-Bold="True" Font-Size="14pt" Text="DATOS REPRESENTANTE LEGAL"></asp:Label>
                                            </div>
                                            <br />
                                            <div class="form-group">
                                                <asp:Label ID="Label15" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOMBRES:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TxtNombreR" runat="server" AutoCompleteType="Disabled" class="form-control" onkeypress="return soloLetras(event);" onPaste="return soloLetras(event);"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label16" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="APELLIDOS:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TextApellidoR" runat="server" AutoCompleteType="Disabled" class="form-control" onkeypress="return soloLetras(event);" onPaste="return soloLetras(event);"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label24" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="SEXO:"></asp:Label><div class="col-md-3">
                                                    <asp:RadioButtonList ID="RadioSexoR" runat="server" RepeatDirection="Horizontal">
                                                        <asp:ListItem Value="F">&#160;FEMENINO&#160;&#160;&#160;</asp:ListItem>
                                                        <asp:ListItem Value="M">&#160;MASCULINO</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>
                                                <asp:Label ID="Label35" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="FECHA NACIMIENTO:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TextFechNacR" runat="server" class="form-control" TextMode="Date"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextFechNacR" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="DatoGeneral">Llene la fecha de nacimiento de representante</asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label10" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DUI:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TextDuiR" runat="server" AutoCompleteType="Disabled" class="form-control" onkeydown="return Documentos(event);" onPaste="return Documentos(event);"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label13" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NIT:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TextNitR" runat="server" AutoCompleteType="Disabled" class="form-control" onkeydown="return Documentos(event);" onPaste="return Documentos(event);"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label11" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="EMAIL:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TextEmailR" runat="server" AutoCompleteType="Disabled" class="form-control" TextMode="Email"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label14" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="TELÉFONO:"></asp:Label><div class="col-md-3">
                                                    <asp:TextBox ID="TextTelR" runat="server" AutoCompleteType="Disabled" class="form-control" onkeydown="return Documentos(event);" onPaste="return Documentos(event);"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label25" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DIRECCIÓN:"></asp:Label><div class="col-md-8">
                                                    <asp:TextBox ID="TextDireccionR" runat="server" AutoCompleteType="Disabled" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label36" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="TRATAMIENTO:"></asp:Label><div class="col-md-3">
                                                    <asp:DropDownList ID="CboTratamientoRepresentante" runat="server" class="form-control" DataTextField="DS_TITULO" DataValueField="ID">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <br />
                                        <div align="center">
                                            <asp:Button ID="BtnGuardarDatoGeneral" runat="server" class="btn btn-primary" OnClick="BtnGuardarDatoGeneral_Click" Text="GUARDAR" ValidationGroup="DatoGeneral" />&#160;
                                        </div>
                                        <br />
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </ContentTemplate>

                        </ajaxToolkit:TabPanel>
                        <ajaxToolkit:TabPanel runat="server" HeaderText="ESCOLARIDAD" ID="TabPanel2">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPEscolaridad" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnEscolaridadGuardar" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <br />
                                        <div class="form-group">
                                            <asp:Label ID="Label47" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="CATEGORIA ESCOLARIDAD:"></asp:Label><div class="col-md-3">
                                                <asp:DropDownList ID="CboCategoriaEscolaridad" runat="server" AutoPostBack="True" class="form-control" DataTextField="DS_ESCOLARIDAD" DataValueField="ID" OnSelectedIndexChanged="CboCategoriaEscolaridad_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                            <asp:Label ID="Label19" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NIVEL EDUCATIVO:"></asp:Label><div class="col-md-3">
                                                <asp:DropDownList ID="CboNivelEducativo" runat="server" AutoPostBack="True" class="form-control" DataTextField="DS_ANIO" DataValueField="ID">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label28" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="OPCION ACADEMICA:"></asp:Label><div class="col-md-9">
                                                <asp:DropDownList ID="CboOpcionAcademica" runat="server" class="form-control" DataTextField="DS_CARRERA" DataValueField="ID">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label20" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="INSTITUCION EDUCATIVA:"></asp:Label><div class="col-md-3">
                                                <asp:DropDownList ID="CboInstitucion" runat="server" class="form-control" DataTextField="DS_CENTRO_ESCOLAR" DataValueField="ID">
                                                </asp:DropDownList>
                                            </div>
                                            <asp:Label ID="Label21" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="OTRA INSTITUCION:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtOtraInstitucion" runat="server" AutoCompleteType="Disabled" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label27" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="PAIS:"></asp:Label><div class="col-md-3">
                                                <asp:DropDownList ID="CboPaisEscolaridad" runat="server" class="form-control" DataTextField="DS_PAIS" DataValueField="ID">
                                                </asp:DropDownList>
                                            </div>
                                            <asp:Label ID="Label39" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="AÑO DE FINALIZACION:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtAnioFin" runat="server" AutoCompleteType="Disabled" class="form-control" TextMode="Number"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label44" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="PROMEDIO DE NOTAS:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtNotas" runat="server" AutoCompleteType="Disabled" class="form-control" ControlToValidate="TxtNotas"></asp:TextBox>
                                            </div>
                                        </div>
                                        <br />
                                        <div align="center">
                                            <asp:Button ID="BtnEscolaridadGuardar" runat="server" class="btn btn-primary" OnClick="BtnEscolaridadGuardar_Click" Text="GUARDAR" />&#160;<asp:Button ID="BtnEscolaridadCancelar" runat="server" CausesValidation="False" class="btn btn-primary" Text="CANCELAR" />
                                        </div>
                                        <br />
                                        <asp:GridView ID="GVEscolaridad" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GVEscolaridad_RowDeleting" Width="100%">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="TxtIDEscolaridad" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="DS_ESCOLARIDAD" HeaderText="ESCOLARIDAD" />
                                                <asp:BoundField DataField="DS_ANIO" HeaderText="NIVEL" />
                                                <asp:BoundField DataField="DS_CARRERA" HeaderText="OPCIÓN ACADÉMICA" />
                                                <asp:BoundField DataField="DS_CENTRO_ESCOLAR" HeaderText="INSTITUCIÓN EDUCATIVA" />
                                                <asp:BoundField DataField="DS_OTRA" HeaderText="OTRA INSTITUCIÓN" />
                                                <asp:BoundField DataField="DS_PAIS" HeaderText="PAÍS" />
                                                <asp:BoundField DataField="NM_ANIO_FIN" HeaderText="AÑO FIN" />
                                                <asp:BoundField DataField="NM_PROMEDIO_NOTA" HeaderText="PROMEDIO" />
                                                <asp:TemplateField HeaderText="Eliminar">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BtnEliminarEscolaridad" runat="server" CommandName="Delete" OnClientClick="return confirm('¿Desea eliminar este archivo?');" Text="Eliminar" />
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
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </ContentTemplate>

                        </ajaxToolkit:TabPanel>
                        <ajaxToolkit:TabPanel runat="server" HeaderText="HABILIDADES" ID="TabPanel3">
                            <ContentTemplate>
                                <div id="Habilidad" class="tab-pane">
                                    <asp:UpdatePanel ID="UPHabilidad" runat="server">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="GVHabilidad" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <br />
                                            <div class="form-group">
                                                <asp:Label ID="Label9" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="CONOCIMIENTO EN:"></asp:Label><div class="col-md-3">
                                                    <asp:DropDownList ID="CboCategoriaHabilidad" runat="server" AutoPostBack="True" class="form-control" DataTextField="DS_CATEGORIA_HABILIDAD" DataValueField="ID" OnSelectedIndexChanged="CboCategoriaHabilidad_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </div>
                                                <asp:Label ID="Label12" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="TIPO DE CONOCIMIENTO:"></asp:Label><div class="col-md-3">
                                                    <asp:DropDownList ID="CboConocimiento" runat="server" class="form-control" DataTextField="DS_HABILIDAD_CONOCIMIENTO" DataValueField="ID">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label33" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NIVEL:"></asp:Label><div class="col-md-3">
                                                    <asp:DropDownList ID="CboNivel" runat="server" class="form-control" DataTextField="DS_NIVEL_CONOCIMIENTO" DataValueField="ID">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div align="center">
                                                <asp:Button ID="BtnGuardarHabilidad" runat="server" class="btn btn-primary" OnClick="BtnGuardarHabilidad_Click" Text="GUARDAR" />&#160;<asp:Button ID="BtnCancelarHabilidad" runat="server" CausesValidation="False" class="btn btn-primary" Text="CANCELAR" />
                                            </div>
                                            <br />
                                            <asp:GridView ID="GVHabilidad" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GVHabilidad_RowDeleting" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TxtIDHabilidad" runat="server" Text='<%#Eval("ID")%>' Visible="False"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="DS_CATEGORIA_HABILIDAD" HeaderText="CONOCIMIENTO" />
                                                    <asp:BoundField DataField="DS_HABILIDAD_CONOCIMIENTO" HeaderText="TIPO DE CONOCIMIENTO" />
                                                    <asp:BoundField DataField="DS_NIVEL_CONOCIMIENTO" HeaderText="NIVEL" />
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
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                            </ContentTemplate>

                        </ajaxToolkit:TabPanel>
                        <ajaxToolkit:TabPanel runat="server" HeaderText="DESTREZAS" ID="TabPanel4">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPDestreza" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnGuardarDestreza" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <br />
                                        <div class="form-group">
                                            <asp:Label ID="Label42" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DESTREZA:"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:DropDownList ID="CboDestreza" runat="server" class="form-control" DataTextField="DS_DESTREZA" DataValueField="ID">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div align="center">
                                            <asp:Button ID="BtnGuardarDestreza" runat="server" class="btn btn-primary" OnClick="BtnGuardarDestreza_Click" Text="GUARDAR" />&#160;<asp:Button ID="BtnCancelarDestreza" runat="server" CausesValidation="False" class="btn btn-primary" Text="CANCELAR" />
                                        </div>
                                        <br />
                                        <asp:GridView ID="GVDestreza" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GVDestreza_RowDeleting" Width="100%">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="TxtIDDestreza" runat="server" Text='<%#Eval("ID")%>' Visible="False"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="DS_DESTREZA" HeaderText="DESTREZA" />
                                                <asp:TemplateField HeaderText="Eliminar">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BtnEliminarDestreza" runat="server" CommandName="Delete" OnClientClick="return confirm('¿Desea eliminar este archivo?');" Text="Eliminar" />
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
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </ContentTemplate>

                        </ajaxToolkit:TabPanel>
                        <ajaxToolkit:TabPanel runat="server" HeaderText="DOCUMENTOS" ID="TabPanel5">
                            <ContentTemplate>
                                <asp:Panel ID="Panel5" runat="server">
                                    <br />
                                    <asp:UpdatePanel ID="UPDocumento" runat="server" UpdateMode="Conditional">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnGuardarDocumento" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <div class="form-group">
                                                <asp:Label ID="Label43" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="TIPO DOCUMENTO:"></asp:Label><div class="col-md-3">
                                                    <asp:DropDownList ID="CboTipoDocumento" runat="server" class="form-control" DataTextField="DS_TIPO_DOCUMENTO" DataValueField="ID">
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="Label22" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="ADJUNTAR DOCUMENTOS:"></asp:Label><div class="col-md-3">
                                                        <ajaxToolkit:AsyncFileUpload ID="FileDocumento" runat="server" FailedValidation="False" OnUploadedComplete="FileDocumento_UploadedComplete" PersistFile="True" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label40" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DESCRIPCION:"></asp:Label><div class="col-md-8">
                                                    <asp:TextBox ID="TxtDescripcionDocumento" runat="server" AutoCompleteType="Disabled" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div align="center">
                                                <asp:Button ID="BtnGuardarDocumento" runat="server" class="btn btn-primary" OnClick="BtnGuardarDocumento_Click" Text="GUARDAR" />&#160;<asp:Button ID="BtnCancelarDocumento" runat="server" CausesValidation="False" class="btn btn-primary" Text="CANCELAR" />
                                            </div>
                                            <br />
                                            <asp:GridView ID="GVDocumento" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GVDocumento_RowDeleting" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TxtIDDocumento" runat="server" Text='<%#Eval("ID")%>' Visible="False"></asp:TextBox>
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
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            </asp:GridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>



                            </ContentTemplate>

                        </ajaxToolkit:TabPanel>

                        <ajaxToolkit:TabPanel runat="server" HeaderText="ENTREGABLE" ID="TabPanel7">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UUPEntregable" runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="PanelListaEntregable" runat="server">
                                            <br />

                                            <asp:TextBox ID="TxtIdEntregable" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <asp:TextBox ID="TxtIdConsultoria" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <asp:TextBox ID="TxtNombreConsultoria" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <asp:GridView ID="GVEntregable" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GVEntregable_SelectedIndexChanged" DataKeyNames="ID">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TxtIdEntregableGV" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="NOMBRE DE PROYECTO" DataField="DS_NOMBRE_CONSULTORIA">
                                                        <ItemStyle Font-Size="Small" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="NOMBRE DE ENTREGABLE" DataField="DS_ENTREGABLE">
                                                        <ItemStyle Font-Size="Small" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="FECHA DE ENTREGA" DataField="FECH_ENTREGA_ENT">
                                                        <ItemStyle Font-Size="Small" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="TIEMPO DE DESARROLLO " DataField="DS_DURACION_ENT">
                                                        <ItemStyle Font-Size="Small" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="CD_ESTADO_ENTREGABLE" HeaderText="ESTADO ACTUAL">
                                                        <ItemStyle Font-Size="Small" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="ENTREGABLES">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnVerEntregable" runat="server" CommandName="Select"
                                                                Text="Ver Entregables" />
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
                                                <asp:Label ID="Label63" runat="server" Text="Entregables" Font-Size="14pt"></asp:Label>
                                            </div>
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
                                                    <asp:TextBox ID="TxtFechaEntregaEntregable" runat="server" class="form-control" Enabled="False" Width="100%"></asp:TextBox>
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
                                                    <asp:TextBox ID="TxtEstadoEntregable" runat="server" class="form-control" Enabled="False" Width="100%"></asp:TextBox>
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
                                                <asp:Button ID="btnGuardarEntregable" runat="server" class="btn btn-primary" Text="GUARDAR" OnClick="BtnGuardarEntregableConsultoria_Click" />
                                                &nbsp;<asp:Button ID="btnAtrasEnt" runat="server" Text="ATRAS" class="btn btn-primary" CausesValidation="False" OnClick="BtnCancelarEntregableConsultoria_Click" />
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
                        <ajaxToolkit:TabPanel runat="server" HeaderText="ACTIVIDAD PASANTIA" ID="TabPanel6">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPACTPAS" runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="PanelListaPasantia" runat="server">
                                            <br />
                                            <asp:TextBox ID="TxtIdActividad" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <asp:TextBox ID="TxtIdActividadAspirante" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <asp:TextBox ID="TxtIdAspirante" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <asp:TextBox ID="TxtNombrePasantiaAct" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <asp:TextBox ID="TxtNombreAct" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <asp:TextBox ID="TxtUrlActiText" runat="server" Visible="False"></asp:TextBox>
                                            <asp:GridView ID="GVListaPasantia" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GVActividad_SelectedIndexChanged" DataKeyNames="ID">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TxtActividadGV" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="NOMBRE PASANTIA" DataField="NOMBRE_PASANTIA" />
                                                    <asp:BoundField HeaderText="ACTIVIDAD PASANTIA" DataField="DS_ACTIVIDAD" />
                                                    <asp:BoundField HeaderText="DESCRIPCION ACTIVIDAD" DataField="DS_DESCRIPCION_ACT" />
                                                    <asp:BoundField HeaderText="TIEMPO DE DESARROLLO" DataField="DS_DURACION_ACT" />
                                                    <asp:BoundField HeaderText="FECHA DE ENTREGA" DataField="FECH_ENTREGA_ACT" />
                                                    <asp:TemplateField HeaderText="ACTIVIDAD">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnVerActividad" runat="server" CommandName="Select"
                                                                Text="Ver Actividades" />
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
                                        <asp:Panel ID="PanelActividadDesc" runat="server" Visible="False">
                                            <br />
                                            <div align="center">
                                                <asp:Label ID="Label49" runat="server" Text="Actividades" Font-Size="14pt"></asp:Label>
                                            </div>
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
                                                    <asp:TextBox ID="TxtFechaEntrega" runat="server" class="form-control" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label54" runat="server" Font-Bold="True" Text="COMENTARIO:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtComentario" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Enabled="True" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label57" runat="server" Font-Bold="True" Text="OBSERVACION:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtObservacion" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label55" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="ESTADO ACTIVIDAD:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtEstadoActividad" runat="server" class="form-control" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label56" runat="server" class="control-label col-sm-3" Font-Bold="True" Text="ADJUNTAR ACTIVIDAD:"></asp:Label>
                                                <div class="col-md-9">
                                                    <ajaxToolkit:AsyncFileUpload ID="FileActividad" runat="server" FailedValidation="False" OnUploadedComplete="FileActividad_UploadedComplete" PersistFile="True" />
                                                </div>
                                            </div>
                                            <br />
                                            <div align="center">
                                                <asp:Button ID="BtnPasantiaActividad" runat="server" class="btn btn-primary" Text="GUARDAR" OnClick="BtnGuardarPasantiaActividad_Click" />
                                                &nbsp;<asp:Button ID="BtnAtrasActividad" runat="server" Text="ATRAS" class="btn btn-primary" CausesValidation="False" OnClick="BtnCancelarPasantiaActividad_Click" />
                                            </div>
                                            <br />
                                            <asp:GridView ID="GVActividadAspirante" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TxtIdActividadGV" runat="server" Text='<%#Eval("ID")%>' Visible="False">
                                                            </asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="NOMBRE ACTIVIDAD" DataField="DS_ACTIVIDAD" />
                                                    <asp:BoundField HeaderText="DESCRIPCION" DataField="DS_DESCRIPCION_ACT" />
                                                    <asp:BoundField HeaderText="FECHA DE ENTREGA" DataField="FECH_ENTREGA_ACT" />
                                                    <asp:BoundField HeaderText="COMENTARIO" DataField="DS_COMENTARIO" />
                                                    <asp:TemplateField HeaderText="Descargar">
                                                        <ItemTemplate>
                                                            <%
                                                                if (TxtUrlActiText.Text == "" || TxtUrlActiText.Text == null)
                                                                { 
                                                            %>
                                                                        No ha adjuntado actividad
                                                                    <%
                                                                }
                                                                else
                                                                {
                                                                    %>
                                                            <a href='<%# "http://"+Request.Url.Authority +"/ASP/Actividades/"+Eval("NOMBRE_PASANTIA")+"/"+Eval("DS_ACTIVIDAD")+"/"+Eval("URL_ACTIVIDAD") %>' target="_blank">Descargar</a>
                                                            <%
                                                                } %>
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
                        <ajaxToolkit:TabPanel ID="TabAceptacionPasantia" runat="server" HeaderText="ACEPTACION PASANTIA" Visible="False">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPEncuesta" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnGuardarEncuesta" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <asp:TextBox ID="TxtIdPasantia" runat="server" Visible="false"></asp:TextBox>
                                        <asp:TextBox ID="TxtIdAceptacionPasantia" runat="server" Visible="False"></asp:TextBox>
                                        <p class="text-justify">
                                            <asp:Label ID="LblParrafo1" runat="server" Text="Label" class="text-justify">
                Estimados estudiantes, esta encuesta tiene como objetivo conocer su interés para ser parte de los jóvenes
                         que haran una PASANTIA NO REMUNERADA, la cual se desarrollará el {{fecha_inicio_pasantia}}, donde pondrán 
                        en práctica sus conocimientos y habilidades adquiridas en los módulos de formación con empresas ya constituidas 
                        dentro del programa PIXELS PRO y dentro del sector que elaboran videojuegos y los comercializan. Por tal motivo 
                        agradecemos que responda a cada uno de los siguientes ítems:
                                            </asp:Label>
                                        </p>
                                        <br />
                                        <div class="form-group">
                                            <asp:Label ID="Label85" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE DE LA PASANTIA:"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="TxtNombPasantia" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <asp:Label class="control-label  col-sm-3" ID="Label87" runat="server" Font-Bold="True" Text="DESCRIPCION:"></asp:Label>
                                            <div class="col-md-9">
                                                <asp:TextBox class="form-control" ID="TxtDescripPas" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <ol>
                                            <li style="font-weight: bold">Está interesado en participar en una pasantía no remunerada con una empresa salvadoreña que se dedica a elaborar videojuegos. </li>
                                            <br />
                                            <br />
                                            Si su respuesta es <b>SI</b>, marque la siguiente casilla y explique por qué le gustaría ser parte.
                   
                    <div class="form-group">
                        <div class="col-sm-1">
                            <asp:CheckBox ID="CBsi" runat="server" Text="SI-" TextAlign="Left" AutoPostBack="True" OnCheckedChanged="CBsi_CheckedChanged" />
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox class="form-control" ID="TxtPregunta" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Enabled="False"></asp:TextBox>
                        </div>
                    </div>
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            Si su respuesta es <b>NO</b>, marque la siguiente casilla y explique el motivo del por qué no podría. Si su respuesta en NO, hasta aquí finaliza la encuesta.
                   
                    <div class="form-group">
                        <div class="col-sm-1">
                            <asp:CheckBox ID="CBno" runat="server" Text="NO-" TextAlign="Left" AutoPostBack="True" OnCheckedChanged="CBno_CheckedChanged" />
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox class="form-control" ID="TxtPregunta1" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Enabled="False"></asp:TextBox>
                        </div>
                    </div>
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <li style="font-weight: bold">
                                                <asp:Label ID="LblLaptop" runat="server" Text="Indicar si tiene laptop personal y estaría dispuesto a utilizarla durante {{duracion_pasantia}} días que durará
                            la pasantía, en caso que quiera formar parte de ella."></asp:Label>
                                            </li>
                                            <div class="form-group">
                                                <div class="col-sm-10">
                                                    <asp:TextBox class="form-control" ID="TxtRespuestaLaptop" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
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
                                        <asp:Panel ID="PanelHorario" runat="server" Visible="false">
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
                                                        <asp:Label ID="Label59" runat="server" Text="AM"></asp:Label></td>
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
                                                        <asp:Label ID="Label58" runat="server" Text="PM"></asp:Label></td>
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
                                        </asp:Panel>
                                        <br />
                                        <div align="center">
                                            <asp:Button ID="BtnGuardarEncuesta" runat="server" class="btn btn-primary" Text="GUARDAR" ValidationGroup="Encuesta" OnClick="BtnGuardarEncuesta_Click" OnClientClick="return confirm('¿Desea enviar los resultados?');" />
                                        </div>
                                        <br />
                                        <br />
                                        <asp:Label ID="LblNombreEstudiante" runat="server" Text="Nombre del Estudiante: {{nombre_aspirante}}"></asp:Label><br />
                                        <br />
                                        <asp:Label ID="LblAceptacion" runat="server" Text="  Durante {{duracion_pasantia}} días que durará la pasantía no remunerada, el estudiante debe
                        costear su transporte, no recibirá ningún pago de parte de la empresa donde realizará la pasantía y por su
                        cuenta debe correr el pago de su alimentación u otro tipo de gasto."
                                            class="text-justify"></asp:Label>


                                    </ContentTemplate>


                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </ajaxToolkit:TabPanel>
                        <ajaxToolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="OPORTUNIDADES">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPPanelOportunidad" runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="PanelHistorialOportunidad" runat="server">
                                            <br /><asp:TextBox ID="TxtIdPas1" runat="server" Visible="false"></asp:TextBox>
                                           
                                            <asp:GridView ID="GVHistorialAceptacion" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID" OnSelectedIndexChanged="GVHistorialAceptacion_SelectedIndexChanged">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="NOMBRE_PASANTIA" HeaderText="PASANTIA" />
                                                    <asp:BoundField DataField="CD_ESTADO" HeaderText="ESTADO ACTUAL" />
                                                    <asp:TemplateField HeaderText="VER DETALLE">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnVerReporteH" runat="server" CommandName="Select"
                                                                Text="Ver Reporte" />
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
                                        
                                        <asp:Panel ID="PanelHistorialAceptacionP" runat="server" Visible="false">
                                            <br /> <asp:TextBox ID="TxtIdAcepPas" runat="server" Visible="False"></asp:TextBox>
                                            <center>
                                            <rsweb:ReportViewer ID="RVHistoricoP" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="427px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="75%" style="margin-right: 0px"><LocalReport ReportPath="ASP\RptAceptacionPasantiaHistorico.rdlc"></LocalReport></rsweb:ReportViewer></center>
                                            <div align="center">
                                                <br />
                                                <asp:Button ID="BtnVerReporteH" runat="server" Text="Cerrar Reporte" OnClick="BtnVerReporteH_Click" />
                                            </div>
                                        </asp:Panel>
                                        
                                       
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </ajaxToolkit:TabPanel>


                        <ajaxToolkit:TabPanel ID="TabPanelEncSemAsp" runat="server" HeaderText="ENCUESTA SEMANAL">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPPanelEncSemAsp" runat="server">
                                    <ContentTemplate>
                                    <asp:Panel ID="PanelEncuestaSemanalAspirante" runat="server" Visible="true">
                                        <asp:TextBox ID="TxtIdEmpresaE" runat="server" Visible="False"></asp:TextBox>
										<div align="center"><b>ENCUESTA SEMANAL A ASPIRANTE</b></div>
										<br />
										<ol>
										<li>¿Cómo calificarías las instalaciones físicas donde recibes clases?</li>
											<asp:RadioButtonList ID="RespSEncSemAsp1" runat="server">
												<asp:ListItem Value="E">Excelente</asp:ListItem>
												<asp:ListItem Value="M">Muy Buena</asp:ListItem>
												<asp:ListItem Value="B">Buena</asp:ListItem>
												<asp:ListItem Value="R">Regular</asp:ListItem>
												<asp:ListItem Value="D">Deficiente</asp:ListItem>
											</asp:RadioButtonList>
											
										<li>¿Cómo calificarías el equipo de cómputo en el cual recibes clases?</li>
											<asp:RadioButtonList ID="RespSEncSemAsp2" runat="server">
												<asp:ListItem Value="E">Excelente</asp:ListItem>
												<asp:ListItem Value="M">Muy Buena</asp:ListItem>
												<asp:ListItem Value="B">Buena</asp:ListItem>
												<asp:ListItem Value="R">Regular</asp:ListItem>
												<asp:ListItem Value="D">Deficiente</asp:ListItem>
											</asp:RadioButtonList>
										
										<li>Considera que el profesor prepara adecuadamente las clases</li>
											<asp:RadioButtonList ID="RespSEncSemAsp3" runat="server">
												<asp:ListItem Value="N">Nunca</asp:ListItem>
												<asp:ListItem Value="C">Casi nunca</asp:ListItem>
												<asp:ListItem Value="V">Mayoria de las veces</asp:ListItem>
												<asp:ListItem Value="S">Siempre</asp:ListItem>
											</asp:RadioButtonList>
											
											
										<li>Facilita el profesor la compresión de los temas</li>
											<asp:RadioButtonList ID="RespSEncSemAsp4" runat="server">
												<asp:ListItem Value="N">Nunca</asp:ListItem>
												<asp:ListItem Value="C">Casi nunca</asp:ListItem>
												<asp:ListItem Value="V">Mayoria de las veces</asp:ListItem>
												<asp:ListItem Value="S">Siempre</asp:ListItem>
											</asp:RadioButtonList>
											
										<li>El profesor promueve  la participación y/o reflexión de los alumnos en clase</li>
											<asp:RadioButtonList ID="RespSEncSemAsp5" runat="server">
												<asp:ListItem Value="N">Nunca</asp:ListItem>
												<asp:ListItem Value="C">Casi nunca</asp:ListItem>
												<asp:ListItem Value="V">Mayoria de las veces</asp:ListItem>
												<asp:ListItem Value="S">Siempre</asp:ListItem>
											</asp:RadioButtonList>
											
											
										<li>El profesor es puntual en sus clases</li>
											<asp:RadioButtonList ID="RespSEncSemAsp6" runat="server">
												<asp:ListItem Value="N">Nunca</asp:ListItem>
												<asp:ListItem Value="C">Casi nunca</asp:ListItem>
												<asp:ListItem Value="V">Mayoria de las veces</asp:ListItem>
												<asp:ListItem Value="S">Siempre</asp:ListItem>
											</asp:RadioButtonList>
										
										<li>El profesor consigue mantener mi atención durante las clases</li>
											<asp:RadioButtonList ID="RespSEncSemAsp7" runat="server">
												<asp:ListItem Value="N">Nunca</asp:ListItem>
												<asp:ListItem Value="C">Casi nunca</asp:ListItem>
												<asp:ListItem Value="V">Mayoria de las veces</asp:ListItem>
												<asp:ListItem Value="S">Siempre</asp:ListItem>
											</asp:RadioButtonList>
											
										<li>El profesor demuestra ser un experto en la asignatura</li>
											<asp:RadioButtonList ID="RespSEncSemAsp8" runat="server">
												<asp:ListItem Value="N">Nunca</asp:ListItem>
												<asp:ListItem Value="C">Casi nunca</asp:ListItem>
												<asp:ListItem Value="V">Mayoria de las veces</asp:ListItem>
												<asp:ListItem Value="S">Siempre</asp:ListItem>
											</asp:RadioButtonList>
											
										<li>El profesor resuelve mis dudas con exactitud</li>
											<asp:RadioButtonList ID="RespSEncSemAsp9" runat="server">
												<asp:ListItem Value="N">Nunca</asp:ListItem>
												<asp:ListItem Value="C">Casi nunca</asp:ListItem>
												<asp:ListItem Value="V">Mayoria de las veces</asp:ListItem>
												<asp:ListItem Value="S">Siempre</asp:ListItem>
											</asp:RadioButtonList>
											
										
										<li>La formación recibida es útil</li>
											<asp:RadioButtonList ID="RespSEncSemAsp10" runat="server">
												<asp:ListItem Value="N">Nunca</asp:ListItem>
												<asp:ListItem Value="C">Casi nunca</asp:ListItem>
												<asp:ListItem Value="V">Mayoria de las veces</asp:ListItem>
												<asp:ListItem Value="S">Siempre</asp:ListItem>
											</asp:RadioButtonList>
										
										<li>El contenido de la asignatura es actual</li>
											<asp:RadioButtonList ID="RespSEncSemAsp11" runat="server">
												<asp:ListItem Value="N">Nunca</asp:ListItem>
												<asp:ListItem Value="C">Casi nunca</asp:ListItem>
												<asp:ListItem Value="V">Mayoria de las veces</asp:ListItem>
												<asp:ListItem Value="S">Siempre</asp:ListItem>
											</asp:RadioButtonList>
											
										<li>Recomendaría el curso a otros estudiantes</li>
											<asp:RadioButtonList ID="RespSEncSemAsp12" runat="server">
												<asp:ListItem Value="N">Nunca</asp:ListItem>
												<asp:ListItem Value="C">Casi nunca</asp:ListItem>
												<asp:ListItem Value="V">Mayoria de las veces</asp:ListItem>
												<asp:ListItem Value="S">Siempre</asp:ListItem>
											</asp:RadioButtonList>
											
										<li>La carga de la asignatura (horas de estudio o preparación) es correcta</li>
											<asp:RadioButtonList ID="RespSEncSemAsp13" runat="server">
												<asp:ListItem Value="N">Nunca</asp:ListItem>
												<asp:ListItem Value="C">Casi nunca</asp:ListItem>
												<asp:ListItem Value="V">Mayoria de las veces</asp:ListItem>
												<asp:ListItem Value="S">Siempre</asp:ListItem>
											</asp:RadioButtonList>
											
										<li>La asignatura tiene una buena coordinación entre teoría y práctica</li>
											<asp:RadioButtonList ID="RespSEncSemAsp14" runat="server">
												<asp:ListItem Value="N">Nunca</asp:ListItem>
												<asp:ListItem Value="C">Casi nunca</asp:ListItem>
												<asp:ListItem Value="V">Mayoria de las veces</asp:ListItem>
												<asp:ListItem Value="S">Siempre</asp:ListItem>
											</asp:RadioButtonList>
											
										<li>La asignatura cumple con mis expectativas</li>
											<asp:RadioButtonList ID="RespSEncSemAsp15" runat="server">
												<asp:ListItem Value="N">Nunca</asp:ListItem>
												<asp:ListItem Value="C">Casi nunca</asp:ListItem>
												<asp:ListItem Value="V">Mayoria de las veces</asp:ListItem>
												<asp:ListItem Value="S">Siempre</asp:ListItem>
											</asp:RadioButtonList>
										</ol>
										<div align="center">
											<asp:Button ID="BtnGuardarEncuestaSemanalAspirante" runat="server" class="btn btn-primary" Text="GUARDAR" ValidationGroup="EncuestaSem" OnClientClick="return confirm('¿Desea enviar los resultados?');" OnClick="BtnGuardarEncuestaSemanalAspirante_Click"  />
										</div><br />
									</asp:Panel>
                                       
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </ajaxToolkit:TabPanel>


                        <ajaxToolkit:TabPanel ID="TabPanelEncMenAsp" runat="server" HeaderText="ENCUESTA MENSUAL">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPPanelEncMenAsp" runat="server">
                                    <ContentTemplate>
                                    <asp:Panel ID="PanelEncuestaMensualAspirante" runat="server" Visible="true">
										<div align="center"><b>ENCUESTA MENSUAL A ASPIRANTE</b></div>
										<br />
										<ol>
										<li>Los profesores que han asumido el desarrollo de las diferentes asignaturas son competentes y profesionales.</li>
											<asp:RadioButtonList ID="RespEncMenAsp1" runat="server">
												<asp:ListItem Value="E">En desacuerdo</asp:ListItem>
												<asp:ListItem Value="I">Indeciso</asp:ListItem>
												<asp:ListItem Value="D">De acuerdo</asp:ListItem>
												<asp:ListItem Value="M">Muy de acuerdo</asp:ListItem>
											</asp:RadioButtonList>
											
										<li>Considera  que el desarrollo de este programa de estudio posee un nivel académico adecuado (intelectual, reflexivo y crítico) para el área de estudio.</li>
											<asp:RadioButtonList ID="RespEncMenAsp2" runat="server">
												<asp:ListItem Value="E">En desacuerdo</asp:ListItem>
												<asp:ListItem Value="I">Indeciso</asp:ListItem>
												<asp:ListItem Value="D">De acuerdo</asp:ListItem>
												<asp:ListItem Value="M">Muy de acuerdo</asp:ListItem>
											</asp:RadioButtonList>
										
										<li>Considera que los temas vistos en el módulo son pertinentes.</li>
											<asp:RadioButtonList ID="RespEncMenAsp3" runat="server">
												<asp:ListItem Value="E">En desacuerdo</asp:ListItem>
												<asp:ListItem Value="I">Indeciso</asp:ListItem>
												<asp:ListItem Value="D">De acuerdo</asp:ListItem>
												<asp:ListItem Value="M">Muy de acuerdo</asp:ListItem>
											</asp:RadioButtonList>
											
											
										<li>Piensa que al término de estos estudios usted logrará ser un especialista competente en su área.</li>
											<asp:RadioButtonList ID="RespEncMenAsp4" runat="server">
												<asp:ListItem Value="E">En desacuerdo</asp:ListItem>
												<asp:ListItem Value="I">Indeciso</asp:ListItem>
												<asp:ListItem Value="D">De acuerdo</asp:ListItem>
												<asp:ListItem Value="M">Muy de acuerdo</asp:ListItem>
											</asp:RadioButtonList>
											
										<li>Las sesiones prácticas han cumplido sus expectativas</li>
											<asp:RadioButtonList ID="RespEncMenAsp5" runat="server">
												<asp:ListItem Value="E">En desacuerdo</asp:ListItem>
												<asp:ListItem Value="I">Indeciso</asp:ListItem>
												<asp:ListItem Value="D">De acuerdo</asp:ListItem>
												<asp:ListItem Value="M">Muy de acuerdo</asp:ListItem>
											</asp:RadioButtonList>
											
										</ol>
										<div align="center">
											<asp:Button ID="BtnGuardarEncuestaMensualAspirante" runat="server" class="btn btn-primary" Text="GUARDAR" ValidationGroup="EncuestaSem" OnClientClick="return confirm('¿Desea enviar los resultados?');" OnClick="BtnGuardarEncuestaMensualAspirante_Click"  />
										</div><br />
									</asp:Panel>
                                       
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </ajaxToolkit:TabPanel>



                        <ajaxToolkit:TabPanel ID="TabInformeFinal" runat="server" HeaderText="INFORME FINAL">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPInformeFinal" runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="PanelInformeFinal" runat="server" Visible="true">
                                            <br /><p style="font-weight: bold; text-align: center">
                                                Infome final de la pasantía no remunerada del programa PIXELS CAPS VIDEOJUEGOS
                                            </p>
                                            <p style="text-align: center">La siguiente guía de preguntas debe de ser respondida por los pasantes de manera individual.</p>
                                            <asp:TextBox ID="TxtIdInformeComparativo" runat="server" Visible="false"></asp:TextBox>
                                            <asp:TextBox ID="TxtIdInformeFinal" runat="server" Visible="false"></asp:TextBox>
                                            <br />
                                            <div class="form-group">
                                                <asp:Label ID="Label69" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE DE LA EMPRESA:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtNombreEmpresa" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label70" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="RESPONSABLE:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtResponsable" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label78" runat="server" Font-Bold="True" Text="DIRECCIÓN:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtDireccionR" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label79" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="TELÉFONO:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtTelResponsable" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label80" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="CORREO ELECTRÓNICO:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtCorreoR" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="form-group">
                                                <asp:Label ID="Label81" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE DE EL/LA PASANTE:"></asp:Label>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="TxtNombrePasante" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label82" runat="server" Font-Bold="True" Text="DIRECCIÓN:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtDireccionPasante" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label83" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="TELÉFONOS DE CONTACTO:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtTelefonoPasante" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label84" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="CORREO ELECTRÓNICO:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtCorreoPasante" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>
                                            <br />
                                            <p style="font-weight: bold">
                                                <asp:Label ID="Label60" runat="server" Text="1. Descripción del proyecto en el que realizó la pasantia."></asp:Label>
                                            </p>
                                            <br />
                                            <asp:Label ID="Label61" runat="server" Text="(Debe incluir una breve reseña de la empresa y enfocarse en explicar en qué consiste el proyecto en el que trabajó)"></asp:Label>


                                            <div class="form-group">
                                                <div class="col-sm-10">
                                                    <asp:TextBox class="form-control" ID="TxtDescripPasantia" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>
                                            </div>
                                            <p style="font-weight: bold">
                                                <asp:Label ID="Label62" runat="server" Text="2. Cronograma de actividades o plan de trabajo"></asp:Label>
                                            </p>
                                            <br />

                                            <div class="form-group">
                                                <div class="col-sm-10">
                                                    <asp:TextBox class="form-control" ID="TxtCrono" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>
                                            </div>
                                            <p style="font-weight: bold">
                                                <asp:Label ID="Label68" runat="server" Text="3. Descripción de las actividades y tareas realizadas durante las 6 semanas de pasantías(por etapa o semana)"></asp:Label>
                                            </p>
                                            <br />
                                            <asp:GridView ID="GVListaActividadEncuesta" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GVDestreza_RowDeleting" Width="100%" DataKeyNames="ID">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TxtIdActividad" runat="server" Text='<%#Eval("ID")%>' Visible="False"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="ACTIVIDAD" DataField="DS_ACTIVIDAD" />
                                                    <asp:BoundField HeaderText="DESCRIPCION ACTIVIDAD" DataField="DS_DESCRIPCION_ACT" />
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
                                            <p style="font-weight: bold">
                                                <br />
                                                <asp:Label ID="Label71" runat="server" Text="4. Cuadro comparativo"></asp:Label>
                                            </p>
                                            <br />
                                            <div class="form-group">
                                                <asp:Label ID="Label72" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="APRENDIDO EN PIXELS CAPS:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtAprendidoComparativo" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <asp:Label ID="Label73" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="LO PUESTO EN PRACTICA EN LA EMPRESA:"></asp:Label>

                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtEnPracticaComparativo" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div align="center">
                                                <asp:Button ID="BtnGuardarComparativo" runat="server" class="btn btn-primary" Text="GUARDAR CUADRO COMPARATIVO" OnClick="BtnGuardarComparativo_Click" />&#160;<asp:Button ID="Button4" runat="server" CausesValidation="False" class="btn btn-primary" Text="CANCELAR" />
                                            </div>
                                            <br />
                                            <asp:GridView ID="GVCuadroComparativo" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GVCuadroComparativo_RowDeleting" Width="100%" DataKeyNames="ID">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TxtIdComparativo" runat="server" Text='<%#Eval("ID")%>' Visible="False"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="Aprendido en PIXELS CAPS" DataField="DS_APRENDIDO_PIXELS" />
                                                    <asp:BoundField HeaderText="Lo puesto en práctica en la empresa" DataField="DS_PRACTICA_EMPRESA" />
                                                    <asp:TemplateField HeaderText="Eliminar">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnEliminarDestreza" runat="server" CommandName="Delete" OnClientClick="return confirm('¿Desea eliminar este archivo?');" Text="Eliminar" />
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
                                            <p style="font-weight: bold">
                                                <asp:Label ID="Label74" runat="server" Text="5. Cómo fue la relación laboral pasante y empresa."></asp:Label>
                                            </p>

                                            <div class="form-group">
                                                <div class="col-sm-10">
                                                    <asp:TextBox class="form-control" ID="TxtLaboral" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>
                                            </div>

                                            <p style="font-weight: bold">
                                                <asp:Label ID="Label75" runat="server" Text="6. Considera que realizar las pasantías ha generado algún tipo de resultado/beneficio en su vida profesional."></asp:Label>
                                            </p>

                                            <div class="form-group">
                                                <div class="col-sm-10">
                                                    <asp:TextBox class="form-control" ID="TxtPasanBenef" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>
                                            </div>
                                            <p style="font-weight: bold">
                                                <asp:Label ID="Label76" runat="server" Text="7. Describa las limitaciones encontradas durante el proceso de la práctica laboral."></asp:Label>
                                            </p>

                                            <div class="form-group">
                                                <div class="col-sm-10">
                                                    <asp:TextBox class="form-control" ID="TxtLimitaciones" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>
                                            </div>
                                            <p style="font-weight: bold">
                                                <asp:Label ID="Label77" runat="server" Text="8. Conclusiones."></asp:Label>
                                            </p>

                                            <div class="form-group">
                                                <div class="col-sm-10">
                                                    <asp:TextBox class="form-control" ID="TxtConclusion" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div align="center">
                                                <asp:Button ID="BtnGuardarInfoFinal" runat="server" class="btn btn-primary" Text="GUARDAR" ValidationGroup="Encuesta" OnClientClick="return confirm('¿Desea enviar los resultados?');" OnClick="BtnGuardarInfoFinal_Click" />
                                                &nbsp;<asp:Button ID="Button5" runat="server" CausesValidation="False" class="btn btn-primary" Text="CANCELAR" />
                                            </div>
                                            <br />
                                        </asp:Panel>
                                        <asp:Panel ID="PanelReporteInfoFinal" runat="server" Visible="true">
                                            <div align="center">
                                                <br />
                                                <br />
                                                <br />
                                                <asp:Button ID="BtnReporteInfoFinal" runat="server" Text="VER REPORTE DE INFORME FINAL" />
                                            </div>
                                            <br />
                                            <asp:Panel ID="PanelReporteP" runat="server" CssClass="modalPopup" Height="527px">
                                                <br />
                                                <center>
        <rsweb:ReportViewer ID="RVInformeFinal" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="427px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="75%" style="margin-right: 0px"><LocalReport ReportPath="ASP\RptInformeFinal.rdlc"></LocalReport></rsweb:ReportViewer></center>
                                                <div align="center">
                                                    <br />
                                                    <asp:Button ID="BtnCerrarInforme" runat="server" Text="Cerrar" />
                                                </div>
                                            </asp:Panel>
                                            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="PanelReporteP" BackgroundCssClass="modalBackround" TargetControlID="BtnReporteInfoFinal" CancelControlID="BtnCerrarInforme"></ajaxToolkit:ModalPopupExtender>

                                        </asp:Panel>
                                        <br />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </ajaxToolkit:TabPanel>
                        




                    </ajaxToolkit:TabContainer>
                </asp:Panel>
            </div>
            <%--fin tab ENTREGABLE--%>
        </div>

        <%--fin tab ENTREGABLE--%>
        <asp:Panel ID="PanelFicha" runat="server" CssClass="modalPopup" Height="527px">
            <br />
            <center>
        <rsweb:ReportViewer ID="RVFichaAspirante" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="427px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="75%" style="margin-right: 0px"><LocalReport ReportPath="ASP\RptFichaAspirante.rdlc"></LocalReport></rsweb:ReportViewer></center>
            <div align="center">
                <br />
                <asp:Button ID="BtnCerrarFicha" runat="server" Text="Cerrar" />
            </div>
        </asp:Panel>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="PanelFicha" BackgroundCssClass="modalBackround" TargetControlID="BtnFicha" CancelControlID="BtnCerrarFicha"></ajaxToolkit:ModalPopupExtender>

    </form>
    <%--fin tab ENTREGABLE--%>
</asp:Content>




