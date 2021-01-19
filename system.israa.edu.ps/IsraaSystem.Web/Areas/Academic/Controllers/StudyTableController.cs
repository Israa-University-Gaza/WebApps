using IsraaSystem.Application.Academic;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Academic.Print;
using IsraaSystem.Core.Classic.Academic.StudyTable;
using IsraaSystem.DataAccess.Sql.Academic;
using IsraaSystem.Web.ActionFillters;

namespace IsraaSystem.Web.Areas.Academic.Controllers
{
    public class StudyTableController : BaseController
    {

        [Authenticate]
        public ActionResult Index()
        {
            StudyTableVM vm = new StudyTableVM(
                new StudyTableFilter(
                    SelectDA.ddlSemesters(),
                    SelectDA.ddlDepartments(),
                    SelectDA.ddlStudyLevels(),
                    SelectDA.ddlSectionGenders(),
                    SelectDA.ddlInstructors(),
                    //todo add semesterEnum here !!!!!!
                    SelectDA.ddlFilterdOfferdCourses(-1, -1, 12),
                    SelectDA.ddlOfferdCoursesSections(),
                    SelectDA.ddlRooms(),
                    SelectDA.ddlCollegesWithoutProgram(),
                    SelectDA.ddlCollege(),
                    SelectDA.ddlPrograms(),
                    SelectDA.ddlBranches()

                    )
                );
            return View(vm);
        }

        [Authenticate]
        public ActionResult InstructorTable()
        {
            StudyTableVM vm = new StudyTableVM(
                new StudyTableFilter(
                    SelectDA.ddlSemesters(),
                    SelectDA.ddlDepartments(),
                    SelectDA.ddlStudyLevels(),
                    SelectDA.ddlSectionGenders(),
                    SelectDA.ddlInstructors(),
                    //todo add semesterEnum here !!!!!!
                    SelectDA.ddlFilterdOfferdCourses(-1, -1, 12),
                    SelectDA.ddlOfferdCoursesSections(),
                    SelectDA.ddlRooms(),
                    SelectDA.ddlCollegesWithoutProgram(),
                    SelectDA.ddlCollege(),
                    SelectDA.ddlPrograms(),
                    SelectDA.ddlBranches()

                )
            );
            return View(vm);
        }

        [Authenticate]
        public ActionResult Print()
        {
            //DataTable DT = StudyTableDA.GetDepartmentsStudyLevelsGenders();
            //return View(DT);

            PrintVM vm = new PrintVM(StudyTableDA.GetDepartmentsStudyLevelsGenders(),
                new PrintFilter(
                    SelectDA.ddlBranches()
                    ));


            return View(vm);
        }


        [Authenticate]
        public ActionResult Report()
        {
            StudyTableVM vm = new StudyTableVM(
                new StudyTableFilter(
                    SelectDA.ddlSemesters(),
                    SelectDA.ddlDepartments(),
                    SelectDA.ddlStudyLevels(),
                    SelectDA.ddlSectionGenders(),
                    SelectDA.ddlInstructors(),
                    //todo add semesterEnum here !!!!!!
                    SelectDA.ddlFilterdOfferdCourses(-1, -1, 12),
                    SelectDA.ddlOfferdCoursesSections(),
                    SelectDA.ddlRooms(),
                    SelectDA.ddlCollegesWithoutProgram(),
                    SelectDA.ddlCollege(),
                    SelectDA.ddlPrograms(),
                    SelectDA.ddlBranches()

                )
            );
            return View(vm);

        }
        [HttpPost]
        public string StudyTableReport(StudyTableVM model)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("dsStudyTable");
            a1.Add("dsStudyTableInfo");

            ArrayList a2 = new ArrayList();
            //a2.Add(StudyTableDA.GetStudyTableReport(Convert.ToInt32(model.filter.SemesterID),Convert.ToInt32(model.filter.DepartmentID), Convert.ToInt32(model.filter.StudyLevelID), Convert.ToInt32(model.filter.GenderID)));
            //a2.Add(StudyTableDA.GetStudyTableInfo(Convert.ToInt32(model.filter.SemesterID),Convert.ToInt32(model.filter.DepartmentID), Convert.ToInt32(model.filter.StudyLevelID), Convert.ToInt32(model.filter.GenderID)));

            if (string.IsNullOrEmpty(model.filter.BranchID))
            {
                model.filter.BranchID = "-1";
            }

