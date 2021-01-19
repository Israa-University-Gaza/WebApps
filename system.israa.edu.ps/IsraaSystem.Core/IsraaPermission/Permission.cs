using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IsraaSystem.Entity.IsraaPermission
{
    [Table("Permission")]
    public partial class Permission
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Permission()
        {
            RolePermission = new HashSet<RolePermission>();
        }

        public int ID { get; set; }

        public string ArName { get; set; }

        [Required]
        public string Name { get; set; }

        [StringLength(50)]
        public string AGroup { get; set; }

        public int AreaID { get; set; }

        public bool IsActive { get; set; }

        public bool IsDelete { get; set; }

        public DateTime InsertDate { get; set; }

        public int InsertEmployeeID { get; set; }

        public DateTime? UpdateDate { get; set; }

        public int? UpdateEmployeeID { get; set; }

        public DateTime? DeleteDate { get; set; }

        public int? DeleteEmployeeID { get; set; }

        [StringLength(100)]
        public string Controller { get; set; }

        [StringLength(100)]
        public string Action { get; set; }

        public virtual Area Area { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RolePermission> RolePermission { get; set; }
    }
}
