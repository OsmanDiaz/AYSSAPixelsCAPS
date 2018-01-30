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
                        <div class="form-group">
                            <asp:Label ID="Label17" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="PERIODO:"></asp:Label>
                            <div class="col-md-3">
                                <asp:DropDownList ID="CboPeriodoAsignado" runat="server" class="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <ajaxtoolkit:TabContainer ID="TabContainer1" runat="server" activetabindex="0" bordercolor="#66CCFF" height="375px" scrollbars="Vertical" width="100%">
                            <ajaxtoolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="REGISTROS DE ASPIRANTES" Width="100%">
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UPRegistroAspirante" runat="server">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="CboPeriodoAsignado" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <%--inicio contenido tab--%><%--inicio tab datos--%>
                                            <br />
                                            ||<br />
                                            <asp:GridView ID="GVRegistroAspirante" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="NOMBRE COMPLETO" DataField="DS_COMPLETO" />
                                                    <asp:BoundField HeaderText="SEXO" DataField="DS_SEXO" />
                                                    <asp:BoundField HeaderText="ESTADO" DataField="CD_ESTADO_ASPIRANTE" />
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
                            <ajaxtoolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="ASPIRANTES ASIGNADOS">
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UPAsignados" runat="server">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="CboPeriodoAsignado" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <br />
                                            <br />
                                            <asp:GridView ID="GVAspiranteAsignado" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="NOMBRE COMPLETO" DataField="DS_COMPLETO" />
                                                    <asp:BoundField HeaderText="ÁREA PASANTÍA" DataField="DS_AREA" />
                                                    <asp:BoundField HeaderText="DURACIÓN PASANTÍA" DataField="DS_DURACION" />
                                                    <asp:BoundField HeaderText="ESTADO" DataField="CD_ESTADO_ASPIRANTE" />
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

