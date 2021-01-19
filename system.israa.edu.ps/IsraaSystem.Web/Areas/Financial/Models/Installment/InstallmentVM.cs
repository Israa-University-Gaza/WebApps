using System;

namespace IsraaSystem.Web.Areas.Financial.Models.Installment
{
    public class InstallmentVM
    {
        public int? SemesterId { get; set; }
        public int? StudentId { get; set; }
        public DateTime? InsertDateFrom { get; set; }
        public DateTime? InsertDateTo { get; set; }
    }
}