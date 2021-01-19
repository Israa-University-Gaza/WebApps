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
    public class SalaryBoxController : BaseController
    {
        // GET: HumanResource/SalaryBox
        public ActionResult Index()
        {
            DataTable DT = SalaryDA.GetSalaryBoxes();
            return View(DT);
        }

        public ActionResult List()
        {
            DataTable DT = SalaryDA.GetSalaryBoxes();
            return View(DT);
        }

        public ActionResult Add()
        {
            SalaryBox model = new SalaryBox()
            {
                SalaryBoxTypes = SelectDA.ddlSalaryBoxTypes()
            };
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(SalaryBox model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.SalaryBoxAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.SalaryBoxTypes = SelectDA.ddlSalaryBoxTypes();
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = SalaryDA.SalaryBoxGet(id);
            if (DT.Rows.Count > 0)
            {
                SalaryBox model = new SalaryBox()
                {
                    ID = id,
                    Name = DT.Rows[0]["Name"].ToString(),
                    SalaryBoxTypeID = Convert.ToInt32(DT.Rows[0]["SalaryBoxTypeID"].ToString()),

                    SalaryBoxTypes = SelectDA.ddlSalaryBoxTypes()
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
        public ActionResult Edit(SalaryBox model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.SalaryBoxAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.SalaryBoxTypes = SelectDA.ddlSalaryBoxTypes();
            return View(model);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = SalaryDA.SalaryBoxDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            DataTable DT2 = SalaryDA.GetSalaryBoxes();
            return View("List", DT2);
        }
    }
}