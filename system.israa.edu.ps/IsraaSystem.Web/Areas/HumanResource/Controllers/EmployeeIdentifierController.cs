using IsraaSystem.Application.HumanResource;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.EmployeeIdentifier;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeIdentifierController : BaseController
    {
        // GET: HumanResource/EmployeeIdentifier
        public ActionResult Index()
        {
            EmployeeIdentifierVM vm = EmployeeIdentifierDA.GetFilterdEmployeeIdentifiers(new EmployeeIdentifierVM(new EmployeeIdentifierFilter(-1, "", "", "", ""), new Pagging("List", "employee-identifier", 1, 10)));
            return View(vm);
        }

        public ActionResult List(EmployeeIdentifierFilter filter)
        {
            EmployeeIdentifierVM vm = EmployeeIdentifierDA.GetFilterdEmployeeIdentifiers(new EmployeeIdentifierVM(filter, new Pagging("list", "form-employee-identifier", 1, 1000)));
            return View(vm);
        }

        public ActionResult EmployeeList(int id)
        {
            EmployeeIdentifierVM vm = EmployeeIdentifierDA.GetFilterdEmployeeIdentifiers(new EmployeeIdentifierVM(new EmployeeIdentifierFilter(id), new Pagging("Employeelist", "employee-page", 1, 1000)));
            return View(vm);
        }

        public ActionResult EmployeeAdd(int empId)
        {
            EmployeeIdentifier employeeIdentifier = new EmployeeIdentifier()
            {
                EmployeeID = empId,
            };
            return View(employeeIdentifier);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeAdd(EmployeeIdentifier employeeIdentifier)
        {
            employeeIdentifier.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeeIdentifierDA.EmployeeIdentifierAddEdit(employeeIdentifier);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                //return RedirectToAction("Edit", new { id = DT.Rows[0]["id"].ToString() });
            }
            return View(employeeIdentifier);
        }

        public ActionResult EmployeeEdit(int id)
        {
            DataTable DT = EmployeeIdentifierDA.EmployeeIdentifierGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeeIdentifier employeeIdentifier = new EmployeeIdentifier()
                {
                    ID = id,
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                    ArFirstName = DT.Rows[0]["ArFirstName"].ToString(),
                    ArSecoundName = DT.Rows[0]["ArSecoundName"].ToString(),
                    ArThirdName = DT.Rows[0]["ArThirdName"].ToString(),
                    ArFamilyName = DT.Rows[0]["ArFamilyName"].ToString(),
                    IdentifierJob = DT.Rows[0]["IdentifierJob"].ToString(),
                    Phone = DT.Rows[0]["Phone"].ToString(),
                    Mobile = DT.Rows[0]["Mobile"].ToString(),
                    Email = DT.Rows[0]["Email"].ToString(),
                    AddressDetails = DT.Rows[0]["AddressDetails"].ToString(),
                };
                return View(employeeIdentifier);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeEdit(EmployeeIdentifier employeeIdentifier)
        {
            employeeIdentifier.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeeIdentifierDA.EmployeeIdentifierAddEdit(employeeIdentifier);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(employeeIdentifier);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = EmployeeIdentifierDA.EmployeeIdentifierDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            int EmpID = Convert.ToInt32(DT.Rows[0]["EmpID"].ToString());
            EmployeeIdentifierVM vm = EmployeeIdentifierDA.GetFilterdEmployeeIdentifiers(new EmployeeIdentifierVM(new EmployeeIdentifierFilter(EmpID), new Pagging("Employeelist", "employee-page", 1, 1000)));
            return View("EmployeeList", vm);
        }
    }
}