using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace IsraaSystem.Entity.IsraaPermission
{
    [Table("EmployeeRole")]
    public partial class EmployeeRole
    {
        public int ID { get; set; }

        public int EmployeeID { get; set; }

        public int RoleID { get; set; }

        public bool IsAllTime { get; set; }

        public DateTime? AvailableFrom { get; set; }

        public DateTime? AvailableTo { get; set; }

        public bool IsActive { get; set; }

        public bool IsDelete { get; set; }

        public DateTime InsertDate { get; set; }

        public int InsertEmployeeID { get; set; }

        public DateTime? UpdateDate { get; set; }

        public int? UpdateEmployeeID { get; set; }

        public DateTime? DeleteDate { get; set; }

        public int? DeleteEmployeeID { get; set; }

        public virtual Employee Employee { get; set; }

        public virtual Role Role { get; set; }
    }
}
