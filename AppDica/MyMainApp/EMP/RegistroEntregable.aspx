<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroEntregable.aspx.cs" Inherits="MyMainApp.EMP.RegistroEntregable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="PanelEntregable" runat="server">
            <div class="form-group">
                    <asp:Label ID="Label9" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="NOMBRE ENTREGABLE:"></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="TxtNombEntregable" runat="server"  class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                    </div>
            </div>
            <div class="form-group">
                    <asp:Label ID="Label1" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="DURACION EN DIAS:"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TxtDuracionE" runat="server" class="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label2" runat="server" class="control-label  col-sm-3" Font-Bold="True" Text="FECHA DE ENTREGA:"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TxtFechaEntrega" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                </div>
            <div class="form-group">
                    <asp:Label class="control-label  col-sm-3" ID="Label7" runat="server" Font-Bold="True" Text="DESCRIPCION:"></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox class="form-control" ID="TxtDescripPasantia" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
                    </div>
                </div>
             <br />
                <div align="center">
                    <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="GUARDAR" />
                    &nbsp;<asp:Button ID="Button2" runat="server" Text="CANCELAR" class="btn btn-primary" CausesValidation="False" />
                </div>
            <asp:GridView ID="GVEntregable" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="NOMBRE DE ENTREGABLE" />
                    <asp:BoundField HeaderText="FECHA DE ENTREGA" />
                    <asp:BoundField HeaderText="DESCRIPCIÓN" />
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
    </div>
    </form>
</body>
</html>
