using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Configuration;
using SAS_StockManagementSystemWebApp.DAL.Model;

namespace SAS_StockManagementSystemWebApp.DAL.Gateway
{
    public class CompanyGateway : BaseGateway
    {
        public int Save(Company company)
        {
            string query = "INSERT INTO Company(Name) VALUES(@name)";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@name", company.Name);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }

        public bool isNameExist(string name)
        {
            string query = "SELECT *FROM Company WHERE Name = @name";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@name", name);
            connection.Open();
            reader = command.ExecuteReader();
            bool isExist = reader.HasRows;
            connection.Close();
            return isExist;
        }

        public List<Company> GetAllCompanyList()
        {
            string query = "SELECT *FROM Company ORDER BY Name";
            command = new SqlCommand(query, connection);
            connection.Open();
            List<Company> companyList = new List<Company>();
            reader = command.ExecuteReader();
            
            while (reader.Read())
            {
                Company company = new Company();
                
                company.Id = Convert.ToInt32(reader["ID"]);
                company.Name = reader["Name"].ToString();

                companyList.Add(company);
            }
            reader.Close();
            connection.Close();

            return companyList;

        }
    }
}