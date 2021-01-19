using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
//using System.Web.WebPages.Html;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.ManualFingerprint
{
    public class ManualFingerprintVM
    {
        public ManualFingerprintFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public ManualFingerprintVM(ManualFingerprintFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class ManualFingerprintFilter
    {
        public string EmployeeName { get; set; }
        public string FingerprintTypeID { get; set; }
        public string AccreditationStatusID { get; set; }
        public string BranchID { get; set; }
        public string DateFrom { get; set; }
        public string DateTo { get; set; }

        public List<SelectListItem> FingerprintTypes { get; set; }
        public List<SelectListItem> AccreditationStatuses { get; set; }
        public List<SelectListItem> Branches { get; set; }

        public ManualFingerprintFilter()
        {

        }
        public ManualFingerprintFilter(string EmployeeName, string FingerprintTypeID, string AccreditationStatusID,string DateFrom,string DateTo, List<SelectListItem> FingerprintTypes, List<SelectListItem> AccreditationStatuses,List<SelectListItem> Branches)
        {
            this.EmployeeName = EmployeeName;
            this.AccreditationStatusID = AccreditationStatusID;
            this.FingerprintTypeID = FingerprintTypeID;
            this.FingerprintTypes = FingerprintTypes;
            this.AccreditationStatuses = AccreditationStatuses;
            this.DateFrom = DateFrom;
            this.DateTo = DateTo;
            this.Branches = Branches;
        }
    }
}

