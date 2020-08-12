using System.Collections.Generic;
using SAS_StockManagementSystemWebApp.DAL.Gateway;
using SAS_StockManagementSystemWebApp.DAL.Model;

namespace SAS_StockManagementSystemWebApp.BLL
{
    public class CompanyManager
    {
        private CompanyGateway companyGateway = new CompanyGateway();

        public string Save(Company company)
        {
            int count = 0;
            int length = company.Name.Length;
            for (int i = 0; i < length; i++)
            {
                if (company.Name[i] == ' ')
                {
                    count++;
                }
            }

            if (count == length)
            {
                return "company name can not be empty ";
            }
            if (company.Name[0] == ' ' || company.Name[length - 1] == ' ')
            {
                return "Invalid company name. Insert without leading and trailing space(s)";
            }
            if (companyGateway.isNameExist(company.Name))
            {
                return "Already exists";
            }
            else
            {
                int rowAffect = companyGateway.Save(company);
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
        public List<Company> GetAllCompanyList()
        {
            return companyGateway.GetAllCompanyList();
        }
    }
}