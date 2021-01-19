using System;
using System.Collections.Generic;
using IsraaSystem.Application.HumanResource;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using IsraaSystem.Core.Classic.HumanResource.Holiday;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class HolidayTypeController : BaseController
    {
        public ActionResult Index()
        {
            DataTable DT = HolidayDA.GetHolidayTypes();
            return View(DT);
        }

        public ActionResult List()
        {
            DataTable DT = HolidayDA.GetHolidayTypes();
            return View(DT);
        }

        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(HolidayType holidayType)
        {
            holidayType.EmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = HolidayDA.HolidayTypeAddEdit(holidayType);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                return RedirectToAction("Edit", new { id = DT.Rows[0]["id"].ToString() });
            }
            return View(holidayType);
        }

        public ActionResult Edit(int id)
        {
            DataTable dtholidayType = HolidayDA.HolidayTypeGet(id);
            if (dtholidayType.Rows.Count > 0)
            {
                HolidayType holidayType = new HolidayType()
                {
                    ID = Convert.ToInt32(dtholidayType.Rows[0]["ID"].ToString()),
                    ArName = dtholidayType.Rows[0]["ArName"].ToString()
                };
                return View(holidayType);
            }
            else
            {
                return HttpNotFound();
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(HolidayType holidayType)
        {
            holidayType.EmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = HolidayDA.HolidayTypeAddEdit(holidayType);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(holidayType);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT1 = HolidayDA.HolidayTypeDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT1.Rows[0]["status"].ToString() + ";" + DT1.Rows[0]["msg"].ToString();
            DataTable DT2 = HolidayDA.GetHolidayTypes();
            return View("List", DT2);
        }
    }
}