using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SAS_StockManagementSystemWebApp.BLL;
using SAS_StockManagementSystemWebApp.DAL.Model;
using SAS_StockManagementSystemWebApp.DAL.Model.ViewModel;

namespace SAS_StockManagementSystemWebApp.UI
{
    public partial class StockOutItemUI : System.Web.UI.Page
    {
        CompanyManager companyManager = new CompanyManager();
        StockOutManager stockOutManager = new StockOutManager();
        ItemManager itemManager = new ItemManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                companyDropDownList.DataSource = companyManager.GetAllCompanyList();
                companyDropDownList.DataTextField = "Name";
                companyDropDownList.DataValueField = "ID";
                companyDropDownList.DataBind();

                companyDropDownList.Items.Insert(0, "Select Company");
                itemDropDownList.Items.Insert(0, "Select Item");
            }
        }

        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (companyDropDownList.SelectedIndex != 0)
            {
                int companyId = Convert.ToInt32(companyDropDownList.SelectedItem.Value);
                itemDropDownList.DataSource = itemManager.GetItemsByCompanyId(companyId);
                itemDropDownList.DataTextField = "Name";
                itemDropDownList.DataValueField = "Id";
                itemDropDownList.DataBind();
            }
            else
            {
                itemDropDownList.Items.Clear();
            }

            addOutputLabel.Text = "";
            gridOutputLabel.Text = "";
            reorderTextBox.Text = "";
            availableQuantityTextBox.Text = "";

            itemDropDownList.Items.Insert(0, "Select Item");

        }

        protected void itemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            addOutputLabel.Text = gridOutputLabel.Text = "";
            if (itemDropDownList.SelectedIndex != 0)
            {
                bool isfound = false;

                int companyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                int itemId = Convert.ToInt32(itemDropDownList.SelectedValue);

                reorderTextBox.Text = itemManager.GetReorderLevelById(companyId, itemId).ToString();
                if (ViewState["stockOutListVs"] != null)
                {
                    List<StockOutItemViewModel> stockOutItemList =
                        ViewState["stockOutListVs"] as List<StockOutItemViewModel>;
                    string companyName = companyDropDownList.SelectedItem.Text;
                    string itemName = itemDropDownList.SelectedItem.Text;


                    foreach (StockOutItemViewModel item in stockOutItemList)
                    {
                        if (item.CompanyName.Equals(companyName) && item.ItemName.Equals(itemName))
                        {
                            availableQuantityTextBox.Text = item.AvailableQuantity.ToString();
                            isfound = true;
                            break;
                        }
                    }

                }
                if (!isfound)
                {
                    availableQuantityTextBox.Text = itemManager.GetQuantityById(companyId, itemId).ToString();
                }
            }
            else
            {
                reorderTextBox.Text = "";
                availableQuantityTextBox.Text = "";
            }

        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            bool isStockOutOk = true;

            addOutputLabel.Text = String.Empty;
            gridOutputLabel.Text = "";
            string company = companyDropDownList.SelectedItem.ToString();
            string item = itemDropDownList.SelectedItem.ToString();
            string itemStockOutQuantity = stockOutTextBox.Text;

            string message = stockOutManager.IsValidInput(company, item, itemStockOutQuantity);
            if (message != "valid")
            {
                addOutputLabel.Text = message;
            }
            else
            {
                int companyId = Convert.ToInt32(companyDropDownList.SelectedItem.Value);
                int itemId = Convert.ToInt32(itemDropDownList.SelectedItem.Value);
                if (ViewState["stockOutListVs"] == null)
                {

                    int availableQuantity = Convert.ToInt32(availableQuantityTextBox.Text);
                    int stockOutQuantity = Convert.ToInt32(stockOutTextBox.Text);

                    if (stockOutQuantity <= availableQuantity)
                    {
                        StockOutItemViewModel stockOutItem = new StockOutItemViewModel();
                        stockOutItem.CompanyId = companyId;
                        stockOutItem.CompanyName = company;
                        stockOutItem.ItemId = itemId;
                        stockOutItem.ItemName = item;
                        stockOutItem.StockOutQuantity = Convert.ToInt32(stockOutTextBox.Text);
                        stockOutItem.AvailableQuantity = availableQuantity - stockOutQuantity;

                        List<StockOutItemViewModel> stockOutItemList = new List<StockOutItemViewModel>();
                        stockOutItemList.Add(stockOutItem);
                        ViewState["stockOutListVs"] = stockOutItemList;
                    }
                    else
                    {
                        addOutputLabel.Text = "Insufficient item";
                        stockOutTextBox.Text = "";
                        isStockOutOk = false;
                    }

                }
                else
                {
                    int availableQuantity = Convert.ToInt32(availableQuantityTextBox.Text);
                    int stockOutQuantity = Convert.ToInt32(stockOutTextBox.Text);


                    List<StockOutItemViewModel> stockOutItemList = ViewState["stockOutListVs"] as List<StockOutItemViewModel>;

                    bool isItemfound = false;
                    int i = 0;
                    foreach (StockOutItemViewModel stockOutItem in stockOutItemList)
                    {
                        if (stockOutItem.CompanyName == company && stockOutItem.ItemName == item)
                        {
                            availableQuantity = stockOutItem.AvailableQuantity;
                            if (stockOutQuantity <= availableQuantity)
                            {
                                stockOutItemList[i].StockOutQuantity += stockOutQuantity;
                                stockOutItemList[i].AvailableQuantity = availableQuantity - stockOutQuantity;
                            }
                            else
                            {
                                addOutputLabel.Text = "Insufficient quantity";
                                stockOutTextBox.Text = "";
                                isStockOutOk = false;
                            }
                            isItemfound = true;
                            break;
                        }
                        i++;
                    }



                    if (!isItemfound && stockOutQuantity <= availableQuantity)
                    {

                        StockOutItemViewModel stockOutItem = new StockOutItemViewModel();

                        stockOutItem.CompanyName = companyDropDownList.SelectedItem.ToString();
                        stockOutItem.ItemId = Convert.ToInt32(itemDropDownList.SelectedItem.Value);
                        stockOutItem.ItemName = itemDropDownList.SelectedItem.ToString();
                        stockOutItem.StockOutQuantity = Convert.ToInt32(stockOutTextBox.Text);
                        stockOutItem.AvailableQuantity = availableQuantity - stockOutQuantity;
                        stockOutItemList.Add(stockOutItem);
                    }
                    else if (!isItemfound && stockOutQuantity > availableQuantity)
                    {
                        addOutputLabel.Text = "Insufficient quantity";
                        stockOutTextBox.Text = "";
                        isStockOutOk = false;
                    }



                    ViewState["stockOutListVs"] = stockOutItemList;


                }

                List<StockOutItemViewModel> stockOutItemsList = (List<StockOutItemViewModel>)ViewState["stockOutListVs"];
                stockOutGridView.DataSource = stockOutItemsList;
                stockOutGridView.DataBind();

                if (isStockOutOk)
                {
                    companyDropDownList.SelectedIndex = 0;
                    itemDropDownList.Items.Clear();
                    itemDropDownList.Items.Insert(0, "Select Item");
                    itemDropDownList.SelectedIndex = 0;
                    reorderTextBox.Text = "";
                    availableQuantityTextBox.Text = "";
                }
            }

            stockOutTextBox.Text = "";


        }

        protected void sellButton_Click(object sender, EventArgs e)
        {
            if (ViewState["stockOutListVs"] != null)
            {
                List<StockOutItemViewModel> stockOutItemsViewList =
                    (List<StockOutItemViewModel>)ViewState["stockOutListVs"];
                List<Item> allItems = new List<Item>();
                List<StockOutItem> allStockOutItems = new List<StockOutItem>();


                foreach (StockOutItemViewModel item in stockOutItemsViewList)
                {
                    Item anitem = new Item();
                    StockOutItem anStockOutItem = new StockOutItem();


                    anitem.Id = item.ItemId;
                    anitem.AvailableQuantity = item.AvailableQuantity;

                    anStockOutItem.ItemId = item.ItemId;
                    anStockOutItem.Quantity = item.StockOutQuantity;
                    anStockOutItem.Date = DateTime.Now.ToString("yyyy-MM-dd");
                    anStockOutItem.StockOutType = "Sell";

                    allItems.Add(anitem);
                    allStockOutItems.Add(anStockOutItem);

                }

                gridOutputLabel.Text = stockOutManager.SellItems(allItems, allStockOutItems, "Sell");

                stockOutGridView.DataSource = null;
                stockOutGridView.DataBind();
                ViewState["stockOutListVs"] = null;
            }
            else
            {
                gridOutputLabel.Text = "Please insert data first";
                addOutputLabel.Text = "";
            }
        }

        protected void damageButton_Click(object sender, EventArgs e)
        {
            if (ViewState["stockOutListVs"] != null)
            {
                List<StockOutItemViewModel> stockOutItemsViewList =
                    (List<StockOutItemViewModel>)ViewState["stockOutListVs"];
                List<Item> allItems = new List<Item>();
                List<StockOutItem> allStockOutItems = new List<StockOutItem>();


                foreach (StockOutItemViewModel item in stockOutItemsViewList)
                {
                    Item anitem = new Item();
                    StockOutItem anStockOutItem = new StockOutItem();


                    anitem.Id = item.ItemId;
                    anitem.AvailableQuantity = item.AvailableQuantity;

                    anStockOutItem.ItemId = item.ItemId;
                    anStockOutItem.Quantity = item.StockOutQuantity;
                    anStockOutItem.Date = DateTime.Now.ToString("yyyy-MM-dd");
                    anStockOutItem.StockOutType = "Damage";

                    allItems.Add(anitem);
                    allStockOutItems.Add(anStockOutItem);

                }

                gridOutputLabel.Text = stockOutManager.SellItems(allItems, allStockOutItems, "Damage");

                stockOutGridView.DataSource = null;
                stockOutGridView.DataBind();
                ViewState["stockOutListVs"] = null;
            }
            else
            {
                gridOutputLabel.Text = "Please insert data first";
                addOutputLabel.Text = "";
            }
        }

        protected void lostButton_Click(object sender, EventArgs e)
        {
            if (ViewState["stockOutListVs"] != null)
            {
                List<StockOutItemViewModel> stockOutItemsViewList =
                    (List<StockOutItemViewModel>)ViewState["stockOutListVs"];
                List<Item> allItems = new List<Item>();
                List<StockOutItem> allStockOutItems = new List<StockOutItem>();


                foreach (StockOutItemViewModel item in stockOutItemsViewList)
                {
                    Item anitem = new Item();
                    StockOutItem anStockOutItem = new StockOutItem();


                    anitem.Id = item.ItemId;
                    anitem.AvailableQuantity = item.AvailableQuantity;

                    anStockOutItem.ItemId = item.ItemId;
                    anStockOutItem.Quantity = item.StockOutQuantity;
                    anStockOutItem.Date = DateTime.Now.ToString("yyyy-MM-dd");
                    anStockOutItem.StockOutType = "Lost";

                    allItems.Add(anitem);
                    allStockOutItems.Add(anStockOutItem);

                }

                gridOutputLabel.Text = stockOutManager.SellItems(allItems, allStockOutItems, "Lost");

                stockOutGridView.DataSource = null;
                stockOutGridView.DataBind();
                ViewState["stockOutListVs"] = null;
            }
            else
            {
                gridOutputLabel.Text = "Please insert data first";
                addOutputLabel.Text = "";
            }
        }
    }
}