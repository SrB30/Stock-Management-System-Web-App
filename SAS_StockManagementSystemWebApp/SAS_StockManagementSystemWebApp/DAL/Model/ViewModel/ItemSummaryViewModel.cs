namespace SAS_StockManagementSystemWebApp.DAL.Model.ViewModel
{
    public class ItemSummaryViewModel
    {
        public int ItemId { get; set; }
        public string ItemName { get; set; }
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public int Quantity { get; set; }
        public int ReorderLevel { get; set; }
    }
}