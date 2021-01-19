using System;
using System.Web.Mvc;
using IsraaSystem.Web.Controllers;
using System.Data;
using System.Collections.Generic;
using IsraaSystem.Application.Common.Transporter;
using IsraaSystem.Application.HumanResource;
using IsraaSystem.Core.Classic.HumanResource.Attendance;
using IsraaSystem.Core.Classic.Shared;
using IsraaSystem.DataAccess.Sql.HumanResource;
using IsraaSystem.Web.ActionFillters;

namespace IsraaSystem.Web.Areas.HumanResource.Controllers
{
    public class AttendanceInstructorController : BaseController
    {
        public ActionResult InstructorIndex()
        {
            AttendanceInstructorVM vm = AttendanceDA.GetInstructorDateRangeAttendance(new AttendanceInstructorVM(new AttendanceInstructorFilter("", "", "", SelectDA.ddlEmploymentTypeEmployees(-1), SelectDA.ddlSemesters(), SelectDA.ddlEmploymentTypes(null), SelectDA.ddlAttendanceInstructorStatuses()), new Pagging("InstructorIndex", "form-instructor", 1, 50)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult InstructorList(AttendanceInstructorFilter filter, Pagging pagging)
        {
            AttendanceInstructorVM vm = AttendanceDA.GetInstructorDateRangeAttendance(new AttendanceInstructorVM(filter, new Pagging("InstructorList", "form-instructor", pagging.currentPage, pagging.pageSize)));

            vm.filter.EmploymentTypes = SelectDA.ddlEmploymentTypes(null);
            vm.filter.Employees = SelectDA.ddlEmploymentTypeEmployees(Convert.ToInt32(vm.filter.EmploymentTypeID));
            vm.filter.Semesters = SelectDA.ddlSemesters();
            vm.filter.AttendanceInstructorStatuses = SelectDA.ddlAttendanceInstructorStatuses();
            return View(vm);
        }

        public ActionResult ddlEmploymentTypeEmployees(int id)
        {
            AttendanceInstructorVM vm = new AttendanceInstructorVM(new AttendanceInstructorFilter(SelectDA.ddlEmploymentTypeEmployees(id)));
            return View(vm);
        }

        public ActionResult InstructorsIndex()
        {
            AttendanceInstructorVM vm = AttendanceDA.GetInstructorsAttendance(new AttendanceInstructorVM(new AttendanceInstructorFilter("", "", SelectDA.ddlEmploymentTypes(null), SelectDA.ddlSemesters(), SelectDA.ddlAttendanceInstructorStatuses()), new Pagging("InstructorsList", "form-instructor", 1, 50)));
            return View(vm);
        }

        [HttpPost]
        public ActionResult InstructorsList(AttendanceInstructorFilter filter, Pagging pagging)
        {
            AttendanceInstructorVM vm = AttendanceDA.GetInstructorsAttendance(new AttendanceInstructorVM(filter, new Pagging("InstructorsList", "form-instructor", pagging.currentPage, pagging.pageSize)));
            vm.filter.Semesters = SelectDA.ddlSemesters();
            vm.filter.EmploymentTypes = SelectDA.ddlEmploymentTypes(null);
            vm.filter.AttendanceInstructorStatuses = SelectDA.ddlAttendanceInstructorStatuses();
            return View(vm);
        }
        [Authenticate]
        public ActionResult Add()
        {
            AttendanceInstructor AttendanceInstructor = new AttendanceInstructor()
            {
                Instructors = SelectDA.ddlEmployees(),
                Lectures = SelectDA.ddlInstructorLectures(-1),
                SemesterID = 15
            };
            return View(AttendanceInstructor);
        }

        public ActionResult ddlInstructorLectures(int id)
        {
            AttendanceInstructor AttendanceInstructor = new AttendanceInstructor()
            {
                Lectures = SelectDA.ddlInstructorLectures(id),
            };
            return View(AttendanceInstructor);
        }
        [Authenticate]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(AttendanceInstructor attendanceInstructor)
        {
            attendanceInstructor.UserID = GetEmployeeID();
            attendanceInstructor.Instructors = SelectDA.ddlEmployees();
            attendanceInstructor.Lectures = SelectDA.ddlInstructorLectures(attendanceInstructor.InstructorID);
            if (ModelState.IsValid)
            {
                DataTable DT1 = AttendanceDA.AttendanceInstructorAdd(attendanceInstructor);
                TempData["add-msg"] = DT1.Rows[0]["status"].ToString() + ";" + DT1.Rows[0]["msg"].ToString();
            }
            return View(attendanceInstructor);
        }
        [Authenticate]
        public ActionResult Edit(int id)
        {
            DataTable DT = AttendanceDA.AttendanceInstructorGet(id);
            if (DT.Rows.Count > 0)
            {
                AttendanceInstructorEdit attendanceInstructoredit = new AttendanceInstructorEdit()
                {
                    ID = id,
                    Semester = DT.Rows[0]["Semester"].ToString(),
                    InstructorName = DT.Rows[0]["InstructorName"].ToString(),
                    Course = DT.Rows[0]["Course"].ToString(),
                    SectionNum = DT.Rows[0]["SectionNum"].ToString(),
                    LectureDate = DT.Rows[0]["LectureDate"].ToString(),
                    LectureFrom = DT.Rows[0]["LectureFrom"].ToString(),
                    LectureTo = DT.Rows[0]["LectureTo"].ToString(),
                };
                return View(attendanceInstructoredit);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }
        [Authenticate]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(AttendanceInstructorEdit model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = AttendanceDA.AttendanceInstructorEdit(model);
                TempData["edit-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(model);
        }

        public ActionResult Delete(int id)
        {
            AttendanceInstructorDelete attendanceInstructor = new AttendanceInstructorDelete() { ID = id };
            return View(attendanceInstructor);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(AttendanceInstructorDelete attendanceInstructor)
        {
            attendanceInstructor.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = AttendanceDA.AttendanceInstructorDelete(attendanceInstructor);
                TempData["delete-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            return View(attendanceInstructor);
        }

        [HttpPost]
        public ActionResult Absence(int id)
        {
            DataTable DT = AttendanceDA.AttendanceInstructorAbsence(id, GetEmployeeID());
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-instructor");
        }
    }
}