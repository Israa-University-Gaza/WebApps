using IsraaSystem.Application.HumanResource;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.EmpEmploymentType;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;
using IsraaSystem.Web.ActionFillters;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmpEmploymentTypeController : BaseController
    {
        public ActionResult Index()
        {
            EmpEmploymentTypeVM vm = EmpEmploymentTypeDA.GetFilterdEmpEmploymentTypes(new EmpEmploymentTypeVM(new EmpEmploymentTypeFilter("", "", "", SelectDA.ddlEmploymentTypes(null), SelectDA.ddlEmployeeStatuses(null)), new Pagging("List", "form-emp-employment-type", 1, 50)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(EmpEmploymentTypeFilter filter, Pagging pagging)
        {
            EmpEmploymentTypeVM vm = EmpEmploymentTypeDA.GetFilterdEmpEmploymentTypes(new EmpEmploymentTypeVM(filter, new Pagging("List", "form-emp-employment-type", pagging.currentPage, pagging.pageSize)));
            vm.filter.EmploymentTypes = SelectDA.ddlEmploymentTypes(null);
            vm.filter.EmployeeStatuses = SelectDA.ddlEmployeeStatuses(null);
            return View(vm);
        }


        [Authenticate]
        public ActionResult Add()
        {
            EmpEmploymentType empEmployementType = new EmpEmploymentType()
            {
                Employees = SelectDA.ddlEmployees(),
                EmploymentTypes = SelectDA.ddlEmploymentTypes(true)
            };
            return View(empEmployementType);
        }
        [Authenticate]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(EmpEmploymentType empEmployementType)
        {
            empEmployementType.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmpEmploymentTypeDA.EmpEmploymentTypeAdd(empEmployementType);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            empEmployementType.Employees = SelectDA.ddlEmployees();
            empEmployementType.EmploymentTypes = SelectDA.ddlEmploymentTypes(true);
            return View(empEmployementType);
        }

        [Authenticate]
        public ActionResult Edit(int id)
        {
            DataTable DT = EmpEmploymentTypeDA.EmpEmploymentTypeGet(id);
            if (DT.Rows.Count > 0)
            {
                EmpEmploymentType empEmployementType = new EmpEmploymentType()
                {
                    ID = id,
                    EmployeeNo = DT.Rows[0]["EmployeeNo"].ToString(),
                    EmployeeName = DT.Rows[0]["EmployeeName"].ToString(),
                    EmploymentTypeID = Convert.ToInt32(DT.Rows[0]["EmploymentTypeID"].ToString()),
                    DateFrom = DT.Rows[0]["DateFrom"].ToString(),
                    DateTo = DT.Rows[0]["DateTo"].ToString(),

                    EmploymentTypes = SelectDA.ddlEmploymentTypes(true)
                };
                return View(empEmployementType);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }
        [Authenticate]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(EmpEmploymentType empEmploymentType)
        {
            empEmploymentType.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmpEmploymentTypeDA.EmpEmploymentTypeEdit(empEmploymentType);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            empEmploymentType.EmploymentTypes = SelectDA.ddlEmploymentTypes(true);
            return View(empEmploymentType);
        }


        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = EmpEmploymentTypeDA.EmpEmploymentTypeDelete(id, GetEmployeeID());
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-emp-employment-type");
        }


        [HttpPost]
        public ActionResult EmpEmploymentTypeGet(int id)
        {
            DataTable DT = EmpEmploymentTypeDA.EmpEmploymentTypeGetLast(id, 1);
            return DT.Rows[0]["EmployeeID"].ToString() == "0" ? Json(new { res = "Error" }) : Json(new
            {
                EmploymentTypeID = DT.Rows[0]["EmploymentTypeID"],
                EmployeeNo = DT.Rows[0]["EmployeeNo"]

            });
        }

        [Authenticate]
        [HttpPost]
        public ActionResult UpdateEmpNumber(int EmployeeID, int EmploymentTypeID)
        {

            DataTable DT = EmpEmploymentTypeDA.EmpEmploymentTypeGetLast(EmployeeID, EmploymentTypeID);
            var CurrentParentID = DT.Rows[0]["CurrentParentID"].ToString();
            var NewParentID = DT.Rows[0]["NewParentID"].ToString();
            var currentEmployeeNo = DT.Rows[0]["EmployeeNo"].ToString();

            if (NewParentID == CurrentParentID)
            {
                return Json(new { EmployeeNo = currentEmployeeNo });
            }
            else
            {
                int newEmployeeNo = EmployeeDA.GenerateEmpNumber(Convert.ToInt32(EmploymentTypeID));
                return Json(new { EmployeeNo = newEmployeeNo });
            }

        }


    }
}