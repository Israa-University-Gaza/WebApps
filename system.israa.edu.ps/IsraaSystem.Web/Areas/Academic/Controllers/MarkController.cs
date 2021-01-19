using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Dynamic;
using System.Threading.Tasks;
using System.Web.Mvc;
using Audit.Mvc;
using Hangfire;
using IsraaSystem.Application.Academic;
using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.Application.Academic.SectionManger;
using IsraaSystem.Application.Common.Alert;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Helper;
using IsraaSystem.Core.Shared;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using IsraaSystem.DataAccess.Sql.Academic;
using IsraaSystem.Web.ActionFillters;
using IsraaSystem.Web.Areas.Academic.Models.Mark;
using IsraaSystem.Web.Common;
using IsraaSystem.Web.Controllers;
using log4net;
using Newtonsoft.Json;
using static IsraaSystem.Application.Academic.MarkManager.MarkService;

namespace IsraaSystem.Web.Areas.Academic.Controllers
{
    public class MarkController : IsraaBaseController
    {
        private readonly IMarkService _markService;
        private readonly ISectionService _sectionService;

        public MarkController(ILog loger, IUnitOfWork unitOfWork, IMarkService markService,
            ISectionService sectionService) : base(loger, unitOfWork)
        {
            _markService = markService;
            _sectionService = sectionService;
        }

        private int GetEmployeeId()
        {
            return Convert.ToInt32(User.Identity.Name);
        }

        protected int GetCurrentSemesterId()
        {
            return (int)SemestersEnum.CurentSemester;
        }
        // GET: Academic/Mark

        #region  Mark

        [Audit]
        [Authenticate]
        public ActionResult StudentMark()
        {
            var model = new MarkIndexVm
            {
                Result = new List<MarkDto>(),
                SectionsMarksDto = new SectionDto(),
                SortOrder = true
            };

            return View(model);
        }

        [Audit]
        public async Task<ActionResult> LoadData(QueryOptions queryOptions, int SectionID)
        {
            #region mid

            if (queryOptions.customActionName == "DeanMidAccerdiate")
            {
                _markService.SectionMarKAccrediation(new SectionMarKAccrediationInput(SectionID,
                    AccreditationTypeEnum.Dean, ThisUserId(), ExamTypeEnum.Mid, queryOptions.SelectedItems));
                queryOptions.AddSuccessAlert();
            }
            else if (queryOptions.customActionName == "AcademicMidAccerdiate")
            {
                _markService.SectionMarKAccrediation(new SectionMarKAccrediationInput(SectionID,
                    AccreditationTypeEnum.Academic, ThisUserId(), ExamTypeEnum.Mid, queryOptions.SelectedItems));
                queryOptions.AddSuccessAlert();
            }
            else if (queryOptions.customActionName == "DeanMidUnAccerdiate")
            {
                _markService.SectionMarKReturnAccrediation(new SectionMarKAccrediationInput(SectionID,
                    AccreditationTypeEnum.Dean, ThisUserId(), ExamTypeEnum.Mid, queryOptions.SelectedItems));
                queryOptions.AddSuccessAlert();
            }
            else if (queryOptions.customActionName == "AcademicMidUnAccerdiate")
            {
                if (!ThisUser().HasAction("Academic.Mark.AcademicMarkAccredit"))
                {
                    queryOptions.AddErrorAlert("لا تملك الصلاحية لتنفيذ العملية");
                }
                else
                {
                    _markService.SectionMarKReturnAccrediation(new SectionMarKAccrediationInput(SectionID,
                        AccreditationTypeEnum.Academic, ThisUserId(), ExamTypeEnum.Mid, queryOptions.SelectedItems));
                    queryOptions.AddSuccessAlert();
                }
            }

            #endregion

            #region Final

            else if (queryOptions.customActionName == "DeanFinalAccerdiate")
            {
                _markService.SectionMarKAccrediation(new SectionMarKAccrediationInput(SectionID,
                    AccreditationTypeEnum.Dean, ThisUserId(), ExamTypeEnum.Final, queryOptions.SelectedItems));
               // queryOptions.AddSuccessAlert();
            }
            else if (queryOptions.customActionName == "AcademicFinalAccerdiate")
            {
                _markService.SectionMarKAccrediation(new SectionMarKAccrediationInput(SectionID,
                    AccreditationTypeEnum.Academic, ThisUserId(), ExamTypeEnum.Final, queryOptions.SelectedItems));
                queryOptions.AddSuccessAlert();
            }
            else if (queryOptions.customActionName == "DeanFinalUnAccerdiate")
            {
                _markService.SectionMarKReturnAccrediation(new SectionMarKAccrediationInput(SectionID,
                    AccreditationTypeEnum.Dean, ThisUserId(), ExamTypeEnum.Final, queryOptions.SelectedItems));
                queryOptions.AddSuccessAlert();
            }
            else if (queryOptions.customActionName == "AcademicFinalUnAccerdiate")
            {
                if (!ThisUser().HasAction("Academic.Mark.AcademicMarkReturnAccredit"))
                {
                    queryOptions.AddErrorAlert("لا تملك الصلاحية لتنفيذ العملية");
                }
                else
                {
                    _markService.SectionMarKReturnAccrediation(new SectionMarKAccrediationInput(SectionID,
                        AccreditationTypeEnum.Academic, ThisUserId(), ExamTypeEnum.Final, queryOptions.SelectedItems));
                    queryOptions.AddSuccessAlert();
                }
            }

            #endregion

            UnitOfWork.Complete();


            var info = _markService.SectionMarkDetails(SectionID);
            var data = await _markService.GetSectionStudentsMarks(queryOptions, SectionID);
            var statistics = new
            {
                count = data.Count,
                FinalIncompleteCount = data.Count(x => x.IsFinalIncomplete),
                FinalNoMarkCount = data.Count(x => x.IsFinalNoMark),
                SuccessCount = data.Count(x => x.IsSuccess),
                FailCount = data.Count(x => !x.IsSuccess) - data.Count(x => x.IsFinalNoMark),
                ExcellenceCount = data.Count(x => x.TotalMark >= 90),
                VeryGoodCount = data.Count(x => x.TotalMark >= 80 && x.TotalMark < 90),
                GoodCount = data.Count(x => x.TotalMark >= 70 && x.TotalMark < 80),
                PassCount = data.Count(x => x.IsSuccess && x.TotalMark < 70),

            };

            var obj = new
            {
                queryOptions.draw,
                queryOptions.recordsFiltered,
                recordsTotal = queryOptions.recordsFiltered,
                queryOptions.customActionMessage,
                queryOptions.customActionStatus,
                data,
                info,
                statistics
            };

            var jsonSerializerSettings = new JsonSerializerSettings
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            };

