using IsraaSystem.Entity.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace IsraaSystem.Entity.HumanResource.Salary
{
    public class EmployeeBonusVM
    {
        public EmployeeBonusFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeeBonusVM()
        {
        }

        public EmployeeBonusVM(EmployeeBonusFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeeBonusFilter
    {
        public string EmployeeName { get; set; }
        public string BonusID { get; set; }
        public string DateFrom { get; set; }
        public string DateTo { get; set; }

        public List<SelectListItem> Bonuses { get; set; }


        public EmployeeBonusFilter()
        {
        }

        public EmployeeBonusFilter(string EmployeeName, string BonusID, string DateFrom, string DateTo, List<SelectListItem> Bonuses)
        {
            this.EmployeeName = EmployeeName;
            this.BonusID = BonusID;
            this.DateFrom = DateFrom;
            this.DateTo = DateTo;
            this.Bonuses = Bonuses;
        }
    }
}
