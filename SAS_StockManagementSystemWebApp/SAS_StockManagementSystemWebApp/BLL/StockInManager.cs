using System.Collections.Generic;
using SAS_StockManagementSystemWebApp.DAL.Gateway;
using SAS_StockManagementSystemWebApp.DAL.Model;

namespace SAS_StockManagementSystemWebApp.BLL
{
    public class StockInManager
    {
        StockInGateway stockInGateway = new StockInGateway();

        public List<Item> GetItemsByCompanyId(int companyId)
        {
            return stockInGateway.GetItemsByCompanyId(companyId);
        }

        public int GetQuantityById(int companyId, int itemId)
        {
            return stockInGateway.GetQuantityById(companyId, itemId);
        }

        public int GetReorderLevelById(int companyId, int itemId)
        {
            return stockInGateway.GetReorderLevelById(companyId, itemId);
        }

        public string Save(Item item, int itemId)
        {
            int rowAffect = stockInGateway.Save(item, itemId);
            if (rowAffect > 0)
            {
                return "Save successful";
            }
            else
            {
                return "Save failed";
            }
        }

        public string IsInputValid(string company, string item, string stockInQuantity)
        {
            if (company == "Select Company" && item == "Select Item")
            {
                return "Please Select Company & item";
            }
            else if (company == "Select Company")
            {
                return "Please select company";
            }
            else if (item == "Select Item")
            {
                return "Please Select Item";
            }
            if (stockInQuantity == "0" || stockInQuantity == "")
            {
                return "Please insert a non-zero quantity to stock in";
            }
            bool isValid = true;
            int zeroCount = 0;
            for (int i = 0; i < stockInQuantity.Length; i++)
            {
                if (stockInQuantity[i] < 48 || stockInQuantity[i] > 57)
                {
                    isValid = false;
                    break;
                }
                if (stockInQuantity[i] == '0')
                {
                    zeroCount++;
                }
            }
            if (!isValid || zeroCount == stockInQuantity.Length)
            {
                return "Invalid stock in quantity";
            }

            return "valid";
        }
    }
}