            var json = JsonConvert.SerializeObject(obj, Formatting.None, jsonSerializerSettings);

            return Content(json, "application/json");

        }

        [Authenticate]
        [Audit]
        public ActionResult Update(int markId)
        {
            var mark = _markService.MarkGet(markId);
            var markTitle = _sectionService.SectionMarkTitleGet(mark.SectionID.Value);
            var model = new MarkUpdateVM
            {
                MarkDto = mark,
                MarkTitle = markTitle
            };
            return PartialView("_MarkUpdate", model);
        }

        [HttpPost]
        [Authenticate]
        [Audit]
        public ActionResult MarkUpdate(MarkUpdateVM model)
        {
            _markService.MarkUpdate(model.MarkDto, ThisUserId());
            _markService.MarKAccrediation(new MarKAccrediationPorter(model.MarkDto.StdSectionId,
                AccreditationTypeEnum.Academic, Convert.ToInt32(User.Identity.Name), ExamTypeEnum.Mid));
            _markService.MarKAccrediation(new MarKAccrediationPorter(model.MarkDto.StdSectionId,
                AccreditationTypeEnum.Academic, Convert.ToInt32(User.Identity.Name), ExamTypeEnum.Final));
            UnitOfWork.Complete();
            // BackgroundJob.Schedule<CalculationManager>(x => x.CalculateGpa(model.MarkDto.StudentID, null, AccreditationStatusEnum.UnAccredit), TimeSpan.FromSeconds(15));
            return RedirectToAction("Update", new { markId = model.MarkDto.MarkId }).WithToastSuccess();
        }

        [HttpPost]
        [Audit]
        [Authenticate]
        public async Task<ActionResult> AcademicMarkAccredit(int stdSectionId, ExamTypeEnum examTypeEnum)
        {
            _markService.MarKAccrediation(new MarKAccrediationPorter(stdSectionId, AccreditationTypeEnum.Academic,
                Convert.ToInt32(User.Identity.Name), examTypeEnum));
            UnitOfWork.Complete();
            return View("_ALERTS").WithToastSuccess("تم اعتماد العلامة");
        }


        [HttpPost]
        [Audit]
        [Authenticate]
        public async Task<ActionResult> DeanMarkAccredit(int stdSectionId, ExamTypeEnum examTypeEnum)
        {
            _markService.MarKAccrediation(new MarKAccrediationPorter(stdSectionId, AccreditationTypeEnum.Dean,
                Convert.ToInt32(User.Identity.Name), examTypeEnum));
            UnitOfWork.Complete();
            return View("_ALERTS").WithToastSuccess("تم اعتماد العلامة");
        }

