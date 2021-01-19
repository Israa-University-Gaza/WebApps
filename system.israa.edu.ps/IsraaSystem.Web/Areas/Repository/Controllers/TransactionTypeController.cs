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
using IsraaSystem.Application.Repository.transactionType;

namespace IsraaSystem.Web.Areas.Repository.Controllers
{
    public class TransactionTypeController : IsraaBaseController
    {
        private ITransactionTypeService TransactionTypeService;

        public TransactionTypeController(ILog looger, IUnitOfWork unitOfWork , ITransactionTypeService transactionTypeService) : base(looger, unitOfWork)
        {
            TransactionTypeService = transactionTypeService;
        }

        // GET: Repository/TransactionType
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add()
        {
            TransactionDto model = new TransactionDto();
            model.IsActive = true;
            return PartialView("_Add", model);
        }

        [HttpPost]
        public ActionResult Add(TransactionDto model)
        {
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);

            TransactionTypeService.AddTransactionType(model);
            UnitOfWork.Complete();

            return PartialView("_Add", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");

        }


        public ActionResult Edit(int id)
        {
            TransactionDto model = TransactionTypeService.Get(id);
            return PartialView("_Edit", model);
        }

        [HttpPost]
        public ActionResult Edit(TransactionDto model)
        {
            TransactionTypeService.Edit(model);
            UnitOfWork.Complete();
            return PartialView("_Edit", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        }


        public ActionResult Delete(int id)
        {
            TransactionTypeService.Delete(id);
            UnitOfWork.Complete();
            return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "israa-form");

        }


        [HttpPost]
        public ActionResult LoadData()
        {

            var draw = Request.Form.GetValues("draw").FirstOrDefault();
            var start = Request.Form.GetValues("start").FirstOrDefault();
            var length = Request.Form.GetValues("length").FirstOrDefault();
            //Find Order Column
            var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
            var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
            var searchKey = Request.Form.GetValues("search[value]").FirstOrDefault();


            int pageSize = length != null ? Convert.ToInt32(length) : 0;
            int skip = start != null ? Convert.ToInt32(start) : 0;
            int recordsTotal = 0;


            //getData

            var data = TransactionTypeService.GetAll(searchKey, sortColumn, sortColumnDir, skip, pageSize, out recordsTotal);

            var result = JsonConvert.SerializeObject(new { draw, recordsFiltered = recordsTotal, recordsTotal, data },
                Formatting.None,
                new JsonSerializerSettings()
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });
            return Content(result, "application/json");


        }

    }
}






