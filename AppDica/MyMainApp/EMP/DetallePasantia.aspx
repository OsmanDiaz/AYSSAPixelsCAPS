<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetallePasantia.aspx.cs" Inherits="MyMainApp.EMP.DetallePasantia" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Panel ID="Panel1" runat="server">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE DE EVALUADOR:"></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="TxtEvaluador" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="DURACIÓN DE PASANTIA:"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TxtDuracion" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label3" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="FECHA INICIO:"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TxtFechaInicio" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="AREA DE PASANTIA:"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TxtAreaPasantia" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label5" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="SUCURSAL:"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TxtSucursal" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label6" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="CANTIDAD DE VACANTES:"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TxtVacantes" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label class="control-label  col-sm-3" ID="Label7" runat="server" Font-Bold="True" Text="DESCRIPCION DE PASANTIA:"></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox class="form-control" ID="TxtDescripPasantia" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                    </div>
                </div>
                <br />
                <br />
                <asp:GridView ID="GVAspirantes" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="Nombre Aspirante" />
                        <asp:BoundField HeaderText="Estado" />
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

        </div>
    </form>
</body>
</html>
