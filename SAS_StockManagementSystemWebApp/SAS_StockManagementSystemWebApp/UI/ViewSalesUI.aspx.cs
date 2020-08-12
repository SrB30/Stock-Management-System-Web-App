using System;
using System.Collections.Generic;
using SAS_StockManagementSystemWebApp.BLL;
using SAS_StockManagementSystemWebApp.DAL.Model.ViewModel;

namespace SAS_StockManagementSystemWebApp.UI
{
    public partial class ViewSalesUI : System.Web.UI.Page
    {
        ViewSalesManager viewSalesManager = new ViewSalesManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fromDateTextBox.Attributes.Add("readonly", "readonly");
                toDateTextBox.Attributes.Add("readonly", "readonly");
            }
            
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            ViewSales viewSales = new ViewSales();
            viewSales.FromDate = fromDateTextBox.Text;
            viewSales.ToDate = toDateTextBox.Text;

            
                string message = viewSalesManager.IsValidDate(viewSales);
                if (message != "valid")
                {
                    outputLabel.Text = message;
                }

                else
                {
                    List<ViewSales> viewSaleItemsList = viewSalesManager.ViewByDate(viewSales);
                    if (viewSaleItemsList.Count <= 0)
                    {
                        outputLabel.Text = "No matched record found";
                    }
                    else
                    {
                        outputLabel.Text = "";
                    }
                    salesViewGridView.DataSource = viewSaleItemsList;
                    salesViewGridView.DataBind();
                }
        }
    }
}