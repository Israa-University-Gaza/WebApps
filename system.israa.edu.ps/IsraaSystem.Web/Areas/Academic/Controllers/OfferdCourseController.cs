using System;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Application.Academic;
using IsraaSystem.Core.Classic.Academic.OfferdCourse;
using IsraaSystem.Core.Classic.Academic.Section;
using IsraaSystem.DataAccess.Sql.Academic;
using IsraaSystem.Web.ActionFillters;
using IsraaSystem.Web.Controllers;

namespace IsraaSystem.Web.Areas.Academic.Controllers
{
    public class OfferdCourseController : BaseController
    {

        [Authenticate]
        public ActionResult Index()
        {
            OfferdCourseVM vm = OfferdCourseDA.GetFilterdOfferdCourses(new OfferdCourseVM(new OfferdCourseFilter("", "", "", "", "", "", "", SelectDA.ddlOfferdCourseSemester(), SelectDA.ddlDepartments(), SelectDA.ddlStudyLevels(), SelectDA.ddlCourseCategories(), SelectDA.ddlOfferdCourseTypes())));
            return View(vm);
        }

        [HttpPost]
        public ActionResult List(OfferdCourseFilter filter)
        {
            OfferdCourseVM vm = OfferdCourseDA.GetFilterdOfferdCourses(new OfferdCourseVM(filter));
            return View(vm);
        }


        [Authenticate]
        public ActionResult Add()
        {
            OfferdCourse offerdCourse = new OfferdCourse()
            {
                Capacity = 50,
                MSectionCount = 1,
                FSectionCount = 1,
                Semesters = SelectDA.ddlOfferdCourseSemester(),
                Departments = SelectDA.ddlDepartments(),
                Courses = SelectDA.ddlCourses(-1),
                Instructors = SelectDA.ddlEmployees()
            };
            return View(offerdCourse);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddForm(OfferdCourse model)
        {
            model.UserID = GetEmployeeID();
            if (ModelState.IsValid)
            {
                DataTable DT = OfferdCourseDA.OfferdCourseAdd(model);
                TempData["add-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
                if (DT.Rows[0]["status"].ToString() == "1")
                {
                    int offerdCourseId = Convert.ToInt32(DT.Rows[0]["OfferdCourseID"].ToString());
                    DataTable DT1 = OfferdCourseDA.GetOfferdCourseDetails(offerdCourseId);
                    OfferdCourse offerdCourse = new OfferdCourse()
                    {
                        ID = offerdCourseId,
                        ProgramName = DT1.Rows[0]["ProgramName"].ToString(),
                        CollegeName = DT1.Rows[0]["CollegeName"].ToString(),
                        DepartmentName = DT1.Rows[0]["DepartmentName"].ToString(),
                        CourseCode = DT1.Rows[0]["CourseCode"].ToString(),
                        CourseName = DT1.Rows[0]["CourseName"].ToString(),
                        CourseHours = DT1.Rows[0]["CourseHours"].ToString(),
                        InstructorName = DT1.Rows[0]["InstructorName"].ToString(),

                        SectionVM = SectionDA.GetOfferdCourseSections(new SectionVM(offerdCourseId))
                    };
                    return View("DetailsForm", offerdCourse);
                }
            }
            model.Semesters = SelectDA.ddlOfferdCourseSemester();
            model.Departments = SelectDA.ddlDepartments();
            model.Courses = SelectDA.ddlCourses(model.DepartmentID);
            model.Instructors = SelectDA.ddlInstructors();
            return View(model);
        }

        public ActionResult ddlDepartmentCourse(int id)
        {
            OfferdCourse offerdCourse = new OfferdCourse()
            {
                Courses = SelectDA.ddlCourses(id)
            };
            return View(offerdCourse);
        }

        public ActionResult Details(int id)
        {
            DataTable DT = OfferdCourseDA.GetOfferdCourseDetails(id);
            if (DT.Rows.Count > 0)
            {
                OfferdCourse offerdCourse = new OfferdCourse()
                {
                    ID = id,
                    ProgramName = DT.Rows[0]["ProgramName"].ToString(),
                    CollegeName = DT.Rows[0]["CollegeName"].ToString(),
                    DepartmentName = DT.Rows[0]["DepartmentName"].ToString(),
                    CourseCode = DT.Rows[0]["CourseCode"].ToString(),
                    CourseName = DT.Rows[0]["CourseName"].ToString(),
                    CourseHours = DT.Rows[0]["CourseHours"].ToString(),
                    InstructorName = DT.Rows[0]["InstructorName"].ToString(),

                    SectionVM = SectionDA.GetOfferdCourseSections(new SectionVM(id))
                };
                return View(offerdCourse);
            }
            else
            {
                return RedirectToAction("Error404", "Error");
            }
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            DataTable DT = OfferdCourseDA.OfferdCourseDelete(id, GetEmployeeID());
            TempData["refresh-msg"] = DT.Rows[0]["status"].ToString() + ";" + DT.Rows[0]["msg"].ToString();
            return View("_Refresh", null, "form-offerd-course");
        }
    }
}