using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Helper;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using IsraaSystem.DataAccess.Sql.Academic;
using IsraaSystem.Web.Areas.Exam.Models;
using IsraaSystem.Web.Controllers;
using log4net;

namespace IsraaSystem.Web.Areas.Exam.Controllers
{
    public class ExamSectionDistributionController : IsraaBaseController
    {


        public ExamSectionDistributionController(ILog looger, IUnitOfWork unitOfWork) : base(looger, unitOfWork)
        {
        }
        // GET: Exam/ExamSectionDistribution
        public ActionResult Index()
        {


            var model = new ExamSectionDistributionVM();
            return View(model);
        }





        [HttpPost]
        public ActionResult Add(ExamSectionDistributionVM model)
        {

            var t = new ExamSectionDistribution()
            {
                RoomId = model.RoomId,
                SectionId = model.SectionID,
                MaleCount = model.MaleCount,
                FemaleCount = model.FemaleCount
            };

            UnitOfWork.Academic.ExamSectionDistribution.Add(t);
            UnitOfWork.Complete();


            return RedirectToAction("List", model);
        }

        public ActionResult List(ExamSectionDistributionVM model)
        {
            var section = UnitOfWork.Academic.Section.Find(model.SectionID);

            var studentGenders = UnitOfWork.Academic.StdSection.Where(x => !x.IsDelete)
                .Where(x => x.SectionID == model.SectionID)
                .Where(x => x.CourseStatusID == 1 || x.CourseStatusID == 11 || x.CourseStatusID == 6 ||
                            x.CourseStatusID == 7 ||
                            x.CourseStatusID == 5)
                .Select(x => x.StudentAcademic.StudentPersonal.Gender);


            model.SectionDetails = new SectionDetails
            {
                count = studentGenders.Count(),
                FeMale = studentGenders.Count(x => x == 2),
                Male = studentGenders.Count(x => x == 1),
                sectionGender = section.Gender
            }; ;


            model.Data = UnitOfWork.Academic.ExamSectionDistribution
                .Where(x => x.Section.OfferdCourse.FinalExamDate == model.ExamDate)
                .Where(x => x.Section.OfferdCourse.FinalExamTimeFrom1 == model.ExamPeriod)
                .GroupBy(x => x.Room)
                .ToList()
                //.Where(x => x.Any(c => c.SectionId == model.SectionID))
                .Select(x => new ExamSectionDistributionListDto
                {
                    roomName = x.Key.Name,
                    data = x.Select(d => d).ToList(),
                    count = x.Select(d => d).Count(),
                    StudentCount = x.Sum(s => s.FemaleCount) + x.Sum(s => s.MaleCount),
                    MaleCount = x.Sum(s => s.MaleCount),
                    FemaleCount = x.Sum(s => s.FemaleCount),
                    ExamCapacity = x.Key.ExamCapacity,
                    LectureCapacity = x.Key.LectureCapacity,
                    SeatNum = x.Key.SeatNum,
                });




            return View(model);
        }





        #region DDLS



        public ActionResult ddlDepartments()
        {
            var id = HttpContext.Request.Params.Get("CollegeID");
            var menu = SelectDA.ddlDepartments();
            return Json(new { success = true, replacement = "فلترة حسب الكلية ,", menu }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ddlFilterdOfferdCourses()
        {
            var id = HttpContext.Request.Params.Get("DepartmentID");
            var SemesterId = 15;
            //var menu = SelectDA.ddlFilterdOfferdCourses(Convert.ToInt32(id), -1, (int)SemestersEnum.CurentSemester);
            var menu = DropDownHelpper.ddlFilterdOfferdCourses(Convert.ToInt32(id), -1, Convert.ToInt32(SemesterId));

            return Json(new { success = true, replacement = "فلترة حسب القسم ,", menu }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ddlSections()
        {
            var id = HttpContext.Request.Params.Get("OfferdCourseID");
            var menu = SelectDA.ddlSections(Convert.ToInt32(id));
            return Json(new { success = true, replacement = "فلترة حسب المساق ,", menu }, JsonRequestBehavior.AllowGet);
        }

        #endregion

    }
}