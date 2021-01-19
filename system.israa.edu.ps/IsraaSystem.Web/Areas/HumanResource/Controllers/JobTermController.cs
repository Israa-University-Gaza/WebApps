using IsraaSystem.Application.HumanResource;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.HumanResource.Job;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class JobTermController : BaseController
    {
        public ActionResult List(int id)
        {
            DataTable DT = JobDA.GetJobTerms(id);
            return View(DT);
        }

        public ActionResult Add(int jobId)
        {
            JobTerm jobTerm = new JobTerm();
            jobTerm.JobID = jobId;
            return View(jobTerm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(JobTerm jobTerm)
        {
            jobTerm.EmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = JobDA.JobTermAddEdit(jobTerm);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                return RedirectToAction("Edit", new { id = DT.Rows[0]["id"].ToString() });
            }
            return View(jobTerm);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = JobDA.JobTermGet(id);
            JobTerm jobTerm = new JobTerm()
            {
                ID = Convert.ToInt32(DT.Rows[0]["ID"].ToString()),
                JobID = Convert.ToInt32(DT.Rows[0]["JobID"].ToString()),
                ArName = DT.Rows[0]["ArName"].ToString(),
                EnName = DT.Rows[0]["EnName"].ToString()
            };
            return View(jobTerm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(JobTerm jobTerm)
        {
            jobTerm.EmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = JobDA.JobTermAddEdit(jobTerm);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(jobTerm);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = JobDA.JobTermDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            DataTable dtJobTerms = JobDA.GetJobTerms(Convert.ToInt32(DT.Rows[0]["JobID"].ToString()));
            return View("List", dtJobTerms);
        }
    }
}