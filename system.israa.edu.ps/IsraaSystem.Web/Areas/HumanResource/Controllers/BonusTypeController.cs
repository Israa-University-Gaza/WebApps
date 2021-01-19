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
    public class BonusTypeController : BaseController
    {
        // GET: HumanResource/BonusType
        public ActionResult Index()
        {
            DataTable DT = SalaryDA.GetBonusTypes();
            return View(DT);
        }

        public ActionResult List()
        {
            DataTable DT = SalaryDA.GetBonusTypes();
            return View(DT);
        }

        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(BonusType model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.BonusTypeAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = SalaryDA.BonusTypeGet(id);
            if (DT.Rows.Count > 0)
            {
                BonusType model = new BonusType()
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
        public ActionResult Edit(BonusType model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.BonusTypeAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = SalaryDA.BonusTypeDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            DataTable DT2 = SalaryDA.GetBonusTypes();
            return View("List", DT2);
        }

        //public ActionResult BonusAdd(int bonustypeId)
        //{
        //    DataTable DT = SalaryDA.BonusTypeGet(bonustypeId);
        //    if (DT.Rows.Count > 0)
        //    {
        //        Bonus model = new Bonus()
        //        {
        //            BonusTypeName = DT.Rows[0]["Name"].ToString(),
        //            BonusTypeID = bonustypeId
        //        };
        //        return View(model);
        //    }
        //    else
        //    {
        //        return RedirectToAction("Error404", "Error");
        //    }
        //}

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult BonusAdd(Bonus model)
        //{
        //    model.UserID = GetEmployeeID();
        //    if (ModelState.IsValid)
        //    {
        //        DataTable DT = SalaryDA.BonusAddEdit(model);
        //        TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
        //    }
        //    return View(model);
        //}
    }
}