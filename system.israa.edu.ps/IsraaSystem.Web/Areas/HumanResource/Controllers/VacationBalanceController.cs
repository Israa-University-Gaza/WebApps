using IsraaSystem.Application.HumanResource;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.Vacation;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;
using IsraaSystem.Web.ActionFillters;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class VacationBalanceController : BaseController
    {
        public ActionResult Index()
        {
            VacationBalanceVM vm = VacationDA.GetFilterdEmployeeVacationBalances(new VacationBalanceVM(new VacationBalanceFilter("", "1", "", SelectDA.ddlVacationTypes(), SelectDA.ddlVacationBalanceYears()), new Pagging("List", "form-vacation-balance", 1, 50)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(VacationBalanceFilter filter, Pagging pagging)
        {
            VacationBalanceVM vm = VacationDA.GetFilterdEmployeeVacationBalances(new VacationBalanceVM(filter, new Pagging("List", "form-vacation-balance", pagging.currentPage, pagging.pageSize)));
            vm.filter.VacationTypes = SelectDA.ddlVacationTypes();
            vm.filter.VacationBalanceYears = SelectDA.ddlVacationBalanceYears();
            return View(vm);
        }

        public ActionResult NoBalanceIndex()
        {
            VacationBalanceVM vm = VacationDA.GetFilterdEmployeeNotInVacationBalance(new VacationBalanceVM(new VacationBalanceFilter("","1", SelectDA.ddlVacationBalanceYears()), new Pagging("NoBalanceList", "form-vacation-balance", 1, 50)));
            return View(vm);
        }

        public ActionResult NoBalanceList(VacationBalanceFilter filter, Pagging pagging)
        {

            VacationBalanceVM vm = VacationDA.GetFilterdEmployeeNotInVacationBalance(new VacationBalanceVM(filter, new Pagging("NoBalanceList", "form-vacation-balance", pagging.currentPage, pagging.pageSize)));
            vm.filter.VacationBalanceYears = SelectDA.ddlVacationBalanceYears();
            return View(vm);
        }

        [Authenticate]
        public ActionResult Add()
        {
            VacationBalance vacationBalance = new VacationBalance();
            vacationBalance.Employees = SelectDA.ddlEmployees();
            vacationBalance.VacationTypes = SelectDA.ddlVacationTypes();
            vacationBalance.VacationBalanceYears = SelectDA.ddlVacationBalanceYears();
            return View(vacationBalance);
        }
        [Authenticate]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(VacationBalance vacationBalance)
        {
            vacationBalance.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = VacationDA.EmployeeVacationBalanceAdd(vacationBalance);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            vacationBalance.Employees = SelectDA.ddlEmployees();
            vacationBalance.VacationTypes = SelectDA.ddlVacationTypes();
            vacationBalance.VacationBalanceYears = SelectDA.ddlVacationBalanceYears();
            return View(vacationBalance);
        }

        [Authenticate]
        public ActionResult Edit(int id)
        {
            DataTable DT = VacationDA.EmployeeVacationBalanceGet(id);
            if (DT.Rows.Count > 0)
            {
                VacationBalanceEdit vacationBalanceEdit = new VacationBalanceEdit()
                {
                    ID = id,
                    EmployeeName = DT.Rows[0]["EmployeeName"].ToString(),
                    VacationBalanceYear = DT.Rows[0]["VacationBalanceYear"].ToString(),
                    DateFrom = DT.Rows[0]["DateFrom"].ToString(),
                    DateTo = DT.Rows[0]["DateTo"].ToString(),
                    PostponeDays = Convert.ToInt32(DT.Rows[0]["PostponeDays"].ToString()),
                    DefualtDays = Convert.ToInt32(DT.Rows[0]["DefualtDays"].ToString()),
                    Note = DT.Rows[0]["Note"].ToString()
                };
                return View(vacationBalanceEdit);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }
        [Authenticate]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(VacationBalanceEdit vacationBalanceEdit)
        {
            vacationBalanceEdit.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = VacationDA.EmployeeVacationBalanceEdit(vacationBalanceEdit);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(vacationBalanceEdit);
        }

        public ActionResult Details(int id)
        {
            DataTable DT = VacationDA.EmployeeVacationBalanceGet(id);
            VacationBalanceEdit model = new VacationBalanceEdit()
            {
                Note = DT.Rows[0]["Note"].ToString()
            };
            return View(model);
        }
    }
}