using System;

namespace SAS_StockManagementSystemWebApp.DAL.Model.ViewModel
{
    [Serializable]
    public class StockOutItemViewModel
    {
        public int ItemId { get; set; }
        public string ItemName { get; set; }
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public int ReorderLevel { get; set; }
        public int AvailableQuantity { get; set; }
        public int StockOutQuantity { get; set; }
        public string StockOutType { get; set; }
        public string Date { get; set; }
    }
}