        [HttpPost]
        [Audit]
        [Authenticate]
        public async Task<ActionResult> DeanMarkReturnAccredit(int stdSectionId, ExamTypeEnum examTypeEnum)
        {
            _markService.MarKReturnAccrediation(stdSectionId, AccreditationTypeEnum.Dean,
                Convert.ToInt32(User.Identity.Name), examTypeEnum);
            UnitOfWork.Complete();

            return View("_ALERTS").WithToastSuccess("تم ارجاع العلامة");
        }


        [HttpPost]
        [Audit]
        [Authenticate]
        public async Task<ActionResult> AcademicMarkReturnAccredit(int stdSectionId, ExamTypeEnum examTypeEnum)
        {
            _markService.MarKReturnAccrediation(stdSectionId, AccreditationTypeEnum.Academic,
                Convert.ToInt32(User.Identity.Name), examTypeEnum);


            UnitOfWork.Complete();

            return View("_ALERTS").WithToastSuccess("تم ارجاع العلامة");
        }

        #endregion

        #region SpecialFinalMark

        public ActionResult SpecialFinalMark()
        {
            return View();
        }
        public ActionResult SetStdSectionTotalMark(SetStdSectionTotalMarkInput input)
        {
            var acred = new MarKAccrediationPorter(input.stdsectionId, AccreditationTypeEnum.Academic,
                Convert.ToInt32(User.Identity.Name), ExamTypeEnum.Final);
            _markService.SetStdSectionTotalMark(input);
            _markService.MarKAccrediation(acred);
            UnitOfWork.Complete();
            return View("_ALERTS").WithToastSuccess("تم حفظ واعتماد العلامة بنجاح");
        }

        [HttpPost]
        public ActionResult SpecialFinalMarkLoadData(QueryOptions queryOptions, GetStudentsSpecialMarksInput input)

        {
            var data = _markService.GetStudentsSpecialMarks(queryOptions, input);
            return Content(data.QueryOptionsGetJson(queryOptions), "application/json");
        }
        #endregion

        #region DDLS

        public ActionResult ddlColleges()
        {
            var id = HttpContext.Request.Params.Get("ProgramID");
            var menu = SelectDA.ddlEmployeeCollages(GetEmployeeId(), Convert.ToInt32(id));
            return Json(new { success = true, replacement = " فلترة حسب البرنامج ,", menu },
                JsonRequestBehavior.AllowGet);
        }

