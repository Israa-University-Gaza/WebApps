using System;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Core.Classic.HumanResource.Attendance;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.Core.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class AttendanceFormatController : BaseController
    {
        public ActionResult Index()
        {
            DataTableVM vm = AttendanceDA.GetAttendanceFormats(new DataTableVM(new Pagging("List", "form-attendance-format", 1, 20)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List( Pagging pagging)
        {
            DataTableVM vm = AttendanceDA.GetAttendanceFormats(new DataTableVM(new Pagging("List", "form-attendance-format", pagging.currentPage, pagging.pageSize)));
            return View(vm);
        }

        

        public ActionResult Add()
        {
            AttendanceFormat af = new AttendanceFormat();
            return View(af);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = AttendanceDA.AttendanceFormatGet(id);
            if (DT.Rows.Count > 0)
            {
                AttendanceFormat af = new AttendanceFormat()
                {
                    ID = Convert.ToInt32(DT.Rows[0]["ID"].ToString()),
                    ArName = DT.Rows[0]["ArName"].ToString(),
                    EnName = DT.Rows[0]["EnName"].ToString()
                };
                return View(af);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(AttendanceFormat model)
        {
            model.InsertEmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = AttendanceDA.AttendanceFormatAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                return RedirectToAction("Edit", new { id = DT.Rows[0]["id"].ToString() });
            }
            return View(model);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(AttendanceFormat model)
        {
            model.InsertEmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = AttendanceDA.AttendanceFormatAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = AttendanceDA.AttendanceFormatDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            DataTableVM vm = AttendanceDA.GetAttendanceFormats(new DataTableVM(new Pagging("List", "attendance-formats", 1, 20)));
            return View("List", vm);
        }

        public ActionResult Details(int id)
        {
            DataTable DT = AttendanceDA.AttendanceFormatDetailsGet(id);
           
            return View(DT);
        }

        public ActionResult AddDetails(int id)
        {
            AttendanceFormatDetails model = new AttendanceFormatDetails
            {
                AttendanceFormatID = id.ToString(),
                Days = SelectDA.ddlDays()
            };
           
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddDetails(AttendanceFormatDetails model)
        {
            model.InsertEmployeeID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = AttendanceDA.AttendanceFormatDetailsAddEdit(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                return RedirectToAction("AddDetails", new { id = DT.Rows[0]["ID"] });
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult DeleteDetails(int AttendanceID,int id)
        {
            DataTable DT = AttendanceDA.AttendanceFormatDetailsDelete(id, GetEmployeeID());
            TempData["toast-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            DataTable vm = AttendanceDA.AttendanceFormatDetailsGet(id);
            return RedirectToAction("Details", new {id=AttendanceID });
        }
    }
}