using IsraaSystem.Application.HumanResource;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.EmployeeEmergencyInfo;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmployeeEmergencyInfoController : BaseController
    {
        // GET: HumanResource/EmployeeEmergencyInfo
        //public ActionResult Index()
        //{
        //    EmployeeEmergencyInfoVM vm = EmployeeEmergencyInfoDA.GetFilterdEmployeeEmergencyInfos(new EmployeeEmergencyInfoVM(new EmployeeEmergencyInfoFilter(-1, "", "", "", "", "", SelectDA.ddlRelativeTypes()), new Pagging("List", "employee-emergency-info", 1, 10)));
        //    return View(vm);
        //}

        //public ActionResult List(EmployeeEmergencyInfoFilter filter)
        //{
        //    EmployeeEmergencyInfoVM vm = EmployeeEmergencyInfoDA.GetFilterdEmployeeEmergencyInfos(new EmployeeEmergencyInfoVM(filter, new Pagging("list", "form-employee-emergency-info", 1, 1000)));
        //    vm.filter.RelativeTypes = SelectDA.ddlRelativeTypes();
        //    return View(vm);
        //}

        public ActionResult EmployeeList(int id)
        {
            EmployeeEmergencyInfoVM vm = EmployeeEmergencyInfoDA.GetFilterdEmployeeEmergencyInfos(new EmployeeEmergencyInfoVM(new EmployeeEmergencyInfoFilter(id), new Pagging("Employeelist", "employee-page", 1, 1000)));
            return View(vm);
        }

        public ActionResult EmployeeAdd(int empId)
        {
            EmployeeEmergencyInfo employeeEmergencyInfo = new EmployeeEmergencyInfo()
            {
                EmployeeID = empId,
                RelativeTypes = SelectDA.ddlRelativeTypes(),
                Governorates = SelectDA.ddlGovernorates(1)
            };
            return View(employeeEmergencyInfo);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeAdd(EmployeeEmergencyInfo employeeEmergencyInfo)
        {
            employeeEmergencyInfo.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeeEmergencyInfoDA.EmployeeEmergencyInfoAddEdit(employeeEmergencyInfo);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            employeeEmergencyInfo.RelativeTypes = SelectDA.ddlRelativeTypes();
            employeeEmergencyInfo.Governorates = SelectDA.ddlGovernorates(1);
            return View(employeeEmergencyInfo);
        }

        public ActionResult EmployeeEdit(int id)
        {
            DataTable DT = EmployeeEmergencyInfoDA.EmployeeEmergencyInfoGet(id);
            if (DT.Rows.Count > 0)
            {
                EmployeeEmergencyInfo employeeEmergencyInfo = new EmployeeEmergencyInfo()
                {
                    ID = id,
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                    ArFirstName = DT.Rows[0]["ArFirstName"].ToString(),
                    ArSecoundName = DT.Rows[0]["ArSecoundName"].ToString(),
                    ArThirdName = DT.Rows[0]["ArThirdName"].ToString(),
                    ArFamilyName = DT.Rows[0]["ArFamilyName"].ToString(),
                    RelativeTypeID = Convert.ToInt32(DT.Rows[0]["RelativeTypeID"].ToString()),
                    GovernoratesID = Convert.ToInt32(DT.Rows[0]["GovernoratesID"].ToString()),
                    Phone = DT.Rows[0]["Phone"].ToString(),
                    Mobile = DT.Rows[0]["Mobile"].ToString(),
                    Email = DT.Rows[0]["Email"].ToString(),
                    AddressDetails = DT.Rows[0]["AddressDetails"].ToString(),

                };
                employeeEmergencyInfo.RelativeTypes = SelectDA.ddlRelativeTypes();
                employeeEmergencyInfo.Governorates = SelectDA.ddlGovernorates(1);
                return View(employeeEmergencyInfo);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeEdit(EmployeeEmergencyInfo employeeEmergencyInfo)
        {
            employeeEmergencyInfo.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmployeeEmergencyInfoDA.EmployeeEmergencyInfoAddEdit(employeeEmergencyInfo);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            };
            employeeEmergencyInfo.RelativeTypes = SelectDA.ddlRelativeTypes();
            employeeEmergencyInfo.Governorates = SelectDA.ddlGovernorates(1);
            return View(employeeEmergencyInfo);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = EmployeeEmergencyInfoDA.EmployeeEmergencyInfoDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            int EmpID = Convert.ToInt32(DT.Rows[0]["EmpID"].ToString());
            EmployeeEmergencyInfoVM vm = EmployeeEmergencyInfoDA.GetFilterdEmployeeEmergencyInfos(new EmployeeEmergencyInfoVM(new EmployeeEmergencyInfoFilter(EmpID), new Pagging("Employeelist", "employee-page", 1, 1000)));
            return View("EmployeeList", vm);
        }
    }
}

