using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Core.Classic.HumanResource.EmpStatus;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class ObserverController : Controller
    {
        // GET: HumanResource/Observer
        public ActionResult Index()
        {
            EmpStatusVM vm = EmpStatusDA.GetFilterdEmpStatuses(new EmpStatusVM(new EmpStatusFilter("", "", SelectDA.ddlEmployeeStatuses(null)), new Pagging("List", "form-emp-status", 1, 50)));
            return View(vm);

        }


        [HttpPost]
        public ActionResult List(EmpStatusFilter filter, Pagging pagging)
        {
            filter.Date = DateTime.Now.Date.ToString();
            EmpStatusVM vm = EmpStatusDA.GetFilterdEmpStatuses(new EmpStatusVM(filter, new Pagging("List", "form-emp-status", pagging.currentPage, pagging.pageSize)));
            vm.filter.EmployeeStatuses = SelectDA.ddlEmployeeStatuses(null);
            return View(vm);
        }





        [HttpPost]
        public ActionResult EmployeeObserverUpdate(int EmployeeID, bool? IsObserver, bool? ObserverBranchID)
        {



            DataTable DT = EmployeeDA.EmployeeObserverUpdate(EmployeeID, IsObserver, ObserverBranchID != null && ObserverBranchID.Value ? 2 : 1);


            if (DT.Rows.Count > 0)
            {
                return Json(new { Status = DT.Rows[0]["Status"].ToString() });
            }
            else
            {
                return Json(new { Status = "0" });
            }

        }

    }
}