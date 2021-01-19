using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Results;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Financial;
using IsraaSystem.Application.Helper;
using IsraaSystem.Core.Shared;
using IsraaSystem.DataAccess.EntityFrameWork.IsraData;
using IsraaSystem.Web.Areas.Financial.Models.Installment;
using IsraaSystem.Web.Controllers;
using log4net;
using Newtonsoft.Json;

namespace IsraaSystem.Web.Areas.Financial.Controllers
{
    public class InstallmentController : IsraaBaseController
    {
        private IInstallmentService _installmentService;
        public InstallmentController(ILog looger, IUnitOfWork unitOfWork, IInstallmentService installmentService) : base(looger, unitOfWork)
        {
            _installmentService = installmentService;
        }

        // GET: Financial/Installment
        public ActionResult Index()
        {

            var model = new InstallmentVM();
            return View(model);
        }


        public ActionResult LoadData(QueryOptions queryOptions, InstallmentVM model)
        {


            if (queryOptions.customActionName == "LoansDivisionAccerdiate")
            {
                _installmentService.Accerdiate(queryOptions.SelectedItems, ThisUserId(), InstallmentAccreditationTypeEnum.LoansDivision);
                queryOptions.AddSuccessAlert();
            }
            else if (queryOptions.customActionName == "AffairsManagerAccerdiate")
            {
                _installmentService.Accerdiate(queryOptions.SelectedItems, ThisUserId(), InstallmentAccreditationTypeEnum.AffairsManager);
                queryOptions.AddSuccessAlert();

            }
            else if (queryOptions.customActionName == "AcademicAccerdiate")
            {
                _installmentService.Accerdiate(queryOptions.SelectedItems, ThisUserId(), InstallmentAccreditationTypeEnum.Academic);
                queryOptions.AddSuccessAlert();

            }
            else if (queryOptions.customActionName == "ManagmentAccerdiate")
            {
                _installmentService.Accerdiate(queryOptions.SelectedItems, ThisUserId(), InstallmentAccreditationTypeEnum.Managment);
                queryOptions.AddSuccessAlert();

            }

            var data = _installmentService.GetAll(queryOptions, model.SemesterId, model.StudentId, model.InsertDateFrom, model.InsertDateTo);
            return Content(data.QueryOptionsGetJson(queryOptions), "application/json");

        }




        public PartialViewResult StudentInstallmentOrderList(int studentId, int semesterId)
        {
            List<StudentInstallment> model = _installmentService.StudentInstallment(studentId, semesterId).ToList();
            return PartialView("_StudentInstallmentOrderList", model);
        }












    }
}