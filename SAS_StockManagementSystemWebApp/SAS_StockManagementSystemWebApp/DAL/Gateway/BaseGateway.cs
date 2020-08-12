using System.Data.SqlClient;
using System.Web.Configuration;

namespace SAS_StockManagementSystemWebApp.DAL.Gateway
{
    public class BaseGateway
    {
        public SqlConnection connection;
        public SqlCommand command;
        public SqlDataReader reader;

        public BaseGateway()
        {
            string connectionString =
                WebConfigurationManager.ConnectionStrings["StockManagementConString"].ConnectionString;
            connection = new SqlConnection(connectionString);
        }
    }
}