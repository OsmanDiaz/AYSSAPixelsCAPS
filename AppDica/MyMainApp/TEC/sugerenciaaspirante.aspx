<%@ Page Title="" Language="C#" MasterPageFile="~/MasterInicio.Master" AutoEventWireup="true" CodeBehind="sugerenciaaspirante.aspx.cs" Inherits="MyMainApp.EMP.sugerenciaaspirante" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPHPrincipal" runat="server">
     <form id="form1" runat="server">
     <asp:Panel ID="PanelAspirantes" runat="server" Visible="true">
                                            <asp:GridView ID="GVAsignacionAspirantes" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="id_aspirante" OnSelectedIndexChanged="GVAsignacionAspirantes_SelectedIndexChanged" EmptyDataText="No existen registros">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="NOMBRE ASPIRANTE" DataField="NOMBRE" />
                                                    <asp:BoundField DataField="Edad" HeaderText="EDAD" />
                                                    <asp:BoundField DataField="discapacidad" HeaderText="DISCAPACIDAD" />
                                                    <asp:BoundField DataField="Semejanzas" HeaderText="SEMEJANZA" />
                                                    <asp:TemplateField HeaderText="ASIGNAR">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnAsignarPasantia" runat="server" CommandName="Select"
                                                                Text="Asignar" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Ver Aspirante">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnVerAspirante" runat="server" CommandName="Select"
                                                                Text="Ver Aspirante" />
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
                                            <asp:GridView ID="GVAspirantes" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" EmptyDataText="No existen registros" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GVAspirantes_SelectedIndexChanged" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE ASPIRANTE" />
                                                    <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" />
                                                    <asp:TemplateField HeaderText="ACTIVIDADES">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BtnVerActividades" runat="server" CommandName="Select" Text="Ver Actividades" />
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
     </form>
</asp:Content>
