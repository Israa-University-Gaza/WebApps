using System;
using System.Web.Mvc;
using System.Data;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Core.Classic.HumanResource.Holiday;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class HolidayController : BaseController
    {
        public ActionResult Index()
        {
            HolidayVM vm = HolidayDA.GetFilterdHolidays(new HolidayVM(new HolidayFilter("", "", "", SelectDA.ddlHolidayTypes()), new Pagging("List", "form-holiday", 1, 50)));
            return View(vm);
        }

        public ActionResult List(HolidayFilter filter, Pagging pagging)
        {
            HolidayVM vm = HolidayDA.GetFilterdHolidays(new HolidayVM(filter, new Pagging("List", "form-holiday", pagging.currentPage, pagging.pageSize)));
            vm.filter.HolidayTypes = SelectDA.ddlHolidayTypes();
            return View(vm);
        }

        public ActionResult Add()
        {
            Holiday holiday = new Holiday();
            holiday.HolidayTypes = SelectDA.ddlHolidayTypes();
            return View(holiday);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(Holiday holiday)
        {
            holiday.EmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = HolidayDA.HolidayAddEdit(holiday);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            holiday.HolidayTypes = SelectDA.ddlHolidayTypes();
            return View(holiday);
        }

        public ActionResult Edit(int id)
        {
            DataTable dtHoliday = HolidayDA.HolidayGet(id);
            if (dtHoliday.Rows.Count > 0)
            {
                Holiday holiday = new Holiday()
                {
                    ID = Convert.ToInt32(dtHoliday.Rows[0]["ID"].ToString()),
                    Title = dtHoliday.Rows[0]["Title"].ToString(),
                    HolidayTypeID = Convert.ToInt32(dtHoliday.Rows[0]["HolidayTypeID"].ToString()),
                    DateFrom = dtHoliday.Rows[0]["DateFrom"].ToString(),
                    DateTo = dtHoliday.Rows[0]["DateTo"].ToString(),
                    Notes = dtHoliday.Rows[0]["Notes"].ToString(),
                    IsActive = Convert.ToBoolean(dtHoliday.Rows[0]["IsActive"].ToString()),
                    HolidayTypes = SelectDA.ddlHolidayTypes()
                };
                return View(holiday);
            }
            else
            {
                return HttpNotFound();
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Holiday holiday)
        {
            holiday.EmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = HolidayDA.HolidayAddEdit(holiday);
                TempData["edit-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            holiday.HolidayTypes = SelectDA.ddlHolidayTypes();
            return View(holiday);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = HolidayDA.HolidayDelete(id, GetEmployeeID());
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-holiday");
        }
    }
}