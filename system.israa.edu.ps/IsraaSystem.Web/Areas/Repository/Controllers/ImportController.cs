using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Threading.Tasks;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Web.Common;
using IsraaSystem.Web.Controllers;
using log4net;
using Newtonsoft.Json;
using IsraaSystem.Application.Repository.import;
using IsraaSystem.Web.Areas.Repository.Models.import;
using System.Web.Helpers;

namespace IsraaSystem.Web.Areas.Repository.Controllers
{
    public class ImportController : IsraaBaseController
    {
        private IImportService ImportService;
        public ImportController(ILog looger, IUnitOfWork unitOfWork , IImportService importService) : base(looger, unitOfWork)
        {
            ImportService = importService;
        }

        // GET: Repository/Import
        public ActionResult Index()
        {
            return View();
        }
        //public ActionResult Add()
        //{
        //    ImportDto model = new ImportDto();
        //    model.IsActive = true;
        //    return PartialView("_Add", model);
        //}

        //[HttpPost]
        //public ActionResult Add(ImportDto model)
        //{
        //    model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
        //    model.RemainingQuantity = model.Quantity;
        //    ImportService.AddImport(model);
        //    UnitOfWork.Complete();
        //    return PartialView("_Add", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");

        //}

        //public ActionResult DistributionImport(int importId)
        //{
        //    var model = new DistributionVM();

        //    model.ImportDto = ImportService.Get(importId);

        //    model.TransactionDto = new TransactionDto();

        //    model.TransactionDto.IsActive = true;
        //    model.TransactionDto.ImportId = importId;
        //    model.TransactionDto.MaterialId = model.ImportDto.MaterialId;
        //    return PartialView("_DistributionImport", model);
        //}

        //[HttpPost]
        //public ActionResult DistributionImport(DistributionVM model)
        //{

        //    //model.ImportDto = ImportService.Get(model.ImportId.Value);
        //    int remmain = model.ImportDto.RemainingQuantity.Value;
        //    int qunt = model.TransactionDto.Quantity;
        //    int result = remmain - qunt;
        //    model.ImportDto.RemainingQuantity = result;
        //    model.ImportDto.IsActive = true;


        //    model.TransactionDto.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
        //    model.TransactionDto.InsertedDate = DateTime.Now;
        //    ImportService.DistributionImport(model.TransactionDto);
        //    ImportService.Edit(model.ImportDto);
        //    UnitOfWork.Complete();
        //    return PartialView("_DistributionImport", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");

        //}

        //public ActionResult Edit(int id)
        //{
        //    ImportDto model = ImportService.Get(id);
        //    return PartialView("_Edit", model);
        //}

        //[HttpPost]
        //public ActionResult Edit(ImportDto model)
        //{
        //    ImportService.Edit(model);
        //    UnitOfWork.Complete();
        //    return PartialView("_Edit", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        //}


        //public ActionResult Delete(int id)
        //{
        //    ImportService.Delete(id);
        //    UnitOfWork.Complete();
        //    return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "israa-form");

        //}

       

        ////public ActionResult List()
        ////{
        ////    var data = ImportService.GetAll();
        ////    return PartialView("_List", data);
        ////}

        //[HttpPost]
        //public ActionResult LoadData()
        //{

        //    var draw = Request.Form.GetValues("draw").FirstOrDefault();
        //    var start = Request.Form.GetValues("start").FirstOrDefault();
        //    var length = Request.Form.GetValues("length").FirstOrDefault();
        //    //Find Order Column
        //    var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
        //    var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
        //    var searchKey = Request.Form.GetValues("search[value]").FirstOrDefault();


        //    int pageSize = length != null ? Convert.ToInt32(length) : 0;
        //    int skip = start != null ? Convert.ToInt32(start) : 0;
        //    int recordsTotal = 0;


        //    //getData



        //    var data = ImportService.GetAll(searchKey, sortColumn, sortColumnDir, skip, pageSize, out recordsTotal);






        //    var result = JsonConvert.SerializeObject(new { draw, recordsFiltered = recordsTotal, recordsTotal, data },
        //        Formatting.None,
        //        new JsonSerializerSettings()
        //        {
        //            ReferenceLoopHandling = ReferenceLoopHandling.Ignore
        //        });
        //    return Content(result, "application/json");


        //}
    }
}

