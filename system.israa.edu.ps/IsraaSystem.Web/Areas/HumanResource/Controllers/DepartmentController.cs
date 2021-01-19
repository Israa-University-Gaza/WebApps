using System;
using System.Collections.Generic;
using IsraaSystem.Application.HumanResource;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.Department;
using IsraaSystem.Core.Classic.HumanResource.EmployeePlacement;
using IsraaSystem.Core.Classic.HumanResource.Job;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class DepartmentController : BaseController
    {
        public ActionResult Index()
        {
            DepartmentsVM vm = DepartmentDA.GetFilterdDepartments(new DepartmentsVM(new DepartmentsFilter("", "", SelectDA.ddlDepartments()), new Pagging("List", "form-department", 1, 50)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(DepartmentsFilter filter, Pagging pagging)
        {
            DepartmentsVM vm = DepartmentDA.GetFilterdDepartments(new DepartmentsVM(filter, new Pagging("List", "form-department", pagging.currentPage, pagging.pageSize)));
            vm.filter.Departments = SelectDA.ddlDepartments();
            return View(vm);
        }

        public ActionResult Add()
        {
            Department department = new Department()
            {
                Departments = SelectDA.ddlDepartments(),
                DepartmentTypes = SelectDA.ddlDepartmentTypes()
            };
            return View(department);
        }

        public ActionResult DepartmentAdd(int id)
        {
            DataTable DT = DepartmentDA.DepartmentGet(id);
            if (DT.Rows.Count > 0)
            {
                DepartmentAdd department = new DepartmentAdd()
                {
                    DepartmentID = Convert.ToInt32(DT.Rows[0]["ID"].ToString()),
                    DepartmentName = DT.Rows[0]["ArName"].ToString(),
                    DepartmentTypes = SelectDA.ddlDepartmentTypes()
                };
                return View(department);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(Department department)
        {
            department.EmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = DepartmentDA.DepartmentAddEdit(department);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            department.Departments = SelectDA.ddlDepartments();
            department.DepartmentTypes = SelectDA.ddlDepartmentTypes();
            return View(department);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = DepartmentDA.DepartmentGet(id);
            if (DT.Rows.Count > 0)
            {
                Department department = new Department()
                {
                    ID = Convert.ToInt32(DT.Rows[0]["ID"].ToString()),
                    ArName = DT.Rows[0]["ArName"].ToString(),
                    ParentID = Convert.ToInt32(DT.Rows[0]["ParentID"].ToString()),
                    DepartmentTypeID = Convert.ToInt32(DT.Rows[0]["DepartmentTypeID"].ToString()),
                    IsActive = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString()),
                    Departments = SelectDA.ddlDepartments(),
                    DepartmentTypes = SelectDA.ddlDepartmentTypes(),
                };

                return View(department);
            }
            else
            {
                return HttpNotFound();
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Department department)
        {
            department.EmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = DepartmentDA.DepartmentAddEdit(department);
                TempData["edit-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            department.Departments = SelectDA.ddlDepartments();
            department.DepartmentTypes = SelectDA.ddlDepartments();

            return View(department);
        }


        public ActionResult ddlDepartmentJobs(int id)
        {
            EmployeePlacement employeePlacement = new EmployeePlacement()
            {
                Jobs = SelectDA.ddlDepartmentJobs(id)
            };
            return View(employeePlacement);
        }

        public ActionResult EmployeePlacementAdd(int departmentId)
        {
            DataTable DT = DepartmentDA.DepartmentGet(departmentId);
            if (DT.Rows.Count > 0)
            {
                EmployeePlacement employeePlacement = new EmployeePlacement()
                {
                    DepartmentName = DT.Rows[0]["ArName"].ToString(),
                    DepartmentID = departmentId,

                    Employees = SelectDA.ddlEmployees(),
                    Jobs = SelectDA.ddlDepartmentJobs(departmentId),
                    Caders = SelectDA.ddlCaders(),
                    PlacementStatuses = SelectDA.ddlPlacementStatuses(),
                    PlacementTypes = SelectDA.ddlPlacementTypes()
                };
                return View(employeePlacement);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeePlacementAdd(EmployeePlacement employeePlacement)
        {
            employeePlacement.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeePlacementDA.EmployeePlacementAdd(employeePlacement);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            employeePlacement.Employees = SelectDA.ddlEmployees();
            employeePlacement.Jobs = SelectDA.ddlDepartmentJobs(employeePlacement.DepartmentID);
            employeePlacement.Caders = SelectDA.ddlCaders();
            employeePlacement.PlacementStatuses = SelectDA.ddlPlacementStatuses();
            employeePlacement.PlacementTypes = SelectDA.ddlPlacementTypes();
            return View(employeePlacement);
        }

        public ActionResult DepartmentJobAdd(int departmentId)
        {
            DataTable DT = DepartmentDA.DepartmentGet(departmentId);
            if (DT.Rows.Count > 0)
            {
                Job job = new Job()
                {
                    DepartmentName = DT.Rows[0]["ArName"].ToString(),
                    DepartmentID = departmentId,

                    ManagerJobs = SelectDA.ddlJobs(),
                    Caders = SelectDA.ddlCaders(),
                    CaderDegrees = SelectDA.ddlCaderDegrees(-1)
                };
                return View(job);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DepartmentJobAdd(Job job)
        {
            job.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = JobDA.JobAddEdit(job);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            job.ManagerJobs = SelectDA.ddlJobs();
            job.Caders = SelectDA.ddlCaders();
            job.CaderDegrees = SelectDA.ddlCaderDegrees(job.CaderID);
            return View(job);
        }

        [HttpPost]
        public ActionResult Activate(int id, bool isActive)
        {
            DataTable DT = DepartmentDA.DepartmentActivate(id, isActive);
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-department");
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = DepartmentDA.DepartmentDelete(id, GetEmployeeID());
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-department");
        }
    }
}