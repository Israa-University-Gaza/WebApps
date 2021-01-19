using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Hangfire;
using IsraaSystem.Application.Academic.MarkManager;
using IsraaSystem.Application.Academic.TransformationManger;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Financial;
using IsraaSystem.Core.Shared;
using IsraaSystem.Web.ActionFillters;
using IsraaSystem.Web.Controllers;
using log4net;

namespace IsraaSystem.Web.Areas.Academic.Controllers
{
    public class TransformationController : IsraaBaseController
    {
        private ITransformationService _transformationService;
        public TransformationController(ILog looger, IUnitOfWork unitOfWork, ITransformationService transformationService) : base(looger, unitOfWork)
        {
            _transformationService = transformationService;
        }
        // GET: Academic/Transformation

        [Authenticate]
        public ActionResult Index()
        {
            return View();
        }




        [HttpPost]
        public ActionResult LoadData(QueryOptions queryOptions)
        {

            if (queryOptions.customActionName == "TransformationAccreditation")
            {
                _transformationService.TransformationAccreditation(queryOptions.SelectedItems, ThisUserId(), AccreditationTypeEnum.Academic);
                queryOptions.AddSuccessAlert();

            }
            else if (queryOptions.customActionName == "TransformationCancel")
            {
                _transformationService.TransformationCancel(queryOptions.SelectedItems, ThisUserId(), false);
                queryOptions.AddSuccessAlert();
            }
            else if (queryOptions.customActionName == "TransformationCancelForStudent")
            {
                _transformationService.TransformationCancel(queryOptions.SelectedItems, ThisUserId(), true);
                queryOptions.AddSuccessAlert();
            }

            var data = _transformationService.GetTransformations(queryOptions);
            return Content(data.QueryOptionsGetJson(queryOptions), "application/json");
        }





        public string AcredPdf(int studentId)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("dsGetStudentTransfromationPdf");

            var data = _transformationService.GetStudentTransfromationPdf(studentId, true);
            ArrayList a2 = new ArrayList();
            a2.Add(data);

            CreatePdfFromList("Transfromation_Acred", @"Areas\Academic\Reports\TransfromationReport.rdlc", a1, a2);
            return "";
        }



        public string UnAcredPdf(int studentId)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("dsGetStudentTransfromationPdf");

            var data = _transformationService.GetStudentTransfromationPdf(studentId, null);
            ArrayList a2 = new ArrayList();
            a2.Add(data);

            CreatePdfFromList("Transfromation_Unacred", @"Areas\Academic\Reports\TransfromationReport.rdlc", a1, a2);
            return "";
        }



    }
}