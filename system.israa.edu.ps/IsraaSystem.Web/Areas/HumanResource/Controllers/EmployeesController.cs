using IsraaSystem.Application.HumanResource;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.Employee;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;
using IsraaSystem.Web.Security;


namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{


    public class EmployeesController : BaseController
    {
        public ActionResult Index()
        {
            EmployeeVM vm = EmployeeDA.GetFilterdEmployees(new EmployeeVM(new EmployeeFilter("1", "", SelectDA.ddlEmployeeStatuses(null), SelectDA.ddlEmploymentTypes(null)), new Pagging("List", "form-employee", 1, 18)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(EmployeeFilter filter, Pagging pagging)
        {
            EmployeeVM vm = EmployeeDA.GetFilterdEmployees(new EmployeeVM(filter, new Pagging("List", "form-employee", pagging.currentPage, 18)));
            vm.filter.EmployeeStatuses = SelectDA.ddlEmployeeStatuses(null);
            vm.filter.EmploymentTypes = SelectDA.ddlEmploymentTypes(null);
            return View(vm);
        }
    }
}