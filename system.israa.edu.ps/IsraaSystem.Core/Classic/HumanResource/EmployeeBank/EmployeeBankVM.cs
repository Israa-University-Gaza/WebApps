using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeBank
{
    public class EmployeeBankVM
    {
        public EmployeeBankFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeeBankVM(EmployeeBankFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeeBankFilter
    {
        public int EmployeeID { get; set; }
        public string BankID { get; set; }
        public string BankNo { get; set; }
        public string BankBranch { get; set; }

        public List<SelectListItem> Banks { get; set; }

        public EmployeeBankFilter()
        {
        }

        public EmployeeBankFilter(int EmployeeID)
        {
            this.EmployeeID = EmployeeID;
        }
        public EmployeeBankFilter(int EmployeeID,string BankID, string BankNo, string BankBranch, List<SelectListItem> Banks)
        {
            this.EmployeeID = EmployeeID;
            this.BankID = BankID;
            this.Banks = Banks;
            this.BankBranch = BankBranch;
            this.Banks = Banks;
        }
    }
}
