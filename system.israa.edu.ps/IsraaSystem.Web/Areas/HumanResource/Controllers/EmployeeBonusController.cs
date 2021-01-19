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
    public class EmployeeBonusController : BaseController
    {
        // GET: HumanResource/EmployeeBonus
        public ActionResult Index()
        {
            EmployeeBonusVM vm = SalaryDA.GetFilterdEmployeeBonuses(new EmployeeBonusVM(new EmployeeBonusFilter("", "", "", "", SelectDA.ddlBonuses()), new Pagging("List", "form-employee-bonus", 1, 50)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(EmployeeBonusFilter filter, Pagging pagging)
        {
            EmployeeBonusVM vm = SalaryDA.GetFilterdEmployeeBonuses(new EmployeeBonusVM(filter, new Pagging("List", "form-employee-bonus", pagging.currentPage, pagging.pageSize)));
            vm.filter.Bonuses = SelectDA.ddlBonuses();
            return View(vm);
        }

        public ActionResult Add()
        {
            EmployeeBonus model = new EmployeeBonus()
            {
                Bonuses = SelectDA.ddlBonuses(),
                Employees = SelectDA.ddlEmployees(),
                BasicSalaries=SelectDA.ddlBasicSalaries(-1)
            };
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(EmployeeBonus model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.EmployeeBonusAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.Bonuses = SelectDA.ddlBonuses();
            model.Employees = SelectDA.ddlEmployees();
            model.BasicSalaries = SelectDA.ddlBasicSalaries(model.EmployeeID);
            return View(model);
        }

        public ActionResult ddlBasicSalaries(int id)
        {
            EmployeeBonus model = new EmployeeBonus()
            {
                BasicSalaries = SelectDA.ddlBasicSalaries(id)
            };
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = SalaryDA.EmployeeBonusGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeeBonus model = new EmployeeBonus()
                {
                    ID = id,
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                    BasicSalaryID= Convert.ToInt32(DT.Rows[0]["BasicSalaryID"].ToString()),
                    BonusID = Convert.ToInt32(DT.Rows[0]["BonusID"].ToString()),
                    Amount = float.Parse(DT.Rows[0]["Amount"].ToString()),
                    DateFrom = DT.Rows[0]["DateFrom"].ToString(),
                    DateTo = DT.Rows[0]["DateTo"].ToString(),
                    Note = DT.Rows[0]["Notes"].ToString(),

                    Bonuses = SelectDA.ddlBonuses(),
                    Employees = SelectDA.ddlEmployees(),
                    BasicSalaries=SelectDA.ddlBasicSalaries(-1)
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
        public ActionResult Edit(EmployeeBonus model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.EmployeeBonusAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.Bonuses = SelectDA.ddlBonuses();
            model.Employees = SelectDA.ddlEmployees();
            model.BasicSalaries = SelectDA.ddlBasicSalaries(model.EmployeeID);
            return View(model);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = SalaryDA.EmployeeBonusDelete(id, GetEmployeeID());
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-employee-bonus");
        }
    }
}