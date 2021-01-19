using System.Data;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeIdentifier
{
    public class EmployeeIdentifierVM
    {
        public EmployeeIdentifierFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeeIdentifierVM(EmployeeIdentifierFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeeIdentifierFilter
    {
        public int EmployeeID { get; set; }
        public string ArFirstName { get; set; }
        public string ArSecoundName { get; set; }
        public string ArThirdName { get; set; }
        public string ArFamilyName { get; set; }

        public EmployeeIdentifierFilter()
        {
        }

        public EmployeeIdentifierFilter(int EmployeeID)
        {
            this.EmployeeID = EmployeeID;
        }

        public EmployeeIdentifierFilter(int EmployeeID, string ArFirstName, string ArSecoundName, string ArThirdName, string ArFamilyName)
        {
            this.EmployeeID = EmployeeID;
            this.ArFirstName = ArFirstName;
            this.ArSecoundName = ArSecoundName;
            this.ArThirdName = ArThirdName;
            this.ArFamilyName = ArFamilyName;
        }
    }
}
