<%@ Page Title="" Language="C#" MasterPageFile="~/MasterProceso.master" AutoEventWireup="true" CodeBehind="TECP0001.aspx.cs" Inherits="MyMainApp.TEC.TECP0001" %>
<%@ Register Assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxtoolkit" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">

        <asp:Panel ID="Panel1" runat="server" Width="100%">
            <form id="form1" runat="server" class="form-horizontal">
                <%--inicio formulario--%>
                <div class="text-center">
                    <%--  div titulo--%>
                    <asp:Label ID="LblTitulo" runat="server" Text="Brecha" Font-Bold="True" Font-Size="18pt"></asp:Label>
                </div>
                <%--fin div titulo--%>
                <div class="container-fluid">
                    <div id="content">

                        

                        <%--inicio container-fluid--%>
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <ajaxToolkit:TabContainer id="TabContainer1" runat="server" activetabindex="0" bordercolor="#66CCFF" scrollbars="Vertical" height="375px" width="100%">
                        <ajaxToolkit:TabPanel runat="server" HeaderText="BRECHA" ID="TabPanel1" Width="100%">
<ContentTemplate>
<asp:UpdatePanel ID="UPDatoGeneral" runat="server"><ContentTemplate><%--inicio contenido tab--%><br /><asp:GridView ID="GVBrecha" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="id_habilidad_conocimiento,id_nivel_conocimiento" OnSelectedIndexChanged="GVBrecha_SelectedIndexChanged" EmptyDataText="No existen registros"><AlternatingRowStyle BackColor="White" /><Columns><asp:BoundField DataField="disponibles" HeaderText="ASPIRANTES DISPONIBLES" >
    <ItemStyle HorizontalAlign="Center" />
    </asp:BoundField>
    <asp:BoundField DataField="vacantes" HeaderText="PUESTOS VACANTES" >
    <ItemStyle HorizontalAlign="Center" />
    </asp:BoundField>
    <asp:BoundField DataField="habilidad" HeaderText="HABILIDAD" /><asp:BoundField DataField="nivel" HeaderText="NIVEL CONOCIMIENTO" /><asp:TemplateField HeaderText="Ver Aspirantes"><ItemTemplate><asp:Button ID="BtnVerAspirante" runat="server" CommandName="Select" Text="Ver Aspirante" /></ItemTemplate>
                                                    </asp:TemplateField>
                                                     </Columns>
                                                <EditRowStyle BackColor="#2461BF" /><FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" /><HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" /><PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" /><RowStyle BackColor="#EFF3FB" /><SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" /><SortedAscendingCellStyle BackColor="#F5F7FB" /><SortedAscendingHeaderStyle BackColor="#6D95E1" /><SortedDescendingCellStyle BackColor="#E9EBEF" /><SortedDescendingHeaderStyle BackColor="#4870BE" /></asp:GridView>
                                    <br /><div align="center"><asp:Button ID="BtnGuardarDatoGeneral" runat="server" class="btn btn-primary" Text="GUARDAR" />&#160;<asp:Button ID="Button2" runat="server" class="btn btn-primary" Text="CANCELAR" /></div>
                                    <br /></ContentTemplate>
<triggers><asp:AsyncPostBackTrigger ControlID="BtnGuardarDatoGeneral" />
</triggers>
</asp:UpdatePanel>

                            
</ContentTemplate>
                             
</ajaxToolkit:TabPanel>
                            <%--fin tab datos--%>
                            
