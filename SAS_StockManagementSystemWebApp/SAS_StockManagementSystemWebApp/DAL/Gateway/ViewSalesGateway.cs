using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using SAS_StockManagementSystemWebApp.DAL.Model.ViewModel;

namespace SAS_StockManagementSystemWebApp.DAL.Gateway
{
    public class ViewSalesGateway : BaseGateway
    {
        public List<ViewSales> ViewByDate(ViewSales viewSales)
        {
            string query = "SELECT * FROM SalesView WHERE (Date BETWEEN @fromDate AND @toDate) AND StockOutType='Sell' ORDER BY Item";

            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@fromDate", viewSales.FromDate);
            command.Parameters.AddWithValue("@toDate", viewSales.ToDate);

            connection.Open();
            reader = command.ExecuteReader();
            List<ViewSales> saleList = new List<ViewSales>();

            while (reader.Read())
            {
                ViewSales viewSale = new ViewSales();

                viewSale.ItemName = reader["Item"].ToString();
                viewSale.CompanyName = reader["Company"].ToString();
                viewSale.Quantity = Convert.ToInt32(reader["Quantity"]);

                saleList.Add(viewSale);
            }
            connection.Close();

            int len = saleList.Count;

            for (int i = 0; i < len - 1; i++)
            {
                for (int j = i+1; j < len; j++)
                {
                    if (saleList[i].CompanyName == saleList[j].CompanyName &&
                        saleList[i].ItemName == saleList[j].ItemName)
                    {
                        saleList[i].Quantity += saleList[j].Quantity;
                        saleList.RemoveAt(j);
                        len -= 1;
                        j--;
                    }

                }
            }
            return saleList;
        }
    }
}