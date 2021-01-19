using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Core.Classic.HumanResource.Employee;
using IsraaSystem.Core.Classic.HumanResource.EmployeePlacement;
using IsraaSystem.Core.Classic.HumanResource.EmpStatus;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeAddController : BaseController
    {
        public ActionResult Index()
        {
            EmployeeAdd model = new EmployeeAdd();
            model.EmploymentTypes = SelectDA.ddlEmploymentTypes(true);
            return View(model);
        }

        public ActionResult EmployeeNo(int id)
        {
            DataTable DT = EmployeeDA.GetEmploymentTypeEmployeeNo(id);
            EmployeeAdd model = new EmployeeAdd(DT.Rows[0]["EmployeeNo"].ToString());

            return View(model);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(EmployeeAdd employee)
        {
            employee.InsertEmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeeDA.EmployeeAdd(employee);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            employee.EmploymentTypes = SelectDA.ddlEmploymentTypes(true);
            return View(employee);
        }

        public ActionResult ddlJob(int id)
        {
            EmployeePlacement model = new EmployeePlacement();
            {
                model.Jobs = SelectDA.ddlDepartmentJobs(id);
            };
            return View(model);
        }

        public ActionResult EmployeePlacementAdd()
        {
            EmployeePlacement model = new EmployeePlacement();
            {
                model.Departments = SelectDA.ddlDepartments();
                model.Jobs = SelectDA.ddlDepartmentJobs(-1);

                model.Caders = SelectDA.ddlCaders();
            }
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeePlacementAdd(EmployeePlacement employeeplacement)
        {
            employeeplacement.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeePlacementDA.EmployeePlacementAdd(employeeplacement);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                employeeplacement.Departments = SelectDA.ddlDepartments();
                employeeplacement.Jobs = SelectDA.ddlDepartmentJobs(-1);
                employeeplacement.Caders = SelectDA.ddlCaders();
            }

            return View(employeeplacement);
        }

        public ActionResult EmpStatusAdd()
        {
            EmpStatus model = new EmpStatus();
            // model.EmployeeStatuses = SelectDA.ddlEmployeeStatuses(true);
            return View(model);
        }

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult EmpStatusAdd(EmpStatus employeeStatus)
        //{
        //    employeeStatus.InsertEmployeeID = GetEmployeeID();
        //    if (ModelState.IsValid)
        //    {
        //     //   DataTable DT = EmpStatusDA.EmpStatusAdd(employeeStatus);
        //       // TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
        //    }
        // //   employeeStatus.EmployeeStatuses = SelectDA.ddlEmployeeStatuses(true);
        //    return View(employeeStatus);
        //}

    }
}