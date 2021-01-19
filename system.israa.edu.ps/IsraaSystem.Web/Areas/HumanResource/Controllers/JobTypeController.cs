using System;
using System.Collections.Generic;
using IsraaSystem.Application.HumanResource;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.Job;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.Core.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class JobTypeController : BaseController
    {
        // GET: HumanResource/JobType
        public ActionResult Index()
        {
            DataTableVM dtJobTypes = JobDA.GetJobTypes(new DataTableVM(new Pagging("List", "Job-Type", 1, 10)));
            return View(dtJobTypes);
        }

        public ActionResult List(int page = 1)
        {
            DataTableVM dtJobTypes = JobDA.GetJobTypes(new DataTableVM(new Pagging("List", "Job-Type", page, 10)));
            return View(dtJobTypes);
        }

        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(JobType jobType)
        {
            jobType.EmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = JobDA.JobTypeAddEdit(jobType);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                return RedirectToAction("Edit", new { id = DT.Rows[0]["id"].ToString() });
            }
            return View(jobType);
        }

        public ActionResult Edit(int id, int page)
        {
            DataTable dtJobType = JobDA.JobTypeGet(id);
            if (dtJobType.Rows.Count > 0)
            {
                JobType jobType = new JobType()
                {
                    ID = Convert.ToInt32(dtJobType.Rows[0]["ID"].ToString()),
                    ArName = dtJobType.Rows[0]["ArName"].ToString(),
                    EnName = dtJobType.Rows[0]["EnName"].ToString()
                };
                ViewBag.Page = page;
                return View(jobType);
            }
            else
            {
                return HttpNotFound();
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(JobType jobType)
        {
            jobType.EmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = JobDA.JobTypeAddEdit(jobType);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }

            return View(jobType);
        }

        [HttpPost]
        public ActionResult Delete(int id, int page)
        {
            DataTable DT = JobDA.JobTypeDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            DataTableVM dtJobTypes = JobDA.GetJobTypes(new DataTableVM(new Pagging("List", "Job-Type", page, 10)));
            return View("List", dtJobTypes);
        }

    }
}