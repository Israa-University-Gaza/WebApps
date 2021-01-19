using System.Data;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeResearch
{
    public class EmployeeResearchVM
    {
        public EmployeeResearchFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeeResearchVM(EmployeeResearchFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }
    public class EmployeeResearchFilter
    {
        public int EmployeeID { get; set; }
        public string ResearchTitle { get; set; }

        public EmployeeResearchFilter()
        {
        }

        public EmployeeResearchFilter(int EmployeeID)
        {
            this.EmployeeID = EmployeeID;
        }
        public EmployeeResearchFilter(int EmployeeID, string ResearchTitle)
        {
            this.EmployeeID = EmployeeID;
            this.ResearchTitle = ResearchTitle;
        }
    }
}
