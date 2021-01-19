using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Core.Classic.HumanResource.Attendance;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeesDateRangeStatusesController : BaseController
    {
        public ActionResult Index()
        {
            EmployeesDateRangeStatusesVM vm = AttendanceDA.GetFilterdEmployeesDateRangeStatuses(new EmployeesDateRangeStatusesVM(new EmployeesDateRangeStatusesFilter("", "", "", "", "", SelectDA.ddlDayStatuses(), SelectDA.ddlEmployeeStatuses(null)), new Pagging("List", "form-employees-date-range-statuses", 1, 100)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(EmployeesDateRangeStatusesFilter filter, Pagging pagging)
        {
            EmployeesDateRangeStatusesVM vm = AttendanceDA.GetFilterdEmployeesDateRangeStatuses(new EmployeesDateRangeStatusesVM(filter, new Pagging("list", "form-employees-date-range-statuses", pagging.currentPage, pagging.pageSize)));
            vm.filter.DayStatuses = SelectDA.ddlDayStatuses();
            vm.filter.EmployeeStatuses = SelectDA.ddlEmployeeStatuses(null);
            return View(vm);
        }
    }
}