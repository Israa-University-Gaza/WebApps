using System.Data;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeMedicalCheckUp
{
    public class EmployeeMedicalCheckUpVM
    {
        public EmployeeMedicalCheckUpVM(EmployeeMedicalCheckUpFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }

        public EmployeeMedicalCheckUpFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

    }

    public class EmployeeMedicalCheckUpFilter
    {
        public EmployeeMedicalCheckUpFilter()
        {
        }

        public EmployeeMedicalCheckUpFilter(int employeeID)
        {
            EmployeeID = employeeID;
        }

        public int EmployeeID { get; set; }



    }

}
