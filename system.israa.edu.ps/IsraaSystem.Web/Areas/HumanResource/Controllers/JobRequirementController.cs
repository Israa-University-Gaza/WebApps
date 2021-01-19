using IsraaSystem.Application.HumanResource;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.HumanResource.Job;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class JobRequirementController : BaseController
    {
        // GET: HumanResource/JobRequirement

        public ActionResult List(int jobId)
        {
            DataTable DT = JobDA.GetJobPersonals(jobId);
            return View(DT);
        }

        public ActionResult JobRequirementList(int jobpersonalId, int jobId)
        {
            DataTable DT = JobDA.GetJobRequirements(jobpersonalId, jobId);
            return View(DT);
        }

        #region JobRequirement

        public ActionResult JobRequirementAdd(int jobpersonalId, int jobId)
        {
            JobRequirement model = new JobRequirement()
            {
                JobID = jobId,
                JobPersonalID = jobpersonalId
            };
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult JobRequirementAdd(JobRequirement model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = JobDA.JobRequirementAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(model);
        }

        public ActionResult JobRequirementEdit(int id)
        {
            DataTable DT = JobDA.JobRequirementGet(id);
            if (DT.Rows.Count > 0)
            {
                JobRequirement model = new JobRequirement()
                {
                    ID = id,
                    Required = DT.Rows[0]["Required"].ToString(),
                    Favorite = DT.Rows[0]["Favorite"].ToString()
                };
                return View(model);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult JobRequirementEdit(JobRequirement model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = JobDA.JobRequirementAddEdit(model);
                TempData["edit-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = JobDA.JobRequirementDelete(id, GetEmployeeID());
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "job-requirement");
        }

        #endregion

        #region JobPersonal

        public ActionResult JobPersonalAdd()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult JobPersonalAdd(JobPersonal model)
        {
            if (ModelState.IsValid)
            {
                DataTable DT = JobDA.JobPersonalAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(model);
        }

        #endregion
    }
}