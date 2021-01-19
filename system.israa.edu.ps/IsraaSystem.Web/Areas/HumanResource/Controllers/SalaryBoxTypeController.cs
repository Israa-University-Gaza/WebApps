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
    public class SalaryBoxTypeController : BaseController
    {
        // GET: HumanResource/SalaryBoxType
        public ActionResult Index()
        {
            DataTable DT = SalaryDA.GetSalaryBoxTypes();
            return View(DT);
        }

        public ActionResult List()
        {
            DataTable DT = SalaryDA.GetSalaryBoxTypes();
            return View(DT);
        }

        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(SalaryBoxType model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.SalaryBoxTypeAdd(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = SalaryDA.SalaryBoxTypeDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            DataTable DT2 = SalaryDA.GetSalaryBoxTypes();
            return View("List", DT2);
        }
    }
}