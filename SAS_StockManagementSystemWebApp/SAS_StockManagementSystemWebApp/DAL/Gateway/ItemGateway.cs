using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Configuration;
using SAS_StockManagementSystemWebApp.DAL.Model;

namespace SAS_StockManagementSystemWebApp.DAL.Gateway
{
    public class ItemGateway : BaseGateway
    {
        public int Save(Item item)
        {
            string query =
                "INSERT INTO Items(Name,CategoryId,CompanyId,ReorderLevel) Values(@name,@categoryId,@companyId,@reorderLevel)";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@name", item.Name);
            command.Parameters.AddWithValue("@categoryId", item.CategoryId);
            command.Parameters.AddWithValue("@companyId", item.CompanyId);
            command.Parameters.AddWithValue("@reorderLevel", item.ReorderLevel);

            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();

            return rowAffect;
        }

        public bool IsItemExist(string name, int companyId)
        {
            string query = "SELECT *FROM Items WHERE Name = @name AND CompanyId=@companyId";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@name", name);
            command.Parameters.AddWithValue("@companyId", companyId);

            connection.Open();
            reader = command.ExecuteReader();
            bool isExist = reader.HasRows;
            connection.Close();
            return isExist;
        }

        public List<Item> GetItemsByCompanyId(int companyId)
        {
            string query = "SELECT * FROM Items WHERE CompanyId= @companyId ORDER BY Name";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@companyId", companyId);
            connection.Open();
            reader = command.ExecuteReader();

            List<Item> itemList = new List<Item>();
            while (reader.Read())
            {
                Item item = new Item();
                item.Id = (int)reader["ID"];
                item.Name = reader["Name"] as string;
                item.CategoryId = (int)reader["CategoryId"];
                item.CompanyId = (int)reader["CompanyId"];
                item.ReorderLevel = (int)reader["ReorderLevel"];
                item.AvailableQuantity = (int)reader["AvailableQuantity"];

                itemList.Add(item);
            }
            connection.Close();
            return itemList;
        }

        public int GetQuantityById(int companyId, int itemId)
        {
            string query = "SELECT * FROM Items WHERE CompanyId= @companyId AND Id = @itemId";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@companyId", companyId);
            command.Parameters.AddWithValue("@itemId", itemId);
            connection.Open();
            reader = command.ExecuteReader();
            int AvailableQuantity = 0;
            while (reader.Read())
            {
                AvailableQuantity = (int)reader["AvailableQuantity"];
            }
            connection.Close();
            return AvailableQuantity;
        }

        public int GetReorderLevelById(int companyId, int itemId)
        {
            string query = "SELECT * FROM Items WHERE CompanyId= @companyId AND Id = @itemId";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@companyId", companyId);
            command.Parameters.AddWithValue("@itemId", itemId);
            connection.Open();
            reader = command.ExecuteReader();
            int reorderLevel = 0;
            while (reader.Read())
            {
                reorderLevel = (int)reader["ReorderLevel"];
            }
            connection.Close();
            return reorderLevel;
        }
    }
}