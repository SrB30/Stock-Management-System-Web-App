using System.Collections.Generic;
using System.Data.SqlClient;
using SAS_StockManagementSystemWebApp.DAL.Model;

namespace SAS_StockManagementSystemWebApp.DAL.Gateway
{
    public class StockInGateway : BaseGateway
    {
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

        public int Save(Item item, int itemId)
        {
            string query = "UPDATE Items SET AvailableQuantity=@quantity WHERE Id=@itemId";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@quantity", item.StockIn);
            command.Parameters.AddWithValue("@itemId", itemId);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();

            return rowAffect;
        }
    }
}