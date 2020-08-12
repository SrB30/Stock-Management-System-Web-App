<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginUI.aspx.cs" Inherits="SAS_StockManagementSystemWebApp.UI.LoginUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Design/HomeStyleSheet.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 325px;
        }
        .auto-style4 {
            width: 172px;
        }
        .auto-style5 {
            width: 275px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr><td><br/><br/></td></tr>
                <tr></tr>
                <tr>
                    <td colspan="6" style="text-align: center; vertical-align: top">
                        <asp:Label runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" Font-Italic="True" Text="Welcome To Stock Management System"></asp:Label>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td style="text-align: center" class="auto-style4">
                        <asp:Label runat="server" Font-Size="X-Large" Text="UserName :"></asp:Label>
                    </td>
                    <td style="text-align: right" class="auto-style2">
                        <asp:TextBox ID="userNameTextBox" runat="server" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td style="text-align: center" class="auto-style4">
                        <asp:Label runat="server" Font-Size="X-Large" Text="Password :"></asp:Label>
                    </td>
                    <td style="text-align: right" class="auto-style2">
                        <asp:TextBox ID="passwordTextBox" runat="server" Font-Size="X-Large" TextMode="Password"></asp:TextBox>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style4"></td>
                    <td class="auto-style2"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style4"></td>
                    <td style="text-align: right" class="auto-style2">
                        <asp:Button ID="loginButton" runat="server" BorderStyle="None" Font-Size="X-Large" OnClick="loginButton_OnClick" Text="Log In" />
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style4"></td>
                    <td class="auto-style2">
                        <asp:Label ID="outputLabel" runat="server" Font-Size="X-Large"></asp:Label>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
