using System.Collections.Generic;
using SAS_StockManagementSystemWebApp.DAL.Gateway;
using SAS_StockManagementSystemWebApp.DAL.Model;

namespace SAS_StockManagementSystemWebApp.BLL
{
    public class ItemManager
    {
        private ItemGateway itemGateway = new ItemGateway();

        public string Save(Item item)
        {
            if (itemGateway.IsItemExist(item.Name, item.CompanyId))
            {
                return "Already exist";
            }
            else
            {
                int rowAffect = itemGateway.Save(item);
                if (rowAffect > 0)
                {
                    return "Save Successful";
                }

                else
                {
                    return "Save Failed";
                }
            }
        }

        public List<Item> GetItemsByCompanyId(int companyId)
        {
            return itemGateway.GetItemsByCompanyId(companyId);
        }

        public int GetQuantityById(int companyId, int itemId)
        {
            return itemGateway.GetQuantityById(companyId, itemId);
        }

        public int GetReorderLevelById(int companyId, int itemId)
        {
            return itemGateway.GetReorderLevelById(companyId, itemId);
        }

        public string IsValidInput(string itemName, string reorderLevel)
        {
            if (itemName == "")
            {
                return "Invalid item name. Please insert without leading or trailing space";
            }
            if (itemName[0] == ' ' || itemName[itemName.Length - 1] == ' ')
            {
                return "Invalid item name. Please insert without leading or trailing space";
            }


            bool isValid = true;
            //int zeroCount = 0;
            for (int i = 0; i < reorderLevel.Length; i++)
            {
                if (reorderLevel[i] < 48 || reorderLevel[i] > 57)
                {
                    isValid = false;
                    break;
                }
            }
            if (!isValid)
            {
                return "Please insert a non-negative numerical reorder value";
            }

            return "valid";
        }
    }
}