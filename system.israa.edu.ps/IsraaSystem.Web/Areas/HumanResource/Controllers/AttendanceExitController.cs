using System.Web.Mvc;
using System.Data;
using IsraaSystem.Application.HumanResource;
using System;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Core.Classic.HumanResource.AttendanceExit;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class AttendanceExitController : BaseController
    {
        public ActionResult Index()
        {
            AttendanceExitsVM vm = AttendanceExitDA.GetFilterdAttendanceExits(new AttendanceExitsVM(new AttendanceExitsFilter(SelectDA.ddlAttendanceExitTypes()), new Pagging("List", "form-attendance-exit", 1, 100)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(AttendanceExitsFilter filter, Pagging pagging)
        {
            AttendanceExitsVM vm = AttendanceExitDA.GetFilterdAttendanceExits(new AttendanceExitsVM(filter, new Pagging("List", "form-attendance-exit", pagging.currentPage, pagging.pageSize)));
            vm.filter.AttendanceExitTypes = SelectDA.ddlAttendanceExitTypes();
            return View(vm);
        }

        public ActionResult Details(int id)
        {
            DataTable DT = AttendanceExitDA.AttendanceExitGet(id);
            AttendanceExit model = new AttendanceExit()
            {
                EmployeeName = DT.Rows[0]["EmployeeName"].ToString(),
                AttendanceExitType = DT.Rows[0]["AttendanceExitType"].ToString(),
                ExitDate = DT.Rows[0]["ExitDate"].ToString(),
                Mobile = DT.Rows[0]["Mobile"].ToString(),
                ExpectedTimeFrom = DT.Rows[0]["ExpectedTimeFrom"].ToString(),
                ExpectedTimeTo = DT.Rows[0]["ExpectedTimeTo"].ToString(),
                ActualTimeFrom = DT.Rows[0]["ActualTimeFrom"].ToString(),
                ActualTimeTo = DT.Rows[0]["ActualTimeTo"].ToString(),
                ExitReason = DT.Rows[0]["ExitReason"].ToString(),
                Notes = DT.Rows[0]["ExitReason"].ToString()
            };
            return View(model);
        }

        public ActionResult Add()
        {
            AttendanceExit AttendanceExit = new AttendanceExit()
            {
                Employees = SelectDA.ddlEmployees(),
                AttendanceExitTypes = SelectDA.ddlAttendanceExitTypes(),

            };
            return View(AttendanceExit);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(AttendanceExit AttendanceExit)
        {
            AttendanceExit.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = AttendanceExitDA.AttendanceExitAdd(AttendanceExit);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            AttendanceExit.Employees = SelectDA.ddlEmployees();
            AttendanceExit.AttendanceExitTypes = SelectDA.ddlAttendanceExitTypes();
            AttendanceExit.DeductionStatuses = SelectDA.ddlDeductionStatuses();
            return View(AttendanceExit);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = AttendanceExitDA.AttendanceExitGet(id);
            if (DT.Rows.Count > 0)
            {
                AttendanceExit AttendanceExit = new AttendanceExit()
                {
                    ID = Convert.ToInt32(DT.Rows[0]["ID"].ToString()),
                    EmployeeID = Convert.ToInt32(DT.Rows[0]["EmployeeID"].ToString()),
                    AttendanceExitTypeID = Convert.ToInt32(DT.Rows[0]["AttendanceExitTypeID"].ToString()),
                    ExitDate = DT.Rows[0]["ExitDate"].ToString(),
                    ExpectedTimeFrom = DT.Rows[0]["ExpectedTimeFrom"].ToString(),
                    ExpectedTimeTo = DT.Rows[0]["ExpectedTimeTo"].ToString(),
                    ActualTimeFrom = DT.Rows[0]["ActualTimeFrom"].ToString(),
                    ActualTimeTo = DT.Rows[0]["ActualTimeTo"].ToString(),
                    ExitReason = DT.Rows[0]["ExitReason"].ToString(),
                    Mobile = DT.Rows[0]["Mobile"].ToString(),
                    Notes = DT.Rows[0]["Notes"].ToString(),
                    AttendanceExitTypes = SelectDA.ddlAttendanceExitTypes(),
                    DeductionStatuses = SelectDA.ddlDeductionStatuses()
                };
                return View(AttendanceExit);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(AttendanceExit AttendanceExit)
        {
            AttendanceExit.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = AttendanceExitDA.AttendanceExitEdit(AttendanceExit);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            AttendanceExit.AttendanceExitTypes = SelectDA.ddlAttendanceExitTypes();
            return View(AttendanceExit);
        }

        public ActionResult Delete(int id)
        {
            AttendanceExitDelete AttendanceExit = new AttendanceExitDelete() { ID = id };
            return View(AttendanceExit);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(AttendanceExitDelete AttendanceExitDelete)
        {
            AttendanceExitDelete.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = AttendanceExitDA.AttendanceExitDelete(AttendanceExitDelete);
                TempData["delete-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(AttendanceExitDelete);
        }

        public ActionResult TimeUpdate(int id)
        {

            DataTable DT = AttendanceExitDA.AttendanceExitGet(id);
            if (DT.Rows.Count > 0)
            {
                AttendanceExitEdit AttendanceExit = new AttendanceExitEdit()
                {
                    ID = Convert.ToInt32(DT.Rows[0]["ID"].ToString()),
                    EmployeeName = DT.Rows[0]["EmployeeName"].ToString(),
                    AttendanceExitType = DT.Rows[0]["AttendanceExitType"].ToString(),
                    ExitDate = DT.Rows[0]["ExitDate"].ToString(),
                    ExpectedTimeFrom = DT.Rows[0]["ExpectedTimeFrom"].ToString(),
                    ExpectedTimeTo = DT.Rows[0]["ExpectedTimeTo"].ToString(),
                    ActualTimeFrom = DT.Rows[0]["ActualTimeFrom"].ToString(),
                    ActualTimeTo = DT.Rows[0]["ActualTimeTo"].ToString()
                };
                return View(AttendanceExit);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TimeUpdate(AttendanceExitEdit AttendanceExitEdit)
        {
            AttendanceExitEdit.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = AttendanceExitDA.AttendanceExitTimeUpdate(AttendanceExitEdit);
                TempData["update-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(AttendanceExitEdit);
        }
    }
}