<ajaxToolkit:TabPanel runat="server" HeaderText="INFO" ID="TabPanel2">
                            <ContentTemplate>
                        <asp:UpdatePanel ID="UPInfo" runat="server">
                            <Triggers><asp:AsyncPostBackTrigger ControlID="BtnInfoGuardar" /></Triggers>
                            <ContentTemplate>
                                    <br />
                                    <div class="form-group">
                                        <asp:Label class="control-label  col-sm-2" ID="Label17" runat="server" Font-Bold="True" Text="DEPARTAMENTO:"></asp:Label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DropDownList2" runat="server" class="form-control">
                                            </asp:DropDownList>
                                        </div>
                                        <asp:Label class="control-label  col-sm-2" ID="Label23" runat="server" Font-Bold="True" Text="MUNICIPIO:"></asp:Label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DropDownList3" runat="server" class="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label class="control-label  col-sm-2" ID="Label18" runat="server" Font-Bold="True" Text="DIRECCIÓN:"></asp:Label>
                                        <div class="col-md-8">
                                            <asp:TextBox class="form-control" ID="TextBox13" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label class="control-label  col-sm-2" ID="Label19" runat="server" Font-Bold="True" Text="INSTITUCIÓN EDUCATIVA:"></asp:Label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DropDownList10" runat="server" class="form-control">
                                            </asp:DropDownList>
                                        </div>
                                        <asp:Label class="control-label  col-sm-2" ID="Label28" runat="server" Font-Bold="True" Text="OTRO:"></asp:Label>
                                        <div class="col-md-3">
                                            <asp:TextBox class="form-control" ID="TextBox18" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label class="control-label  col-sm-2" ID="Label20" runat="server" Font-Bold="True" Text="EMAIL:"></asp:Label>
                                        <div class="col-md-3">
                                            <asp:TextBox class="form-control" ID="TextBox15" runat="server" TextMode="Email"></asp:TextBox>
                                        </div>
                                        <asp:Label class="control-label  col-sm-2" ID="Label26" runat="server" Font-Bold="True" Text="DISCAPACIDAD:"></asp:Label>
                                        <div class="col-md-3">
                                            <asp:TextBox class="form-control" ID="TextBox17" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label class="control-label  col-sm-2" ID="Label21" runat="server" Font-Bold="True" Text="PROMEDIO DE NOTAS:"></asp:Label>
                                        <div class="col-md-3">
                                            <asp:TextBox class="form-control" ID="TextBox16" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:Label class="control-label  col-sm-2" ID="Label27" runat="server" Font-Bold="True" Text="ESCOLARIDAD:"></asp:Label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DropDownList4" runat="server" class="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label class="control-label  col-sm-2" ID="Label22" runat="server" Font-Bold="True" Text="ADJUNTAR DOCUMENTOS:"></asp:Label>
                                        <div class="col-md-3">
                                            <input type="button" value="Adjuntar" onclick="open_win_doc">
                                        </div>
                                    </div>
                                    <br />
                                    <div align="center">
                                        <asp:Button ID="BtnInfoGuardar" runat="server" Text="GUARDAR" class="btn btn-primary"/>
                                        &nbsp;<asp:Button ID="Button5" runat="server" Text="CANCELAR" class="btn btn-primary"/>
                                    </div>
                                    <br />
      
                            <%--fin tab informacion adicional--%>
     
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            
</ContentTemplate>
                             
</ajaxToolkit:TabPanel>
                            <%--fin tab datos--%>
                            
<ajaxToolkit:TabPanel runat="server" HeaderText="DETALLE" ID="TabPanel3">
                            <ContentTemplate>
                        <asp:UpdatePanel ID="UPDetalle" runat="server">
                            <Triggers><asp:AsyncPostBackTrigger ControlID="BtnDetalleGuardar" /></Triggers>
                            <ContentTemplate>
            <%--inicio tab habilidades--%>
                <br />
                <div class="form-group">
                    <asp:Label class="control-label  col-sm-2" ID="Label9" runat="server" Font-Bold="True" Text="CONOCIMIENTO:"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="DropDownList5" runat="server" class="form-control">
                        </asp:DropDownList>
                    </div>
                    <asp:Label class="control-label  col-sm-2" ID="Label12" runat="server" Font-Bold="True" Text="HABILIDAD:"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="DropDownList6" runat="server" class="form-control">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label class="control-label  col-sm-2" ID="Label33" runat="server" Font-Bold="True" Text="NIVEL:"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="DropDownList7" runat="server" class="form-control">
                        </asp:DropDownList>
                    </div>
                </div>
                <div align="center">
                    <asp:Button ID="BtnDetalleGuardar" runat="server" Text="GUARDAR" class="btn btn-primary" />
                    &nbsp;<asp:Button ID="Button6" runat="server" Text="CANCELAR" class="btn btn-primary" />
                </div>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField HeaderText="Conocimientos" />
                        <asp:BoundField HeaderText="Habilidades" />
                        <asp:BoundField HeaderText="Nivel" />
                    </Columns>
                </asp:GridView>
                
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            
</ContentTemplate>
                             
</ajaxToolkit:TabPanel>
                            
                    
</ajaxToolkit:TabContainer>
                        <%--fin tab habilidades--%>
                    </div>
                    <%--fin contenido tab--%>
                </div>
                <%--fin container-fluid--%>
            </form>
            <%--fin formulario--%>
        </asp:Panel>
    </asp:Content>

