﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterProceso.master" AutoEventWireup="true" CodeBehind="EMPP0001.aspx.cs" Inherits="MyMainApp.EMP.EMPP0001" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <asp:Panel ID="Panel1" runat="server" Width="100%">
        <form id="form1" runat="server" class="form-horizontal">

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <%--inicio formulario--%>
            <div class="text-center">
                <%--  div titulo--%>
                <asp:Label ID="LblTitulo" runat="server" Text="Registro para Empresa" Font-Bold="True" Font-Size="18pt"></asp:Label>
            </div>
            <div style="text-align: right; right: 25px; left: 25px">

                <asp:Button ID="BtnFicha" runat="server" Text="Ver Ficha" /><br />

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="LblEmpresa" runat="server" Text="" Font-Bold="True"></asp:Label><br />
                        <asp:Label ID="LblPasantia" runat="server" Text="" Font-Bold="True"></asp:Label><br />
                        <asp:Label ID="LblProyecto" runat="server" Text="" Font-Bold="True"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <%--fin div titulo--%>
            <div class="container-fluid">
                <div id="content">
                    <%--inicio container-fluid--%>
                    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="3" BorderColor="#66CCFF" ScrollBars="Vertical" Height="375px" Width="100%">
                        <ajaxToolkit:TabPanel runat="server" HeaderText="DATOS GENERALES" ID="TabPanel1" Width="100%">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPDatoGeneral" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnGuardarDatosGenerales" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <%--inicio contenido tab--%><%--inicio tab datos--%>
                                        <%--inicio tab datos--%>
                                        <asp:TextBox ID="TxtIDEmpresa" runat="server" Visible="False">0</asp:TextBox>
                                        <br />
                                        <div class="form-group">
                                            <asp:Label class="control-label  col-sm-3" ID="Label1" runat="server" Text="NOMBRE DE EMPRESA:" Font-Bold="True"></asp:Label>
                                            <div class="col-md-9">
                                                <asp:TextBox class="form-control" ID="TxtEmpresa" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtEmpresa" SetFocusOnError="True" ValidationGroup="DatoGeneral">Llenar Nombre de Empresa</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label class="control-label  col-sm-3" ID="Label3" runat="server" Text="ACTIVIDAD ECONÓMICA:" Font-Bold="True"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:DropDownList ID="CboActEcono" runat="server" class="form-control" DataTextField="DS_ACT_ECO" DataValueField="ID">
                                                </asp:DropDownList>
                                            </div>
                                            <asp:Label class="control-label  col-sm-3" ID="Label41" runat="server" Text="NOMBRE DE CONTACTO:" Font-Bold="True"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:TextBox class="form-control" ID="TxtNombreContact" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtNombreContact" SetFocusOnError="True" ValidationGroup="DatoGeneral">Llenar Nombre de contacto</asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label class="control-label  col-sm-3" ID="Label2" runat="server" Text="EMAIL DE CONTACTO:" Font-Bold="True"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:TextBox class="form-control" ID="TxtEmailC" runat="server" AutoCompleteType="Disabled" TextMode="Email"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtEmailC" SetFocusOnError="True" ValidationGroup="DatoGeneral">Llenar email de contacto</asp:RequiredFieldValidator>
                                            </div>
                                            <asp:Label class="control-label  col-sm-3" ID="Label5" runat="server" Text="TELÉFONO DE CONTACTO:" Font-Bold="True"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:TextBox class="form-control" ID="TxtTelC" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtTelC" SetFocusOnError="True" ValidationGroup="DatoGeneral">Llenar Telefono de contacto</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label class="control-label  col-sm-3" ID="Label4" runat="server" Text="NIT DE EMPESA:" Font-Bold="True"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:TextBox class="form-control" ID="TxtNitEmpresa" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtNitEmpresa" SetFocusOnError="True" ValidationGroup="DatoGeneral">Llenar Nit de empresa</asp:RequiredFieldValidator>
                                            </div>
                                            <asp:Label class="control-label  col-sm-3" ID="Label6" runat="server" Text="TELÉFONO EMPRESA:" Font-Bold="True"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:TextBox class="form-control" ID="TxtTelEmpresa" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtTelEmpresa" SetFocusOnError="True" ValidationGroup="DatoGeneral">Llenar Telefono de empresa</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label class="control-label  col-sm-3" ID="Label7" runat="server" Font-Bold="True" Text="DIRECCIÓN EMPRESA:"></asp:Label>
                                            <div class="col-md-9">
                                                <asp:TextBox class="form-control" ID="TxtDirEmpresa" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtDirEmpresa" SetFocusOnError="True" ValidationGroup="DatoGeneral">Llenar Direccion de empresa</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label class="control-label  col-sm-3" ID="Label8" runat="server" Font-Bold="True" Text="DEPARTAMENTO:"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:DropDownList ID="CboDepartamento" runat="server" class="form-control" AutoPostBack="True" DataTextField="DS_DEPARTAMENTO" DataValueField="ID" OnSelectedIndexChanged="CboDepartamento_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                            <asp:Label class="control-label  col-sm-3" ID="Label10" runat="server" Font-Bold="True" Text="MUNICIPIO:"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:DropDownList ID="CboMunicipio" runat="server" class="form-control" DataTextField="DS_MUNICIPIO" DataValueField="ID">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label class="control-label  col-sm-3" ID="Label11" runat="server" Text="NOMBRE REPRESENTANTE LEGAL:" Font-Bold="True"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:TextBox class="form-control" ID="TxtNombRepre" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtNombRepre" SetFocusOnError="True" ValidationGroup="DatoGeneral">Llenar Nombre de representante legal</asp:RequiredFieldValidator>
                                            </div>
                                            <asp:Label class="control-label  col-sm-3" ID="Label13" runat="server" Text="EMAIL DE REPRESENTANTE LEGAL:" Font-Bold="True"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:TextBox class="form-control" ID="TxtEmailRep" runat="server" AutoCompleteType="Disabled" TextMode="Email"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtEmailRep" SetFocusOnError="True" ValidationGroup="DatoGeneral">Llenar email de representante legal</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label class="control-label  col-sm-3" ID="Label14" runat="server" Text="NIT REPRESENTANTE LEGAL:" Font-Bold="True"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:TextBox class="form-control" ID="TxtNitRep" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtNitRep" SetFocusOnError="True" ValidationGroup="DatoGeneral">Llenar Nit de representante legal</asp:RequiredFieldValidator>
                                            </div>
                                            <asp:Label class="control-label  col-sm-3" ID="Label15" runat="server" Text="DUI REPRESENTANTE LEGAL:" Font-Bold="True"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:TextBox class="form-control" ID="TxtDuiRep" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtDuiRep" SetFocusOnError="True" ValidationGroup="DatoGeneral">Llenar Dui de representante legal</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <br />
                                        <div align="center">
                                            <asp:Button ID="BtnGuardarDatosGenerales" runat="server" class="btn btn-primary" Text="GUARDAR" OnClick="BtnGuardarDatosGenerales_Click" ValidationGroup="DatoGeneral" />

                                        </div>
                                        <br />
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </ContentTemplate>
                        </ajaxToolkit:TabPanel>
                        <%--fin tab datos--%>
                        <ajaxToolkit:TabPanel runat="server" HeaderText="PASANTIA" ID="TabPanel2">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPPasantia" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnGuardarPasantia" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <%--inicio tab Pasantia--%>
                                        <asp:Panel ID="PanelPasantia" runat="server" Visible="false">
                                            <div align="left">
                                                <asp:Button ID="BtnRegresarListaPasantia" runat="server" Text="ATRAS" class="btn btn-primary" CausesValidation="False" OnClick="BtnRegresarListaPasantia_Click" />
                                            </div>
                                            <div align="center">
                                                <asp:Label ID="Label81" runat="server" Text="REGISTRO DE PASANTIA" Font-Size="14pt"></asp:Label>
                                                <br />
                                            </div>
                                            <br />
                                            <asp:TextBox ID="TxtIDPasantia" runat="server" Visible="False">0</asp:TextBox>
                                            <br />
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label60" runat="server" Font-Bold="True" Text="TITULO PASANTIA:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtTituloPasantia" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtTituloPasantia" ValidationGroup="info">Llenar Titulo Pasantia</asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label17" runat="server" Font-Bold="True" Text="NOMBRE DEL EVALUADOR:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox class="form-control" ID="TxtNombEva" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtNombEva" ValidationGroup="info">Llenar Nombre de evaluador</asp:RequiredFieldValidator>
                                                </div>
                                                <asp:Label class="control-label  col-sm-3" ID="Label23" runat="server" Font-Bold="True" Text="EMAIL DEL EVALUADOR:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox class="form-control" ID="TxtEmailEva" runat="server" AutoCompleteType="Disabled" TextMode="Email"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtEmailEva" ValidationGroup="info">Llenar email de contacto</asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label16" runat="server" Font-Bold="True" Text="AREA DE PASANTIA:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:DropDownList ID="CboAreaPasantia" runat="server" class="form-control" DataTextField="DS_AREA" DataValueField="ID">
                                                    </asp:DropDownList>

                                                </div>
                                                <asp:Label class="control-label  col-sm-3" ID="Label24" runat="server" Font-Bold="True" Text="ESTADO"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:DropDownList ID="CboEstadoPasantia" runat="server" class="form-control">
                                                        <asp:ListItem Value="D">Disponible</asp:ListItem>
                                                        <asp:ListItem Value="N">No disponible</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label18" runat="server" Font-Bold="True" Text="DESCRIPCIÓN DE PASANTÍA:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtDescPasantia" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtDescPasantia" ValidationGroup="info">Llenar Descripcion de pasantia</asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label19" runat="server" Font-Bold="True" Text="FECHA INICIO:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox class="form-control" ID="TxtFechInicio" runat="server" TextMode="Date" AutoCompleteType="Disabled"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtFechInicio" ValidationGroup="info">Llenar Fecha de inicio de pasantia</asp:RequiredFieldValidator>
                                                </div>
                                                <asp:Label class="control-label  col-sm-3" ID="Label25" runat="server" Font-Bold="True" Text="DURACIÓN DE PASANTIA(DÍAS):"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox class="form-control" ID="TxtDuracion" runat="server" AutoCompleteType="Disabled" TextMode="Number"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtDuracion" ValidationGroup="info">Llenar Duración de pasantia</asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-2" ID="Label20" runat="server" Font-Bold="True" Text="HORARIO:"></asp:Label>
                                                <asp:Label class="control-label  col-sm-1" ID="Label28" runat="server" Font-Bold="True" Text="DE:"></asp:Label>
                                                <div class="col-md-2">
                                                    <asp:TextBox class="form-control" ID="TxtDe" runat="server" AutoCompleteType="Disabled" TextMode="Time"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtDe" ValidationGroup="info">Llenar Horario de pasantia</asp:RequiredFieldValidator>
                                                </div>
                                                <div class="col-md-3"></div>
                                                <asp:Label class="control-label  col-sm-1" ID="Label26" runat="server" Font-Bold="True" Text="A:"></asp:Label>
                                                <div class="col-md-2">
                                                    <asp:TextBox class="form-control" ID="TxtA" runat="server" TextMode="Time" AutoCompleteType="Disabled"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtA" ValidationGroup="info">Llenar Horario de pasantia</asp:RequiredFieldValidator>
                                                </div>
                                                <div class="col-md-1"></div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-2" ID="Label29" runat="server" Font-Bold="True" Text="DÍAS:"></asp:Label>
                                                <asp:Label class="control-label  col-sm-1" ID="Label30" runat="server" Font-Bold="True" Text="DE:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:DropDownList ID="CboDias1" runat="server" class="form-control">
                                                        <asp:ListItem Value="1">Lunes</asp:ListItem>
                                                        <asp:ListItem Value="2">Martes</asp:ListItem>
                                                        <asp:ListItem Value="3">Miércoles</asp:ListItem>
                                                        <asp:ListItem Value="4">Jueves</asp:ListItem>
                                                        <asp:ListItem Value="5">Viernes</asp:ListItem>
                                                    </asp:DropDownList>

                                                </div>
                                                <div class="col-md-2"></div>
                                                <asp:Label class="control-label  col-sm-1" ID="Label31" runat="server" Font-Bold="True" Text="A:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:DropDownList ID="CboDias2" runat="server" class="form-control">
                                                        <asp:ListItem Value="1">Lunes</asp:ListItem>
                                                        <asp:ListItem Value="2">Martes</asp:ListItem>
                                                        <asp:ListItem Value="3">Miércoles</asp:ListItem>
                                                        <asp:ListItem Value="4">Jueves</asp:ListItem>
                                                        <asp:ListItem Value="5">Viernes</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-2" ID="Label21" runat="server" Font-Bold="True" Text="RANGO DE EDAD:"></asp:Label>
                                                <asp:Label class="control-label  col-sm-1" ID="Label34" runat="server" Font-Bold="True" Text="DE:"></asp:Label>
                                                <div class="col-md-1">
                                                    <asp:TextBox class="form-control" ID="TxtEdadDe" runat="server" AutoCompleteType="Disabled" TextMode="Number"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtEdadDe" ValidationGroup="info">Llenar Rango de edad</asp:RequiredFieldValidator>
                                                </div>
                                                <asp:Label class="control-label  col-sm-1" ID="Label35" runat="server" Font-Bold="True" Text="A:"></asp:Label>
                                                <div class="col-md-1">
                                                    <asp:TextBox class="form-control" ID="TxtEdadA" runat="server" AutoCompleteType="Disabled" TextMode="Number"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtEdadA" ValidationGroup="info">Llenar Rango de edad</asp:RequiredFieldValidator>
                                                </div>
                                                <asp:Label class="control-label  col-sm-3" ID="Label32" runat="server" Font-Bold="True" Text="CANTIDAD DE VACANTES:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox class="form-control" ID="TxtCantVacantes" runat="server" AutoCompleteType="Disabled" TextMode="Number"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtCantVacantes" ValidationGroup="info">Llenar cantidad de vacantes</asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label36" runat="server" Font-Bold="True" Text="SUCURSAL:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox class="form-control" ID="TxtSucursal" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label37" runat="server" Font-Bold="True" Text="DIRECCIÓN DE SUCURSAL:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtDireccion" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div align="center">
                                                <asp:Button ID="BtnGuardarPasantia" runat="server" Text="GUARDAR" class="btn btn-primary" OnClick="BtnGuardarPasantia_Click" ValidationGroup="info" />&nbsp;<asp:Button ID="BtnCancelarPasantia" runat="server" Text="CANCELAR" class="btn btn-primary" CausesValidation="False" />
                                            </div>
                                            <br />
                                            <ajaxToolkit:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server" TargetControlID="PanelNivelEducativo" BorderColor="Orange" />
                                            <asp:Panel ID="PanelNivelEducativo" runat="server">
                                                <div align="center">
                                                    <asp:Label ID="Label47" runat="server" Text="Nivel Educativo" Font-Size="14pt"></asp:Label>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="Label62" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="CATEGORIA ESCOLARIDAD:"></asp:Label>
                                                    <div class="col-md-3">
                                                        <asp:DropDownList ID="CboCategoriaEscolaridad" runat="server" AutoPostBack="True" class="form-control" DataTextField="DS_ESCOLARIDAD" DataValueField="ID" OnSelectedIndexChanged="CboCategoriaEscolaridad_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </div>
                                                    <asp:Label class="control-label  col-sm-3" ID="Label22" runat="server" Font-Bold="True" Text="NIVEL EDUCATIVO:"></asp:Label>
                                                    <div class="col-md-3">
                                                        <asp:DropDownList ID="CboNivelEducativo" runat="server" class="form-control" DataTextField="DS_ANIO" DataValueField="ID" AutoPostBack="True">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label class="control-label  col-sm-3" ID="Label27" runat="server" Font-Bold="True" Text="OPCIÓN ACADÉMICA:"></asp:Label>
                                                    <div class="col-md-3">
                                                        <asp:DropDownList ID="CboOpcionAcademica" runat="server" class="form-control" DataTextField="DS_CARRERA" DataValueField="ID">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div align="center">
                                                    <asp:Button ID="BtnGuardarNivel" runat="server" Text="GUARDAR" class="btn btn-primary" OnClick="BtnGuardarNivel_Click" />
                                                    &nbsp;<asp:Button ID="BtnCancelarNivel" runat="server" Text="CANCELAR" class="btn btn-primary" CausesValidation="False" />
                                                </div>

                                                <br />
                                                <asp:GridView ID="GVNivelEducativo" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:BoundField DataField="DS_ESCOLARIDAD" HeaderText="CATEGORIA ESCOLARIDAD" />
                                                        <asp:BoundField HeaderText="NIVEL EDUCATIVO" DataField="DS_ANIO" />
                                                        <asp:BoundField HeaderText="OPCIÓN ACADÉMICA" DataField="DS_CARRERA" />
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
                                            <ajaxToolkit:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="PanelHabilidades" BorderColor="Orange" />
                                            <asp:Panel ID="PanelHabilidades" runat="server">
                                                <div align="center">
                                                    <asp:Label ID="Label46" runat="server" Text="Habilidades" Font-Size="14"></asp:Label>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label class="control-label  col-sm-3" ID="Label42" runat="server" Font-Bold="True" Text="CONOCIMIENTO EN:"></asp:Label>
                                                    <div class="col-md-3">
                                                        <asp:DropDownList ID="CboCategoriaHabilidad" runat="server" class="form-control" DataTextField="DS_CATEGORIA_HABILIDAD" DataValueField="ID" AutoPostBack="True" OnSelectedIndexChanged="CboCategoriaHabilidad_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </div>

                                                    <asp:Label class="control-label  col-sm-3" ID="Label43" runat="server" Font-Bold="True" Text="TIPO DE CONOCIMIENTO:"></asp:Label>
                                                    <div class="col-md-3">
                                                        <asp:DropDownList ID="CboConocimiento" runat="server" class="form-control" DataTextField="DS_HABILIDAD_CONOCIMIENTO" DataValueField="ID">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label class="control-label  col-sm-3" ID="Label44" runat="server" Font-Bold="True" Text="NIVEL:"></asp:Label>
                                                    <div class="col-md-3">
                                                        <asp:DropDownList ID="CboNivel" runat="server" class="form-control" DataTextField="DS_NIVEL_CONOCIMIENTO" DataValueField="ID">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div align="center">
                                                    <asp:Button ID="BtnGuardarHabilidad" runat="server" Text="GUARDAR" class="btn btn-primary" OnClick="BtnGuardarHabilidad_Click" />
                                                    &nbsp;<asp:Button ID="Button5" runat="server" Text="CANCELAR" class="btn btn-primary" CausesValidation="False" />
                                                </div>
                                                <br />
                                                <asp:GridView ID="GVHabilidad" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="CONOCIMIENTO" DataField="DS_CATEGORIA_HABILIDAD" />
                                                        <asp:BoundField HeaderText="TIPO DE CONOCIMIENTO" DataField="DS_HABILIDAD_CONOCIMIENTO" />
                                                        <asp:BoundField HeaderText="NIVEL" DataField="DS_NIVEL_CONOCIMIENTO" />
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
                                            <ajaxToolkit:RoundedCornersExtender ID="RoundedCornersExtender3" runat="server" TargetControlID="PanelDestreza" BorderColor="Orange" />
                                            <asp:Panel ID="PanelDestreza" runat="server">
                                                <div align="center">
                                                    <asp:Label ID="Label48" runat="server" Text="Destrezas" Font-Size="14pt"></asp:Label>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label class="control-label  col-sm-3" ID="Label45" runat="server" Font-Bold="True" Text="DESTREZA:"></asp:Label>
                                                    <div class="col-md-3">
                                                        <asp:DropDownList ID="CboDestreza" runat="server" class="form-control" DataTextField="DS_DESTREZA" DataValueField="ID">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div align="center">
                                                    <asp:Button ID="BtnGuardarDestreza" runat="server" Text="GUARDAR" class="btn btn-primary" OnClick="BtnGuardarDestreza_Click" />&nbsp;<asp:Button ID="BtnCancelarDestreza" runat="server" Text="CANCELAR" class="btn btn-primary" CausesValidation="False" />
                                                </div>
                                                <br />
                                                <asp:GridView ID="GVDestreza" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="DESTREZA" DataField="DS_DESTREZA" />
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

                                            <ajaxToolkit:RoundedCornersExtender ID="RoundedCornersExtender5" runat="server" TargetControlID="PanelActividadesPasentia" BorderColor="Orange" />
                                            <asp:Panel ID="PanelActividadesPasentia" runat="server">
                                                <div align="center">
                                                    <asp:Label ID="Label63" runat="server" Text="Actividades" Font-Size="14pt"></asp:Label>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="Label64" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE ACTIVIDAD:"></asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox ID="TxtActividad" runat="server" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="Label65" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="DURACION EN DIAS:"></asp:Label>
                                                    <div class="col-md-3">
                                                        <asp:TextBox ID="TxtDuracionA" runat="server" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                                    </div>
                                                    <asp:Label ID="Label66" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="FECHA DE ENTREGA:"></asp:Label>
                                                    <div class="col-md-3">
                                                        <asp:TextBox ID="TxtFechaEntregaA" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label class="control-label  col-sm-3" ID="Label67" runat="server" Font-Bold="True" Text="DESCRIPCION:"></asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox class="form-control" ID="TxtDescripActividad" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <br />
                                                <div align="center">
                                                    <asp:Button ID="BtnActividades" runat="server" class="btn btn-primary" Text="GUARDAR" OnClick="BtnActividades_Click" />
                                                    &nbsp;<asp:Button ID="BtnCancelarActivades" runat="server" Text="CANCELAR" class="btn btn-primary" />
                                                </div>
                                                <asp:GridView ID="GVActividades" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="NOMBRE ACTIVIDAD" DataField="DS_ACTIVIDAD" />
                                                        <asp:BoundField HeaderText="FECHA DE ENTREGA" DataField="FECH_ENTREGA_ACT" />
                                                        <asp:BoundField HeaderText="DESCRIPCIÓN" DataField="DS_DESCRIPCION_ACT" />
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

                                            <ajaxToolkit:RoundedCornersExtender ID="RoundedCornersExtender4" runat="server" TargetControlID="PanelDatoAspirante" BorderColor="Orange" />
                                            <asp:Panel ID="PanelDatoAspirante" runat="server" Visible="False">
                                                <div align="center">
                                                    <asp:Label ID="Label49" runat="server" Text="Datos Aspirantes" Font-Size="14pt"></asp:Label>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="Label50" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE ASPIRANTE:"></asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox ID="TxtNombreA" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="Label51" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="EDAD:"></asp:Label>
                                                    <div class="col-md-3">
                                                        <asp:TextBox ID="TxtEdad" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <asp:Label ID="Label52" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="SEXO:"></asp:Label>
                                                    <div class="col-md-3">
                                                        <asp:TextBox ID="TxtSexo" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="Label53" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="TIPO ASPIRANTE:"></asp:Label>
                                                    <div class="col-md-3">
                                                        <asp:TextBox ID="TxtTipoAspirante" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <asp:Label ID="Label54" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NIT:"></asp:Label>
                                                    <div class="col-md-3">
                                                        <asp:TextBox ID="TxtNit" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </asp:Panel>
                                        <br />
                                        <asp:Panel ID="PanelListadoPasantia" runat="server" Visible="true">
                                            <div align="left">
                                                <asp:Button ID="BtnNuevaPasantia" runat="server" Text="NUEVA PASANTIA" class="btn btn-primary" CausesValidation="False" OnClick="BtnNuevaPasantia_Click" />
                                            </div>
                                            <br />
                                            <asp:GridView ID="GVPasantia" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnRowUpdating="GVPasantia_RowUpdating" OnSelectedIndexChanged="GVPasantia_SelectedIndexChanged" DataKeyNames="ID">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TxtIDPasantiaGV" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="PASANTÍA" DataField="NOMBRE_PASANTIA" />
                                                    <asp:BoundField HeaderText="ÁREA DE PASANTÍA" DataField="DS_AREA" />
                                                    <asp:BoundField HeaderText="DURACIÓN DE PASANTÍA" DataField="DS_DURACION" />
                                                    <asp:BoundField HeaderText="ESTADO" DataField="Estado" />
                                                    <asp:TemplateField HeaderText="Actualizar">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnActualizarPasantia" runat="server" CommandName="Update"
                                                                Text="Editar" OnClientClick="return confirm('¿Desea editar este registro?');" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="VER ASPIRANTES">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnVerAspirantes" runat="server" CommandName="Select"
                                                                Text="Ver Aspirantes" />
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
                                            <asp:Panel ID="PanelAspirantes" runat="server" Visible="False">
                                                <asp:GridView ID="GVAspirantes" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID" OnSelectedIndexChanged="GVAspirantes_SelectedIndexChanged" EmptyDataText="No existen registros">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="NOMBRE ASPIRANTE" DataField="NOMBRE" />
                                                        <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" />
                                                        <asp:TemplateField HeaderText="ACTIVIDADES">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BtnVerActividades" runat="server" CommandName="Select"
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
                                                <center> <asp:Button ID="BtnRegresarPasantias" runat="server" class="btn btn-primary" OnClick="BtnRegresarPasantias_Click" Text="Regresar a Listado Pasantias" /></center>
                                            </asp:Panel>
                                            <br />
                                            <asp:Panel ID="PanelActividadAspirante" runat="server" Visible="False">
                                                <asp:GridView ID="GVActividadAspirante" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Visible="False" Width="100%" EmptyDataText="No existen registros">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="NOMBRE ACTIVIDAD" DataField="DS_ACTIVIDAD" />
                                                        <asp:BoundField HeaderText="FECHA DE ENTREGA" DataField="FECH_ENTREGA_ACT" />
                                                        <asp:BoundField HeaderText="ESTADO" DataField="CD_ESTADO" />
                                                        <asp:BoundField HeaderText="COMENTARIO ASPIRANTE" DataField="DS_COMENTARIO" />
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
                                                <center> <asp:Button ID="Button1" runat="server" class="btn btn-primary" OnClick="BtnRegresarAspirantes_Click" Text="Regresar a Listado Aspirantes" /></center>
                                            </asp:Panel>
                                        </asp:Panel>
                                        <br />

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </ajaxToolkit:TabPanel>
                        <%--fin tab datos--%>
                        <ajaxToolkit:TabPanel runat="server" HeaderText="PROYECTO" ID="TabPanel3">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPProyecto" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnProyectoGuardar" />
                                    </Triggers>
                                    <ContentTemplate>

                                        <%--inicio tab proyecto--%>
                                        <br />
                                        <asp:Panel ID="PanelRegistroProyecto" runat="server" Visible="false">
                                            <div align="center">
                                                <asp:Label ID="Label68" runat="server" Text="REGISTRO DE PROYECTO" Font-Size="14pt"></asp:Label>
                                                <br />
                                            </div>
                                            <br />
                                            <asp:TextBox ID="TxtIdProyecto" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label61" runat="server" Font-Bold="True" Text="TITULO PROYECTO:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtTituloProyecto" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtTituloProyecto" ValidationGroup="proyecto">Llenar Titulo Pasantia</asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label9" runat="server" Font-Bold="True" Text="No CONTRATO:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox class="form-control" ID="TxtContrato" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtContrato" ValidationGroup="proyecto">Llenar No de contrato</asp:RequiredFieldValidator>
                                                </div>
                                                <asp:Label class="control-label  col-sm-3" ID="Label12" runat="server" Font-Bold="True" Text="DURACIÓN DE CONTRATO (DÍAS):"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox class="form-control" ID="TxtDuracionC" runat="server" AutoCompleteType="Disabled" TextMode="Number" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label33" runat="server" Font-Bold="True" Text="DESCRIPCIÓN DE PROYECTO:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtDescProyecto" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtDescProyecto" ValidationGroup="proyecto">Llenar nombre de proyecto</asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label38" runat="server" Font-Bold="True" Text="FECHA DE INICIO DE CONTRATO:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox class="form-control" ID="TxtFechIniCont" runat="server" TextMode="Date" AutoCompleteType="Disabled"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtFechIniCont" ValidationGroup="proyecto">Llenar fecha de inicio de contrato</asp:RequiredFieldValidator>
                                                </div>
                                                <asp:Label class="control-label  col-sm-3" ID="Label39" runat="server" Font-Bold="True" Text="ESTADO"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:DropDownList ID="CboEstadoPro" runat="server" class="form-control">
                                                        <asp:ListItem Value="1">Disponible</asp:ListItem>
                                                        <asp:ListItem Value="2">No disponible</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label40" runat="server" Font-Bold="True" Text="MONTO DE PROYECTO:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox class="form-control" ID="TxtMontoPro" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TxtMontoPro" ValidationGroup="proyecto">Llenar monto de proyecto</asp:RequiredFieldValidator>
                                                </div>
                                            </div>


                                            <div align="center">
                                                <asp:Button ID="BtnProyectoGuardar" runat="server" Text="GUARDAR PROYECTO" class="btn btn-primary" ValidationGroup="proyecto" OnClick="BtnProyectoGuardar_Click" />
                                                &nbsp;<asp:Button ID="BtnRegresarPro" runat="server" Text="CANCELAR" class="btn btn-primary" CausesValidation="False" OnClick="BtnRegresarPro_Click" />
                                            </div>
                                        </asp:Panel>

                                        <asp:Panel ID="PanelProyecto" runat="server">
                                            <div align="left">
                                                <asp:Button ID="BtnNuevoProyecto" runat="server" Text="NUEVO PROYECTO" class="btn btn-primary" CausesValidation="False" OnClick="BtnNuevoProyecto_Click" />
                                            </div>
                                            <br />

                                            <asp:GridView ID="GVContrato" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GVContrato_SelectedIndexChanged" DataKeyNames="ID">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TxtIDPasantiaGV" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="NOMBRE DE PROYECTO" DataField="DS_NOMBRE_CONSULTORIA" />
                                                    <asp:BoundField HeaderText="FECHA DE CONTRATO" DataField="FECH_INICIO_CONTRATO" />
                                                    <asp:BoundField HeaderText="DURACIÓN DE CONTRATO" DataField="DS_CONTRATO_DURACION" />
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
                                            <br />
                                        </asp:Panel>
                                        <asp:Panel ID="PanelEntregable" runat="server" Visible="false">
                                            <div align="center">
                                                <asp:Label ID="Label59" runat="server" Text="REGISTRO DE ENTREGABLES" Font-Size="14pt"></asp:Label>
                                            </div>
                                            <br />
                                            <div class="form-group">
                                                <asp:Label ID="Label55" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE ENTREGABLE:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox ID="TxtNombEntregable" runat="server" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label56" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="DURACION EN DIAS:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtDuracionE" runat="server" class="form-control" AutoCompleteType="Disabled" ReadOnly="true" TextMode="Number"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label57" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="FECHA DE ENTREGA:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtFechaEntrega" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label58" runat="server" Font-Bold="True" Text="DESCRIPCION:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtDescripPasantia" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>
                                            </div>
                                            <br />
                                            <div align="center">
                                                <asp:Button ID="BtnGuardarEntregable" runat="server" class="btn btn-primary" Text="GUARDAR ENTREGABLE" OnClick="BtnGuardarEntregable_Click" />
                                                &nbsp;<asp:Button ID="BtnCancelarEntregable" runat="server" Text="CANCELAR" class="btn btn-primary" CausesValidation="False" OnClick="BtnCancelarEntregable_Click" />
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="PanelListaEntregable" runat="server" Visible="false">
                                            <div align="left">
                                                <asp:TextBox ID="TxtIdProyecto1" runat="server" Text="0" Visible="False"></asp:TextBox>
                                                <asp:Button ID="BtnNuevoEntregable" runat="server" Text="NUEVO ENTREGABLE" class="btn btn-primary" CausesValidation="False" OnClick="BtnNuevoEntregable_Click" />
                                                <asp:Button ID="BtnRegresarProyec" runat="server" Text="REGRESAR" class="btn btn-primary" CausesValidation="False" OnClick="BtnRegresarProyec_Click" />
                                            </div>
                                            <br />
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-2" ID="LblProyecto1" runat="server" Font-Bold="True" Text="NOMBRE DE PROYECTO:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtNombrePro" runat="server" ReadOnly="true" AutoCompleteType="Disabled"></asp:TextBox>
                                                    <asp:TextBox ID="TxtIdConsultoA" runat="server" Text="0" Visible="False"></asp:TextBox>
                                                </div>
                                            </div>
                                            <br />

                                            <asp:GridView ID="GVEntregable" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GVEntregable_SelectedIndexChanged" DataKeyNames="ID,DS_ENTREGABLE">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="NOMBRE DE ENTREGABLE" DataField="DS_ENTREGABLE" />
                                                    <asp:BoundField HeaderText="FECHA DE ENTREGA" DataField="FECH_ENTREGA_ENT" />
                                                    <asp:BoundField HeaderText="DESCRIPCIÓN" DataField="DS_DESCRIPCION_ENT" />
                                                    <asp:TemplateField HeaderText="VER ASPIRANTES">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnVerAspirantes" runat="server" CommandName="Select" Text="Ver Aspirantes" />
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

                                        <asp:Panel ID="PanelAspirantesE" runat="server" Visible="false">
                                            <div align="left">
                                                <asp:Button ID="BtnRegresar1" runat="server" Text="REGRESAR" class="btn btn-primary" CausesValidation="False" OnClick="BtnRegresar1_Click" />
                                            </div>
                                            <asp:TextBox ID="TxtIdConsultoria" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <asp:TextBox ID="TxtIdAspirante" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <br />
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-2" ID="Label69" runat="server" Font-Bold="True" Text="NOMBRE DE PROYECTO:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtProyectoNomb" runat="server" ReadOnly="true" AutoCompleteType="Disabled"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-2" ID="Label80" runat="server" Font-Bold="True" Text="NOMBRE ENTREGABLE:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtEntregableNomb" runat="server" ReadOnly="true" AutoCompleteType="Disabled"></asp:TextBox>

                                                </div>
                                            </div>
                                            <br />
                                            <asp:GridView ID="GVAspirantesEntregables" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID1,ID" OnSelectedIndexChanged="GVAspirantesEntregables_SelectedIndexChanged">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="DS_COMPLETO" HeaderText="ASPIRANTE" />
                                                    <asp:BoundField HeaderText="DESCARGAR" />
                                                    <asp:BoundField DataField="CD_ESTADO_ENTREGABLE" HeaderText="ESTADO" />
                                                    <asp:TemplateField HeaderText="VER DETALLE">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnVerDetalles" runat="server" CommandName="Select" Text="Ver Detalle" />
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
                                        <asp:Panel ID="PanelDetalleEntregable" runat="server" Visible="false">
                                            <asp:TextBox ID="TxtIdConsulEntrega" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <div align="center">
                                                <asp:Label ID="Label75" runat="server" Text="DETALLE DE ENTREGABLE" Font-Size="14pt"></asp:Label><br />
                                            </div>
                                            <br />

                                            <div class="form-group">
                                                <asp:Label ID="Label76" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRES:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtNombre" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label77" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="APELLIDOS:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtApellido" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label70" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE ENTREGABLE:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox ID="TxtNombreEntregable" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label71" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="DURACION EN DIAS:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtDuracionEntregable" runat="server" class="form-control" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label72" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="FECHA DE ENTREGA:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:TextBox ID="TxtFechaEntregaEntregable" runat="server" class="form-control" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label73" runat="server" Font-Bold="True" Text="DESCRIPCION:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtDescripcion" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Enabled="False" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label74" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="ESTADO ENTREGABLE:"></asp:Label>
                                                <div class="col-md-3">
                                                    <asp:DropDownList ID="CboEstadoEntregable" runat="server">
                                                        <asp:ListItem Value="B">Aprobado</asp:ListItem>
                                                        <asp:ListItem Value="R">Rechazado</asp:ListItem>
                                                        <asp:ListItem Value="O">Con Observación</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label class="control-label  col-sm-3" ID="Label78" runat="server" Font-Bold="True" Text="OBSERVACIÓN:"></asp:Label>
                                                <div class="col-md-9">
                                                    <asp:TextBox class="form-control" ID="TxtObservEntregable" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Enabled="true" Width="100%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div align="center">
                                                <asp:Button ID="BtnGuardarObservacion" runat="server" class="btn btn-primary" Text="GUARDAR OBSERVACIÓN" OnClick="BtnGuardarObservacion_Click" />
                                                &nbsp;<asp:Button ID="BtnCancelarObservacion" runat="server" Text="REGRESAR" class="btn btn-primary" CausesValidation="False" OnClick="BtnCancelarObservacion_Click" />
                                            </div>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </ajaxToolkit:TabPanel>
                        <ajaxToolkit:TabPanel ID="TabPanel5" runat="server" HeaderText="Encuesta Desempeño">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPEncuestaDes" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnGuardarEncuesta" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <asp:Panel ID="PanelEncuestaDes" runat="server">
                                            <br />

                                            <p style="text-align: center; font-weight: bold">
                                                Percepción del desempeño y competencias laborales de pasantes del programa PIXELS CAPS VIDEOJUEGOS</p>
                                            <br />
                                           <asp:Label ID="LblInfoEmp" runat="server" Text="Label"> La finalidad de esta encuesta es conocer a nivel general el desempeño laboral del o los pasantes que estuvieron dentro de la empresa.<br />
                                            <br />
                                            <b>Nombre de la empresa:</b> {{ds_nombre_empresa}}
                                             <br />
                                           <b> Responsable:</b> {{ds_nombre_contacto}}
                                             <br />
                                           <b> Dirección:</b> {{ds_direccion_empresa}}
                                              <br />
                                            <b>Teléfono:</b> {{ds_telefono_contacto}}
                                            </asp:Label>
                                            <br />
                                            <asp:TextBox ID="TxtIdEvaRendimiento" runat="server" Visible="False"></asp:TextBox>
                                            
                                            <br />
                                            <ol>
                                                <li>Como fue el desempeño laboral del/ o los pasasantes dentro de la empresa?</li>
                                                
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                        <asp:TextBox class="form-control" ID="TxtPregunta1" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <li>El o la pasante acataban las indicaciones o asignaciones de parte de la persona responsable</li>
                                                
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                        <asp:TextBox class="form-control" ID="TxtPregunta2" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <li>Tuvieron algún tipo de inconveniente con el o la pasante a nivel de convivencia.</li>
                                                
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                        <asp:TextBox class="form-control" ID="TxtPregunta3" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <li>El trabajo que realizó el o la pasante cumplió con la calidad solicitada</li>
                                                
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                        <asp:TextBox class="form-control" ID="TxtPregunta4" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <li>El o la estudiante proponía ideas para mejorar el trabajo asignado.</li>
                                                
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                        <asp:TextBox class="form-control" ID="TxtPregunta5" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <li>Comente las limitaciones a nivel de desempeño y competencia laboral que observó de parte de los pasantes.</li>
                                               
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                        <asp:TextBox class="form-control" ID="TxtPregunta6" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <li>A la empresa le benefició en sus actividades laborales contar con el aporte generado por el pasante durante las seis semanas.</li>
                                                
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                        <asp:TextBox class="form-control" ID="TxtPregunta7" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <li>Estaría dispuesto a continuar apoyando a pasantes del programa PIXELS CAPS dentro de la empresa.</li>
                                                
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                        <asp:TextBox class="form-control" ID="TxtPregunta8" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <li>Recomendaciones y observaciones sobre las pasantías.</li>
                                                
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                        <asp:TextBox class="form-control" ID="TxtPregunta9" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </ol>
                                            <div align="center">
                                                <asp:Button ID="BtnGuardarEncuesta" runat="server" class="btn btn-primary" Text="GUARDAR" ValidationGroup="Encuesta" OnClientClick="return confirm('¿Desea enviar los resultados?');" OnClick="BtnGuardarEncuesta_Click" />
                                            </div>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </ajaxToolkit:TabPanel>
                    </ajaxToolkit:TabContainer>
                    <%--fin tab habilidades--%>
                </div>
                <%--fin contenido tab--%>
            </div>
            <%--fin container-fluid--%>
            <asp:Panel ID="PanelFicha" runat="server" CssClass="modalPopup" Height="540px">
                <br />
                <center>
        <rsweb:ReportViewer ID="RVEmpresa" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="427px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="75%" style="margin-right: 0px"><LocalReport ReportPath="EMP\RptEmpresa.rdlc"></LocalReport></rsweb:ReportViewer></center>
                <div align="center">
                    <br />
                    <br />
                    <asp:Button ID="BtnCerrarFicha" runat="server" Text="Cerrar" />
                </div>
            </asp:Panel>
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="PanelFicha" BackgroundCssClass="modalBackround" TargetControlID="BtnFicha" CancelControlID="BtnCerrarFicha"></ajaxToolkit:ModalPopupExtender>

        </form>
        <%--fin formulario--%>
    </asp:Panel>

</asp:Content>

