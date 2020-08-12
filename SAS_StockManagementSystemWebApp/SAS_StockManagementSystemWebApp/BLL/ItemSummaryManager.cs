using System.Collections.Generic;
using SAS_StockManagementSystemWebApp.DAL.Gateway;
using SAS_StockManagementSystemWebApp.DAL.Model.ViewModel;

namespace SAS_StockManagementSystemWebApp.BLL
{
    public class ItemSummaryManager
    {
        private ItemSummaryGateway itemSummaryGateway = new ItemSummaryGateway();
        public List<ItemSummaryViewModel> GetItemSummary(int companyId, int categoryId)
        {
            if (companyId > -1 && categoryId > -1)
            {
                return itemSummaryGateway.GetItemSummaryByCompanyIdAndCategoryId(companyId, categoryId);
            }
            else if (companyId == -1 && categoryId == -1)
            {
                return itemSummaryGateway.GetAllItemSummary();
            }
            else if (categoryId == -1)
            {
                return itemSummaryGateway.GetItemSummaryByCompanyId(companyId);
            }
            else
            {
                return itemSummaryGateway.GetItemSummaryByCategoryId(categoryId);
            }
        }
    }
}