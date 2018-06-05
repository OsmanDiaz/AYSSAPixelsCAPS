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
                        <ajaxtoolkit:tabcontainer id="TabContainer1" runat="server" activetabindex="1" bordercolor="#66CCFF" scrollbars="Vertical" height="375px" width="100%">
                        <ajaxToolkit:TabPanel runat="server" HeaderText="DATOS" ID="TabPanel1" Width="100%">
                            <ContentTemplate>
                                 <asp:UpdatePanel ID="UPDatos" runat="server">
                                    <ContentTemplate>
                            <%--inicio contenido tab--%>
                                <%--inicio tab datos--%>
                                <br />
                                        <asp:Panel ID="PanelSistema" runat="server">
                                            <div align="center">
                                    <asp:Label ID="Label15" runat="server" Font-Size="14pt" Text="MENU - NIVEL 3"></asp:Label>
                                    <br />
                                    <br /><br />
                                </div>
                                        <asp:GridView ID="GVOpcionSistema" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False" DataKeyNames="ID" OnSelectedIndexChanged="GVOpcionSistema_SelectedIndexChanged" OnRowDeleting="GVOpcionSistema_RowDeleting">
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
                                            <asp:Button ID="BtnActuSis" runat="server" CommandName="Select" Text="Actualizar" />
                                        </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="ELIMINAR">
                                                    <ItemTemplate>
                                           <asp:Button ID="BtnEliminarSis" runat="server" CommandName="Delete" OnClientClick="return confirm('¿Desea eliminar este registro?');" Text="Eliminar" />
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
                                    <asp:Label ID="Label5" runat="server" Font-Size="14pt" Text="ACTUALIZACION DE MENU - NIVEL 3"></asp:Label>
                                    <br />
                                    <br /><br />
                                </div><asp:TextBox ID="TxtIdCodiS" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <div class="form-group">
                                    <asp:Label ID="Label6" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="CODIGO:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtCodigo2" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label7" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOMBRE:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtNombre2" runat="server" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <br /><div class="form-group">
                                    <asp:Label ID="Label1" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOMBRE MENU:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtNombMenu2" runat="server" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label2" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="RUTA DE ENLACE:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtRuta2" runat="server" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
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
                                    <asp:Button ID="BtnActualizarS" runat="server" class="btn btn-primary" Text="ACTUALIZAR" OnClick="BtnActualizarS_Click"/>
                                    <asp:Button ID="BtnRegresar" runat="server" class="btn btn-primary" Text="REGRESAR" OnClick="BtnRegresar_Click" />
                                </div><br />
                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                             </ajaxToolkit:TabPanel>
                            <%--fin tab datos--%>
                            <ajaxToolkit:TabPanel runat="server" HeaderText="DETALLE" ID="TabPanel2">
                            <ContentTemplate>
                        <asp:UpdatePanel ID="UPDetalle" runat="server">
                            <ContentTemplate>
                                    <br />
                                    <div align="center">
                                    <asp:Label ID="Label3" runat="server" Font-Size="14pt" Text="REGISTRO DE MENU - NIVEL 3"></asp:Label>
                                    <br />
                                    <br /><br />
                                </div>
                                            <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="CODIGO:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtCodigo" runat="server" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtCodigo" ErrorMessage="Llenar codigo" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                    <asp:Label ID="Label10" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOMBRE:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtNombre" runat="server" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtNombre" ErrorMessage="Llenar nombre" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <br />
                                <br /><div class="form-group">
                                    <asp:Label ID="Label11" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOMBRE MENU:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtNombMenu" runat="server" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtNombMenu" ErrorMessage="Llenar Nombre Menu" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                    <asp:Label ID="Label12" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="RUTA DE ENLACE:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtRuta" runat="server" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtRuta" ErrorMessage="Llenar Ruta de enlace" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <br />
                                <br />
                                <div class="form-group">
                                    <asp:Label class="control-label  col-sm-2" ID="Label13" runat="server" Font-Bold="True" Text="DESCRIPCION:"></asp:Label>
                                    <div class="col-md-9">
                                        <asp:TextBox class="form-control" ID="TxtDescripcion" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Width="100%"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <br />
                                    <br />
                                    <asp:Label ID="Label14" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="ESTADO:"></asp:Label>
                                    <div class="col-md-3">
                                        <br />
                                        <asp:DropDownList ID="CbEstadoS" runat="server" class="form-control">
                                            <asp:ListItem Value="A">Activo</asp:ListItem>
                                            <asp:ListItem Value="I">Inactivo</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <br />
                                <br />
                                
                                <div align="center">
                                    <asp:Button ID="BtnGuardarSistema" runat="server" class="btn btn-primary" Text="GUARDAR" OnClick="BtnGuardarSistema_Click"/>
      
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

