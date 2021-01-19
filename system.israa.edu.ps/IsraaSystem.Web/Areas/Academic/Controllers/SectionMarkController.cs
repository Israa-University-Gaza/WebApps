using System;
using Audit.Mvc;
using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Web.ActionFillters;
using IsraaSystem.Web.Controllers;
using log4net;
using Newtonsoft.Json;
using System.Web.Mvc;
using IsraaSystem.Application.Academic.SectionManger;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Web.Common;

namespace IsraaSystem.Web.Areas.Academic.Controllers
{
    public class SectionMarkController : IsraaBaseController
    {

        private readonly IMarkService _markService;
        public readonly ISectionService _SectionService;

        public SectionMarkController(ILog looger, IUnitOfWork unitOfWork, IMarkService markService, ISectionService sectionService) : base(looger, unitOfWork)
        {
            this._markService = markService;
            _SectionService = sectionService;
        }

        [Audit]
        [Authenticate]
        // GET: Academic/SectionMark
        public ActionResult Index()
        {
            SectionService.SearchSectionsOutput porter = new SectionService.SearchSectionsOutput();
            return View(porter);
        }



        //[HttpPost]
        //[Audit]
        //[Authenticate]
        //public async Task<PartialViewResult> SectionMarkList(SectionMarkIndexVm model)
        //{
        //    model.AcademicSectionsMarksInOut.pagger = model.pagging;
        //    model.AcademicSectionsMarksInOut = await _markService.GetAcademicSectionsMarks(model.AcademicSectionsMarksInOut);
        //    return PartialView("_SectionMarkList", model);
        //}





        public ActionResult LoadData(SectionService.SearchSectionsOutput porter)
        {

            #region mid

            if (porter.customActionName == "DeanMidAccerdiate")
            {

                _markService.MultiSectionMarKAccrediation(porter.SelectedItems, AccreditationTypeEnum.Dean, ExamTypeEnum.Mid, ThisUserId());
                porter.AddSuccessAlert();
            }
            else if (porter.customActionName == "AcademicMidAccerdiate")
            {
                _markService.MultiSectionMarKAccrediation(porter.SelectedItems, AccreditationTypeEnum.Academic, ExamTypeEnum.Mid, ThisUserId());
                porter.AddSuccessAlert();

            }
            else if (porter.customActionName == "DeanMidUnAccerdiate")
            {
                _markService.MultiSectionMarKReturnAccrediation(porter.SelectedItems, AccreditationTypeEnum.Dean, ExamTypeEnum.Mid, ThisUserId());
                porter.AddSuccessAlert();
            }
            else if (porter.customActionName == "AcademicMidUnAccerdiate")
            {
                _markService.MultiSectionMarKReturnAccrediation(porter.SelectedItems, AccreditationTypeEnum.Academic, ExamTypeEnum.Mid, ThisUserId());
                porter.AddSuccessAlert();

            }


            #endregion

            #region Final

            else if (porter.customActionName == "DeanFinalAccerdiate")
            {
                _markService.MultiSectionMarKAccrediation(porter.SelectedItems, AccreditationTypeEnum.Dean, ExamTypeEnum.Final, ThisUserId());
                porter.AddSuccessAlert();

            }
            else if (porter.customActionName == "AcademicFinalAccerdiate")
            {
                _markService.MultiSectionMarKAccrediation(porter.SelectedItems, AccreditationTypeEnum.Academic, ExamTypeEnum.Final, ThisUserId());
                porter.AddSuccessAlert();
            }
            else if (porter.customActionName == "DeanFinalUnAccerdiate")
            {
                _markService.MultiSectionMarKReturnAccrediation(porter.SelectedItems, AccreditationTypeEnum.Dean, ExamTypeEnum.Final, ThisUserId());
                porter.AddSuccessAlert();
            }
            else if (porter.customActionName == "AcademicFinalUnAccerdiate")
            {
                _markService.MultiSectionMarKReturnAccrediation(porter.SelectedItems, AccreditationTypeEnum.Academic, ExamTypeEnum.Final, ThisUserId());
                porter.AddSuccessAlert();
            }


            #endregion



            var result = _SectionService.SearchSections(porter);

            var jsonSerializerSettings = new JsonSerializerSettings()
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            };

            UnitOfWork.Complete();

            return Content(JsonConvert.SerializeObject(result, Formatting.None, jsonSerializerSettings), "application/json");



        }





        //[HttpPost]
        //[Audit]
        //[Authenticate]
        //public async Task<ActionResult> AcademicSectionAccredit(int id, ExamTypeEnum examTypeEnum, SectionMarkIndexVm model)
        //{


