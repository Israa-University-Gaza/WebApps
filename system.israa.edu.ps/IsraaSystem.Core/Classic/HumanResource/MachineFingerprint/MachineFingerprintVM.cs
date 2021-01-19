using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.MachineFingerprint
{
    public class MachineFingerprintVM
    {
        public MachineFingerprintFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public MachineFingerprintVM(MachineFingerprintFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class MachineFingerprintFilter
    {
        public string EmployeeName { get; set; }
        public string FingerprintTypeID { get; set; }
        public string DateFrom { get; set; }
        public string DateTo { get; set; }

        public List<SelectListItem> FingerprintTypes { get; set; }


        public MachineFingerprintFilter()
        {
        }
        public MachineFingerprintFilter(string EmployeeName, string FingerprintTypeID, string DateFrom, string DateTo, List<SelectListItem> FingerprintTypes)
        {
            this.EmployeeName = EmployeeName;
            this.FingerprintTypeID = FingerprintTypeID;
            this.DateFrom = DateFrom;
            this.DateTo = DateTo;
            this.FingerprintTypes = FingerprintTypes;
        }
    }
}
