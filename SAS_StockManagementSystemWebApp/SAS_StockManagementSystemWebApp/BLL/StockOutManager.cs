using System.Collections.Generic;
using SAS_StockManagementSystemWebApp.DAL.Gateway;
using SAS_StockManagementSystemWebApp.DAL.Model;

namespace SAS_StockManagementSystemWebApp.BLL
{
    public class StockOutManager
    {
        StockOutGateway stockOutGateway = new StockOutGateway();
        public string IsValidInput(string company, string item, string itemStockOutQuantity)
        {
            if (company == "Select Company" && item == "Select Item")
            {
                return "Please Select Company & Item";
            }
            if (company == "Select Company")
            {
                return "Please Select Company";
            }
            if (item == "Select Item")
            {
                return "Please Select Item";
            }
            if (itemStockOutQuantity == "0" || itemStockOutQuantity == "")
            {
                return "Please insert a non-zero quantity to stock out";
            }
            bool isValid = true;
            int zeroCount = 0;
            for (int i = 0; i < itemStockOutQuantity.Length; i++)
            {
                if (itemStockOutQuantity[i] < 48 || itemStockOutQuantity[i] > 57)
                {
                    isValid = false;
                    break;
                }
                if (itemStockOutQuantity[i] == '0')
                {
                    zeroCount++;
                }
            }
            if (!isValid || zeroCount == itemStockOutQuantity.Length)
            {
                return "Invalid stock out quantity";
            }

            return "valid";

        }

        public string SellItems(List<Item> allItems, List<StockOutItem> allStockOutItems, string stockOutType)
        {
            int rowAfect = stockOutGateway.SellItems(allItems, allStockOutItems, stockOutType);
            if (rowAfect > 0)
            {
                if (stockOutType == "Sell")
                {
                    return "Successfuly sold";
                }
                if (stockOutType == "Damage")
                {
                    return "Damage successful";
                }
                else
                {
                    return "successfuly lost";
                }

            }
            else
            {
                return "Problem in selling items.";
            }
        }
    }
}