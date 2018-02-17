<%@ Page Title="" Language="C#" MasterPageFile="~/MasterProceso.master" AutoEventWireup="true" CodeBehind="TECP0001.aspx.cs" Inherits="MyMainApp.TEC.TECP0001" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

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
                    <ajaxtoolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" BorderColor="#66CCFF" ScrollBars="Vertical" Height="375px" Width="100%">
                        <ajaxtoolkit:TabPanel runat="server" HeaderText="BRECHA" ID="TabPanel1" Width="100%">

                            <ContentTemplate>


                                <asp:UpdatePanel ID="UPBrecha" runat="server">
                                    <ContentTemplate>
                                        <%--inicio contenido tab--%>
                                        <div align="center">
                                            <asp:Label ID="Label47" runat="server" Text="Personal que se requiere segun habilidades" Font-Size="14pt"></asp:Label>
                                        </div>
                                        <asp:GridView ID="GVBrecha" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_habilidad_conocimiento,id_nivel_conocimiento" EmptyDataText="No existen registros" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GVBrecha_SelectedIndexChanged" Width="100%">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="habilidad" HeaderText="HABILIDAD" />
                                                <asp:BoundField DataField="nivel" HeaderText="NIVEL CONOCIMIENTO" />
                                                <asp:BoundField DataField="disponibles" HeaderText="ASPIRANTES DISPONIBLES">


                                                    <ItemStyle HorizontalAlign="Center" />


                                                </asp:BoundField>

                                                <asp:BoundField DataField="vacantes" HeaderText="PUESTOS VACANTES">


                                                    <ItemStyle HorizontalAlign="Center" />


                                                </asp:BoundField>


                                                <asp:TemplateField HeaderText="Ver Aspirantes">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BtnVerAspirante" runat="server" CommandName="Select" Text="Ver Aspirantes" />
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
                                        
                                        <asp:Panel ID="PanelSugerida" runat="server" Visible="false">
                                        <div align="center">
                                            <asp:Label ID="Label1" runat="server" Text="Personal sugerido a enviar a curso" Font-Size="14pt"></asp:Label>
                                        </div>
                                        <asp:GridView ID="GVAspirantes" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="id_aspirante" EmptyDataText="No existen registros" Visible="True" OnRowUpdating="GVAspirantes_RowUpdating">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="" Visible="false">
                                   <ItemTemplate><asp:TextBox ID="TxtIDAspiranteGV" runat="server" Text='<%#Eval("ID_ASPIRANTE")%>' Visible="False"></asp:TextBox>
                                   </ItemTemplate>
                                   </asp:TemplateField>
                                                <asp:TemplateField HeaderText="" Visible="false">
                                   <ItemTemplate><asp:TextBox ID="TxtNombreAspiranteGV" runat="server" Text='<%#Eval("NOMBRE")%>' Visible="False"></asp:TextBox>
                                   </ItemTemplate>
                                   </asp:TemplateField>
                                                <asp:BoundField HeaderText="NOMBRE ASPIRANTE" DataField="NOMBRE" />
                                                <asp:TemplateField HeaderText="ASIGNAR">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BtnAsignarPasantia" runat="server" CommandName="Update"
                                                            Text="Enviar a Capacitación" />
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
                                            <asp:Panel ID="PanelCurso" runat="server" Visible="False">         <div class="form-group">
                                           <div class="col-md-3">
                              <asp:TextBox ID="TxtNombreAspirante" runat="server" ReadOnly></asp:TextBox>
                                                </div>   
                                                 <asp:Label ID="Label2" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="CURSO"></asp:Label>
                        <div class="col-md-3">
 <asp:DropDownList ID="CboCurso" runat="server" class="form-control" DataTextField="DS_NOMBRE_CURSO" DataValueField="ID" AutoPostBack="True" OnSelectedIndexChanged="CboCurso_SelectedIndexChanged">
                                                </asp:DropDownList>
                              <asp:TextBox ID="TxtIdHabilidadConocimiento" runat="server" Visible="False">0</asp:TextBox>
                              <asp:TextBox ID="TxtIdAspirante" runat="server" Visible="False">0</asp:TextBox>
  </div>
                                                        <asp:Button ID="BtnAgregarACurso" runat="server" Text="Agregar a Curso" OnClick="BtnAgregarACurso_Click"  />
  </div>
                                            <div align="center"><asp:Label ID="Label3" runat="server" Text="Aspirantes en este Curso" Font-Size="14pt"></asp:Label></div>
           </asp:Panel>                                 <br />