            a2.Add(StudyTableDA.GetStudyTableReport(16, Convert.ToInt32(model.filter.DepartmentID), Convert.ToInt32(model.filter.StudyLevelID), Convert.ToInt32(model.filter.GenderID), Convert.ToInt32(model.filter.BranchID)));
            a2.Add(StudyTableDA.GetStudyTableInfo(16, Convert.ToInt32(model.filter.DepartmentID), Convert.ToInt32(model.filter.StudyLevelID), Convert.ToInt32(model.filter.GenderID), Convert.ToInt32(model.filter.BranchID)));

            CreatePDF("BlockSection", @"Areas\Academic\Reports\StudyTableReport.rdlc", a1, a2);
            return "";
        }

        [HttpPost]
        public string InstructorStudyTableReport(StudyTableVM model)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("dsInstructorStudyTable");
            a1.Add("dsInstructorStudyTableInfo");

            ArrayList a2 = new ArrayList();
            a2.Add(StudyTableDA.GetInstructorStudyTableReport(Convert.ToInt32(model.filter.SemesterID), Convert.ToInt32(model.filter.InstructorID)));
            a2.Add(StudyTableDA.GetInstructorStudyTableInfo(Convert.ToInt32(model.filter.SemesterID), Convert.ToInt32(model.filter.InstructorID)));

