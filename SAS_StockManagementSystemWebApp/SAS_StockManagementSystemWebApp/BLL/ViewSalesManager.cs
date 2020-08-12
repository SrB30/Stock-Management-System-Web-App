using System;
using System.Collections.Generic;
using SAS_StockManagementSystemWebApp.DAL.Gateway;
using SAS_StockManagementSystemWebApp.DAL.Model.ViewModel;

namespace SAS_StockManagementSystemWebApp.BLL
{
    public class ViewSalesManager
    {
        ViewSalesGateway viewSalesGateway = new ViewSalesGateway();
        public List<ViewSales> ViewByDate(ViewSales viewSales)
        {
            return viewSalesGateway.ViewByDate(viewSales);
        }

        public string IsValidDate(ViewSales viewSales)
        {
            string fromDate = viewSales.FromDate;
            string toDate = viewSales.ToDate;

            if (fromDate=="" || toDate=="")
            {
                return "Please input the dates correctly";
            }
            for (int i = 0; i < toDate.Length; i++)
            {
                if (fromDate[i]>toDate[i])
                {
                    return "To Date must be greater than or equal to From Date";
                }
                if (fromDate[i]<toDate[i])
                {
                    break;
                }
            }
            return "valid";
        }
    }
}