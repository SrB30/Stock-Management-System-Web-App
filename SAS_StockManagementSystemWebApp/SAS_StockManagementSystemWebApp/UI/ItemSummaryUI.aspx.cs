using System;
using System.Collections.Generic;
using SAS_StockManagementSystemWebApp.BLL;
using SAS_StockManagementSystemWebApp.DAL.Model.ViewModel;

namespace SAS_StockManagementSystemWebApp.UI
{
    public partial class ItemSummaryUI : System.Web.UI.Page
    {
        CompanyManager companyManager = new CompanyManager();
        CategoryManager categoryManager = new CategoryManager();
        ItemSummaryManager itemSummaryManager = new ItemSummaryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                companyDropDownList.DataSource = companyManager.GetAllCompanyList();
                companyDropDownList.DataValueField = "Id";
                companyDropDownList.DataTextField = "Name";
                companyDropDownList.DataBind();
                companyDropDownList.Items.Insert(0, "Select Company");
                companyDropDownList.SelectedItem.Value = (-1).ToString();

                categoryDropDownList.DataSource = categoryManager.GetAllCategory();
                categoryDropDownList.DataValueField = "Id";
                categoryDropDownList.DataTextField = "Name";
                categoryDropDownList.DataBind();
                categoryDropDownList.Items.Insert(0, "Select Category");
                categoryDropDownList.SelectedItem.Value = (-1).ToString();

            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            int companyId = Convert.ToInt32(companyDropDownList.SelectedItem.Value);
            int categoryId = Convert.ToInt32(categoryDropDownList.SelectedItem.Value);
            List<ItemSummaryViewModel> itemSummaryViewList = itemSummaryManager.GetItemSummary(companyId, categoryId);

            if (itemSummaryViewList.Count <= 0)
            {
                outputLabel.Text = "No matched record found";
            }

            itemSummaryGridView.DataSource = itemSummaryViewList;
            itemSummaryGridView.DataBind();


            companyDropDownList.SelectedIndex = 0;
            categoryDropDownList.SelectedIndex = 0;
        }
    }
}