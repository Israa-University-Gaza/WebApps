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
    public class DeductionController : BaseController
    {
        // GET: HumanResource/Deduction
        public ActionResult Index()
        {
            DataTable DT = SalaryDA.GetDeductions();
            return View(DT);
        }

        public ActionResult List()
        {
            DataTable DT = SalaryDA.GetDeductions();
            return View(DT);
        }

        public ActionResult Add()
        {
            Deduction model = new Deduction()
            {
                DeductionTypes = SelectDA.ddlDeductionTypes(),
                Currencies = SelectDA.ddlCurrencies()
            };
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(Deduction model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.DeductionAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.DeductionTypes = SelectDA.ddlDeductionTypes();
            model.Currencies = SelectDA.ddlCurrencies();
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = SalaryDA.DeductionGet(id);
            if (DT.Rows.Count > 0)
            {
                Deduction model = new Deduction()
                {
                    ID = id,
                    Name = DT.Rows[0]["Name"].ToString(),
                    DeductionTypeID = Convert.ToInt32(DT.Rows[0]["DeductionTypeID"].ToString()),
                    Amount = float.Parse(DT.Rows[0]["Amount"].ToString()),
                    CurrencyID = Convert.ToInt32(DT.Rows[0]["CurrencyID"].ToString()),
                    RVTypeID = Convert.ToInt32(DT.Rows[0]["RVTypeID"].ToString()),

                    DeductionTypes = SelectDA.ddlDeductionTypes(),
                    Currencies = SelectDA.ddlCurrencies()
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
        public ActionResult Edit(Deduction model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.DeductionAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.DeductionTypes = SelectDA.ddlDeductionTypes();
            model.Currencies = SelectDA.ddlCurrencies();
            return View(model);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = SalaryDA.DeductionDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            DataTable DT2 = SalaryDA.GetDeductions();
            return View("List", DT2);
        }
    }
}