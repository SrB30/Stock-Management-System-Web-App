﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockInUI.aspx.cs" Inherits="SAS_StockManagementSystemWebApp.UI.StockInUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Design/StoryStyleSheet.css" rel="stylesheet" />
    <style>
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
            position: -webkit-sticky; /* Safari */
            position: sticky;
            width: 100%;
        }

        li {
            float: left;
        }

            li a {
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

                /* Change the link color to #111 (black) on hover */
                li a:hover {
                    background-color: #111;
                }

        /*table.center {
                    text-align: center;
                }*/
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ul>
                <li center><a href="IndexUI.aspx">Home</a></li>
                <li><a href="CategoryUI.aspx">Category Setup</a></li>
                <li><a href="CompanyUI.aspx">Company Setup</a></li>
                <li><a href="ItemSetupUI.aspx">Item Setup</a></li>

                <li><a href="StockOutItemUI.aspx">Stock Out</a></li>
                <li><a href="ItemSummaryUI.aspx">Search & View Items Summary</a></li>
                <li><a href="ViewSalesUI.aspx">View Sales Between Two Dates</a></li>
            </ul>
        </div>
        <h1><b><i>Stock In</i></b></h1>
        <br />
        <br />

        <div align="center">
            <table class="center">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Company"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="companyDropDownList" runat="server" Height="23px" Width="175px" AutoPostBack="True" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged" ForeColor="Black"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Item"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="itemDropDownList" runat="server" Height="23px" Width="175px" AutoPostBack="True" OnSelectedIndexChanged="itemDropDownList_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Reorder Level"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="reorderTextBox" runat="server" ReadOnly="True" Height="23px" Width="171px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Available Quantity"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="availableQuantityTextBox" runat="server" ReadOnly="True" Height="23px" Width="171px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Stock In Quantity"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="stockInTextBox" runat="server" Height="23px" Width="171px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <br />

        <div align="center">
            <asp:Label ID="outputLabel" runat="server" ForeColor="red"></asp:Label>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