        public ActionResult ddlEmployeeDepartments()
        {
            var id = HttpContext.Request.Params.Get("CollegeID");
            var menu = SelectDA.ddlEmployeeDepartments(GetEmployeeId(), Convert.ToInt32(id));
            return Json(new { success = true, replacement = "فلترة حسب الكلية ,", menu }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ddlFilterdOfferdCourses()
        {
            var id = HttpContext.Request.Params.Get("DepartmentID");
            var SemesterId = HttpContext.Request.Params.Get("SemesterId");
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

        #region Reports

        public async Task<string> SectionStudentsMarks(string sectionID)
        {


            var data = await _markService.GetSectionStudentsMarks(null, Convert.ToInt32(sectionID));
            var statistics = new
            {
                count = data.Count,
                FinalIncompleteCount = data.Count(x => x.IsFinalIncomplete),
                FinalNoMarkCount = data.Count(x => x.IsFinalNoMark),
                SuccessCount = data.Count(x => x.IsSuccess),
                FailCount = data.Count(x => !x.IsSuccess) - data.Count(x => x.IsFinalNoMark),
                ExcellenceCount = data.Count(x => x.TotalMark >= 90),
                VeryGoodCount = data.Count(x => x.TotalMark >= 80 && x.TotalMark < 90),
                GoodCount = data.Count(x => x.TotalMark >= 70 && x.TotalMark < 80),
                PassCount = data.Count(x => x.IsSuccess && x.TotalMark < 70),
                Pcount = 100,
                PFinalIncompleteCount = (data.Count(x => x.IsFinalIncomplete) / data.Count) * 100,
                PFinalNoMarkCount = (data.Count(x => x.IsFinalNoMark) / data.Count) * 100,
                PSuccessCount = (data.Count(x => x.IsSuccess) / data.Count )*100,
                PFailCount = ((data.Count(x => !x.IsSuccess) - data.Count(x => x.IsFinalNoMark)) / data.Count )*100,
                PExcellenceCount = (data.Count(x => x.TotalMark >= 90) / data.Count )*100,
                PVeryGoodCount = (data.Count(x => x.TotalMark >= 80 && x.TotalMark < 90) / data.Count )*100,
                PGoodCount = (data.Count(x => x.TotalMark >= 70 && x.TotalMark < 80) / data.Count )*100,
                PPassCount = (data.Count(x => x.IsSuccess && x.TotalMark < 70) / data.Count )*100,


            };

            double Pcount = 100;
            var PFinalIncompleteCount = Convert.ToDouble(statistics.FinalIncompleteCount) / Convert.ToDouble(statistics.count )* 100;
            var PFinalNoMarkCount = Convert.ToDouble(statistics.FinalNoMarkCount) / Convert.ToDouble(statistics.count) * 100;
            var PSuccessCount = Convert.ToDouble(statistics.SuccessCount) / Convert.ToDouble(statistics.count) * 100;
            var PFailCount = (Convert.ToDouble(statistics.FailCount) - Convert.ToDouble(statistics.FinalNoMarkCount)) / Convert.ToDouble(statistics.count) * 100;
            var PExcellenceCount = Convert.ToDouble(statistics.ExcellenceCount) / Convert.ToDouble(statistics.count) * 100;
            var PVeryGoodCount = Convert.ToDouble(statistics.VeryGoodCount) / Convert.ToDouble(statistics.count) * 100;
            var PGoodCount = Convert.ToDouble(statistics.GoodCount) / Convert.ToDouble(statistics.count) * 100;
            var PPassCount = Convert.ToDouble(statistics.PassCount) / Convert.ToDouble(statistics.count) * 100;

            DataTable dt = new DataTable();

            dt.Columns.Add("count", typeof(string));
            dt.Columns.Add("FinalIncompleteCount", typeof(string));
            dt.Columns.Add("FinalNoMarkCount", typeof(string));
            dt.Columns.Add("SuccessCount", typeof(string));
            dt.Columns.Add("FailCount", typeof(string));
            dt.Columns.Add("ExcellenceCount", typeof(string));
            dt.Columns.Add("VeryGoodCount", typeof(string));
            dt.Columns.Add("GoodCount", typeof(string));
            dt.Columns.Add("PassCount", typeof(string));
            dt.Columns.Add("Pcount", typeof(string));
            dt.Columns.Add("PFinalIncompleteCount", typeof(string));
            dt.Columns.Add("PFinalNoMarkCount", typeof(string));
            dt.Columns.Add("PSuccessCount", typeof(string));
            dt.Columns.Add("PFailCount", typeof(string));
            dt.Columns.Add("PExcellenceCount", typeof(string));
            dt.Columns.Add("PVeryGoodCount", typeof(string));
            dt.Columns.Add("PGoodCount", typeof(string));
            dt.Columns.Add("PPassCount", typeof(string));



            dt.Rows.Add(
                    statistics.count,
                statistics.FinalIncompleteCount,
                statistics.FinalNoMarkCount,
                statistics.SuccessCount,
                statistics.FailCount,
                statistics.ExcellenceCount,
                statistics.VeryGoodCount,
                statistics.GoodCount,
                statistics.PassCount,
                    Math.Round(Pcount).ToString()+"%",
                     Math.Round(PFinalIncompleteCount).ToString() + "%",
                     Math.Round(PFinalNoMarkCount).ToString() + "%",
                     Math.Round(PSuccessCount).ToString() + "%",
                     Math.Round(PFailCount).ToString() + "%",
                     Math.Round(PExcellenceCount).ToString() + "%",
                     Math.Round(PVeryGoodCount).ToString() + "%",
                     Math.Round(PGoodCount).ToString() + "%",
                     Math.Round(PPassCount).ToString() + "%"
                    );



            var a1 = new ArrayList();
            a1.Add("dsSectionStudentsMarks");
            a1.Add("dsSectionStatistics");
            a1.Add("dsSectionStatistics2");

            var a2 = new ArrayList();
            a2.Add(MarkDA.GetSectionStudentsMarks(sectionID));
            a2.Add(MarkDA.GetSectionStatistics(sectionID));
            a2.Add(dt);

            CreatePDF("SectionStudentsMarks_", @"Areas\Academic\Reports\SectionStudentsMarks.rdlc", a1, a2);
            return "";
        }

        public string SectionStudentsMidtermMarks(string sectionID)
        {
            var a1 = new ArrayList();
            a1.Add("dsSectionStudentsMidtermMarks");
            a1.Add("dsSectionStatistics");

            var a2 = new ArrayList();
            a2.Add(MarkDA.GetSectionStudentsMidtermMarks(sectionID));
            a2.Add(MarkDA.GetSectionStatistics(sectionID));

            CreatePDF("SectionStudentsMidtermMarks_", @"Areas\Academic\Reports\SectionStudentsMidtermMarks.rdlc", a1,
                a2);
            return "";
        }

        #endregion




    }
}