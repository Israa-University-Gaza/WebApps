using System.Collections.Generic;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.HumanResource.MachineFingerprint
{
    public class MachineFingerprint
    {
        public int? ID { get; set; }
        public int EmployeeID { get; set; }
        public int FingerprintTypeID { get; set; }
        public string FingerprintDate { get; set; }
        public int UserID { get; set; }

        public List<SelectListItem> FingerprintTypes { get; set; }
    }
}
