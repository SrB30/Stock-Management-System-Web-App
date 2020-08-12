using System.Collections.Generic;
using System.Data.SqlClient;
using SAS_StockManagementSystemWebApp.DAL.Model.ViewModel;

namespace SAS_StockManagementSystemWebApp.DAL.Gateway
{
    public class ItemSummaryGateway : BaseGateway
    {
        public List<ItemSummaryViewModel> GetAllItemSummary()
        {
            string query = "SELECT * FROM ItemSummaryView ORDER BY ItemName";

            command = new SqlCommand(query, connection);

            connection.Open();
            reader = command.ExecuteReader();
            List<ItemSummaryViewModel> showItemSummaryList = new List<ItemSummaryViewModel>();

            while (reader.Read())
            {
                ItemSummaryViewModel itemSummary = new ItemSummaryViewModel();
                itemSummary.ItemId = (int)reader["ItemId"];
                itemSummary.ItemName = reader["ItemName"] as string;
                itemSummary.CompanyId = (int)reader["CompanyId"];
                itemSummary.CompanyName = reader["CompanyName"] as string;
                itemSummary.CategoryId = (int)reader["CategoryId"];
                itemSummary.CategoryName = reader["CategoryName"] as string;
                itemSummary.Quantity = (int)reader["AvailableQuantity"];
                itemSummary.ReorderLevel = (int)reader["ReorderLevel"];

                showItemSummaryList.Add(itemSummary);
            }
            connection.Close();
            return showItemSummaryList;
        }

        public List<ItemSummaryViewModel> GetItemSummaryByCompanyId(int companyId)
        {
            string query = "SELECT * FROM ItemSummaryView WHERE CompanyId = @companyId ORDER BY ItemName";

            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@companyId", companyId);

            connection.Open();
            reader = command.ExecuteReader();
            List<ItemSummaryViewModel> showItemSummaryList = new List<ItemSummaryViewModel>();

            while (reader.Read())
            {
                ItemSummaryViewModel itemSummary = new ItemSummaryViewModel();
                itemSummary.ItemId = (int)reader["ItemId"];
                itemSummary.ItemName = reader["ItemName"] as string;
                itemSummary.CompanyId = (int)reader["CompanyId"];
                itemSummary.CompanyName = reader["CompanyName"] as string;
                itemSummary.CategoryId = (int)reader["CategoryId"];
                itemSummary.CategoryName = reader["CategoryName"] as string;
                itemSummary.Quantity = (int)reader["AvailableQuantity"];
                itemSummary.ReorderLevel = (int)reader["ReorderLevel"];

                showItemSummaryList.Add(itemSummary);
            }
            connection.Close();
            return showItemSummaryList;
        }

        public List<ItemSummaryViewModel> GetItemSummaryByCategoryId(int categoryId)
        {
            string query = "SELECT * FROM ItemSummaryView WHERE CategoryId = @categoryId ORDER BY ItemName";

            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@categoryId", categoryId);

            connection.Open();
            reader = command.ExecuteReader();
            List<ItemSummaryViewModel> showItemSummaryList = new List<ItemSummaryViewModel>();

            while (reader.Read())
            {
                ItemSummaryViewModel itemSummary = new ItemSummaryViewModel();
                itemSummary.ItemId = (int)reader["ItemId"];
                itemSummary.ItemName = reader["ItemName"] as string;
                itemSummary.CompanyId = (int)reader["CompanyId"];
                itemSummary.CompanyName = reader["CompanyName"] as string;
                itemSummary.CategoryId = (int)reader["CategoryId"];
                itemSummary.CategoryName = reader["CategoryName"] as string;
                itemSummary.Quantity = (int)reader["AvailableQuantity"];
                itemSummary.ReorderLevel = (int)reader["ReorderLevel"];

                showItemSummaryList.Add(itemSummary);
            }
            connection.Close();
            return showItemSummaryList;
        }

        public List<ItemSummaryViewModel> GetItemSummaryByCompanyIdAndCategoryId(int companyId, int categoryId)
        {
            string query = "SELECT * FROM ItemSummaryView WHERE CompanyId = @companyId AND CategoryId = @categoryId ORDER BY ItemName";

            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@companyId", companyId);
            command.Parameters.AddWithValue("@categoryId", categoryId);

            connection.Open();
            reader = command.ExecuteReader();
            List<ItemSummaryViewModel> showItemSummaryList = new List<ItemSummaryViewModel>();

            while (reader.Read())
            {
                ItemSummaryViewModel itemSummary = new ItemSummaryViewModel();
                itemSummary.ItemId = (int)reader["ItemId"];
                itemSummary.ItemName = reader["ItemName"] as string;
                itemSummary.CompanyId = (int)reader["CompanyId"];
                itemSummary.CompanyName = reader["CompanyName"] as string;
                itemSummary.CategoryId = (int)reader["CategoryId"];
                itemSummary.CategoryName = reader["CategoryName"] as string;
                itemSummary.Quantity = (int)reader["AvailableQuantity"];
                itemSummary.ReorderLevel = (int)reader["ReorderLevel"];

                showItemSummaryList.Add(itemSummary);
            }
            connection.Close();
            return showItemSummaryList;
        }
    }
}