using System;

namespace SAS_StockManagementSystemWebApp.DAL.Model
{
    [Serializable]
    public class StockOutItem
    {
        public int ID { get; set; }
        public int ItemId { get; set; }
        public int Quantity { get; set; }
        public string Date { get; set; }
        public string StockOutType { get; set; }
    }
}