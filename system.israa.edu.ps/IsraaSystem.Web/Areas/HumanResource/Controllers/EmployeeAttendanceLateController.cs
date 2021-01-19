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
    public class EmployeeAttendanceLateController : BaseController
    {
        public ActionResult Index()
        {
            EmployeeAttendanceLateVM vm = AttendanceDA.GetFilterdAttendanceLates(new EmployeeAttendanceLateVM(new EmployeeAttendanceLateFilter("", "-1", SelectDA.ddlLateTypes()), new Pagging("List", "form-employee-attendance-late", 1, 100)));
            return View(vm);
        }

        public ActionResult List(EmployeeAttendanceLateFilter filter,Pagging pagging)
        {
            EmployeeAttendanceLateVM vm = AttendanceDA.GetFilterdAttendanceLates(new EmployeeAttendanceLateVM(filter, new Pagging("list", "form-employee-attendance-late", pagging.currentPage, pagging.pageSize)));
            vm.filter.LateTypes = SelectDA.ddlLateTypes();
            return View(vm);
        }
    }
}