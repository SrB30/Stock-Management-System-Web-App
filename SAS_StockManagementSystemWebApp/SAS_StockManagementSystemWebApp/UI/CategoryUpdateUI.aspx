<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryUpdateUI.aspx.cs" Inherits="SAS_StockManagementSystemWebApp.UI.CategoryUpdateUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Design/StoryStyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:HiddenField ID="idHiddenField" runat="server"/>
                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="nameTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="updateButton" runat="server" Text="Update" OnClick="updateButton_OnClick" />
                    </td>
            </tr>
        </table>
                    <br />
                    <asp:Label ID="outputLabel" runat="server" ForeColor="red"></asp:Label>
        <br />
        <br/>
    </div>
        <a href="CategoryUI.aspx">Back</a>
    </form>
</body>
</html>
