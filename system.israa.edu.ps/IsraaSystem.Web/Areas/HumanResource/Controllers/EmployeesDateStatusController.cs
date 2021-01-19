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
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeesDateStatusController : BaseController
    {
        public ActionResult Index()
        {
            EmployeesDateStatusVM vm = AttendanceDA.GetFilterdEmployeesDateStatuses(new EmployeesDateStatusVM(new EmployeesDateStatusFilter("", "", SelectDA.ddlDayStatuses()), new Pagging("List", "form-attendance-day-status", 1, 10)));
            return View(vm);
        }

        public ActionResult List(EmployeesDateStatusFilter filter)
        {
            EmployeesDateStatusVM vm = AttendanceDA.GetFilterdEmployeesDateStatuses(new EmployeesDateStatusVM(filter, new Pagging("list", "form-attendance-day-status", 1, 1000)));
            vm.filter.DayStatuses = SelectDA.ddlDayStatuses();
            return View(vm);
        }
    }
}