﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FichaAspirante.aspx.cs" Inherits="MyMainApp.ASP.FichaAspirante" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <center>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="827px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="757px" style="margin-right: 0px">
            <LocalReport ReportPath="ASP\RptFichaAspirante.rdlc">
            </LocalReport>
        </rsweb:ReportViewer>
    
    </div>
    </form></center>
</body>
</html>
