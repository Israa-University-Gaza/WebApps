using IsraaSystem.Application.HumanResource;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.HumanResource.Salary;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class DeductionTypeController : BaseController
    {
        // GET: HumanResource/DeductionType
        public ActionResult Index()
        {
            DataTable DT = SalaryDA.GetDeductionTypes();
            return View(DT);
        }

        public ActionResult List()
        {
            DataTable DT = SalaryDA.GetDeductionTypes();
            return View(DT);
        }

        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(DeductionType model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.DeductionTypeAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = SalaryDA.DeductionTypeGet(id);
            if (DT.Rows.Count > 0)
            {
                DeductionType model = new DeductionType()
                {
                    ID = id,
                    Name = DT.Rows[0]["Name"].ToString()
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
        public ActionResult Edit(DeductionType model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.DeductionTypeAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = SalaryDA.DeductionTypeDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            DataTable DT2 = SalaryDA.GetDeductionTypes();
            return View("List", DT2);
        }
    }
}