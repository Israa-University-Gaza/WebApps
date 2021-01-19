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
    public class JobTaskController : BaseController
    {
        public ActionResult List(int id)
        {
            DataTable DT = JobDA.GetJobTasks(id);
            return View(DT);
        }

        public ActionResult Add(int jobId)
        {
            JobTask jobTask = new JobTask();
            jobTask.JobID = jobId;
            return View(jobTask);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(JobTask jobTask)
        {
            jobTask.EmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = JobDA.JobTaskAddEdit(jobTask);
                if (DT.Rows[0]["status"].ToString() == "1")
                {
                    jobTask.ArName = "";
                }
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(jobTask);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = JobDA.JobTaskGet(id);
            JobTask jobTask = new JobTask()
            {
                ID = Convert.ToInt32(DT.Rows[0]["ID"].ToString()),
                JobID = Convert.ToInt32(DT.Rows[0]["JobID"].ToString()),
                ArName = DT.Rows[0]["ArName"].ToString(),
                EnName = DT.Rows[0]["EnName"].ToString()
            };
            return View(jobTask);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(JobTask jobTask)
        {
            jobTask.EmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = JobDA.JobTaskAddEdit(jobTask);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(jobTask);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = JobDA.JobTaskDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            DataTable dtJobTasks = JobDA.GetJobTasks(Convert.ToInt32(DT.Rows[0]["JobID"].ToString()));
            return View("List", dtJobTasks);
        }
    }
}