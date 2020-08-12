<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexUI.aspx.cs" Inherits="SAS_StockManagementSystemWebApp.UI.IndexUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Design/HomeStyleSheet.css" rel="stylesheet" />
    <style>
        body {
            background: rgb(184, 189, 177);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <%--<div align="center">--%>
        <h1 align="center"><b><i>Stock Management System</i></b></h1>

        <p align="center" >
        <asp:HyperLink runat="server" NavigateUrl="LoginUI.aspx" BorderStyle="Double" BorderColor="white" Font-Bold="True" ForeColor="black" BackColor="white" >Log Out</asp:HyperLink>
        </p>
        <br/>
        <br/>
        
        <div align="center">
        <ul>
            <li><asp:HyperLink runat="server" NavigateUrl="CategoryUI.aspx">Category Setup</asp:HyperLink></li>
            <li><asp:HyperLink runat="server" NavigateUrl="CompanyUI.aspx">Company Setup</asp:HyperLink></li>
            <li><asp:HyperLink runat="server" NavigateUrl="ItemSetupUI.aspx">Item Setup</asp:HyperLink></li>
            
            <li><asp:HyperLink runat="server" NavigateUrl="StockInUI.aspx">Stock In</asp:HyperLink></li>
            <li><asp:HyperLink runat="server" NavigateUrl="StockOutItemUI.aspx">Stock Out</asp:HyperLink></li>
           
            <li><asp:HyperLink runat="server" NavigateUrl="ItemSummaryUI.aspx">Item Summary</asp:HyperLink></li>
            
            <li><asp:HyperLink runat="server" NavigateUrl="ViewSalesUI.aspx">View Sales Between Two Dates</asp:HyperLink></li>
        </ul>
        <br/>
    </div>
        <div align="center">
            <h3>-------------------------</h3>
            <h6>Shresta Biwas</h6>
            <h6>Shahadat Hossain</h6>
            <h6>Avishek Palit</h6>
        </div>
    </form>
</body>
</html>
