using System.Data;

namespace IsraaSystem.Core.Classic.Shared
{
    public class EmployeeDT
    {
        public int employeeId { get; set; }

        public DataTable data { get; set; }

        public EmployeeDT(int employeeId, DataTable data)
        {
            this.employeeId = employeeId;
            this.data = data;
        }
    }
}