            CreatePDF("InstructorStudyTable", @"Areas\Academic\Reports\InstructorStudyTableReport.rdlc", a1, a2);
            return "";
        }

        [HttpPost]
        public string RoomStudyTableReport(StudyTableVM model)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("dsRoomStudyTable");
            a1.Add("dsRoomStudyTableInfo");

            ArrayList a2 = new ArrayList();
            a2.Add(StudyTableDA.GetRoomStudyTableReport(Convert.ToInt32(model.filter.SemesterID), Convert.ToInt32(model.filter.RoomID)));
            a2.Add(StudyTableDA.GetRoomStudyTableInfo(Convert.ToInt32(model.filter.SemesterID), Convert.ToInt32(model.filter.RoomID)));

            CreatePDF("RoomStudyTable", @"Areas\Academic\Reports\RoomStudyTableReport.rdlc", a1, a2);
            return "";
        }

        [HttpPost]
        public string CollegeTableReport(StudyTableVM model)
        {

            ArrayList a1 = new ArrayList();
            a1.Add("dsGetCollegeInstructorHours");
            ArrayList a2 = new ArrayList();
            a2.Add(StudyTableDA.GetCollegeInstructorHours(model.filter.SemesterID, model.filter.CollegeID, model.filter.InstructorID));
            CreatePDF("CollegeInstructorHoursReport", @"Areas\Academic\Reports\CollegeInstructorHoursReport.rdlc", a1, a2);
            return "";


        }



        [HttpPost]
        public void SectionsWithNoEmployeeReport(StudyTableVM model)
        {




            ArrayList a1 = new ArrayList();
            a1.Add("dsGetSectionsWithNoEmployee");
            ArrayList a2 = new ArrayList();
            a2.Add(StudyTableDA.GetSectionsWithNoEmployee(model.filter.SemesterID, model.filter.ProgramID, model.filter.CollegeID));
            CreatePDF("SectionsWithNoEmployeeReport", @"Areas\Academic\Reports/SectionsWithNoEmployeeReport.rdlc", a1, a2);
        }






        [HttpGet]
        public JsonResult Lectures(StudyTableFilter model)
        {
            List<Event> events = new List<Event>();
            DataTable DT = StudyTableDA.GetStudyTableLectures(model);

            foreach (DataRow row in DT.Rows)
            {
                events.Add(new Event()
                {
                    id = row["id"].ToString(),
                    title = row["title"].ToString(),
                    start = row["start"].ToString(),
                    end = row["end"].ToString(),
                    Course = row["ArNameCourse"].ToString(),
                    SectionNum = row["SectionNum"].ToString(),
                    Instructor = row["Instructor"].ToString(),
                    Room = row["Room"].ToString()
                });
            }

            return Json(events, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult SectionStudyTableLectures(StudyTableFilter model)
        {
            List<Event> events = new List<Event>();
            DataTable DT = StudyTableDA.GetSectionStudyTableLectures(model);

            foreach (DataRow row in DT.Rows)
            {
                events.Add(new Event()
                {
                    id = row["id"].ToString(),
                    title = row["title"].ToString(),
                    start = row["start"].ToString(),
                    end = row["end"].ToString(),
                    color = row["color"].ToString(),
                    Course = row["ArNameCourse"].ToString(),
                    SectionNum = row["SectionNum"].ToString(),
                    Instructor = row["Instructor"].ToString(),
                    Room = row["Room"].ToString()
                });
            }

            return Json(events, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult StudentLectures(StudyTableFilter model)
        {
            List<Event> events = new List<Event>();
            DataTable DT = StudyTableDA.GetStudentLectures(model);

            foreach (DataRow row in DT.Rows)
            {
                events.Add(new Event()
                {
                    id = row["id"].ToString(),
                    title = row["title"].ToString(),
                    start = row["start"].ToString(),
                    end = row["end"].ToString(),
                    Course = row["ArNameCourse"].ToString(),
                    SectionNum = row["SectionNum"].ToString(),
                    Instructor = row["Instructor"].ToString(),
                    Room = row["Room"].ToString()
                });
            }

            return Json(events, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult InstructorLectures(StudyTableFilter model)
        {
            List<Event> events = new List<Event>();
            DataTable DT = StudyTableDA.GetInstructorLectures(model);

            foreach (DataRow row in DT.Rows)
            {
                events.Add(new Event()
                {
                    id = row["id"].ToString(),
                    title = row["title"].ToString(),
                    start = row["start"].ToString(),
                    end = row["end"].ToString(),
                    Course = row["ArNameCourse"].ToString(),
                    SectionNum = row["SectionNum"].ToString(),
                    Instructor = row["Instructor"].ToString(),
                    Room = row["Room"].ToString()
                });
            }

            return Json(events, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult InstructorHours(StudyTableFilter model)
        {
            List<Event> events = new List<Event>();
            DataTable DT = StudyTableDA.GetInstructorStudyTableInfo(Convert.ToInt32(model.SemesterID), Convert.ToInt32(model.InstructorID));
            return Json(new { hours = DT.Rows[0]["SumOfHours"].ToString() }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult CourseLectures(StudyTableFilter model)
        {
            List<Event> events = new List<Event>();
            DataTable DT = StudyTableDA.GetCourseLectures(model);

            foreach (DataRow row in DT.Rows)
            {
                events.Add(new Event()
                {
                    id = row["id"].ToString(),
                    title = row["title"].ToString(),
                    start = row["start"].ToString(),
                    end = row["end"].ToString(),
                    Course = row["ArNameCourse"].ToString(),
                    SectionNum = row["SectionNum"].ToString(),
                    Instructor = row["Instructor"].ToString(),
                    Room = row["Room"].ToString()
                });
            }

            return Json(events, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult SectionLectures(StudyTableFilter model)
        {
            List<Event> events = new List<Event>();
            DataTable DT = StudyTableDA.GetSectionLectures(model);

            foreach (DataRow row in DT.Rows)
            {
                events.Add(new Event()
                {
                    id = row["id"].ToString(),
                    title = row["title"].ToString(),
                    start = row["start"].ToString(),
                    end = row["end"].ToString(),
                    Course = row["ArNameCourse"].ToString(),
                    SectionNum = row["SectionNum"].ToString(),
                    Instructor = row["Instructor"].ToString(),
                    Room = row["Room"].ToString()
                });
            }

            return Json(events, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult RoomLectures(StudyTableFilter model)
        {
            List<Event> events = new List<Event>();
            DataTable DT = StudyTableDA.GetRoomLectures(model);

            foreach (DataRow row in DT.Rows)
            {
                events.Add(new Event()
                {
                    id = row["id"].ToString(),
                    title = row["title"].ToString(),
                    start = row["start"].ToString(),
                    end = row["end"].ToString(),
                    Course = row["ArNameCourse"].ToString(),
                    SectionNum = row["SectionNum"].ToString(),
                    Instructor = row["Instructor"].ToString(),
                    Room = row["Room"].ToString()
                });
            }

            return Json(events, JsonRequestBehavior.AllowGet);
        }



        public ActionResult ddlCourseStudyTableCourse(int id)
        {
            StudyTableVM vm = new StudyTableVM(
                new StudyTableFilter(
                    SelectDA.ddlSemesters(),
                    SelectDA.ddlDepartments(),
                    SelectDA.ddlStudyLevels(),
                    SelectDA.ddlSectionGenders(),
                    SelectDA.ddlInstructors(),
                    SelectDA.ddlFilterdOfferdCourses(-1, -1, id),
                    SelectDA.ddlOfferdCoursesSections(),
                    SelectDA.ddlRooms(),
                    SelectDA.ddlCollegesWithoutProgram(),
                    SelectDA.ddlCollege(),
                    SelectDA.ddlPrograms(),
                    SelectDA.ddlBranches()
                    )
            );
            return View(vm);
        }



    }
}