        //    int empid = Convert.ToInt32(User.Identity.Name);
        //    await _markService.SectionMarKAccrediation(new SectionMarKAccrediationTransporter(id, AccreditationTypeEnum.Academic, empid, examTypeEnum));

        //    UnitOfWork.Complete();

        //    return Json(new { });


        //}




        //[HttpPost]
        //[Audit]
        //[Authenticate]
        //public async Task<ActionResult> DeanSectionAccredit(int id, ExamTypeEnum examTypeEnum, SectionMarkIndexVm model)
        //{


        //    int empid = Convert.ToInt32(User.Identity.Name);
        //    await _markService.SectionMarKAccrediation(new SectionMarKAccrediationTransporter(id, AccreditationTypeEnum.Dean, empid, examTypeEnum));

        //    UnitOfWork.Complete();

        //    return Json(new { });


        //}









        //[HttpPost]
        //[Audit]
        //[Authenticate]
        //public async Task<ActionResult> AcademicReturnAccredit(int id, ExamTypeEnum examTypeEnum, SectionMarkIndexVm model)
        //{

        //    int empid = Convert.ToInt32(User.Identity.Name);
        //    await _markService.SectionMarKReturnAccrediation(id, AccreditationTypeEnum.Academic, empid, examTypeEnum);

        //    UnitOfWork.Complete();
        //    return Json(new { });


        //}




        //[HttpPost]
        //[Audit]
        //[Authenticate]
        //public async Task<ActionResult> DeanReturnAccredit(int id, ExamTypeEnum examTypeEnum, SectionMarkIndexVm model)
        //{

        //    int empid = Convert.ToInt32(User.Identity.Name);
        //    await _markService.SectionMarKReturnAccrediation(id, AccreditationTypeEnum.Dean, empid, examTypeEnum);

        //    UnitOfWork.Complete();
        //    return Json(new { });


        //}


        //[HttpPost]
        //[Audit]
        //[Authenticate]
        //public async Task<ActionResult> DeanMultiSectionMarKAccrediation(SectionMarkIndexVm model)
        //{

        //    // MarkDA.SetAllSectionMarkAccreditation(model.SelectedRows, GetEmployeeID(), 3);
        //    int empid = Convert.ToInt32(User.Identity.Name);
        //    await _markService.MultiSectionMarKAccrediation(model.SelectedRows, AccreditationTypeEnum.Dean, model.AcademicSectionsMarksInOut.ExamType, empid);

        //    model.AcademicSectionsMarksInOut.pagger = model.pagging;
        //    UnitOfWork.Complete();
        //    return View("_ALERTS").WithToastSuccess("تم اعتماد العلامات", "form-mark-section");

        //}



        //[HttpPost]
        //[Audit]
        //[Authenticate]
        //public async Task<ActionResult> AcademicMultiSectionMarKAccrediation(SectionMarkIndexVm model)
        //{
        //    int empid = Convert.ToInt32(User.Identity.Name);
        //    await _markService.MultiSectionMarKAccrediation(model.SelectedRows, AccreditationTypeEnum.Academic, model.AcademicSectionsMarksInOut.ExamType, empid);

        //    UnitOfWork.Complete();
        //    return View("_ALERTS").WithToastSuccess("تم اعتماد العلامات", "form-mark-section");
        //}



        //[HttpPost]
        //[Audit]
        //[Authenticate]
        //public async Task<ActionResult> AcademicMultiSectionMarKReturnAccrediation(SectionMarkIndexVm model)
        //{
        //    int empid = Convert.ToInt32(User.Identity.Name);
        //    await _markService.MultiSectionMarKReturnAccrediation(model.SelectedRows, AccreditationTypeEnum.Academic, model.AcademicSectionsMarksInOut.ExamType, empid);

        //    UnitOfWork.Complete();
        //    return View("_ALERTS").WithToastSuccess("تم ارجاع اعتماد العلامات كنائب اكاديمي", "form-mark-section");
        //}


        //[HttpPost]
        //[Audit]
        //[Authenticate]
        //public async Task<ActionResult> DeanMultiSectionMarKReturnAccrediation(SectionMarkIndexVm model)
        //{
        //    int empid = Convert.ToInt32(User.Identity.Name);
        //    await _markService.MultiSectionMarKReturnAccrediation(model.SelectedRows, AccreditationTypeEnum.Dean, model.AcademicSectionsMarksInOut.ExamType, empid);

        //    UnitOfWork.Complete();
        //    return View("_ALERTS").WithToastSuccess("تم ارجاع اعتماد العلامات كعميد", "form-mark-section");
        //}







    }
}