<asp:GridView ID="GVAspirantesCurso" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="id" EmptyDataText="No existen registros">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField HeaderText="NOMBRE ASPIRANTE" DataField="NOMBRE" />
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
                                        <br />
                                    </ContentTemplate>
                                </asp:UpdatePanel>








                            </ContentTemplate>




                        </ajaxtoolkit:TabPanel>
                        <%--fin tab datos--%>

                        <ajaxtoolkit:TabPanel runat="server" HeaderText="INFO" ID="TabPanel2" Visible="false">


                            <ContentTemplate>




                                <asp:UpdatePanel ID="UPInfo" runat="server">


                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnInfoGuardar" />
                                    </Triggers>


                                    <ContentTemplate>


                                        <br />


                                        <div class="form-group">
                                            <asp:Label ID="Label17" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DEPARTAMENTO:"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:DropDownList ID="DropDownList2" runat="server" class="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <asp:Label ID="Label23" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="MUNICIPIO:"></asp:Label>
                                            <div class="col-md-3">
                                                <asp:DropDownList ID="DropDownList3" runat="server" class="form-control">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label18" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DIRECCIÓN:"></asp:Label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="TextBox13" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label19" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="INSTITUCIÓN EDUCATIVA:"></asp:Label>
                          <div class="col-md-3">
 <asp:DropDownList ID="DropDownList10" runat="server" class="form-control">
                                                </asp:DropDownList>
  </div>
 <asp:Label ID="Label28" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="OTRO:"></asp:Label>
 <div class="col-md-3">
     <asp:TextBox ID="TextBox18" runat="server" class="form-control"></asp:TextBox>
   </div>
  </div>
      <div class="form-group">


                                            <asp:Label ID="Label20" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="EMAIL:"></asp:Label>


                                            <div class="col-md-3">


                                                <asp:TextBox ID="TextBox15" runat="server" class="form-control" TextMode="Email"></asp:TextBox>


                                            </div>


                                            <asp:Label ID="Label26" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="DISCAPACIDAD:"></asp:Label>


                                            <div class="col-md-3">


                                                <asp:TextBox ID="TextBox17" runat="server" class="form-control"></asp:TextBox>


                                            </div>


                                        </div>


                                        <div class="form-group">


                                            <asp:Label ID="Label21" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="PROMEDIO DE NOTAS:"></asp:Label>


                                            <div class="col-md-3">


                                                <asp:TextBox ID="TextBox16" runat="server" class="form-control"></asp:TextBox>


                                            </div>


                                            <asp:Label ID="Label27" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="ESCOLARIDAD:"></asp:Label>


                                            <div class="col-md-3">


                                                <asp:DropDownList ID="DropDownList4" runat="server" class="form-control">
                                                </asp:DropDownList>


                                            </div>


                                        </div>


                                        <div class="form-group">


                                            <asp:Label ID="Label22" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="ADJUNTAR DOCUMENTOS:"></asp:Label>


                                            <div class="col-md-3">


                                                <input onclick="open_win_doc" type="button" value="Adjuntar">

                                                </input>
                                            </div>


                                        </div>


                                        <br />


                                        <div align="center">


                                            <asp:Button ID="BtnInfoGuardar" runat="server" class="btn btn-primary" Text="GUARDAR" />


                                            <asp:Button ID="Button5" runat="server" class="btn btn-primary" Text="CANCELAR" />


                                        </div>


                                        <br />





                                        <%--fin tab informacion adicional--%>
                                    </ContentTemplate>



                                </asp:UpdatePanel>





                            </ContentTemplate>




                        </ajaxtoolkit:TabPanel>
                        <%--fin tab datos--%>

                        <ajaxtoolkit:TabPanel runat="server" HeaderText="DETALLE" ID="TabPanel3"  Visible="false">


                            <ContentTemplate>




                                <asp:UpdatePanel ID="UPDetalle" runat="server">


                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnDetalleGuardar" />
                                    </Triggers>


                                    <ContentTemplate>


                                        <%--inicio tab habilidades--%>


                                        <br />


                                        <div class="form-group">


                                            <asp:Label ID="Label9" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="CONOCIMIENTO:"></asp:Label>


                                            <div class="col-md-3">


                                                <asp:DropDownList ID="DropDownList5" runat="server" class="form-control">
                                                </asp:DropDownList>


                                            </div>


                                            <asp:Label ID="Label12" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="HABILIDAD:"></asp:Label>


                                            <div class="col-md-3">


                                                <asp:DropDownList ID="DropDownList6" runat="server" class="form-control">
                                                </asp:DropDownList>


                                            </div>


                                        </div>


                                        <div class="form-group">


                                            <asp:Label ID="Label33" runat="server" class="control-label  col-sm-2" Font-Bold="True" Text="NIVEL:"></asp:Label>


                                            <div class="col-md-3">


                                                <asp:DropDownList ID="DropDownList7" runat="server" class="form-control">
                                                </asp:DropDownList>


                                            </div>


                                        </div>


                                        <div align="center">


                                            <asp:Button ID="BtnDetalleGuardar" runat="server" class="btn btn-primary" Text="GUARDAR" />


                                            <asp:Button ID="Button6" runat="server" class="btn btn-primary" Text="CANCELAR" />


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

