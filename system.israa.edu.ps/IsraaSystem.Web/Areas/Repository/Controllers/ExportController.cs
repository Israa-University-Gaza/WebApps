using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Threading.Tasks;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Repository.material;
using IsraaSystem.Web.Common;
using IsraaSystem.Web.Controllers;
using log4net;
using Newtonsoft.Json;
using IsraaSystem.Application.Repository.export;
using IsraaSystem.Web.Areas.Repository.Models.export;

namespace IsraaSystem.Web.Areas.Repository.Controllers
{
    public class ExportController : IsraaBaseController
    {
        private IExportService ExportService;
        public ExportController(ILog looger, IUnitOfWork unitOfWork, IExportService exportService) : base(looger, unitOfWork)
        {
            ExportService = exportService;
        }

        // GET: Repository/Export
        public ActionResult Index()
        {
            return View();
        }
        //public ActionResult Add()
        //{
        //    ExportDto model = new ExportDto();
        //    model.IsActive = true;
        //    return PartialView("_Add", model);
        //}


        //[HttpPost]
        //public ActionResult Add(ExportDto model)
        //{
        //    model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);

        //    ExportService.AddExport(model);
        //    UnitOfWork.Complete();

        //    return PartialView("_Add", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");

        //}


        //public ActionResult RemainQuantityTotal(int id)
        //{
        //    int v = ExportService.MaterialRemainingQuantity(id);
        //    return Json(new { hamza = v });
        //}

        //public ActionResult MaterialDepartment(int id)
        //{
        //    var v = ExportService.MaterialDepartment(id);
        //    return Json(new { model = v });
        //}


        //public ActionResult DistributionExport(int exportId)
        //{
        //    var model = new DistributionExportVM();
        //    model.ExportDto = ExportService.Get(exportId);
          
        //    model.TransactionDto = new TransactionDto();
        //    model.TransactionDto.IsActive = true;
        //    model.TransactionDto.ExportId = exportId;
        //    model.TransactionDto.MaterialId = model.ExportDto.MaterialId;
        //    return PartialView("_DistributionExport", model);
        //}

        //[HttpPost]
        //public ActionResult DistributionExport(DistributionExportVM model)
        //{
        //    model.TransactionDto.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
        //    model.TransactionDto.InsertedDate = DateTime.Now;
        //    ExportService.DistributionExport(model.TransactionDto);
        //    UnitOfWork.Complete();
        //    return PartialView("_DistributionExport", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");

        //}

        //public ActionResult Edit(int id)
        //{
        //    ExportDto model = ExportService.Get(id);
        //    return PartialView("_Edit", model);
        //}

        //[HttpPost]
        //public ActionResult Edit(ExportDto model)
        //{
        //    ExportService.Edit(model);
        //    UnitOfWork.Complete();
        //    return PartialView("_Edit", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        //}


        //public ActionResult Delete(int id)
        //{
        //    ExportService.Delete(id);
        //    UnitOfWork.Complete();
        //    return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "israa-form");

        //}


    
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



        //    var data = ExportService.GetAll(searchKey, sortColumn, sortColumnDir, skip, pageSize, out recordsTotal);






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

    