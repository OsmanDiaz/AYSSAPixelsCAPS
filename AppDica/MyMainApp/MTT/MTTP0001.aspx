<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMantenimiento.master" AutoEventWireup="true" CodeBehind="MTTP0001.aspx.cs" Inherits="MyMainApp.MANTENIMIENTOS.MTTP0001" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <form id="form1" runat="server">
        <div class="container-fluid">
                    <div id="content">
        <div align="center">
            <asp:Label ID="LblTitulo" runat="server" Text="Mantenimiento de Catálogo" Font-Bold="True" Font-Size="20pt"></asp:Label>

        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />

        <ajaxtoolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" BorderColor="#66CCFF" ScrollBars="Vertical" Height="375px" Width="100%">
            <ajaxtoolkit:TabPanel runat="server" HeaderText="DATOS" ID="TabPanel1" Width="100%">
                <ContentTemplate>
                    <asp:UpdatePanel ID="UPDatos" runat="server">
                        <ContentTemplate>
                            <%--inicio contenido tab--%>
                            <br />
                            <asp:Panel ID="PanelPerfil" runat="server">
                                <div align="center">
                                    <asp:Label ID="Label10" runat="server" Font-Size="14pt" Text="PERFIL DE USUARIO"></asp:Label>
                                    <br />
                                    <br /><br />
                                </div>
                            <asp:GridView ID="GVDetallePerfil" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False" OnRowDeleting="GVDetallePerfil_RowDeleting" DataKeyNames="ID" OnSelectedIndexChanged="GVDetallePerfil_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField Visible="False">
                                        <ItemTemplate>
                                           <asp:TextBox ID="TxtIdCodigo" runat="server" Text='<%#Eval("ID")%>' Visible="False"></asp:TextBox>
                                         </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ID" HeaderText="CODIGO" />
                                    <asp:BoundField HeaderText="NOMBRE " DataField="DS_NOMBRE_PERFIL" />
                                    <asp:BoundField HeaderText="DESCRIPCION" DataField="DS_DESCRIPCION" />
                                    <asp:BoundField HeaderText="ESTADO" DataField="CD_ESTADO_PERFIL" />
                                    <asp:TemplateField HeaderText="Actualizar">
                                        <ItemTemplate>
                                            <asp:Button ID="BtnActuPerfil" runat="server" CommandName="Select" Text="Actualizar" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Eliminar">
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
                            <asp:Panel ID="PanelActuPerfil" runat="server" Visible="false">
                                <div align="center">
                                    <asp:Label ID="Label5" runat="server" Font-Size="14pt" Text="ACTUALIZACION DE PERFIL USUARIO"></asp:Label>
                                    <br />
                                    <br /><br />
                                </div><asp:TextBox ID="TxtIdCodiP" runat="server" Text="0" Visible="False"></asp:TextBox>
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
                                    <asp:Button ID="BtnActualizarP" runat="server" class="btn btn-primary" Text="ACTUALIZAR" OnClick="BtnActualizarP_Click"/>
                                    <asp:Button ID="BtnRegresar" runat="server" class="btn btn-primary" Text="REGRESAR" OnClick="BtnRegresar_Click"  />
                                </div>
                            </asp:Panel>
                        </ContentTemplate>

                    </asp:UpdatePanel>
                </ContentTemplate>
            </ajaxtoolkit:TabPanel>
            <%--fin tab datos--%>
            <ajaxtoolkit:TabPanel runat="server" HeaderText="DETALLE" ID="TabPanel2">
                <ContentTemplate>
                    <asp:UpdatePanel ID="UPDetalle" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="PanelGuardar" runat="server">
                                <br />
                                <div align="center">
                                    <asp:Label ID="Label4" runat="server" Font-Size="14pt" Text="REGISTRO DE PERFIL USUARIO"></asp:Label>
                                    <br />
                                    <br /><br />
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="CODIGO:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtCodigo" runat="server" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtCodigo" ErrorMessage="Llenar Codigo " ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                    <asp:Label ID="Label3" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NOMBRE:"></asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TxtNombre" runat="server" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtNombre" ErrorMessage="Llenar Nombre" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <br />
                                <br />
                                <div class="form-group">
                                    <asp:Label class="control-label  col-sm-2" ID="Label67" runat="server" Font-Bold="True" Text="DESCRIPCION:"></asp:Label>
                                    <div class="col-md-9">
                                        <asp:TextBox class="form-control" ID="TxtDescripcion" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" Width="100%"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <br />
                                    <br />
                                    <asp:Label ID="Label2" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="ESTADO:"></asp:Label>
                                    <div class="col-md-3">
                                        <br />
                                        <asp:DropDownList ID="CboEstadoP" runat="server" class="form-control">
                                            <asp:ListItem Value="A">Activo</asp:ListItem>
                                            <asp:ListItem Value="I">Inactivo</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <br />
                                <br />
                                
                                <div align="center">
                                    <asp:Button ID="BtnGuardarPerfil" runat="server" class="btn btn-primary" Text="GUARDAR" OnClick="BtnGuardarPerfil_Click" />
                                </div>

                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>
            </ajaxtoolkit:TabPanel>
            <%--fin tab datos--%>
        </ajaxtoolkit:TabContainer>
                        </div>
            </div>
    </form>
</asp:Content>

