<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyUI.aspx.cs" Inherits="SAS_StockManagementSystemWebApp.UI.CompanyUI" %>

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

table.center {
    margin-left: auto;
    margin-right: auto;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <ul>
            <li center><a href="IndexUI.aspx">Home</a></li>
            <li><a href="CategoryUI.aspx">Category Setup</a></li>
            
            <li><a href="ItemSetupUI.aspx">Item Setup</a></li>
            <li><a href="StockInUI.aspx">Stock In</a></li>
            <li><a href="StockOutItemUI.aspx">Stock Out</a></li>
            <li><a href="ItemSummaryUI.aspx">Search & View Items Summary</a></li>
            <li><a href="ViewSalesUI.aspx">View Sales Between Two Dates</a></li>
        </ul>
        </div>
        
        <h1><b><i>Company Setup</i></b></h1>
        <br/>
        <br/>

        <table class="center">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="nameTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" style="height: 26px" />
                </td>
            </tr>
        </table>
        <br />

        <div align="center">
                    <asp:Label ID="outputLabel" runat="server" ForeColor="red"></asp:Label>
            </div>
                <br />
        <br />
        
        <div align="center">
        <asp:GridView ID="companyListGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" GridLines="Vertical" BorderStyle="None">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:TemplateField HeaderText="SL">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <br/>
        
    </div>
    </form>
</body>
</html>
