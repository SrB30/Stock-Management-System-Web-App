using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using SAS_StockManagementSystemWebApp.DAL.Model;

namespace SAS_StockManagementSystemWebApp.DAL.Gateway
{
    public class StockOutGateway : BaseGateway
    {
        public int SellItems(List<Item> allItems, List<StockOutItem> allStockOutItems, string stockOutType)
        {
            connection.Open();
            int rowAffect = 0;
            foreach (Item item in allItems)
            {
                string queryItem = "UPDATE Items SET AvailableQuantity= @availableQuantity WHERE Id=@id";
                command = new SqlCommand(queryItem, connection);
                command.Parameters.AddWithValue("@availableQuantity", item.AvailableQuantity);
                command.Parameters.AddWithValue("@id", item.Id);

                rowAffect += command.ExecuteNonQuery();
            }


            foreach (StockOutItem item in allStockOutItems)
            {
                string queryStockOutItem = "INSERT INTO ItemStockOut(ItemId, StockOutType, Date, Quantity) VALUES(@itemId, @stockOutType, @date, @quantity)";
                command = new SqlCommand(queryStockOutItem, connection);

                command.Parameters.AddWithValue("@itemId", item.ItemId);
                command.Parameters.AddWithValue("@stockOutType", item.StockOutType);
                DateTime dt = DateTime.ParseExact(item.Date, "yyyy-MM-dd", null);
                command.Parameters.AddWithValue("@date", dt);
                command.Parameters.AddWithValue("@quantity", item.Quantity);

                rowAffect += command.ExecuteNonQuery();
            }

            connection.Close();
            return rowAffect;
        }
    }
}