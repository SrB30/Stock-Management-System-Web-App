<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSalesUI.aspx.cs" Inherits="SAS_StockManagementSystemWebApp.UI.ViewSalesUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title></title>
    <link href="Design/StoryStyleSheet.css" rel="stylesheet" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#<%= fromDateTextBox.ClientID %>").datepicker(
                {
                    dateFormat: 'yy-mm-dd',
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '1950:2100'
                });
        });
    </script>
    <script>
        $(function () {
            $("#<%= toDateTextBox.ClientID %>").datepicker(
                {
                    dateFormat: 'yy-mm-dd',
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '1950:2100'
                });
        });
    </script>
    <style>
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
            position: -webkit-sticky;
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
                <li><a href="StockOutItemUI.aspx">Stock Out</a></li>
                <li><a href="ItemSummaryUI.aspx">Search & View Items Summary</a></li>

            </ul>
        </div>

        <h1><b><i>View Sales Between Two Dates</i></b></h1>
        <br />
        <br />

        <div align="center">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="From Date" ></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="fromDateTextBox" runat="server" placeholder="YYYY-MM-DD"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="To Date"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="toDateTextBox" runat="server" placeholder="YYYY-MM-DD"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" />
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

        <div align="center">
            <asp:GridView ID="salesViewGridView" runat="server" AutoGenerateColumns="False" Height="153px" Width="815px" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="SL">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("ItemName") %>'>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Company Name">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("CompanyName") %>'>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Sale Quantity">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("Quantity") %>'>'></asp:Label>
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
        </div>
        <br />
    </form>
</body>
</html>
