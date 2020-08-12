using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAS_StockManagementSystemWebApp.UI
{
    public partial class LoginUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_OnClick(object sender, EventArgs e)
        {
            string userName = userNameTextBox.Text;
            string password = passwordTextBox.Text;
            if (userName == "Admin" && password == "Admin")
                Response.Redirect("IndexUI.aspx");
            else if (userName == "" || password == "")
            {
                outputLabel.Text = "Please enter your username and password";
            }
            else
            {
                outputLabel.Text = "Username & Password don't match";
            }
        }
    }
}