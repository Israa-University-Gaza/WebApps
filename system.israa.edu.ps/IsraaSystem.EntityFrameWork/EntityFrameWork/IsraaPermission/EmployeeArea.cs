//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IsraaSystem.DataAccess.EntityFrameWork.IsraaPermission
{
    using System;
    using System.Collections.Generic;
    
    public partial class EmployeeArea
    {
        public int ID { get; set; }
        public int EmployeeID { get; set; }
        public int AreaID { get; set; }
        public bool IsAllTime { get; set; }
        public Nullable<System.DateTime> AvailableFrom { get; set; }
        public Nullable<System.DateTime> AvailableTo { get; set; }
        public bool IsActive { get; set; }
        public bool IsDelete { get; set; }
        public System.DateTime InsertDate { get; set; }
        public int InsertEmployeeID { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> UpdateEmployeeID { get; set; }
        public Nullable<System.DateTime> DeleteDate { get; set; }
        public Nullable<int> DeleteEmployeeID { get; set; }
    
        public virtual Area Area { get; set; }
        public virtual Employee Employee { get; set; }
    }
}
