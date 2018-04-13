<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMantenimiento.master" AutoEventWireup="true" CodeBehind="MTTP0002.aspx.cs" Inherits="MyMainApp.MTT.MTTP0002" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxtoolkit" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
        <asp:Panel ID="Panel1" runat="server"  Width="100%">
     <form id="form1" runat="server">
                    <div align="center">
                        <asp:Label ID="LblTitulo" runat="server" Text="Mantenimiento de Catálogo" Font-Bold="True" Font-Size="20pt"></asp:Label>
                       
                    </div>
                   <br />
         <div class="container-fluid">
                    <div id="content">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <ajaxtoolkit:tabcontainer id="TabContainer1" runat="server" activetabindex="0" bordercolor="#66CCFF" scrollbars="Vertical" height="375px" width="100%">
                        <ajaxToolkit:TabPanel runat="server" HeaderText="DATOS" ID="TabPanel1" Width="100%">
                            <ContentTemplate>
                                 <asp:UpdatePanel ID="UPDatos" runat="server">
                                    <ContentTemplate>
                            <%--inicio contenido tab--%>
                                <%--inicio tab datos--%>
                                <br />
                                        <asp:Panel ID="PanelSistema" runat="server">
                                        <asp:GridView ID="GVOpcionSistema" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField Visible="False">
                                                    <ItemTemplate>
                                           <asp:TextBox ID="TxtIdCodigo" runat="server" Text='<%#Eval("ID")%>' Visible="False"></asp:TextBox>
                                         </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="CODIGO" DataField="ID" >
                                                <ControlStyle Font-Size="Small" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="NOMBRE" DataField="DS_CODI_OPCI_SIST" >
                                                <ControlStyle Font-Size="Smaller" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="NOMBRE MENU" DataField="DS_NOMBRE_FORMA" >
                                                <ControlStyle Font-Size="Smaller" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="DS_RUTA_FORMA" HeaderText="ENLACE DE RUTA">
                                                <ControlStyle Font-Size="Smaller" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="DS_DESCRIPCION" HeaderText="DESCRIPCION">
                                                <ControlStyle Font-Size="Smaller" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="ACTUALIZAR">
                                                    <ItemTemplate>
                                            <asp:Button ID="BtnActuPerfil" runat="server" CommandName="Select" Text="Actualizar" />
                                        </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="ELIMINAR">
                                                    <ItemTemplate>
                                           <asp:Button ID="BtnEliminarPerfil" runat="server" CommandName="Delete" OnClientClick="return confirm('¿Desea eliminar este registro?');" Text="Eliminar" />
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
                                        <asp:Panel ID="PanelActuSistema" runat="server" Visible="false">
                                            <div align="center">
                                    <asp:Label ID="Label5" runat="server" Font-Size="14pt" Text="REGISTRO DE OPCION MENU"></asp:Label>
                                    <br />
                                    <br /><br />
                                </div><asp:TextBox ID="TxtIdCodiS" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <div class="form-group">
                                    <asp:Label ID="Label6" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="CODIGO:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtCodigo2" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label7" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOMBRE:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtNombre2" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <br /><div class="form-group">
                                    <asp:Label ID="Label1" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOMBRE MENU:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtNombMenu2" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label2" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="RUTA DE ENLACE:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtRuta2" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <br />
                                <div class="form-group">
                                    <asp:Label class="control-label  col-sm-2" ID="Label8" runat="server" Font-Bold="True" Text="DESCRIPCION:"></asp:Label>
                                    <div class="col-md-9">
                                        <asp:TextBox class="form-control" ID="TxtDescripcion2" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Width="100%"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <br />
                                    <br />
                                    <asp:Label ID="Label9" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="ESTADO:"></asp:Label>
                                    <div class="col-md-3">
                                        <br />
                                        <asp:DropDownList ID="CboEstado2" runat="server" class="form-control">
                                            <asp:ListItem Value="A">Activo</asp:ListItem>
                                            <asp:ListItem Value="I">Inactivo</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <br />
                                <br />
                                
                                <div align="center">
                                    <asp:Button ID="BtnActualizarS" runat="server" class="btn btn-primary" Text="ACTUALIZAR"/>
                                    <asp:Button ID="BtnRegresar" runat="server" class="btn btn-primary" Text="REGRESAR" />
                                </div>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                             </ajaxToolkit:TabPanel>
                            <%--fin tab datos--%>
                            <ajaxToolkit:TabPanel runat="server" HeaderText="DETALLE" ID="TabPanel2">
                            <ContentTemplate>
                        <asp:UpdatePanel ID="UPDetalle" runat="server">
                            <%--<Triggers><asp:AsyncPostBackTrigger ControlID="BtnDatosGuardar" /></Triggers>--%>
                            <ContentTemplate>
                                    <br />
                                    <div class="form-group">
                                        <asp:Label class="control-label  col-sm-2" ID="Label17" runat="server" Font-Bold="True" Text="NOMBRE:"></asp:Label>
                                        <div class="col-md-3">
                                           <asp:TextBox class="form-control" ID="TxtNombre" runat="server"></asp:TextBox>
                                        </div>
                                       
                                    </div>
                                    <div class="form-group">
                                        <asp:Label class="control-label  col-sm-2" ID="Label18" runat="server" Font-Bold="True" Text="DESCRIPCION:"></asp:Label>
                                        <div class="col-md-8">
                                            <asp:TextBox class="form-control" ID="TxtDescripcion" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        
                                        <asp:Label class="control-label  col-sm-2" ID="Label27" runat="server" Font-Bold="True" Text="ESTADO:"></asp:Label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DropDownList4" runat="server" class="form-control">
                                                <asp:ListItem Value="A">Activo</asp:ListItem>
                                                <asp:ListItem Value="I">Inactivo</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    
                                    <br />
                                    <div align="center">
                                        <asp:Button ID="BtnDatosGuardar" runat="server" Text="GUARDAR" class="btn btn-primary"/>
                                        &nbsp;<asp:Button ID="Button5" runat="server" Text="CANCELAR" class="btn btn-primary"/>
                                    </div>
                                    <br />
      
                            <%--fin tab informacion adicional--%>
     
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                             </ajaxToolkit:TabPanel>
                            <%--fin tab datos--%>
                            
                    </ajaxtoolkit:tabcontainer>
                        </div>
             </div>
                        </form>

        </asp:Panel>
        </asp:Content>

