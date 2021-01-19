using IsraaSystem.Application.HumanResource;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using IsraaSystem.Web.Controllers;
using IsraaSystem.Web.ActionFillters;
using IsraaSystem.Web.Common;
using log4net;
using EmployeePlacement = IsraaSystem.Core.Classic.HumanResource.EmployeePlacement.EmployeePlacement;
using Hangfire;
using IsraaSystem.Application.HumanResource.JobManger;
using IsraaSystem.Core.Classic.HumanResource.EmployeePlacement;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeePlacementController : IsraaBaseController
    {
        public ActionResult Index()
        {
            EmployeePlacementVM vm = EmployeePlacementDA.GetFilterdEmployeePlacements(new EmployeePlacementVM(new EmployeePlacementsFilter("", "", "", "", SelectDA.ddlDepartments(), SelectDA.ddlJobs()), new Pagging("List", "form-employee-placement", 1, 50)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(EmployeePlacementsFilter filter, Pagging pagging)
        {
            EmployeePlacementVM vm = EmployeePlacementDA.GetFilterdEmployeePlacements(new EmployeePlacementVM(filter, new Pagging("List", "form-employee-placement", pagging.currentPage, pagging.pageSize)));
            vm.filter.Departments = SelectDA.ddlDepartments();
            vm.filter.Jobs = SelectDA.ddlJobs();
            return View(vm);
        }
        [Authenticate]
        public ActionResult Add()
        {
            EmployeePlacement employeePlacement = new EmployeePlacement();
            employeePlacement.Employees = SelectDA.ddlEmployees();
            employeePlacement.Departments = SelectDA.ddlDepartments();
            employeePlacement.Jobs = SelectDA.ddlDepartmentJobs(employeePlacement.DepartmentID);
            employeePlacement.Caders = SelectDA.ddlCaders();
            //employeePlacement.DManagers = SelectDA.ddlEmployees();
            employeePlacement.PlacementStatuses = SelectDA.ddlPlacementStatuses();
            employeePlacement.PlacementTypes = SelectDA.ddlPlacementTypes();
            return View(employeePlacement);
        }

        public ActionResult ddlDepartmentJobs(int id)
        {
            EmployeePlacement employeePlacement = new EmployeePlacement()
            {
                Jobs = SelectDA.ddlDepartmentJobs(id)
            };
            return View(employeePlacement);
        }
        [Authenticate]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(EmployeePlacement employeePlacement)
        {
            employeePlacement.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeePlacementDA.EmployeePlacementAdd(employeePlacement);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                var jobId = Convert.ToInt32(DT.Rows[0]["JobID"].ToString());
                BackgroundJob.Enqueue<IJobService>(f => f.updateEmployeePlacmentManger(jobId));
            }


            employeePlacement.Employees = SelectDA.ddlEmployees();
            employeePlacement.Departments = SelectDA.ddlDepartments();
            employeePlacement.Jobs = SelectDA.ddlDepartmentJobs(employeePlacement.DepartmentID);
            employeePlacement.Caders = SelectDA.ddlCaders();
            //employeePlacement.DManagers = SelectDA.ddlEmployees();
            employeePlacement.PlacementStatuses = SelectDA.ddlPlacementStatuses();
            employeePlacement.PlacementTypes = SelectDA.ddlPlacementTypes();




            return View(employeePlacement);
        }

        public ActionResult EmployeeList(int id)
        {
            EmployeePlacementVM vm = EmployeePlacementDA.GetFilterdEmployeePlacements(new EmployeePlacementVM(new EmployeePlacementsFilter(id), new Pagging("Employeelist", "employee-page", 1, 1000)));
            return View(vm);
        }
        [Authenticate]
        public ActionResult EmployeeAdd(int empId)
        {
            DataTable DT = EmployeeDA.GetEmployeeByEmployeeID(empId);
            EmployeePlacement employeePlacement = new EmployeePlacement();
            employeePlacement.EmployeeID = empId;
            employeePlacement.EmployeeName = DT.Rows[0]["EmployeeName"].ToString();
            employeePlacement.Departments = SelectDA.ddlDepartments();
            employeePlacement.Jobs = SelectDA.ddlDepartmentJobs(employeePlacement.DepartmentID);
            employeePlacement.Caders = SelectDA.ddlCaders();
            employeePlacement.PlacementStatuses = SelectDA.ddlPlacementStatuses();
            employeePlacement.PlacementTypes = SelectDA.ddlPlacementTypes();
            return View(employeePlacement);
        }
        [Authenticate]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeAdd(EmployeePlacement employeePlacement)
        {
            employeePlacement.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeePlacementDA.EmployeePlacementAdd(employeePlacement);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();

                var jobId = Convert.ToInt32(DT.Rows[0]["JobID"].ToString());
                BackgroundJob.Enqueue<IJobService>(f => f.updateEmployeePlacmentManger(jobId));
            }
            employeePlacement.Departments = SelectDA.ddlDepartments();
            employeePlacement.Jobs = SelectDA.ddlDepartmentJobs(employeePlacement.DepartmentID);
            employeePlacement.Caders = SelectDA.ddlCaders();
            employeePlacement.PlacementStatuses = SelectDA.ddlPlacementStatuses();
            employeePlacement.PlacementTypes = SelectDA.ddlPlacementTypes();
            return View(employeePlacement);
        }
        [Authenticate]
        public ActionResult EmployeeEdit(int id)
        {
            DataTable DT = EmployeePlacementDA.EmployeePlacementGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeePlacement employeePlacement = new EmployeePlacement()
                {
                    ID = Convert.ToInt32(DT.Rows[0]["ID"].ToString()),
                    EmployeeName = DT.Rows[0]["EmployeeName"].ToString(),
                    DepartmentID = Convert.ToInt32(DT.Rows[0]["DepartmentID"].ToString()),
                    JobID = Convert.ToInt32(DT.Rows[0]["JobID"].ToString()),
                    CaderID = Convert.ToInt32(DT.Rows[0]["CaderID"].ToString()),
                    DManagerID = Convert.ToInt32(DT.Rows[0]["DManagerID"].ToString()),
                    PlacementStatusID = Convert.ToInt32(DT.Rows[0]["PlacementStatusID"].ToString()),
                    PlacementTypeID = Convert.ToInt32(DT.Rows[0]["PlacementTypeID"].ToString()),
                    DateFrom = DT.Rows[0]["DateFrom"].ToString(),
                    DateTo = DT.Rows[0]["DateTo"].ToString(),

                    Departments = SelectDA.ddlDepartments(),
                    MangerName= DT.Rows[0]["MangerName"].ToString(),
                    Jobs = SelectDA.ddlDepartmentJobs(Convert.ToInt32(DT.Rows[0]["DepartmentID"].ToString())),
                    Caders = SelectDA.ddlCaders(),
                    PlacementStatuses = SelectDA.ddlPlacementStatuses(),
                    PlacementTypes = SelectDA.ddlPlacementTypes(),
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString())
                };
                return View(employeePlacement);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }



        [Authenticate]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeEdit(EmployeePlacement employeePlacement)
        {
            employeePlacement.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeePlacementDA.EmployeePlacementEdit(employeePlacement);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();

                var jobId = Convert.ToInt32(DT.Rows[0]["JobID"].ToString());
                BackgroundJob.Enqueue<IJobService>(f => f.updateEmployeePlacmentManger(jobId));
            }
            employeePlacement.Departments = SelectDA.ddlDepartments();
            employeePlacement.Jobs = SelectDA.ddlDepartmentJobs(employeePlacement.DepartmentID);
            employeePlacement.Caders = SelectDA.ddlCaders();
         employeePlacement.PlacementStatuses = SelectDA.ddlPlacementStatuses();
            employeePlacement.PlacementTypes = SelectDA.ddlPlacementTypes();
            return View(employeePlacement);
        }



        [HttpPost]
        public ActionResult EmployeeDelete(int Id)
        {
            var model = UnitOfWork.HumanResource.EmployeePlacement.Find(Id);
            model.IsDelete = true;
            UnitOfWork.Complete();
            BackgroundJob.Enqueue<IJobService>(f => f.updateEmployeePlacmentManger(model.JobID));
            return RedirectToAction("EmployeeList", new { id = model.EmployeeID });
        }

        public EmployeePlacementController(ILog looger, IUnitOfWork unitOfWork) : base(looger, unitOfWork)
        {
        }
    }
}