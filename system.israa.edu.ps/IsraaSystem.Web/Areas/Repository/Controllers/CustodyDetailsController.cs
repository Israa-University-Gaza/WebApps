using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.UnitOfWork;
using log4net;
using IsraaSystem.Application.Repository.custodyDetails;
using IsraaSystem.Web.Common;
using IsraaSystem.Core.Shared;
using IsraaSystem.Application.Helper;
using static IsraaSystem.Application.Repository.custodyDetails.CustodyDetailsService;

namespace IsraaSystem.Web.Areas.Repository.Controllers
{
    public class CustodyDetailsController : IsraaBaseController
    {
        private ICustodyDetailsService CustodyDetailsService;

        public CustodyDetailsController(ILog looger, IUnitOfWork unitOfWork, ICustodyDetailsService custodyDetailsService) : base(looger, unitOfWork)
        {
            CustodyDetailsService = custodyDetailsService;
        }

        public ActionResult GetMaterialUnConsumeByDepartment(int DepartmentId)
        {
            var v = DropDownHelpper.GetMaterialUnConsumeByDepartment(DepartmentId);
            return Json(v, JsonRequestBehavior.AllowGet);
        }


        public ActionResult GetMaterialByEmployee(int EmployeeId)
        {
            var e = DropDownHelpper.GetMaterialByEmployee(EmployeeId);
            return Json(e, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetDepartmentsByMaterial(int MaterialId)
        {
            var e = DropDownHelpper.GetDepartmentsByMaterial(MaterialId);
            return Json(e, JsonRequestBehavior.AllowGet);
        }
        // GET: Repository/CustodyDetails


        #region صرف عهدة
        public ActionResult IndexExportCustody()
        {
            return View();
        }

        public ActionResult AddExportCustody()
        {
            CustodyDetailsDto model = new CustodyDetailsDto();
            model.CustodyTypeId = 1;
            model.CustodyStatus = true;
            model.IsActive = true;
            return PartialView("_AddExportCustody", model);
        }

        [HttpPost]
        public ActionResult AddExportCustody(CustodyDetailsDto model)
        {
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            bool status = CustodyDetailsService.AddExportCustody(model);
            if (status == false)
            {
                return PartialView("_AddExportCustody", model).WithToastError("لا يمكن صرف الصنف غير متواجد في المخزن", "israa-form");
            }

            else if (status == true)
            {
                UnitOfWork.Complete();
                return PartialView("_AddExportCustody", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");
            }

            else
            {
                return View();
            }

        }

        public ActionResult EditExportCustody(int id)
        {
            CustodyDetailsDto model = CustodyDetailsService.Get(id);
            return PartialView("_EditExportCustody", model);
        }

        [HttpPost]
        public ActionResult EditExportCustody(CustodyDetailsDto model)
        {
            CustodyDetailsService.EditCustody(model);
            UnitOfWork.Complete();
            return PartialView("_EditExportCustody", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        }



        [HttpPost]
        public ActionResult LoadExportCustodyData(QueryOptions queryOptions,int? DepartmentId,int? EmployeeId)
        {

            var query = CustodyDetailsService.GetAllExportCustody(queryOptions, DepartmentId, EmployeeId);
            return Content(query.QueryOptionsGetJson(queryOptions), "application/json");

        }
        #endregion

        #region سحب عهدة
        public ActionResult IndexWithdrawalCustody()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoadWithdrawalCustodyData(QueryOptions queryOptions)
        {

            var query = CustodyDetailsService.GetAllWithdrawalCustody(queryOptions);
            return Content(query.QueryOptionsGetJson(queryOptions), "application/json");

        }

        public ActionResult AddWithdrawalCustody()
        {
            CustodyDetailsDto model = new CustodyDetailsDto();
            model.CustodyTypeId = 2;
            model.IsActive = true;
            return PartialView("_AddWithdrawalCustody", model);
        }

        [HttpPost]
        public ActionResult AddWithdrawalCustody(CustodyDetailsDto model)
        {
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            CustodyDetailsService.AddWithdrawalCustody(model);
            UnitOfWork.Complete();
            return PartialView("_AddWithdrawalCustody", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");

        }

        public ActionResult EditWithdrawalCustody(int id)
        {
            CustodyDetailsDto model = CustodyDetailsService.Get(id);
            return PartialView("_EditWithdrawalCustody", model);
        }

        [HttpPost]
        public ActionResult EditWithdrawalCustody(CustodyDetailsDto model)
        {
            CustodyDetailsService.EditCustody(model);
            UnitOfWork.Complete();
            return PartialView("_EditWithdrawalCustody", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        }

        #endregion

        #region نقل عهدة
        public ActionResult IndexMovmentCustody()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoadMovmentCustodyData(QueryOptions queryOptions)
        {

            var query = CustodyDetailsService.GetAllMovmentCustody(queryOptions);
            return Content(query.QueryOptionsGetJson(queryOptions), "application/json");

        }

        public ActionResult AddMovmentCustody()
        {
            CustodyDetailsDto model = new CustodyDetailsDto();
            model.CustodyTypeId = 3;
            model.CustodyStatus = true;
            model.IsActive = true;
            return PartialView("_AddMovmentCustody", model);
        }

        [HttpPost]
        public ActionResult AddMovmentCustody(CustodyDetailsDto model)
        {
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            bool status =CustodyDetailsService.AddMovmentCustody(model);
            if(status == false)
            {
                return PartialView("_AddMovmentCustody", model).WithToastError("الكمية المراد نقلها غير متاحة ", "israa-form");

            }
            else
            {
                UnitOfWork.Complete();
                return PartialView("_AddMovmentCustody", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");
            }
        }

        public ActionResult EditMovmentCustody(int id)
        {
            CustodyDetailsDto model = CustodyDetailsService.Get(id);
            return PartialView("_EditMovmentCustody", model);
        }

        [HttpPost]
        public ActionResult EditMovmentCustody(CustodyDetailsDto model)
        {
            CustodyDetailsService.EditCustody(model);
            UnitOfWork.Complete();
            return PartialView("_EditMovmentCustody", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        }
        #endregion

        #region عهد الموظفين
        public ActionResult IndexRepositoryCustody()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LoadRepositoryCustodyData(QueryOptions queryOptions,  GetAllInput input)
        {
            var query = CustodyDetailsService.GetAllRepositoryCustody(queryOptions, input);
            return Content(query.QueryOptionsGetJson(queryOptions), "application/json");
        }
        #endregion
    }
}