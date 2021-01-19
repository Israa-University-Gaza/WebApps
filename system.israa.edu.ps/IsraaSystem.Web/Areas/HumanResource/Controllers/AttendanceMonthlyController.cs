using IsraaSystem.Application.HumanResource;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Academic;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.Attendance;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using SelectDA = IsraaSystem.DataAccess.Sql.HumanResource.SelectDA;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class AttendanceMonthlyController : BaseController
    {
        public ActionResult Index()
        {
            AttendanceMonthlyVM vm = AttendanceDA.GetFilterdAttendanceMonthly(new AttendanceMonthlyVM(new AttendanceMonthlyFilter("", "", "", "", SelectDA.ddlMonths(), SelectDA.ddlVacationBalanceYears()), new Pagging("List", "form-attendance-monthly", 1, 50)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(AttendanceMonthlyFilter filter, Pagging pagging)
        {
            AttendanceMonthlyVM vm = AttendanceDA.GetFilterdAttendanceMonthly(new AttendanceMonthlyVM(filter, new Pagging("List", "form-attendance-monthly", pagging.currentPage, pagging.pageSize)));
            vm.filter.Monthes = SelectDA.ddlMonths();
            vm.filter.VacationBalanceYears = SelectDA.ddlVacationBalanceYears();
            return View(vm);
        }


        [HttpPost]
        public ActionResult DeductedFromSalary(int id)
        {
            DataTable DT = AttendanceDA.AttendanceMonthlyDeductFromSalary(id, 1);
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-attendance-monthly");
        }
    }
}