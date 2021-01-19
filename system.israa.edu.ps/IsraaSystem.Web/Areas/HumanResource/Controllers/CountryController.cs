using IsraaSystem.Application.HumanResource;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.HumanResource.Country;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class CountryController : BaseController
    {
        // GET: HumanResource/Country
        public ActionResult Index()
        {
            DataTable DT = CountryDA.GetCountres();
            return View(DT);
        }

        public ActionResult List()
        {
            DataTable DT = CountryDA.GetCountres();
            return View(DT);
        }
        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(Country model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = CountryDA.CountryAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = CountryDA.CountryGet(id);
            if (DT.Rows.Count > 0)
            {
                Country model = new Country()
                {
                    ID = id,
                    ArName = DT.Rows[0]["ArName"].ToString(),
                    EnName = DT.Rows[0]["EnName"].ToString()
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
        public ActionResult Edit(Country model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = CountryDA.CountryAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = CountryDA.CountryDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            DataTable DT2 = CountryDA.GetCountres();
            return View("List", DT2);
        }
    }
}