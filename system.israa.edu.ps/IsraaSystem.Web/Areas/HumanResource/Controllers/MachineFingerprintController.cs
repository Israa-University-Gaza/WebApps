using IsraaSystem.Application.HumanResource;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Web.Controllers;
using System.Data;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.MachineFingerprint;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.ActionFillters;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class MachineFingerprintController : BaseController
    {
        public ActionResult Index()
        {
            MachineFingerprintVM vm = AttendanceDA.GetFilterdMachineFingerprints(new MachineFingerprintVM(new MachineFingerprintFilter("", "", "", "", SelectDA.ddlFingerprintTypes()), new Pagging("List", "form-machine-fingerprint", 1, 100)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(MachineFingerprintFilter filter, Pagging pagging)
        {
            MachineFingerprintVM vm = AttendanceDA.GetFilterdMachineFingerprints(new MachineFingerprintVM(filter, new Pagging("List", "form-machine-fingerprint", pagging.currentPage, pagging.pageSize)));
            vm.filter.FingerprintTypes = SelectDA.ddlFingerprintTypes();
            return View(vm);
        }

        [HttpPost]
        [Authenticate]
        public ActionResult Apply(int id)
        {
            DataTable DT = AttendanceDA.MachineFingerprintApply(id);
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-manual-fingerprint");
        }
    }
}