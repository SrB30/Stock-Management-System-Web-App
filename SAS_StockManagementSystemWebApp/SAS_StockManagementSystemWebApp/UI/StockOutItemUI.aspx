<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockOutItemUI.aspx.cs" Inherits="SAS_StockManagementSystemWebApp.UI.StockOutItemUI" %>

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
    <form id="form1" runat="server">
        <div>
            <ul>
                <li center><a href="IndexUI.aspx">Home</a></li>
                <li><a href="CategoryUI.aspx">Category Setup</a></li>
                <li><a href="CompanyUI.aspx">Company Setup</a></li>
                <li><a href="ItemSetupUI.aspx">Item Setup</a></li>
                <li><a href="StockInUI.aspx">Stock In</a></li>

                <li><a href="ItemSummaryUI.aspx">Search & View Items Summary</a></li>
                <li><a href="ViewSalesUI.aspx">View Sales Between Two Dates</a></li>
            </ul>
        </div>

        <h1><b><i>Stock Out</i></b></h1>
        <br />
        <br />

        <div align="center">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Company"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="companyDropDownList" runat="server" Height="23px" Width="175px" AutoPostBack="True" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged"></asp:DropDownList>
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
                        <asp:Label ID="Label5" runat="server" Text="Stock Out Quantity"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="stockOutTextBox" runat="server" Height="23px" Width="171px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="addButton" runat="server" Text="Add" OnClick="addButton_Click" />
                    </td>
                </tr>
            </table>
        </div>

        <br />
        <div align="center">
            <asp:Label ID="addOutputLabel" runat="server" ForeColor="red"></asp:Label>
        </div>
        <br />
        <br />

        <div align="center">
            <asp:GridView ID="stockOutGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="115px" Width="383px" BorderStyle="None">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="SL">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
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
                            <asp:Label runat="server" Text='<%#Eval("StockOutQuantity") %>'></asp:Label>
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
        </div>

        <div align="center">
            <table>
                <tr>
                    <td>&nbsp;</td>

                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="sellButton" runat="server" Text="Sell" OnClick="sellButton_Click" />
                        &nbsp;&nbsp;
                    <asp:Button ID="damageButton" runat="server" Text="Damage" OnClick="damageButton_Click" />
                        &nbsp;&nbsp;
                    <asp:Button ID="lostButton" runat="server" Text="Lost" OnClick="lostButton_Click" />
                    </td>
                </tr>
            </table>

            <br />
            <tr>
                <td>
                    <br />
                    <asp:Label ID="gridOutputLabel" runat="server" ForeColor="red"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
        </div>
    </form>
</body>
</html>
