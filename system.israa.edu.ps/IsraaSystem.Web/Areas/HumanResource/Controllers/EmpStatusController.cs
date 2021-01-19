using IsraaSystem.Application.HumanResource;
using System;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Web.Controllers;
using IsraaSystem.Web.ActionFillters;
using IsraaSystem.Application.Common.UnitOfWork;
using Hangfire.Logging;
using IsraaSystem.Core.Classic.HumanResource.EmpStatus;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using log4net;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class EmpStatusController : IsraaBaseController
    {
        public EmpStatusController(log4net.ILog looger, IUnitOfWork unitOfWork) : base(looger, unitOfWork)
        {
        }

        public ActionResult Index()
        {
            EmpStatusVM vm = EmpStatusDA.GetFilterdEmpStatuses(new EmpStatusVM(new EmpStatusFilter("", "", SelectDA.ddlEmployeeStatuses(null)), new Pagging("List", "form-emp-status", 1, 50)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(EmpStatusFilter filter, Pagging pagging)
        {
            EmpStatusVM vm = EmpStatusDA.GetFilterdEmpStatuses(new EmpStatusVM(filter, new Pagging("List", "form-emp-status", pagging.currentPage, pagging.pageSize)));
            vm.filter.EmployeeStatuses = SelectDA.ddlEmployeeStatuses(null);
            return View(vm);
        }
        [Authenticate]
        public ActionResult Add()
        {
            EmpStatus empStatus = new EmpStatus()
            {
                Employees = SelectDA.ddlEmployees(),
                DateFrom = "2017/09/01",
                DateTo = "2018/06/15",
                EmployeeStatuses = SelectDA.ddlEmployeeStatuses(true)
            };
            return View(empStatus);
        }
        [Authenticate]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(EmpStatus empStatus)
        {
            empStatus.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmpStatusDA.EmpStatusAdd(empStatus);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            empStatus.Employees = SelectDA.ddlEmployees();
            empStatus.EmployeeStatuses = SelectDA.ddlEmployeeStatuses(true);
            return View(empStatus);
        }
        [Authenticate]
        public ActionResult Edit(int id)
        {
            DataTable DT = EmpStatusDA.EmpStatusGet(id);
            if (DT.Rows.Count > 0)
            {
                EmpStatus empStatus = new EmpStatus()
                {
                    ID = Convert.ToInt32(DT.Rows[0]["ID"].ToString()),
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                    EmployeeStatusID = Convert.ToInt32(DT.Rows[0]["EmployeeStatusID"].ToString()),
                    EmployeeName = DT.Rows[0]["EmployeeName"].ToString(),
                    DateFrom = DT.Rows[0]["DateFrom"].ToString(),
                    DateTo = DT.Rows[0]["DateTo"].ToString(),

                    Employees = SelectDA.ddlEmployees(),
                    EmployeeStatuses = SelectDA.ddlEmployeeStatuses(true)
                };
                return View(empStatus);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }
        [Authenticate]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(EmpStatus empStatus)
        {
            empStatus.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmpStatusDA.EmpStatusEdit(empStatus);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            empStatus.Employees = SelectDA.ddlEmployees();
            empStatus.EmployeeStatuses = SelectDA.ddlEmployeeStatuses(true);
            return View(empStatus);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = EmpStatusDA.EmpStatusDelete(id, GetEmployeeID());
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-emp-status");
        }


        public ActionResult EmployeeList(int id)
        {
            EmpStatusVM vm = EmpStatusDA.GetFilterdEmpStatuses(new EmpStatusVM(new EmpStatusFilter(id), new Pagging("Employeelist", "employee-page", 1, 1000)));
            return View(vm);
        }

        [Authenticate]
        public ActionResult EmployeeAdd(int empId)
        {
            DataTable DT = EmployeeDA.GetEmployeeByEmployeeID(empId);
            EmpStatus empstatus = new EmpStatus();
            empstatus.EmployeeID = empId;
            empstatus.EmployeeName = DT.Rows[0]["EmployeeName"].ToString();
            empstatus.Employees = SelectDA.ddlEmployees();
            empstatus.EmployeeStatuses = SelectDA.ddlEmployeeStatuses(true);
            return View(empstatus);
        }
        [Authenticate]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeAdd(EmpStatus empStatus)
        {
            empStatus.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmpStatusDA.EmpStatusAdd(empStatus);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            empStatus.Employees = SelectDA.ddlEmployees();
            empStatus.EmployeeStatuses = SelectDA.ddlEmployeeStatuses(true);
            return View(empStatus);
        }

        [Authenticate]
        public ActionResult EmployeeEdit(int id)
        {
            DataTable DT = EmpStatusDA.EmpStatusGet(id);
            if (DT.Rows.Count > 0)
            {
                EmpStatus empStatus = new EmpStatus()
                {
                    ID = Convert.ToInt32(DT.Rows[0]["ID"].ToString()),
                    EmployeeName = DT.Rows[0]["EmployeeName"].ToString(),
                    EmployeeStatusID = Convert.ToInt32(DT.Rows[0]["EmployeeStatusID"].ToString()),
                    Notes = DT.Rows[0]["Notes"].ToString(),
                    DateFrom = DT.Rows[0]["DateFrom"].ToString(),
                    DateTo = DT.Rows[0]["DateTo"].ToString(),
                    Employees = SelectDA.ddlEmployees(),
                    EmployeeStatuses = SelectDA.ddlEmployeeStatuses(true),
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString())
                };
                return View(empStatus);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }



        [Authenticate]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EmployeeEdit(EmpStatus empStatus)
        {
            empStatus.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = EmpStatusDA.EmpStatusEdit(empStatus);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            empStatus.Employees = SelectDA.ddlEmployees();
            empStatus.EmployeeStatuses = SelectDA.ddlEmployeeStatuses(true);
            return View(empStatus);
        }


        [HttpPost]
        public ActionResult EmployeeDelete(int Id)
        {
            var model = UnitOfWork.HumanResource.EmpStatus.Find(Id);
            model.IsDelete = true;
            UnitOfWork.Complete();
            return RedirectToAction("EmployeeList", new { id = model.EmployeeID });
        }

    }
}