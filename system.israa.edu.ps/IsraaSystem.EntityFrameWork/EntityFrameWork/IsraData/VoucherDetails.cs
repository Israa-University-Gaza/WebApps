//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IsraaSystem.DataAccess.EntityFrameWork.IsraData
{
    using System;
    using System.Collections.Generic;
    
    public partial class VoucherDetails
    {
        public int ID { get; set; }
        public int VoucherID { get; set; }
        public decimal Amount { get; set; }
        public int CurrencyID { get; set; }
        public Nullable<int> CurrencyPriceID { get; set; }
        public bool IsDelete { get; set; }
        public System.DateTime InsertDate { get; set; }
        public int InsertEmployeeID { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> UpdateEmployeeID { get; set; }
        public Nullable<System.DateTime> DeleteDate { get; set; }
        public Nullable<int> DeleteEmployeeID { get; set; }
    
        public virtual Currency Currency { get; set; }
        public virtual Voucher Voucher { get; set; }
    }
}
