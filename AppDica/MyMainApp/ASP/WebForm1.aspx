<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MyMainApp.ASP.WebForm1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        /*.modalBackround 
        {
            background-color: black;
            filter: alpha(opacity=0.9) !important;
            opacity: 0.6 !important;
            z-index: 20;
        }

        .modalPopup 
        {
            padding: 20px 0px 24px 10px;
            position: relative;
            width: 450px;
            height: 66px;
            background-color: white;
            border: 1px solid black;
        }﻿*/

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <ajaxToolkit:ComboBox ID="ComboBox1" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList">
            <asp:ListItem>hola</asp:ListItem>
            <asp:ListItem>ana</asp:ListItem>
            <asp:ListItem>osmin</asp:ListItem>
            <asp:ListItem>gabrui</asp:ListItem>
            <asp:ListItem>real </asp:ListItem>
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>anona</asp:ListItem>
            <asp:ListItem>america</asp:ListItem>
            <asp:ListItem>alberja</asp:ListItem>
            <asp:ListItem>alicia</asp:ListItem>
        </ajaxToolkit:ComboBox>
        <br />
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox1" />
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <br />
        <asp:Panel ID="Panel1" runat="server">
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Button ID="Button3" runat="server" Text="Button" />
            <br />
        </asp:Panel>
        <br />
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel2" TargetControlID="Button1" BackgroundCssClass="modalBackround" CancelControlID="Button3"></ajaxToolkit:ModalPopupExtender>

        <ajaxToolkit:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="Panel1" />

        <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" Width="100%">
            <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
               <ContentTemplate>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
              </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                <ContentTemplate>  <asp:Button ID="Button2" runat="server" Text="Button" />   </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
    </div>
    </form>
</body>
</html>
