using System;
using System.Web.UI.WebControls;
using SAS_StockManagementSystemWebApp.BLL;
using SAS_StockManagementSystemWebApp.DAL.Model;

namespace SAS_StockManagementSystemWebApp.UI
{
    public partial class CategoryUI : System.Web.UI.Page
    {
        CategoryManager categoryManager = new CategoryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            categoryListGridView.DataSource = categoryManager.GetAllCategory();
            categoryListGridView.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            Category category = new Category();
            category.Name = nameTextBox.Text;

            string message = categoryManager.Save(category);
            outputLabel.Text = message;
            nameTextBox.Text = "";
            categoryListGridView.DataSource = categoryManager.GetAllCategory();
            categoryListGridView.DataBind();
        }

        protected void OnClick(object sender, EventArgs e)
        {
            LinkButton linkButton = sender as LinkButton;
            DataControlFieldCell cell = linkButton.Parent as DataControlFieldCell;
            GridViewRow row = cell.Parent as GridViewRow;
            HiddenField hiddenField = row.FindControl("idHiddenField") as HiddenField;
            int id = Convert.ToInt32(hiddenField.Value);
            Response.Redirect("CategoryUpdateUI.aspx?Id=" + id);
        }
    }
}