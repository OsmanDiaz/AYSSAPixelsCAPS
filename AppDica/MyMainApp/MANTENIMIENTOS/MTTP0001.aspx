<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMantenimiento.master" AutoEventWireup="true" CodeBehind="MTTP0001.aspx.cs" Inherits="MyMainApp.MANTENIMIENTOS.MTTP0001" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxtoolkit" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form id="form1" runat="server">
                    <div align="center">
                        <asp:Label ID="LblTitulo" runat="server" Text="Mantenimiento de Catálogo" Font-Bold="True" Font-Size="20pt"></asp:Label>
                       
                    </div>
                   <br />

                        <ajaxtoolkit:tabcontainer id="TabContainer1" runat="server" activetabindex="0" bordercolor="#66CCFF" scrollbars="Vertical" height="375px" width="100%">
                        <ajaxToolkit:TabPanel runat="server" HeaderText="DATOS" ID="TabPanel1" Width="100%">
                            <ContentTemplate>
                                 <asp:UpdatePanel ID="UPDatos" runat="server">
                                    <ContentTemplate>
                            <%--inicio contenido tab--%>
                                <br />
                                        <asp:GridView ID="GVDetalle" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField HeaderText="NOMBRE" />
                                                <asp:BoundField HeaderText="DESCRIPCION" />
                                                <asp:BoundField HeaderText="ESTADO" />
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
                                    <Triggers><asp:AsyncPostBackTrigger ControlID="BtnGuardarDatoGeneral" /></Triggers>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                             </ajaxToolkit:TabPanel>
                            <%--fin tab datos--%>
                            <ajaxToolkit:TabPanel runat="server" HeaderText="DETALLE" ID="TabPanel2">
                            <ContentTemplate>
                        <asp:UpdatePanel ID="UPDetalle" runat="server">
                            <Triggers><asp:AsyncPostBackTrigger ControlID="BtnDatosGuardar" /></Triggers>
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
      
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                             </ajaxToolkit:TabPanel>
                            <%--fin tab datos--%>
                            
                    </ajaxtoolkit:tabcontainer>
                        </form>
        </asp:Content>

