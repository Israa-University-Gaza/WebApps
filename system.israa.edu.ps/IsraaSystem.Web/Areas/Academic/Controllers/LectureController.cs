using IsraaSystem.Application.Academic;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Helper;
using IsraaSystem.Core.Classic.Academic.Lecture;
using IsraaSystem.Core.Classic.Academic.Section;
using IsraaSystem.DataAccess.Sql.Academic;
using IsraaSystem.Web.ActionFillters;

namespace IsraaSystem.Web.Areas.Academic.Controllers
{
    public class LectureController : BaseController
    {
        [Authenticate]
        public ActionResult Add(int semesterId, int departmentId, int studyLevelId, int roomId, string start, string end)
        {
            DateTime s = Convert.ToDateTime(start).AddHours(-3);
            DateTime e = Convert.ToDateTime(end).AddHours(-3);

            Lecture lecture = new Lecture()
            {
                //OfferdCourses = SelectDA.ddlFilterdOfferdCourses(departmentId, studyLevelId, semesterId),
                OfferdCourses = DropDownHelpper.FilterdOfferdCourses(departmentId, studyLevelId, semesterId),
                Sections = SelectDA.ddlSections(-1),
                Rooms = SelectDA.ddlAvailableRooms(s.Day + 14, s.ToString("HH:mm"), e.ToString("HH:mm"), semesterId),
                RoomID = roomId,
                CDays = SelectDA.ddlCDays(),
                CDayID = s.Day + 14,
                FromHour = s.ToString("HH:mm"),
                ToHour = e.ToString("HH:mm")
            };
            return View(lecture);
        }

