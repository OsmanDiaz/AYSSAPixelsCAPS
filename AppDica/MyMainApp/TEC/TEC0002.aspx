<%@ Page Title="" Language="C#" MasterPageFile="~/MasterProceso.master" AutoEventWireup="true" CodeBehind="TEC0002.aspx.cs" Inherits="MyMainApp.TEC.TEC0002" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <asp:Panel ID="Panel1" runat="server" Width="100%">
        <form id="form1" runat="server" class="form-horizontal">
            <%--inicio formulario--%>
            <div class="text-center">
                <%--  div titulo--%>
                <asp:Label ID="LblTitulo" runat="server" Text="TABLERO DE CONTROL - EMPRESA" Font-Bold="True" Font-Size="18pt"></asp:Label>
            </div>
            <%--fin div titulo--%>
            <div class="container-fluid">
                <div id="content">
                    <%--inicio container-fluid--%>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <br />
                    <div class="form-group">
                        <asp:Label ID="Label34" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="PERIODO:"></asp:Label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="CboPeriodoEmpresa" runat="server" class="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <ajaxtoolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" BorderColor="#66CCFF" Height="375px" ScrollBars="Vertical" Width="100%">
                        <ajaxtoolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="REGISTROS DE EMPRESAS" Width="100%">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPRegistroEmp" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="CboPeriodoEmpresa" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <%--inicio contenido tab--%><%--inicio tab datos--%>
                                        <br />
                                        <asp:GridView ID="GVListaEmpresa" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField HeaderText="NOMBRE EMPRESA" />
                                                <asp:BoundField HeaderText="DEPARTAMENTO" />
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
                        </ajaxtoolkit:TabPanel>
                        <%--fin tab datos--%>
                        <ajaxtoolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="PASANTIAS">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPPasantias" runat="server">

                                    <ContentTemplate>
                                        <br />
                                        <div class="form-group">
                                            <asp:Label ID="Label1" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE DE EMPRESA:"></asp:Label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="TxtNombreEmpresa" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <br />
                                        <asp:GridView ID="GVListaPasantia" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">

                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField HeaderText="NOMBRE PASANTIA" />
                                                <asp:BoundField HeaderText="AREA PASANTIA" />
                                                <asp:BoundField HeaderText="DURACION PASANTIA" />
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
                                        <%--fin tab informacion adicional--%>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </ajaxtoolkit:TabPanel>
                        <%--fin tab datos--%>
                        <ajaxtoolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="ACTIVIDADES">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UPActividad" runat="server">

                                    <ContentTemplate>
                                        <%--inicio tab habilidades--%>
                                        <br />
                                         <div class="form-group">
                    <asp:Label ID="Label2" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE DE EMPRESA:"></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="TxtEmpresa" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="DURACIÓN DE PASANTIA:"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TxtDuracion" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label4" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="FECHA INICIO:"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TxtFechaInicio" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label9" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE DE EVALUADOR:"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TxtEvaluador" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label5" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="AREA DE PASANTIA:"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TxtAreaPasantia" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                    </div>
                    
                </div>
                <div class="form-group">
                    <asp:Label ID="Label6" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="SUCURSAL:"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TxtSucursal" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label7" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="ESTADO:"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TxtEstado" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label class="control-label  col-sm-3" ID="Label8" runat="server" Font-Bold="True" Text="DESCRIPCION DE PASANTIA:"></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox class="form-control" ID="TxtDescripPasantia" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>
                                        <br />
                                        <asp:GridView ID="GVListaEntregable" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField HeaderText="NOMBRE ENTREGABLE" />
                                                <asp:BoundField HeaderText="FECHA DE ENTREGA" />
                                                <asp:BoundField HeaderText="DESCRIPCION" />
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

