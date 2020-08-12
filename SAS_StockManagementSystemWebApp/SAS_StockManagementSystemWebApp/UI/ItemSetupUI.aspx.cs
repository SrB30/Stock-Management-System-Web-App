using System;
using SAS_StockManagementSystemWebApp.BLL;
using SAS_StockManagementSystemWebApp.DAL.Model;

namespace SAS_StockManagementSystemWebApp.UI
{
    public partial class ItemSetupUI : System.Web.UI.Page
    {
        ItemManager itemManager = new ItemManager();
        CompanyManager companyManager = new CompanyManager();
        CategoryManager categoryManager = new CategoryManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                categoryDropDownList.DataSource = categoryManager.GetAllCategory();
                categoryDropDownList.DataTextField = "Name";
                categoryDropDownList.DataValueField = "ID";
                categoryDropDownList.DataBind();

                companyDropDownList.DataSource = companyManager.GetAllCompanyList();
                companyDropDownList.DataTextField = "Name";
                companyDropDownList.DataValueField = "ID";
                companyDropDownList.DataBind();

                categoryDropDownList.Items.Insert(0, "Select Category");
                companyDropDownList.Items.Insert(0, "Select Company");
            }

        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            bool isValid = true;

            if (companyDropDownList.SelectedIndex != 0 && categoryDropDownList.SelectedIndex != 0)
            {
                string itemName = itemNameTextBox.Text;
                string reorderLevel = reorderLevelTextBox.Text;

                string message = itemManager.IsValidInput(itemName, reorderLevel);
                if (message != "valid")
                {
                    outputLabel.Text = message;
                    isValid = false;
                }
                else
                {
                    Item item = new Item();
                    item.CompanyId = Convert.ToInt32(companyDropDownList.SelectedItem.Value);
                    item.CategoryId = Convert.ToInt32(categoryDropDownList.SelectedItem.Value);
                    item.Name = itemNameTextBox.Text;
                    if (reorderLevel=="")
                    {
                        item.ReorderLevel = 0;
                    }
                    else
                    {
                        item.ReorderLevel = Convert.ToInt32(reorderLevelTextBox.Text);
                    }
                    

                    message = itemManager.Save(item);
                    outputLabel.Text = message;
                }
            }
            else
            {
                outputLabel.Text = "Please select both company & category";
                isValid = false;
            }

            if (isValid)
            {
                itemNameTextBox.Text = "";
                reorderLevelTextBox.Text = "";
                categoryDropDownList.SelectedIndex = 0;
                companyDropDownList.SelectedIndex = 0;
            }
        }

    }
}