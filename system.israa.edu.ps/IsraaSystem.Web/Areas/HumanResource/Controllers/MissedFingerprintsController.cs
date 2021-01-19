using IsraaSystem.Application.HumanResource;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.Attendance;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class MissedFingerprintsController : Controller
    {
        // GET: HumanResource/MissedFingerprints
        public ActionResult Index()
        {
            MissedFingerprintsVM vm = AttendanceDA.GetFilteredMissedFingerprints(new MissedFingerprintsVM(new MissedFingerprintsFilter(DateTime.Now.ToString("yyyy/MM/dd"), ""), new Pagging("List", "form-missed-fingerprints", 1, 100)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(MissedFingerprintsFilter filter)
        {
            MissedFingerprintsVM vm = AttendanceDA.GetFilteredMissedFingerprints(new MissedFingerprintsVM(filter, new Pagging("list", "form-missed-fingerprints", 1, 100)));
            return View(vm);
        }

        public ActionResult IndexInstructor()
        {
            InstructorMissedFingerprintsVM vm = AttendanceDA.GetFilteredInstructorsMissedFingerprints(new InstructorMissedFingerprintsVM(new InstructorMissedFingerprintsFilter("-1", "-1", DateTime.Now.ToString("yyyy/MM/dd"), DateTime.Now.ToString("yyyy/MM/dd"), SelectDA.ddlEmployees(), SelectDA.ddlSemesters()), new Pagging("ListInstructor", "form-missed-fingerprints", 1, 100)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult ListInstructor(InstructorMissedFingerprintsFilter filter)
        {
            InstructorMissedFingerprintsVM vm = AttendanceDA.GetFilteredInstructorsMissedFingerprints(new InstructorMissedFingerprintsVM(filter, new Pagging("ListInstructor", "form-missed-fingerprints", 1, 100)));
            vm.filter.Employees = SelectDA.ddlEmployees();
            vm.filter.Semesters = SelectDA.ddlSemesters();
            return View(vm);
        }
    }
}