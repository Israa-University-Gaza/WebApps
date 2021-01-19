using IsraaSystem.Application.HumanResource;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.HumanResource.Salary;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class BonusController : BaseController
    {
        // GET: HumanResource/Bonus
        public ActionResult Index()
        {
            DataTable DT = SalaryDA.GetBonuses();
            return View(DT);
        }


        public ActionResult List()
        {
            DataTable DT = SalaryDA.GetBonuses();
            return View(DT);
        }

        public ActionResult Add()
        {
            Bonus model = new Bonus()
            {
                BonusTypes = SelectDA.ddlBonusTypes(),
                Currencies = SelectDA.ddlCurrencies()
            };
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(Bonus model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.BonusAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.BonusTypes = SelectDA.ddlBonusTypes();
            model.Currencies = SelectDA.ddlCurrencies();
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = SalaryDA.BonusGet(id);
            if (DT.Rows.Count > 0)
            {
                Bonus model = new Bonus()
                {
                    ID = id,
                    Name = DT.Rows[0]["Name"].ToString(),
                    BonusTypeID = Convert.ToInt32(DT.Rows[0]["BonusTypeID"].ToString()),
                    CurrencyID = Convert.ToInt32(DT.Rows[0]["CurrencyID"].ToString()),
                    Amount = float.Parse(DT.Rows[0]["Amount"].ToString()),
                    RVTypeID= Convert.ToInt32(DT.Rows[0]["RVTypeID"].ToString()),

                    BonusTypes = SelectDA.ddlBonusTypes(),
                    Currencies = SelectDA.ddlCurrencies(),
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
        public ActionResult Edit(Bonus model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.BonusAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.BonusTypes = SelectDA.ddlBonusTypes();
            model.Currencies = SelectDA.ddlCurrencies();
            return View(model);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = SalaryDA.BonusDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            DataTable DT2 = SalaryDA.GetBonuses();
            return View("List", DT2);
        }

        public string BonusReport()
        {
            ArrayList a1 = new ArrayList();
            a1.Add("dsGetBonuses");

            ArrayList a2 = new ArrayList();
            a2.Add(SalaryDA.GetBonuses());

            CreatePDF("BonusesReport", @"Areas\HumanResource\Reports\Bonus.rdlc", a1, a2);
            return "";
        }
    }
}