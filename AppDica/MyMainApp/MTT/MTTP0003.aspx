<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMantenimiento.master" AutoEventWireup="true" CodeBehind="MTTP0003.aspx.cs" Inherits="MyMainApp.MTT.MTTP0003" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxtoolkit" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:Panel ID="Panel1" runat="server" Width="100%">
        <form id="form1" runat="server">
            <div align="center">
                <asp:Label ID="LblTitulo" runat="server" Text="Mantenimiento de Catálogo" Font-Bold="True" Font-Size="20pt"></asp:Label>

            </div>
            <br />
            <div class="container-fluid">
                <div id="content">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <ajaxtoolkit:tabcontainer id="TabContainer1" runat="server" activetabindex="0" bordercolor="#66CCFF" scrollbars="Vertical" height="375px" width="100%">
                        <ajaxtoolkit:TabPanel runat="server" HeaderText="DATOS" ID="TabPanel1" Width="100%">
                            <contenttemplate>
                        <asp:UpdatePanel ID="UPDatos" runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="PanelMenu" runat="server">
                                <br />
                                <asp:GridView ID="GVMenuSistema" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False" DataKeyNames="ID" OnSelectedIndexChanged="GVMenuSistema_SelectedIndexChanged">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField Visible="False">
                                            <ItemTemplate>
                                           <asp:TextBox ID="TxtIdCodigo" runat="server" Text='<%#Eval("ID")%>' Visible="False"></asp:TextBox>
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="CODIGO" DataField="ID" />
                                        <asp:BoundField HeaderText="NOMBRE MENU" DataField="DS_DESC_MENU" />
                                        <asp:BoundField HeaderText="DESCRIPCION" DataField="DS_DESCRIPCION" />
                                        <asp:BoundField DataField="NM_ORDEN_MENU" HeaderText="ORDEN MENU" />
                                        <asp:TemplateField HeaderText="ACTUALIZAR">
                                        <ItemTemplate>
                                            <asp:Button ID="BtnActuMenu" runat="server" CommandName="Select" Text="Actualizar" />
                                        </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ELIMINAR">
                                         <ItemTemplate>
                                           <asp:Button ID="BtnEliminarMenu" runat="server" CommandName="Delete" OnClientClick="return confirm('¿Desea eliminar este registro?');" Text="Eliminar" />
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
                                <asp:Panel ID="PanelActuMenu" runat="server" Visible="false">
                                    <div align="center">
                                    <asp:Label ID="Label1" runat="server" Font-Size="14pt" Text="ACTUALIZACION DE MENU"></asp:Label>
                                    <br />
                                    <br /><br />
                                </div><asp:TextBox ID="TxtIdCodiM" runat="server" Text="0" Visible="False"></asp:TextBox>
                                            <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="CODIGO:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtCodigo2" runat="server" class="form-control"></asp:TextBox>
                                     </div>
                                   </div>
                                <br />
                                <br /><div class="form-group">
                                    <asp:Label ID="Label5" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOMBRE MENU:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtNombMenu2" runat="server" class="form-control"></asp:TextBox>
                                         </div>
                                    <asp:Label ID="Label6" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NUMERO DE ORDEN:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtOrden2" runat="server" class="form-control"></asp:TextBox>
                                         </div>
                                </div>
                                <br />
                                <br />
                                <div class="form-group">
                                    <asp:Label class="control-label  col-sm-2" ID="Label7" runat="server" Font-Bold="True" Text="DESCRIPCION:"></asp:Label>
                                    <div class="col-md-9">
                                        <asp:TextBox class="form-control" ID="TxtDescripcion2" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Width="100%"></asp:TextBox>
                                    </div>
                                </div>
                                
                                <br />
                                <br />
                                
                                <div align="center">
                                    <asp:Button ID="BtnActuMenu" runat="server" class="btn btn-primary" Text="ACTUALIZAR" OnClick="BtnActuMenu_Click"/>
                                    <asp:Button ID="BtnRegresar" runat="server" class="btn btn-primary" Text="REGRESAR" OnClick="BtnRegresar_Click" />
                                </div>
                                </asp:Panel>
                            </ContentTemplate>
                          </asp:UpdatePanel>
                        </contenttemplate>

                        </ajaxtoolkit:TabPanel>
                        <%--fin tab datos--%>

                        <ajaxtoolkit:TabPanel runat="server" HeaderText="DETALLE" ID="TabPanel2">
                            <contenttemplate>
                        <asp:UpdatePanel ID="UPDetalle" runat="server">
                            <Triggers><asp:AsyncPostBackTrigger ControlID="BtnGuardarMenu" /></Triggers>
                            <ContentTemplate>
                                    <br />
                                    <div align="center">
                                    <asp:Label ID="Label3" runat="server" Font-Size="14pt" Text="REGISTRO DE MENU"></asp:Label>
                                    <br />
                                    <br /><br />
                                </div>
                                            <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="CODIGO:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtCodigo" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtCodigo" ErrorMessage="Llenar codigo" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                   </div>
                                <br />
                                <br /><div class="form-group">
                                    <asp:Label ID="Label11" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOMBRE MENU:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtNombMenu" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtNombMenu" ErrorMessage="Llenar Nombre Menu" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                    <asp:Label ID="Label12" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NUMERO DE ORDEN:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtOrden" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtOrden" ErrorMessage="Llenar Numero de orden" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
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
                                <p><br />
                                <br />
                                <br /></p>
                                
                                <div align="center">
                                    <asp:Button ID="BtnGuardarMenu" runat="server" class="btn btn-primary" Text="GUARDAR" OnClick="BtnGuardarMenu_Click"/>
                                </div>
      
                            <%--fin tab informacion adicional--%>
     
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            
</contenttemplate>

                        </ajaxtoolkit:TabPanel>
                        <%--fin tab datos--%>
                    </ajaxtoolkit:tabcontainer>
                </div>
            </div>
        </form>

    </asp:Panel>
</asp:Content>

