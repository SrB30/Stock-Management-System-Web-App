namespace SAS_StockManagementSystemWebApp.DAL.Model
{
    public class Item
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int CategoryId { get; set; }
        public int CompanyId { get; set; }
        public int ReorderLevel { get; set; }
        public int AvailableQuantity { get; set; }

        public int StockIn { get; set; }
    }
}