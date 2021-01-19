using IsraaSystem.Application.HumanResource;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.HumanResource.JobTaskPointer;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class JobTaskPointerController : BaseController
    {
        public ActionResult List(int id)
        {
            DataTable DT = JobDA.GetJobTaskPointers(id);
            return View(DT);
        }

        public ActionResult Add(int jobId)
        {
            JobTaskPointer JobTaskPointer = new JobTaskPointer();
            JobTaskPointer.JobID = jobId;
            return View(JobTaskPointer);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(JobTaskPointer JobTaskPointer)
        {
            JobTaskPointer.EmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = JobDA.JobTaskPointerAddEdit(JobTaskPointer);
                if (DT.Rows[0]["status"].ToString() == "1")
                {
                    JobTaskPointer.ArName = "";
                }
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(JobTaskPointer);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = JobDA.JobTaskPointerGet(id);
            JobTaskPointer JobTaskPointer = new JobTaskPointer()
            {
                ID = Convert.ToInt32(DT.Rows[0]["ID"].ToString()),
                JobID = Convert.ToInt32(DT.Rows[0]["JobID"].ToString()),
                ArName = DT.Rows[0]["ArName"].ToString(),
                EnName = DT.Rows[0]["EnName"].ToString()
            };
            return View(JobTaskPointer);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(JobTaskPointer JobTaskPointer)
        {
            JobTaskPointer.EmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = JobDA.JobTaskPointerAddEdit(JobTaskPointer);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(JobTaskPointer);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = JobDA.JobTaskPointerDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            DataTable dtJobTaskPointers = JobDA.GetJobTaskPointers(Convert.ToInt32(DT.Rows[0]["JobID"].ToString()));
            return View("List", dtJobTaskPointers);
        }
    }
}