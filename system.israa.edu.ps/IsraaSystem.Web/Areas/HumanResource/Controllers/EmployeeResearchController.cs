using IsraaSystem.Application.HumanResource;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.EmployeeResearch;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeResearchController : BaseController
    {
        // GET: HumanResource/EmployeeResearch
        //public ActionResult Index()
        //{
        //    EmployeeResearchVM vm = EmployeeResearchDA.GetFilterdEmployeeResearchs(new EmployeeResearchVM(new EmployeeResearchFilter(-1, ""), new Pagging("List", "employee-research", 1, 10)));
        //    return View(vm);
        //}

        //public ActionResult List(EmployeeResearchFilter filter)
        //{
        //    EmployeeResearchVM vm = EmployeeResearchDA.GetFilterdEmployeeResearchs(new EmployeeResearchVM(filter, new Pagging("list", "form-employee-research", 1, 1000)));
        //    return View(vm);
        //}

        public ActionResult EmployeeList(int id)
        {
            EmployeeResearchVM vm = EmployeeResearchDA.GetFilterdEmployeeResearchs(new EmployeeResearchVM(new EmployeeResearchFilter(id), new Pagging("Employeelist", "employee-page", 1, 1000)));
            return View(vm);
        }

        public ActionResult EmployeeAdd(int empId)
        {
            EmployeeResearch employeeResearch = new EmployeeResearch()
            {
                EmployeeID = empId
            };
            return View(employeeResearch);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeAdd(EmployeeResearch employeeResearch)
        {
            employeeResearch.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeeResearchDA.EmployeeResearchAddEdit(employeeResearch);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(employeeResearch);
        }

        public ActionResult EmployeeEdit(int id)
        {
            DataTable DT = EmployeeResearchDA.EmployeeResearchGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeeResearch employeeResearch = new EmployeeResearch()
                {
                    ID = id,
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                    ResearchTitle = DT.Rows[0]["ResearchTitle"].ToString(),
                    ResearchOrganization = DT.Rows[0]["ResearchOrganization"].ToString(),
                    ResearchDetails = DT.Rows[0]["ResearchDetails"].ToString(),
                    ResearchDate = DT.Rows[0]["ResearchDate"].ToString()
                };
                return View(employeeResearch);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeEdit(EmployeeResearch employeeResearch)
        {
            employeeResearch.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeeResearchDA.EmployeeResearchAddEdit(employeeResearch);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(employeeResearch);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = EmployeeResearchDA.EmployeeResearchDelete(id, GetEmployeeID());
            int EmpID = Convert.ToInt32(DT.Rows[0]["EmpID"].ToString());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            EmployeeResearchVM vm = EmployeeResearchDA.GetFilterdEmployeeResearchs(new EmployeeResearchVM(new EmployeeResearchFilter(EmpID), new Pagging("Employeelist", "employee-page", 1, 10)));
            return View("EmployeeList", vm);
        }
    }
}