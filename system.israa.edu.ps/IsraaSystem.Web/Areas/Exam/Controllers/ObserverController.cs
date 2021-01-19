using Audit.Mvc;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Helper;
using IsraaSystem.Core.Exam.Observer.DTO;
using IsraaSystem.Web.ActionFillters;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using IsraaSystem.Application.Academic.ExamManager.ObserverService;
using log4net;

namespace IsraaSystem.Web.Areas.Exam.Controllers
{
    public class ObserverController : IsraaBaseController
    {

        private readonly IObserverService _observerService;
        //private readonly IDropDownService _dropDownService;

        public ObserverController(ILog looger, IUnitOfWork unitOfWork, IObserverService observerService) : base(looger, unitOfWork)
        {
            _observerService = observerService;
            //_dropDownService = dropDownService;
        }


        public ActionResult Dashboard()
        {
            return View();
        }





        public ActionResult Index()
        {


            return View();
        }



        [Authenticate]
        public ActionResult ObserversDistribution()
        {

            ObserversDistribution_Input model = new ObserversDistribution_Input();

            return View(model);
        }




        #region Final

        [Audit]
        [Authenticate]
        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult ObserversDistribution(ObserversDistribution_Input model)
        {
            List<ObserversDistributionList_Output> listData = new List<ObserversDistributionList_Output>();
            if (ModelState.IsValid)
            {
                _observerService.ObserversDistribution(model);
                UnitOfWork.Complete();
                //listData = _observerService.ObserversDistributionList(model).GroupBy(x => x.OfferdCourceName).SelectMany(c => c).ToList();
            }

            return PartialView("ObserverList", listData);
        }



        [Audit]
        [Authenticate]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ObserversDistributionList(ObserversDistribution_Input model)
        {
            List<ObserversDistributionList_Output> listData = new List<ObserversDistributionList_Output>();
            if (ModelState.IsValid)
            {
                listData = _observerService.ObserversDistributionList(model).OrderBy(x => x.RoomName).ToList();
            }

            return PartialView("ObserverList", listData);
        }



        #endregion


        #region Mid







        #endregion


        #region DDls



        public ActionResult ddlDays()
        {
            var examType = HttpContext.Request.Params.Get("ExamType");
            if (examType == "1")
            {

                var menu = DropDownHelpper.MidExamDate();
                return Json(new { success = true, replacement = " فلترة حسب التاريخ ,", menu = menu }, JsonRequestBehavior.AllowGet);

            }
            else
            {
                var menu = DropDownHelpper.FinalExamDate();
                return Json(new { success = true, replacement = " فلترة حسب التاريخ ,", menu = menu }, JsonRequestBehavior.AllowGet);


            }


        }


        public ActionResult ddlPeriods()
        {
            var date = HttpContext.Request.Params.Get("Date");
            var examType = HttpContext.Request.Params.Get("ExamType");
            if (examType == "1")
            {

                var menu = DropDownHelpper.MidExamPeriods(Convert.ToDateTime(date));
                return Json(new { success = true, replacement = " فلترة حسب التاريخ ,", menu = menu }, JsonRequestBehavior.AllowGet);

            }
            else
            {
                var menu = DropDownHelpper.FinalExamPeriods(Convert.ToDateTime(date));
                return Json(new { success = true, replacement = " فلترة حسب التاريخ ,", menu = menu }, JsonRequestBehavior.AllowGet);


            }

        }


        public ActionResult ddlEmps()
        {
            var date = HttpContext.Request.Params.Get("Date");
            var menu = DropDownHelpper.FinalExamPeriods(Convert.ToDateTime(date));
            return Json(new { success = true, replacement = " فلترة حسب التاريخ ,", menu = menu }, JsonRequestBehavior.AllowGet);

        }





        #endregion



    }



}