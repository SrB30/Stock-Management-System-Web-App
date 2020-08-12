using System;
using SAS_StockManagementSystemWebApp.BLL;
using SAS_StockManagementSystemWebApp.DAL.Model;

namespace SAS_StockManagementSystemWebApp.UI
{
    public partial class CompanyUI : System.Web.UI.Page
    {
        private CompanyManager companyManager = new CompanyManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            companyListGridView.DataSource = companyManager.GetAllCompanyList();
            companyListGridView.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            Company company = new Company();
            company.Name = nameTextBox.Text;

            string message = companyManager.Save(company);
            outputLabel.Text = message;

            nameTextBox.Text = "";
            companyListGridView.DataSource = companyManager.GetAllCompanyList();
            companyListGridView.DataBind();
        }

    }
}