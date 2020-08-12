using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Configuration;
using SAS_StockManagementSystemWebApp.DAL.Model;

namespace SAS_StockManagementSystemWebApp.DAL.Gateway
{
    public class CategoryGateway : BaseGateway
    {
        public int Save(Category category)
        {
            string query = "INSERT INTO Category(Name) VALUES(@name)";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@name", category.Name);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }

        public bool isNameExist(string name)
        {
            string query = "SELECT * FROM Category WHERE Name = @name";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@name", name);
            connection.Open();
            reader = command.ExecuteReader();
            bool isExist = reader.HasRows;
            connection.Close();
            return isExist;
        }

        public List<Category> GetAllCategory()
        {
            string query = "SELECT *FROM Category ORDER BY Name";
            command = new SqlCommand(query, connection);
             connection.Open();
            List<Category> categoryList = new List<Category>();
            reader = command.ExecuteReader();

            while (reader.Read())
            {
                Category category = new Category();
                category.Id = Convert.ToInt32(reader["ID"]);
                category.Name = reader["Name"].ToString();
                categoryList.Add(category);
            }
            reader.Close();
            connection.Close();

            return categoryList;
        }

        public Category GetCategoryById(int id)
        {
            string query = "SELECT * FROM Category WHERE ID=@id";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@id", id);
            connection.Open();
            reader = command.ExecuteReader();
            reader.Read();
            Category category = null;
            if (reader.HasRows)
            {
                category = new Category();
                category.Id = Convert.ToInt32(reader["ID"]);
                category.Name = reader["Name"].ToString();
            }

            reader.Close();
            connection.Close();

            return category;
        }

        public int UpdateById(Category category)
        {
            string query = "Update Category SET Name=@name Where ID = @id";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@name", category.Name);
            command.Parameters.AddWithValue("@id", category.Id);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }
    }
}