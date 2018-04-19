<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMantenimiento.master" AutoEventWireup="true" CodeBehind="MTTP0004.aspx.cs" Inherits="MyMainApp.MTT.MTTP0004" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
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
                    <ajaxtoolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" BorderColor="#66CCFF" ScrollBars="Vertical" Height="375px" Width="100%">
                        <ajaxtoolkit:TabPanel runat="server" HeaderText="DATOS" ID="TabPanel1" Width="100%">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPDatos" runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="PanelOpcion" runat="server">
                                        <br />
                                        <asp:GridView ID="GVOpcionSistema" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False" DataKeyNames="ID_SISTEMA,ID_MENU_SISTEMA,ID_OPCION_SISTEMA" OnRowDeleting="GVOpcionSistema_RowDeleting">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField Visible="False">
                                                    <ItemTemplate>
                                           <asp:TextBox ID="TxtIdCodigo" runat="server" Text='<%#Eval("ID_SISTEMA")%>' Visible="False"></asp:TextBox>
                                           <asp:TextBox ID="TxtIdMenu" runat="server" Text='<%#Eval("ID_MENU_SISTEMA")%>' Visible="False"></asp:TextBox>
                                           <asp:TextBox ID="TxtIdSistema" runat="server" Text='<%#Eval("ID_OPCION_SISTEMA")%>' Visible="False"></asp:TextBox>
                                         </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="CODIGO" DataField="ID_SISTEMA" />
                                                <asp:BoundField HeaderText="CODIGO MENU" DataField="ID_MENU_SISTEMA" />
                                                <asp:BoundField HeaderText="CODIGO SISTEMA" DataField="ID_OPCION_SISTEMA" />
                                                <asp:BoundField DataField="DS_DESCRIPCION" HeaderText="DESCRIPCION" />
                                                
                                                <asp:TemplateField HeaderText="ELIMINAR">
                                                    <ItemTemplate>
                                            <asp:Button ID="BtnEliminarOpci" runat="server" CommandName="Delete" OnClientClick="return confirm('¿Desea eliminar este registro?');" Text="Eliminar" />
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
                        <%--fin tab datos--%>

                        <ajaxtoolkit:TabPanel runat="server" HeaderText="DETALLE" ID="TabPanel2">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPDetalle" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnDatosGuardar" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <br />
                                    <div align="center">
                                    <asp:Label ID="Label3" runat="server" Font-Size="14pt" Text="REGISTRO DE PANTALLA"></asp:Label>
                                    <br />
                                    <br /><br />
                                </div>
                                            <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="CODIGO SISTEMA:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="CboCodSis" runat="server" class="form-control" DataTextField="ID" DataValueField="ID">
                                        </asp:DropDownList>
                                    </div>
                                   </div>
                                <br />
                                <br /><div class="form-group">
                                    <asp:Label ID="Label11" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="CODIGO MENU:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="CboMenu" runat="server" class="form-control" DataTextField="ID" DataValueField="ID">
                                        </asp:DropDownList>
                                    </div>
                                    <asp:Label ID="Label12" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="CODIGO OPCION MENU:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="CboOpcionMenu" runat="server" class="form-control" DataTextField="ID" DataValueField="ID">
                                        </asp:DropDownList>
                                        
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
                                            <asp:Button ID="BtnDatosGuardar" runat="server" Text="GUARDAR" class="btn btn-primary" OnClick="BtnDatosGuardar_Click" />
                                            &nbsp;<asp:Button ID="Button5" runat="server" Text="CANCELAR" class="btn btn-primary" />
                                        </div>
                                        <br />

                                        <%--fin tab informacion adicional--%>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </ContentTemplate>

                        </ajaxtoolkit:TabPanel>
                        <%--fin tab datos--%>
                    </ajaxtoolkit:TabContainer>
                </div>
            </div>
        </form>

    </asp:Panel>
</asp:Content>

