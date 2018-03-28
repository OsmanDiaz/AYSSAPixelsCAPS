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
                        
                        <ajaxtoolkit:TabContainer ID="TabContainer1" runat="server" activetabindex="2" bordercolor="#66CCFF" height="375px" scrollbars="Vertical" width="100%">
                            <ajaxtoolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="REGISTROS DE IQ" Width="100%">
                                <ContentTemplate>
                                    
                                    <asp:UpdatePanel ID="UPRegistroAspirante" runat="server">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnGuardarNotaIq" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <%--inicio contenido tab--%><%--inicio tab datos--%>
                                            
                                            <asp:Panel ID="PanelRegistroAspirante" runat="server"><br />
                                            <div align="center">
                                                <asp:Label ID="Label2" runat="server" Font-Size="14pt" Text="LISTA DE ASPIRANTES SIN REGISTRO DE IQ"></asp:Label>
                                                <br />
                                            </div>
                                            <br />
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
                                            <asp:UpdatePanel ID="UUPEntregable" runat="server">
                                    <ContentTemplate>   
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
                                                          <ajaxtoolkit:AsyncFileUpload ID="ArchivoIq" runat="server" OnUploadedComplete="ArchivoIq_UploadedComplete" PersistFile="True" />
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
                                                     </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <br />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </ajaxtoolkit:TabPanel>
                            <%--fin tab datos--%>
                            <ajaxtoolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="ASPIRANTES ASIGNADOS">
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UPAsignados" runat="server">
                                        
                                        <ContentTemplate><br />
                                            <div align="center">
                                                <asp:Label ID="Label69" runat="server" Font-Size="14pt" Text="LISTA DE ASPIRANTES ASIGNADOS"></asp:Label>
                                                <br />
                                            </div>
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
                            <ajaxtoolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
                                <HeaderTemplate>
                                    LISTA DE ASPIRANTES REGISTRADOS
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UPRegistroAspirantes" runat="server">
                                        <ContentTemplate>
                                            <asp:Panel ID="PanelListaRegistros" runat="server"><br />
                                                <div align="center">
                                                <asp:Label ID="Label68" runat="server" Text="LISTA DE ASPIRANTES REGISTRADOS" Font-Size="14pt"></asp:Label>
                                                <br />
                                            </div><asp:TextBox ID="TxtIdPasante" runat="server" Text="0" Visible="False"></asp:TextBox>
                                                <asp:GridView ID="GVListaRegistroAspirantes" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID" AutoGenerateColumns="False" OnSelectedIndexChanged="GVListaRegistroAspirantes_SelectedIndexChanged">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:BoundField DataField="DS_COMPLETO" HeaderText="NOMBRE COMPLETO ASPIRANTE" />
                                                        <asp:BoundField DataField="DS_SEXO" HeaderText="SEXO" />
                                                        <asp:BoundField DataField="CD_ESTADO_ASPIRANTE" HeaderText="ESTADO ACTUAL" />
                                                        <asp:TemplateField HeaderText="PERFIL">
                                                            <ItemTemplate>
                                                            <asp:Button ID="BtnVerPerfil" runat="server" CommandName="Select"
                                                                Text="Ver Perfil" />
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
                                            <asp:Panel ID="PanelPerfil" runat="server" Visible="false">
                                                <div align="left">
                                                <asp:Button ID="BtnRegresarLista" runat="server" Text="REGRESAR" class="btn btn-primary" CausesValidation="False" OnClick="BtnRegresarLista_Click"/></div>
                                        <div class="form-group">
                                            <div align="center">
                                                <asp:Label ID="Label16" runat="server" Text="PERFIL DEL ASPIRANTE" Font-Size="14pt"></asp:Label>
                                                
                                            </div><br /><br />
                                            <asp:Label ID="Label4" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOMBRES:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtNombreA" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label5" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="APELLIDOS:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtApellidoA" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label7" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="FECHA NACIMIENTO:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtFechNac" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                            
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label9" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="TELÉFONO (CASA):"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtTelCasa" runat="server" AutoCompleteType="Disabled" class="form-control" ReadOnly="true" onkeypress="return Documentos(event);" onPaste="return Documentos(event);"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label41" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="TELÉFONO (CELULAR):"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtTelCel" runat="server" AutoCompleteType="Disabled" class="form-control" ReadOnly="true" onkeydown="return Documentos(event);" onPaste="return Documentos(event);"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTelCel" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="DatoGeneral">Llenar Telefono Celular</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label10" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NIT:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtNitA" runat="server" class="form-control" onkeypress="return Documentos(event);" onPaste="return Documentos(event);" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label29" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DUI:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtDui" runat="server" AutoCompleteType="Disabled" class="form-control" ReadOnly="true" onkeypress="return Documentos(event);" onPaste="return Documentos(event);" TargetControlID="TxtDui"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label30" runat="server" class="control-label  col-sm-3" Font-Bold="True" readonly="" Text="EMAIL:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtEmail" runat="server" AutoCompleteType="Disabled" ReadOnly="true" class="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtEmail" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="DatoGeneral">Llenar email</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label11" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="SEXO:"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="TxtSexo" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label31" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="TIPO ASPIRANTE:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtTipoAspirante" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label12" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="TRATAMIENTO:"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="TxtTratamiento" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label26" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="DISCAPACIDAD 1:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtDiscapacidad1" runat="server" AutoCompleteType="Disabled" ReadOnly="true" class="form-control" onkeypress="return soloLetras(event);" onPaste="return soloLetras(event);"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label32" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DISCAPACIDAD 2:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtDiscapacidad2" runat="server" AutoCompleteType="Disabled" ReadOnly="true" class="form-control" onkeypress="return soloLetras(event);" onPaste="return soloLetras(event);"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label34" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="DISCAPACIDAD 3:"></asp:Label><div class="col-md-3">
                                                <asp:TextBox ID="TxtDiscapacidad3" runat="server" AutoCompleteType="Disabled" ReadOnly="true" class="form-control" onkeypress="return soloLetras(event);" onPaste="return soloLetras(event);"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label38" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="PAIS:"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="TxtPais" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label17" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DEPARTAMENTO:"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="TxtDepartamento" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label23" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="MUNICIPIO:"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="TxtMunicipio" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label18" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DIRECCIÓN:"></asp:Label><div class="col-md-8">
                                                <asp:TextBox ID="TxtDireccion" runat="server" AutoCompleteType="Disabled" ReadOnly="true" class="form-control" TextMode="MultiLine"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TxtDireccion" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="DatoGeneral">Llenar Direccion</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                      <div align="center">
                                                <asp:Label ID="Label13" runat="server" Text="REGISTRO DE PRUEBA IQ" Font-Size="14pt"></asp:Label>
                                                <br />
                                            </div><asp:Label ID="lblPruebaIq" runat="server" Visible="false"></asp:Label>
                                                <asp:GridView ID="GVNotaIq" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="NOTA OBTENIDA" DataField="NM_NOTA_IQ" />
                                                        <asp:BoundField HeaderText="OBSERVACION" DataField="DS_OBSERVACION_IQ" />
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
                                                </asp:GridView><hr />
                                                <div align="center">
                                                <asp:Label ID="Label8" runat="server" Text="ESCOLARIDAD DEL ASPIRANTE" Font-Size="14pt"></asp:Label>
                                                <br />
                                            </div><asp:Label ID="lblEscolaridad" runat="server" Visible="false"></asp:Label>
                                                <asp:GridView ID="GVEscolaridadA" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                
                                                <asp:BoundField DataField="DS_ESCOLARIDAD" HeaderText="ESCOLARIDAD" />
                                                <asp:BoundField DataField="DS_ANIO" HeaderText="NIVEL" />
                                                <asp:BoundField DataField="DS_CARRERA" HeaderText="OPCIÓN ACADÉMICA" />
                                                <asp:BoundField DataField="DS_CENTRO_ESCOLAR" HeaderText="INSTITUCIÓN EDUCATIVA" />
                                                <asp:BoundField DataField="DS_OTRA" HeaderText="OTRA INSTITUCIÓN" />
                                                <asp:BoundField DataField="DS_PAIS" HeaderText="PAÍS" />
                                                <asp:BoundField DataField="NM_ANIO_FIN" HeaderText="AÑO FIN" />
                                                <asp:BoundField DataField="NM_PROMEDIO_NOTA" HeaderText="PROMEDIO" />
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
                                        </asp:GridView><hr />
                                                <div align="center">
                                                <asp:Label ID="Label14" runat="server" Text="HABILIDADES DEL ASPIRANTE" Font-Size="14pt"></asp:Label>
                                                <br /><asp:Label ID="lblHabilidadA" runat="server" Visible="false"></asp:Label>
                                                </div>
                                                <asp:GridView ID="GVHabilidadA" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"  Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="" Visible="false">
                                                        
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
                                            </asp:GridView><hr />
                                                    <div align="center">
                                                <asp:Label ID="Label15" runat="server" Text="DESTREZAS DEL ASPIRANTE" Font-Size="14pt"></asp:Label>
                                                <br /> <asp:Label ID="lblDestrezaA" runat="server" Visible="false"></asp:Label>
                                            </div>
                                            <asp:GridView ID="GVDestrezaA" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"  Width="100%">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                
                                                <asp:BoundField DataField="DS_DESTREZA" HeaderText="DESTREZA" />
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
                                        </asp:GridView><hr />
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

