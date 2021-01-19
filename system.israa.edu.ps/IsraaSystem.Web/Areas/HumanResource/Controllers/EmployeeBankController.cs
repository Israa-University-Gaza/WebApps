using IsraaSystem.Application.HumanResource;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.EmployeeBank;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.ActionFillters;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{


    public class EmployeeBankController : BaseController
    {
        // GET: HumanResource/EmployeeBank
        [Authenticate]
        public ActionResult Index()
        {

            EmployeeBankVM vm = EmployeeBankDA.GetFilterdEmployeeBanks(new EmployeeBankVM(new EmployeeBankFilter(-1, "", "", "", SelectDA.ddlBanks()), new Pagging("List", "employee-bank", 1, 10)));
            return View(vm);
        }

        public ActionResult List(EmployeeBankFilter filter)
        {
            EmployeeBankVM vm = EmployeeBankDA.GetFilterdEmployeeBanks(new EmployeeBankVM(filter, new Pagging("list", "form-employee-bank", 1, 1000)));
            vm.filter.Banks = SelectDA.ddlBanks();
            return View(vm);
        }

        public ActionResult EmployeeList(int id)
        {
            EmployeeBankVM vm = EmployeeBankDA.GetFilterdEmployeeBanks(new EmployeeBankVM(new EmployeeBankFilter(id), new Pagging("Employeelist", "employee-page", 1, 1000)));
            return View(vm);
        }

        public ActionResult EmployeeAdd(int empId)
        {
            EmployeeBank employeeBank = new EmployeeBank()
            {
                EmployeeID = empId,
                Banks = SelectDA.ddlBanks()
            };
            return View(employeeBank);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeAdd(EmployeeBank employeeBank)
        {
            employeeBank.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeeBankDA.EmployeeBankAddEdit(employeeBank);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();

            }
            employeeBank.Banks = SelectDA.ddlBanks();
            return View(employeeBank);
        }

        public ActionResult EmployeeEdit(int id)
        {
            DataTable DT = EmployeeBankDA.EmployeeBankGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeeBank employeeBank = new EmployeeBank()
                {
                    ID = id,
                    BankID = Convert.ToInt32(DT.Rows[0]["BankID"].ToString()),
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                    BankNo = DT.Rows[0]["BankNo"].ToString(),
                    BankBranch = DT.Rows[0]["BankBranch"].ToString(),
                    Note = DT.Rows[0]["Note"].ToString(),
                    Banks = SelectDA.ddlBanks()
                };
                return View(employeeBank);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeEdit(EmployeeBank employeeBank)
        {
            employeeBank.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeeBankDA.EmployeeBankAddEdit(employeeBank);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            employeeBank.Banks = SelectDA.ddlBanks();
            return View(employeeBank);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = EmployeeBankDA.EmployeeBankDelete(id, GetEmployeeID());
            int EmpID = Convert.ToInt32(DT.Rows[0]["EmpID"].ToString());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            EmployeeBankVM vm = EmployeeBankDA.GetFilterdEmployeeBanks(new EmployeeBankVM(new EmployeeBankFilter(EmpID), new Pagging("Employeelist", "employee-page", 1, 10)));

            return View("EmployeeList", vm);

        }
    }
}