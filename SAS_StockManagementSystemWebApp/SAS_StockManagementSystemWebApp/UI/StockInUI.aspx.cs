using System;
using SAS_StockManagementSystemWebApp.BLL;
using SAS_StockManagementSystemWebApp.DAL.Model;

namespace SAS_StockManagementSystemWebApp.UI
{
    public partial class StockInUI : System.Web.UI.Page
    {
        CompanyManager companyManager = new CompanyManager();
        ItemManager itemManager = new ItemManager();
        StockInManager stockInManager = new StockInManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                companyDropDownList.DataSource = companyManager.GetAllCompanyList();
                companyDropDownList.DataTextField = "Name";
                companyDropDownList.DataValueField = "ID";
                companyDropDownList.DataBind();

                companyDropDownList.Items.Insert(0, "Select Company");
                itemDropDownList.Items.Insert(0, "Select Item");
            }
        }


        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (companyDropDownList.SelectedIndex != 0)
            {
                int companyId = Convert.ToInt32(companyDropDownList.SelectedItem.Value);
                itemDropDownList.DataSource = stockInManager.GetItemsByCompanyId(companyId);
                itemDropDownList.DataTextField = "Name";
                itemDropDownList.DataValueField = "Id";
                itemDropDownList.DataBind();
            }
            else
            {
                itemDropDownList.Items.Clear();
            }

            itemDropDownList.Items.Insert(0, "Select Item");

            reorderTextBox.Text = availableQuantityTextBox.Text = stockInTextBox.Text = "";
        }

        protected void itemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (itemDropDownList.SelectedIndex != 0)
            {
                int companyId = Convert.ToInt32(companyDropDownList.SelectedItem.Value);
                int itemId = Convert.ToInt32(itemDropDownList.SelectedItem.Value);

                reorderTextBox.Text = stockInManager.GetReorderLevelById(companyId, itemId).ToString();
                availableQuantityTextBox.Text = stockInManager.GetQuantityById(companyId, itemId).ToString();
            }
            else
            {
                reorderTextBox.Text = availableQuantityTextBox.Text = "";
            }
            stockInTextBox.Text = "";

        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            bool isValid = true;
            string company = companyDropDownList.SelectedItem.ToString();
            string items = itemDropDownList.SelectedItem.ToString();
            string stockInQuantity = stockInTextBox.Text;

            string message = stockInManager.IsInputValid(company, items, stockInQuantity);
            if (message != "valid")
            {
                outputLabel.Text = message;
                stockInTextBox.Text = "";
                isValid = false;
            }
            else
            {
                int itemId = Convert.ToInt32(itemDropDownList.SelectedItem.Value);
                Item item = new Item();
                item.StockIn = Convert.ToInt32(stockInTextBox.Text) + Convert.ToInt32(availableQuantityTextBox.Text);
                message = stockInManager.Save(item, itemId);
                outputLabel.Text = message;
            }

            if (isValid)
            {
                stockInTextBox.Text = "";
                availableQuantityTextBox.Text = "";
                reorderTextBox.Text = "";

                companyDropDownList.SelectedIndex = 0;
                itemDropDownList.Items.Clear();
                itemDropDownList.Items.Insert(0, "Select Item");
            }
        }
    }
}