using System;
using SAS_StockManagementSystemWebApp.BLL;
using SAS_StockManagementSystemWebApp.DAL.Model;

namespace SAS_StockManagementSystemWebApp.UI
{
    public partial class CategoryUpdateUI : System.Web.UI.Page
    {
        CategoryManager categoryManager = new CategoryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["Id"]);

                Category category = categoryManager.GetCategoryById(id);

                if (category != null)
                {
                    idHiddenField.Value = category.Id.ToString();
                    nameTextBox.Text = category.Name;
                }
            }

        }

        protected void updateButton_OnClick(object sender, EventArgs e)
        {
            Category category = new Category();
            category.Id = Convert.ToInt32(idHiddenField.Value);
            category.Name = nameTextBox.Text;

            string message = categoryManager.UpdateById(category);
            if (message == "Update Successful")
            {
                Response.Redirect("CategoryUI.aspx");
            }
            else
            {
                outputLabel.Text = message;
            }
        }
    }
}