using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Threading.Tasks;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Repository.material;
using IsraaSystem.Web.Common;
using IsraaSystem.Web.Controllers;
using log4net;
using Newtonsoft.Json;
using IsraaSystem.Application.Repository.supplier;
using IsraaSystem.Core.Shared;
using static IsraaSystem.Application.Repository.supplier.SupplierService;

namespace IsraaSystem.Web.Areas.Repository.Controllers
{
    public class SupplierController : IsraaBaseController
    {
        private ISupplierService SupplierService;

        public SupplierController(ILog looger, IUnitOfWork unitOfWork, ISupplierService supplierService) : base(looger, unitOfWork)
        {
            SupplierService = supplierService;
        }

        // GET: Repository/Supplier
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add()
        {
            SupplierDto model = new SupplierDto();

            model.IsActive = true;
            return PartialView("_Add", model);
        }

        [HttpPost]
        public ActionResult Add(SupplierDto model)
        {
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);

            SupplierService.AddSupplier(model);
            UnitOfWork.Complete();

            return PartialView("_Add", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");

        }


        public ActionResult Edit(int id)
        {
            SupplierDto model = SupplierService.Get(id);
            return PartialView("_Edit", model);
        }

        [HttpPost]
        public ActionResult Edit(SupplierDto model)
        {
            SupplierService.Edit(model);
            UnitOfWork.Complete();
            model = SupplierService.Get(model.Id);
            return PartialView("_Edit", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        }





        public ActionResult EditMaterials(int id)
        {
            SupplierDto model = SupplierService.Get(id);
            return PartialView("_EditMaterials", model);
        }

        [HttpPost]
        public ActionResult EditMaterials(SupplierDto model, List<int> Materials)
        {
            SupplierService.EditMaterials(model.Id, Materials);
            UnitOfWork.Complete();
            model = SupplierService.Get(model.Id);
            return PartialView("_EditMaterials", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        }



        public ActionResult Delete(int id)
        {
            SupplierService.Delete(id);
            UnitOfWork.Complete();
            return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "israa-form");

        }



        [HttpPost]
        public ActionResult LoadData(QueryOptions queryOptions, GetAllInput input)
        {

            var data = SupplierService.GetAll(queryOptions , input);
            return Content(data.QueryOptionsGetJson(queryOptions), "application/json");

        }

    }
}






