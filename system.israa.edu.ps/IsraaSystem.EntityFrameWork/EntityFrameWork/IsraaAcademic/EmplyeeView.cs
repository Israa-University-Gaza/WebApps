//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic
{
    using System;
    using System.Collections.Generic;
    
    public partial class EmplyeeView
    {
        public int ID { get; set; }
        public string EmployeeNo { get; set; }
        public Nullable<bool> IsObserver { get; set; }
        public Nullable<int> ObserverBranchID { get; set; }
        public bool IsActive { get; set; }
        public bool IsDelete { get; set; }
        public Nullable<bool> IsSuperAdmin { get; set; }
        public string ArNameTitle { get; set; }
        public string ArSecoundName { get; set; }
        public string ArThirdName { get; set; }
        public string ArFamilyName { get; set; }
        public string ImageURL { get; set; }
        public Nullable<int> Gender { get; set; }
        public string SSN { get; set; }
        public Nullable<System.DateTime> DateOfBirth { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string ArFirstName { get; set; }
    }
}
