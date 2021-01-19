using IsraaSystem.Application.HumanResource;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IsraaSystem.Web.Controllers;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.HumanResource.Attendance;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeDateRangeStatusController : BaseController
    {
        public ActionResult Index()
        {
            EmployeeDateRangeStatusVM vm = AttendanceDA.GetFilterdEmployeeDateRangeStatuses(new EmployeeDateRangeStatusVM(new EmployeeDateRangeStatusFilter(SelectDA.ddlEmployees(), SelectDA.ddlDayStatuses())));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(EmployeeDateRangeStatusFilter filter)
        {
            EmployeeDateRangeStatusVM vm = AttendanceDA.GetFilterdEmployeeDateRangeStatuses(new EmployeeDateRangeStatusVM(filter));
            vm.filter.Employees = SelectDA.ddlEmployees();
            vm.filter.DayStatuses = SelectDA.ddlDayStatuses();
            return View(vm);
        }
    }
}