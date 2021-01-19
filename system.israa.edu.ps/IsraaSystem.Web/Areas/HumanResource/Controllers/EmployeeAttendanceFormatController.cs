using IsraaSystem.Application.HumanResource;
using System;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.Attendance;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeAttendanceFormatController : BaseController
    {
        public ActionResult Index()
        {
            EmployeeAttendanceFormatFilter filter = new EmployeeAttendanceFormatFilter("", "", "", SelectDA.ddlAttendanceFormats());
            Pagging pagging = new Pagging("List", "form-employee-attendance-format", 1, 100);
            EmployeeAttendanceFormatVM vm = new EmployeeAttendanceFormatVM(filter, pagging);
            vm = AttendanceDA.GetFilterdEmployeeAttendanceFormats(vm);
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(EmployeeAttendanceFormatFilter filter, Pagging pagging)
        {
            EmployeeAttendanceFormatVM vm = AttendanceDA.GetFilterdEmployeeAttendanceFormats(new EmployeeAttendanceFormatVM(filter, new Pagging("List", "form-employee-attendance-format", pagging.currentPage, pagging.pageSize)));
            vm.filter.AttendanceFormats = SelectDA.ddlAttendanceFormats();
            return View(vm);
        }

        public ActionResult Add()
        {
            EmployeeAttendanceFormat employeeAttendanceFormat = new EmployeeAttendanceFormat()
            {
                Employees = SelectDA.ddlEmployees(),
                AttendanceFormats = SelectDA.ddlAttendanceFormats()
            };
            return View(employeeAttendanceFormat);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(EmployeeAttendanceFormat employeeAttendanceFormat)
        {
            employeeAttendanceFormat.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = AttendanceDA.EmployeeAttendanceFormatAdd(employeeAttendanceFormat);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();

                DataTable DT2 = AttendanceDA.ReCalculateEmployeeDateRangeAttendanceDaily(employeeAttendanceFormat);


            }
            employeeAttendanceFormat.Employees = SelectDA.ddlEmployees();
            employeeAttendanceFormat.AttendanceFormats = SelectDA.ddlAttendanceFormats();
            return View(employeeAttendanceFormat);
        }



        public ActionResult Edit(int id, DateTime? activeToDate)
        {

            EmployeeAttendanceFormat manualFingerprint = new EmployeeAttendanceFormat()
            {
                ID = id,
                ActiveToDate = (activeToDate != null) ? activeToDate.Value.Date.ToString() : DateTime.Now.Date.ToString(),
                UserID = Convert.ToInt32(User.Identity.Name)

            };
            return View(manualFingerprint);

        }


        [HttpPost]

        [ValidateAntiForgeryToken]
        public ActionResult Edit(EmployeeAttendanceFormat manualFingerprint)
        {
            manualFingerprint.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = AttendanceDA.EmployeeAttendanceFormatEdit(manualFingerprint);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(manualFingerprint);

        }



    }
}