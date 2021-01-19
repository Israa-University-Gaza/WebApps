using IsraaSystem.Application.HumanResource;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.EmployeePlacement;
using IsraaSystem.Core.Classic.HumanResource.Job;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;
using IsraaSystem.Web.ActionFillters;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class JobController : BaseController
    {
        public ActionResult Index()
        {
            JobsVM vm = JobDA.GetFilterdJobs(new JobsVM(new JobsFilter("", "-1", SelectDA.ddlDepartments()), new Pagging("List", "form-job", 1, 50)));
            return View(vm);
        }

        public ActionResult List(JobsFilter filter, Pagging pagging)
        {
            JobsVM vm = JobDA.GetFilterdJobs(new JobsVM(filter, new Pagging("List", "form-job", pagging.currentPage, pagging.pageSize)));
            vm.filter.Departments = SelectDA.ddlDepartments();
            return View(vm);
        }
        [Authenticate]
        public ActionResult Add()
        {
            Job job = new Job()
            {
                Departments = SelectDA.ddlDepartments(),
                ManagerJobs = SelectDA.ddlJobs(),
                Caders = SelectDA.ddlCaders(),
                CaderDegrees = SelectDA.ddlCaderDegrees(-1)
            };
            return View(job);
        }

        public ActionResult ddlCaderDegree(int id)
        {
            Job job = new Job()
            {
                CaderDegrees = SelectDA.ddlCaderDegrees(id)
            };
            return View(job);
        }
        [Authenticate]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(Job job)
        {
            job.UserID = GetEmployeeID();
            job.Departments = SelectDA.ddlDepartments();
            job.ManagerJobs = SelectDA.ddlJobs();
            job.Caders = SelectDA.ddlCaders();
            job.CaderDegrees = SelectDA.ddlCaderDegrees(job.CaderID);
            if (ModelState.IsValid)
            {
                DataTable DT = JobDA.JobAddEdit(job);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(job);
        }
        [Authenticate]
        public ActionResult Edit(int id)
        {
            DataTable dtJob = JobDA.JobGet(id);
            if (dtJob.Rows.Count > 0)
            {
                Job job = new Job()
                {
                    ID = Convert.ToInt32(dtJob.Rows[0]["ID"].ToString()),
                    JobTitle = dtJob.Rows[0]["JobTitle"].ToString(),
                    JobGoal = dtJob.Rows[0]["JobGoal"].ToString(),
                    DepartmentID = Convert.ToInt32(dtJob.Rows[0]["DepartmentID"].ToString()),
                    CaderID = Convert.ToInt32(dtJob.Rows[0]["CaderID"].ToString()),
                    ManagerJobID = Convert.ToInt32(dtJob.Rows[0]["ManagerJobID"].ToString()),
                    CaderDegreeID = Convert.ToInt32(dtJob.Rows[0]["CaderDegreeID"].ToString()),
                    IsActive = Convert.ToBoolean(dtJob.Rows[0]["IsActive"].ToString()),
                    OtherJobRelation = dtJob.Rows[0]["OtherJobRelation"].ToString(),

                    Departments = SelectDA.ddlDepartments(),
                    ManagerJobs = SelectDA.ddlJobs(),
                    Caders = SelectDA.ddlCaders(),
                    CaderDegrees = SelectDA.ddlCaderDegrees(1)
                };
                return View(job);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }


        [Authenticate]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Job job)
        {
            job.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = JobDA.JobAddEdit(job);
                TempData["edit-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            job.Departments = SelectDA.ddlDepartments();
            job.Caders = SelectDA.ddlCaders();
            job.ManagerJobs = SelectDA.ddlJobs();
            job.CaderDegrees = SelectDA.ddlCaderDegrees(1);
            return View(job);
        }

        [HttpPost]
        public ActionResult Activate(int id, bool isActive)
        {
            DataTable DT = JobDA.JobActivate(id, isActive);
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-job");
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = JobDA.JobDelete(id, GetEmployeeID());
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-job");
        }

        public ActionResult Details(int id)
        {
            JobDetail jobDetails = new JobDetail()
            {
                Job = JobDA.JobGet(id),
                JobTasks = JobDA.GetJobTasks(id),
                JobTaskPointers = JobDA.GetJobTaskPointers(id),
                JobTerms = JobDA.GetJobTerms(id),
                JobPersonals = JobDA.GetJobPersonals(id)
            };
            return View(jobDetails);
        }
        [Authenticate]
        public ActionResult EmployeePlacementAdd(int jobId)
        {
            DataTable DT = JobDA.JobGet(jobId);
            if (DT.Rows.Count > 0)
            {
                EmployeePlacement employeePlacement = new EmployeePlacement()
                {
                    DepartmentName = DT.Rows[0]["DepartmentName"].ToString(),
                    JobName = DT.Rows[0]["JobTitle"].ToString(),
                    DepartmentID = Convert.ToInt32(DT.Rows[0]["DepartmentID"].ToString()),
                    JobID = jobId,

                    Employees = SelectDA.ddlEmployees(),
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
        [Authenticate]
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
            employeePlacement.Caders = SelectDA.ddlCaders();
            employeePlacement.PlacementStatuses = SelectDA.ddlPlacementStatuses();
            employeePlacement.PlacementTypes = SelectDA.ddlPlacementTypes();
            return View(employeePlacement);
        }
    }
}