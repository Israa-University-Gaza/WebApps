using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Repository.materialUnit;
using IsraaSystem.Core.Shared;
using IsraaSystem.Web.Common;
using IsraaSystem.Web.Controllers;
using log4net;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.ExtensionMethods;


namespace IsraaSystem.Web.Areas.Repository.Controllers
{
    public class MaterialUnitController : IsraaBaseController
    {
        private IMaterialUnitService MaterialUnitService;
        public MaterialUnitController(ILog looger, IUnitOfWork unitOfWork, IMaterialUnitService materialUnitService) : base(looger, unitOfWork)
        {
            MaterialUnitService = materialUnitService;
        }

        // GET: Repository/MaterialUnit
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add()
        {
            MaterialUnitDto model = new MaterialUnitDto();
            model.IsActive = true;
            return PartialView("_Add", model);
        }

        [HttpPost]
        public ActionResult Add(MaterialUnitDto model)
        {
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);

            MaterialUnitService.AddMaterialUnit(model);
            UnitOfWork.Complete();

            return PartialView("_Add", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");

        }


        public ActionResult Edit(int id)
        {
            MaterialUnitDto model = MaterialUnitService.Get(id);
            return PartialView("_Edit", model);
        }

        [HttpPost]
        public ActionResult Edit(MaterialUnitDto model)
        {
            MaterialUnitService.Edit(model);
            UnitOfWork.Complete();
            return PartialView("_Edit", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        }


        public ActionResult Delete(int id)
        {
            MaterialUnitService.Delete(id);
            UnitOfWork.Complete();
            return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "israa-form");

        }


        [HttpPost]
        public ActionResult LoadData(QueryOptions queryOptions)
        {

            var query = MaterialUnitService.GetAll(queryOptions);
            return Content(query.QueryOptionsGetJson(queryOptions), "application/json");
        }
        /*
                // GET: Repository/MaterialUnit
                public ActionResult Index(string q)
                {
                    var data = MaterialUnitService.GetAll(q);
                    return View(data);
                }

                public ActionResult List(string q)
                {
                    var data = MaterialUnitService.GetAll(q);
                    return View(data);
                }

                public ActionResult Add()
                {
                    MaterialUnitDto model = new MaterialUnitDto();
                    model.IsActive = true;
                    return PartialView("_Add", model);
                }

                [HttpPost]
                public ActionResult Add(MaterialUnitDto model)
                {
                    model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
                    bool s = MaterialUnitService.AddMaterialUnit(model);
                    if (s == true)
                    {
                        UnitOfWork.Complete();
                        return PartialView("_Add", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");
                    }
                    else
                    {
                        return PartialView("_Add", model).WithToastError("هذه البيانات مضافة مسبقاً", "israa-form");
                    }
                }

                public ActionResult Edit(int id)
                {
                    MaterialUnitDto model = MaterialUnitService.Get(id);
                    return PartialView("_Edit", model);
                }

                [HttpPost]
                public ActionResult Edit(MaterialUnitDto model)
                {
                    MaterialUnitService.EditMaterialUnit(model);
                    UnitOfWork.Complete();
                    return PartialView("_Edit", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
                }

                public ActionResult Delete(int id)
                {
                    bool s = MaterialUnitService.DeleteMaterialUnit(id);
                    if (s == true)
                    {
                        UnitOfWork.Complete();
                        return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "israa-form");
                    }
                    else
                    {
                        return View("_ALERTS").WithToastError("لا يمكن الحذف لارتباطها بصنف", "israa-form");
                    }
                }
                */
    }
}