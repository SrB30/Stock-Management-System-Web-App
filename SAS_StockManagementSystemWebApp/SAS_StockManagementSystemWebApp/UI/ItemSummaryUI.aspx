<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemSummaryUI.aspx.cs" Inherits="SAS_StockManagementSystemWebApp.UI.ItemSummaryUI" %>

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
                
    </style>
</head>
<body>
    <div>
        <ul>
            <li center><a href="IndexUI.aspx">Home</a></li>
            <li><a href="CategoryUI.aspx">Category Setup</a></li>
            <li><a href="CompanyUI.aspx">Company Setup</a></li>
            <li><a href="ItemSetupUI.aspx">Item Setup</a></li>
            <li><a href="StockInUI.aspx">Stock In</a></li>
            <li><a href="StockOutItemUI.aspx">Stock Out</a></li>
            <li><a href="ViewSalesUI.aspx">View Sales Between Two Dates</a></li>
        </ul>
    </div>

    <h1><b><i>Search & View Items Summary</i></b></h1>
    <br />
    <br />

    <form id="form1" runat="server">
        <div align="center">
            <asp:Label ID="Label1" runat="server" Text="Company"></asp:Label>
            &nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="companyDropDownList" runat="server" Height="16px" Width="215px">
        </asp:DropDownList>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Category"></asp:Label>
            &nbsp;&nbsp; &nbsp;
        <asp:DropDownList ID="categoryDropDownList" runat="server" Height="16px" Width="215px">
        </asp:DropDownList>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <asp:Button ID="searchButton" runat="server" OnClick="searchButton_Click" Text="Search" />

            <br />

            <br />
            <asp:Label ID="outputLabel" runat="server"></asp:Label>
        </div>
        <br />
        <br />

        <div align="center">
            <asp:GridView ID="itemSummaryGridView" runat="server" Height="135px" Width="695px" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="Sl">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("ItemName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Company">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("CompanyName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Reorder Level">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("ReorderLevel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>

            <br />

        </div>

    </form>
</body>
</html>
