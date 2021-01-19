using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Repository.material;
using IsraaSystem.Core.Shared;
using IsraaSystem.Web.Common;
using IsraaSystem.Web.Controllers;
using log4net;
using System;
using System.Collections.Generic;
using System.Web.Mvc;
using IsraaSystem.Application.Common.ExtensionMethods;
using static IsraaSystem.Application.Repository.material.MaterialService;


namespace IsraaSystem.Web.Areas.Repository.Controllers
{
    public class MaterialController : IsraaBaseController
    {
        private IMaterialService MaterialService;

        public MaterialController(ILog looger, IUnitOfWork unitOfWork, IMaterialService materialService) : base(looger, unitOfWork)
        {
            MaterialService = materialService;
        }

        // GET: Repository/material
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult Add()
        {
            MaterialDto model = new MaterialDto();
            model.IsActive = true;
            model.IsConsumed = true;
            model.UsageStatus = true;
            return PartialView("_Add", model);
        }

        [HttpPost]
        public ActionResult Add(MaterialDto model)
        {
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            MaterialService.AddMaterial(model);
            UnitOfWork.Complete();

            return PartialView("_Add", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");

        }


        public ActionResult Edit(int id)
        {
            MaterialDto model = MaterialService.Get(id);
            return PartialView("_Edit", model);
        }

        [HttpPost]
        public ActionResult Edit(MaterialDto model)
        {
            MaterialService.Edit(model);
            UnitOfWork.Complete();
            model = MaterialService.Get(model.Id);
            return PartialView("_Edit", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        }


        public ActionResult EditSuppliers(int id)
        {
            MaterialDto model = MaterialService.Get(id);
            return PartialView("_EditSuppliers", model);
        }

        [HttpPost]
        public ActionResult EditSuppliers(MaterialDto model, List<int> Suppliers)
        {
            MaterialService.EditSuppliers(model, Suppliers);
            UnitOfWork.Complete();
            return PartialView("_EditSuppliers", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        }



        public ActionResult Delete(int id)
        {

            bool s = MaterialService.Delete(id);
            if (s == true)
            {
                UnitOfWork.Complete();
                return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "israa-form");
            }
            else
            {
                return View("_ALERTS").WithToastError("لا يمكن الحذف لارتباطها بعمليات المخازن", "israa-form");
            }

        }



        [HttpPost]
        public ActionResult LoadData(QueryOptions queryOptions, GetAllInput model /*int? SupplierId, int? TypeId,int? MaterialUnitId*/)
        {
            var data = MaterialService.GetAll(queryOptions, model);
            return Content(data.QueryOptionsGetJson(queryOptions), "application/json");
        }



    }
}

