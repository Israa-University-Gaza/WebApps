using IsraaSystem.Application.HumanResource;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.Salary;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class BasicSalaryController : BaseController
    {
        // GET: HumanResource/BasicSalary
        public ActionResult Index()
        {
            BasicSalaryVM vm = SalaryDA.GetFilterdBasicSalaries(new BasicSalaryVM(new BasicSalaryFilter("", "", "", "", "", "", SelectDA.ddlSalaryBoxes(), SelectDA.ddlSalaryBoxTypes(), SelectDA.ddlEmploymentTypes(null), SelectDA.ddlEmployeeStatuses(null),SelectDA.ddlCurrencies()), new Pagging("List", "form-basic-salary", 1, 50)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(BasicSalaryFilter filter, Pagging pagging)
        {
            BasicSalaryVM vm = SalaryDA.GetFilterdBasicSalaries(new BasicSalaryVM(filter, new Pagging("List", "form-basic-salary", pagging.currentPage, pagging.pageSize)));
            vm.filter.SalaryBoxes = SelectDA.ddlSalaryBoxes();
            vm.filter.SalaryBoxTypes = SelectDA.ddlSalaryBoxTypes();
            vm.filter.Currencies = SelectDA.ddlCurrencies();
            vm.filter.EmploymentTypes = SelectDA.ddlEmploymentTypes(null);
            vm.filter.EmployeeStatuses = SelectDA.ddlEmployeeStatuses(null);
            return View(vm);
        }

        public ActionResult Add()
        {
            BasicSalary model = new BasicSalary()
            {
                SalaryBoxes = SelectDA.ddlSalaryBoxes(),
                Currencies = SelectDA.ddlCurrencies(),
                Employees = SelectDA.ddlEmployees()
            };
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(BasicSalary model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.BasicSalaryAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.SalaryBoxes = SelectDA.ddlSalaryBoxes();
            model.Currencies = SelectDA.ddlCurrencies();
            model.Employees = SelectDA.ddlEmployees();
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = SalaryDA.BasicSalaryGet(id);
            if (DT.Rows.Count > 0)
            {
                BasicSalary model = new BasicSalary()
                {
                    ID = id,
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                    SalaryBoxID = Convert.ToInt32(DT.Rows[0]["SalaryBoxID"].ToString()),
                    CurrencyID = Convert.ToInt32(DT.Rows[0]["CurrencyID"].ToString()),
                    Amount = float.Parse(DT.Rows[0]["Amount"].ToString()),
                    DateFrom = DT.Rows[0]["DateFrom"].ToString(),
                    DateTo = DT.Rows[0]["DateTo"].ToString(),

                    SalaryBoxes = SelectDA.ddlSalaryBoxes(),
                    Currencies = SelectDA.ddlCurrencies(),
                    Employees = SelectDA.ddlEmployees(),
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
        public ActionResult Edit(BasicSalary model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.BasicSalaryAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.SalaryBoxes = SelectDA.ddlSalaryBoxes();
            model.Currencies = SelectDA.ddlCurrencies();
            model.Employees = SelectDA.ddlEmployees();
            return View(model);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = SalaryDA.BasicSalaryDelete(id, GetEmployeeID());
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-basic-salary");
        }

        public ActionResult EmployeeBonusAdd(int id)
        {
            DataTable DT = SalaryDA.BasicSalaryGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeeBonus model = new EmployeeBonus()
                {
                    BasicSalaryID = id,
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                    EmployeeName = DT.Rows[0]["EmployeeName"].ToString(),
                    BasicSalaryAmount = DT.Rows[0]["Amount"].ToString(),

                    Bonuses = SelectDA.ddlBonuses()
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
        public ActionResult EmployeeBonusAdd(EmployeeBonus model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.EmployeeBonusAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.Bonuses = SelectDA.ddlBonuses();
            return View(model);
        }

        public ActionResult EmployeeDeductionAdd(int id)
        {
            DataTable DT = SalaryDA.BasicSalaryGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeeDeduction model = new EmployeeDeduction()
                {
                    BasicSalaryID = id,
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                    EmployeeName = DT.Rows[0]["EmployeeName"].ToString(),
                    BasicSalaryAmount = DT.Rows[0]["Amount"].ToString(),

                    Deductions = SelectDA.ddlBonuses()
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
        public ActionResult EmployeeDeductionAdd(EmployeeDeduction model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.EmployeeDeductionAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.Deductions = SelectDA.ddlDeductions();
            return View(model);
        }
    }
}