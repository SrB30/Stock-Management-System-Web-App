using System.Collections.Generic;
using SAS_StockManagementSystemWebApp.DAL.Gateway;
using SAS_StockManagementSystemWebApp.DAL.Model;

namespace SAS_StockManagementSystemWebApp.BLL
{
    public class CategoryManager
    {
        private CategoryGateway categoryGateway = new CategoryGateway();

        public string IsInputValid(Category category)
        {
            int count = 0;
            int length = category.Name.Length;
            for (int i = 0; i < length; i++)
            {
                if (category.Name[i] == ' ')
                {
                    count++;
                }
            }

            if (count == length)
            {
                return "Category name can not be empty ";
            }
            if (category.Name[0] == ' ' || category.Name[length - 1] == ' ')
            {
                return "Invalid category name. Insert without leading and trailing space(s)";
            }
            if (categoryGateway.isNameExist(category.Name))
            {
                return "This category already exists";
            }
            return "valid";
        }
        public string Save(Category category)
        {
            string message = IsInputValid(category);
            if (message != "valid")
            {
                return message;
            }
            else
            {
                int rowAffect = categoryGateway.Save(category);
                if (rowAffect > 0)
                {
                    return "Save successful";
                }
                else
                {
                    return "Save failed";
                }
            }

        }

        public Category GetCategoryById(int id)
        {
            return categoryGateway.GetCategoryById(id);
        }

        public List<Category> GetAllCategory()
        {
            return categoryGateway.GetAllCategory();
        }

        public string UpdateById(Category category)
        {
            string message = IsInputValid(category);
            if (message != "valid")
            {
                return message;
            }

            else
            {
                int rowAffect = categoryGateway.UpdateById(category);
                if (rowAffect > 0)
                {
                    return "Update successful";
                }
                else
                {
                    return "Update failed";
                }
            }
        }
    }
}