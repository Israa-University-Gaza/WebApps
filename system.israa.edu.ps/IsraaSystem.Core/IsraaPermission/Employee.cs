using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IsraaSystem.Entity.IsraaPermission
{
    [Table("Employee")]
    public partial class Employee
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Employee()
        {
            EmployeeArea = new HashSet<EmployeeArea>();
            EmployeeRole = new HashSet<EmployeeRole>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        [StringLength(10)]
        public string EmployeeNo { get; set; }

        [Required]
        [StringLength(50)]
        public string Password { get; set; }

        public int? Gender { get; set; }

        public bool IsObserver { get; set; }

        public int? ObserverBranchID { get; set; }

        public bool IsActive { get; set; }

        public bool IsDelete { get; set; }

        public DateTime InsertDate { get; set; }

        public int InsertEmployeeID { get; set; }

        public DateTime? UpdateDate { get; set; }

        public int? UpdateEmployeeID { get; set; }

        public DateTime? DeleteDate { get; set; }

        public int? DeleteEmployeeID { get; set; }

        public bool? IsSuperAdmin { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EmployeeArea> EmployeeArea { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EmployeeRole> EmployeeRole { get; set; }
    }
}