        [Authenticate]
        public ActionResult ddlSections(int id)
        {
            Lecture lecture = new Lecture()
            {
                Sections = SelectDA.ddlSections(id)
            };
            return View(lecture);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authenticate]
        public ActionResult Add(Lecture model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = LectureDA.LectureAdd(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["title"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.OfferdCourses = SelectDA.ddlFilterdOfferdCourses(model.DepartmentID, model.StudyLevelID, model.SemesterID);
            model.Sections = SelectDA.ddlSections(model.OfferdCourseID);
            model.Rooms = SelectDA.ddlAvailableRooms(model.CDayID, model.FromHour, model.ToHour, model.SemesterID);
            model.CDays = SelectDA.ddlCDays();
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            DataTable DT = LectureDA.LectureGet(id);
            Lecture lecture = new Lecture()
            {
                ID = id,
                CourseName = DT.Rows[0]["CourseName"].ToString(),
                SectionNum = DT.Rows[0]["SectionNum"].ToString(),
                Rooms = SelectDA.ddlAvailableRooms(Convert.ToInt32(DT.Rows[0]["CDayID"].ToString()), DT.Rows[0]["FromHour"].ToString(), DT.Rows[0]["ToHour"].ToString(), Convert.ToInt32(DT.Rows[0]["SemesterID"].ToString())),
                RoomID = Convert.ToInt32(DT.Rows[0]["RoomID"].ToString()),
                CDays = SelectDA.ddlCDays(),
                CDayID = Convert.ToInt32(DT.Rows[0]["CDayID"].ToString()),
                FromHour = DT.Rows[0]["FromHour"].ToString(),
                ToHour = DT.Rows[0]["ToHour"].ToString(),
                IsPined = (DT.Rows[0]["IsPined"] != null) ? Convert.ToBoolean(DT.Rows[0]["IsPined"]) : false,
                PinEmployeeID = (!string.IsNullOrEmpty(DT.Rows[0]["PinEmployeeID"].ToString())) ? Convert.ToInt32(DT.Rows[0]["PinEmployeeID"]) : 0,
            };


            //if ((lecture.PinEmployeeID == GetEmployeeID()) && lecture.IsPined)
            //{
            //    ViewBag.canUnPin = true;

            //}
            //else if (lecture.PinEmployeeID == 0)
            //{
            //    ViewBag.canUnPin = true;

            //}
            //else
            ViewBag.canUnPin = GetEmployeeID() == 5017;

            return View(lecture);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authenticate]
        public ActionResult Edit(Lecture model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = LectureDA.LectureEdit(model);
                TempData["edit-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["title"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            model.Rooms = SelectDA.ddlRooms();
            model.CDays = SelectDA.ddlCDays();
            ViewBag.canUnPin = GetEmployeeID() == 5017;
            return View(model);
        }

        [HttpPost]
        [Authenticate]
        public JsonResult SetDayTime(int id, string start, string end)
        {
            DateTime s = Convert.ToDateTime(start).AddHours(-3);
            DateTime e = Convert.ToDateTime(end).AddHours(-3);

            Lecture model = new Lecture(id, s.Day + 14, s.ToString("HH:mm"), e.ToString("HH:mm"), GetEmployeeID());
            DataTable DT = LectureDA.LectureSetDayTime(model);

            return Json(new { status = DT.Rows[0]["status"].ToString(), title = DT.Rows[0]["title"].ToString(), msg = DT.Rows[0]["msg"].ToString() }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult InstructorEdit(int id)
        {
            DataTable DT = LectureDA.LectureGet(id);
            DataTable dtSection = SectionDA.SectionGet(Convert.ToInt32(DT.Rows[0]["SectionID"].ToString()));
            ViewBag.canUnPin = GetEmployeeID() == 5017;
            if (dtSection.Rows.Count > 0)
            {
                SectionInstructorEdit sectionInstructorEdit = new SectionInstructorEdit()
                {
                    ID = id,
                    OfferdCourseID = Convert.ToInt32(dtSection.Rows[0]["OfferdCourseID"].ToString()),
                    InstructorID = Convert.ToInt32(dtSection.Rows[0]["EmployeeID"].ToString()),
                    SectionNum = dtSection.Rows[0]["SectionNum"].ToString(),
                    SectionTypeName = dtSection.Rows[0]["SectionTypeName"].ToString(),
                    CourseName = dtSection.Rows[0]["CourseName"].ToString(),
                    GenderName = dtSection.Rows[0]["GenderName"].ToString(),
                    Instructors = SelectDA.ddlInstructors(),
                    IsPined = Convert.ToBoolean(DT.Rows[0]["IsPined"]),
                    PinEmployeeID = Convert.ToInt32(DT.Rows[0]["PinEmployeeID"]),

                };
                return View(sectionInstructorEdit);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authenticate]
        public ActionResult InstructorEdit(SectionInstructorEdit sectionInstructorEdit)
        {
            sectionInstructorEdit.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = SectionDA.SectionInstructorEdit(sectionInstructorEdit);
                TempData["edit-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            }
            sectionInstructorEdit.Instructors = SelectDA.ddlInstructors();
            ViewBag.canUnPin = GetEmployeeID() == 5017;
            return View(sectionInstructorEdit);
        }

        [HttpPost]
        [Authenticate]
        public ActionResult Delete(int id)
        {
            DataTable DT = LectureDA.LectureDelete(new Lecture(id, GetEmployeeID()));
            TempData["delete-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View();
        }

        [HttpPost]
        [Authenticate]
        public ActionResult Pin(int id, bool pin, int pinEmployeeID)
        {

            if (GetEmployeeID() != 5017)
            {
                if ((pinEmployeeID != GetEmployeeID()) && !pin)
                {
                    return Json(new { success = false, responseText = "لا يمكنك الغاء تثبيت هذه المحاضرة " }, JsonRequestBehavior.AllowGet);

                }


            }


            try
            {
                DataTable DT = LectureDA.LecturePined(new Lecture { ID = id, PinEmployeeID = GetEmployeeID(), IsPined = pin });
                if (pin)
                {
                    return Json(new { success = true, responseText = "تم تثبيت المحاضرة بنجاح!" }, JsonRequestBehavior.AllowGet);

                }
                else
                {
                    return Json(new { success = true, responseText = "تم إلغاء  تثبيت المحاضرة بنجاح!" }, JsonRequestBehavior.AllowGet);

                }
            }
            catch (Exception e)
            {
                return Json(new { success = false, responseText = "خطأ! : " + e.Message }, JsonRequestBehavior.AllowGet);
            }

        }

    }
}