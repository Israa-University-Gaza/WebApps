using IsraaSystem.Application.HumanResource;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections;
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
    public class EmployeeSalaryController : BaseController
    {
        // GET: HumanResource/EmployeeSalary
        public ActionResult Index()
        {

            EmployeeSalaryVM vm = SalaryDA.GetFilterdEmployeeSalaries(new EmployeeSalaryVM(new EmployeeSalaryFilter(null, "", "", "", "", SelectDA.ddlMonths(), SelectDA.ddlCurrencies(), SelectDA.ddlSalaryBoxes()), new Pagging("List", "form-employee-salary", 1, 50)));
            vm.filter.Months = SelectDA.ddlMonths();
            vm.filter.Currencies = SelectDA.ddlCurrencies();
            vm.filter.Employees = SelectDA.ddlEmployees();
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(EmployeeSalaryFilter filter, Pagging pagging, string answer)
        {
            if (answer == "احتساب الراتب")
            {

                if (string.IsNullOrEmpty(filter.MonthID) || string.IsNullOrEmpty(filter.Year))
                {
                    TempData["add-msg"] = "0;الرجاء التأكد من البيانات . الشهر والسنة حقول مطلوبة ";
                }
                else
                {
                    DataTable DT = SalaryDA.CalculateEmployeeSalary(new EmployeeSalary()
                    {
                        EmployeeID = filter.EmployeeID,
                        MonthID = Convert.ToInt32(filter.MonthID),
                        Year = Convert.ToInt32(filter.Year)
                    });
                    TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                }
            }

            EmployeeSalaryVM vm = SalaryDA.GetFilterdEmployeeSalaries(new EmployeeSalaryVM(filter, new Pagging("List", "form-employee-salary", pagging.currentPage, pagging.pageSize)));
            vm.filter.Months = SelectDA.ddlMonths();
            vm.filter.Currencies = SelectDA.ddlCurrencies();
            vm.filter.SalaryBoxes = SelectDA.ddlSalaryBoxes();
            vm.filter.Employees = SelectDA.ddlEmployees();

            return View(vm);
        }



        public ActionResult CalculateEmployeeSalary(string year, string monthId, string employeeId)
        {
            DataTable DT = SalaryDA.CalculateEmployeeSalary(new EmployeeSalary()
            {
                EmployeeID = employeeId,
                MonthID = Convert.ToInt32(monthId),
                Year = Convert.ToInt32(year)
            });


            TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();


            return Json(new
            {
                status = DT.Rows[0]["status"].ToString(),
                msg = DT.Rows[0]["msg"].ToString()
            }
                );
        }



        //Todo في صفحة الموظف بدنا نعمل كالكوليت للسالري
        public ActionResult CalculateSalary(string id)
        {
            EmployeeSalary model = new EmployeeSalary()
            {
                EmployeeID = id,

                Months = SelectDA.ddlMonths()
            };
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CalculateSalary(EmployeeSalary model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SalaryDA.CalculateEmployeeSalary(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.Months = SelectDA.ddlMonths();
            return View(model);
        }

        public string EmployeeSalaryReport(int year, int monthId, int employeeId)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("dsGetEmployeeSalaryReport");
            a1.Add("dsGetEmployeeBonuses");
            a1.Add("dsGetEmployeeDeductions");

            ArrayList a2 = new ArrayList();
            a2.Add(SalaryDA.GetEmployeeSalaryReport(year, monthId, employeeId));
            a2.Add(SalaryDA.GetEmployeeBonuses(year, monthId, employeeId));
            a2.Add(SalaryDA.GetEmployeeDeductions(year, monthId, employeeId));

            CreatePDF("EmployeeSalary", @"Areas\HumanResource\Reports\EmployeeSalaryReport.rdlc", a1, a2);
            return "";
        }

        public string EmployeesSalaryBankReport(int? year, int? monthId, int? currencyId)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("dsGetEmployeesSalaryBankReport");

            ArrayList a2 = new ArrayList();
            a2.Add(SalaryDA.GetEmployeesSalaryBankReport(year, monthId, currencyId));

            CreatePDF("EmployeesSalaryBank", @"Areas\HumanResource\Reports\EmployeesSalaryBankReport.rdlc", a1, a2);
            return "";
        }

        public string SumSalaryBankReport(int? salaryboxId, int? year, int? monthId)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("dsSumSalaryBankReport");

            ArrayList a2 = new ArrayList();
            a2.Add(SalaryDA.GetSumSalaryBankReport(salaryboxId, year, monthId));

            CreatePDF("SumSalaryBankReport", @"Areas\HumanResource\Reports\SumSalaryBankReport.rdlc", a1, a2);
            return "";
        }
    }
}