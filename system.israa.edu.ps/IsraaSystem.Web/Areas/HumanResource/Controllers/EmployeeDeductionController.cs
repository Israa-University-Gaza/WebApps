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
    public class EmployeeDeductionController : BaseController
    {
        // GET: HumanResource/EmployeeDeduction
        public ActionResult Index()
        {
            EmployeeDeductionVM vm = SalaryDA.GetFilterdEmployeeDeductions(new EmployeeDeductionVM(new EmployeeDeductionFilter("", "", "", "", SelectDA.ddlDeductions()), new Pagging("List", "form-employee-deduction", 1, 50)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(EmployeeDeductionFilter filter, Pagging pagging)
        {
            EmployeeDeductionVM vm = SalaryDA.GetFilterdEmployeeDeductions(new EmployeeDeductionVM(filter, new Pagging("List", "form-employee-deduction", pagging.currentPage, pagging.pageSize)));
            vm.filter.Deductions = SelectDA.ddlDeductions();
            return View(vm);
        }

        public ActionResult Add()
        {
            EmployeeDeduction model = new EmployeeDeduction()
            {
                Deductions = SelectDA.ddlDeductions(),
                Employees = SelectDA.ddlEmployees(),
                BasicSalaries = SelectDA.ddlBasicSalaries(-1)
            };
            return View(model);
        }


        public ActionResult MultiAdd()
        {
            EmployeesDeduction model = new EmployeesDeduction()
            {
                Deductions = SelectDA.ddlDeductions(),

            };
            return View(model);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult MultiAdd(EmployeesDeduction model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {

                DataTable DT = SalaryDA.MultiEmployeeDeductionAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.Deductions = SelectDA.ddlDeductions();
            return View(model);
        }



        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(EmployeeDeduction model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.EmployeeDeductionAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.Deductions = SelectDA.ddlDeductions();
            model.Employees = SelectDA.ddlEmployees();
            model.BasicSalaries = SelectDA.ddlBasicSalaries(model.EmployeeID);
            return View(model);
        }

        public ActionResult ddlBasicSalaries(int id)
        {
            EmployeeDeduction model = new EmployeeDeduction()
            {
                BasicSalaries = SelectDA.ddlBasicSalaries(id)
            };
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = SalaryDA.EmployeeDeductionGet(id);
            if (DT.Rows.Count > 0)
            {
                //EmployeeDeduction model = new EmployeeDeduction()
                //{
                //    ID = id,
                //    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                //    BasicSalaryID = Convert.ToInt32(DT.Rows[0]["BasicSalaryID"].ToString()),
                //    DeductionID = Convert.ToInt32(DT.Rows[0]["DeductionID"].ToString()),
                //    Amount = float.Parse(DT.Rows[0]["Amount"].ToString()),
                //    DateFrom = DT.Rows[0]["DateFrom"].ToString(),
                //    DateTo = DT.Rows[0]["DateTo"].ToString(),
                //    Note = DT.Rows[0]["Note"].ToString(),

                //    Deductions = SelectDA.ddlDeductions(),
                //    Employees = SelectDA.ddlEmployees(),
                //    BasicSalaries = SelectDA.ddlBasicSalaries(-1)
                //};
                EmployeeDeduction model = new EmployeeDeduction()
                {
                    ID = id,
                    DeductionDays = Convert.ToInt32(DT.Rows[0]["DeductionDays"].ToString()),
                    PostponeDays = Convert.ToInt32(DT.Rows[0]["PostponeDays"].ToString()),
                    Note = DT.Rows[0]["Notes"].ToString()
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
        public ActionResult Edit(EmployeeDeduction model)
        {
            model.UserID = GetEmployeeID();
            DataTable DT = SalaryDA.DeductionPostponeDays(model);
            TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();

            //model.Deductions = SelectDA.ddlDeductions();
            //model.Employees = SelectDA.ddlEmployees();
            //model.BasicSalaries = SelectDA.ddlBasicSalaries(model.EmployeeID);
            return View(model);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = SalaryDA.EmployeeDeductionDelete(id, GetEmployeeID());
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-employee-deduction");
        }
    }
}