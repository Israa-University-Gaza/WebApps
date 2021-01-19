using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IsraaSystem.Entity.IsraaPermission
{
    [Table("Role")]
    public partial class Role
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Role()
        {
            EmployeeRole = new HashSet<EmployeeRole>();
            RolePermission = new HashSet<RolePermission>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        public int AreaID { get; set; }

        public bool IsActive { get; set; }

        public bool IsDelete { get; set; }

        public DateTime InsertDate { get; set; }

        public int InsertEmployeeID { get; set; }

        public DateTime? UpdateDate { get; set; }

        public int? UpdateEmployeeID { get; set; }

        public DateTime? DeleteDate { get; set; }

        public int? DeleteEmployeeID { get; set; }

        public virtual Area Area { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EmployeeRole> EmployeeRole { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RolePermission> RolePermission { get; set; }
    }
}
