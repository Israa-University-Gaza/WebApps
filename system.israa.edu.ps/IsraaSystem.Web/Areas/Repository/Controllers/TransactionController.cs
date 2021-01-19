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
using IsraaSystem.Application.Repository.transaction;

namespace IsraaSystem.Web.Areas.Repository.Controllers
{
    public class TransactionController : IsraaBaseController
    {
        private IRepoTransactionService TransactionService;

        public TransactionController(ILog looger, IUnitOfWork unitOfWork, IRepoTransactionService transactionService) : base(looger, unitOfWork)
        {
            TransactionService = transactionService;
        }



        #region وارد

        // GET: Repository/Transaction
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AddImport()
        {
            TransactionDto model = new TransactionDto();
            model.TransactionTypeId = 1;
            model.IsActive = true;
            return PartialView("_AddImport", model);
        }

        [HttpPost]
        public ActionResult AddImport(TransactionDto model)
        {
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            TransactionService.AddTransactionImport(model);
            UnitOfWork.Complete();
            return PartialView("_AddImport", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");
        }

        public ActionResult EditImport(int id)
        {
            TransactionDto model = TransactionService.Get(id);
            return PartialView("_EditImport", model);
        }

        [HttpPost]
        public ActionResult EditImport(TransactionDto model)
        {
            TransactionService.EditImport(model);
            UnitOfWork.Complete();
            return PartialView("_EditImport", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        }


        public ActionResult Delete(int id)
        {

            bool s = TransactionService.Delete(id);
            if (s == true)
            {
                UnitOfWork.Complete();
                return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "israa-form");
            }
            else
            {
                return View("_ALERTS").WithToastError("لا يمكن الحذف لارتباطها بتفاصيل", "israa-form");
            }

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



            var data = TransactionService.GetAllImport(searchKey, sortColumn, sortColumnDir, skip, pageSize, out recordsTotal);


            var result = JsonConvert.SerializeObject(new { draw, recordsFiltered = recordsTotal, recordsTotal, data },
                Formatting.None,
                new JsonSerializerSettings()
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });
            return Content(result, "application/json");


        }
        #endregion

        #region صادر
        public ActionResult IndexExport()
        {
            return View();
        }
        public ActionResult AddExport()
        {
            TransactionDto model = new TransactionDto();
            model.TransactionTypeId = 2;
            model.IsActive = true;
            return PartialView("_AddExport", model);
        }

        [HttpPost]
        public ActionResult AddExport(TransactionDto model)
        {
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            TransactionService.AddTransactionExport(model);
            UnitOfWork.Complete();
            return PartialView("_AddExport", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");
        }

        public ActionResult EditExport(int id)
        {
            TransactionDto model = TransactionService.Get(id);
            return PartialView("_EditExport", model);
        }

        [HttpPost]
        public ActionResult EditExport(TransactionDto model)
        {
            TransactionService.EditExport(model);
            UnitOfWork.Complete();
            return PartialView("_EditExport", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        }



        [HttpPost]
        public ActionResult LoadExportData()
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



            var data = TransactionService.GetAllExport(searchKey, sortColumn, sortColumnDir, skip, pageSize, out recordsTotal);


            var result = JsonConvert.SerializeObject(new { draw, recordsFiltered = recordsTotal, recordsTotal, data },
                Formatting.None,
                new JsonSerializerSettings()
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });
            return Content(result, "application/json");


        }

        #endregion

        #region Movment

        public ActionResult IndexMovment()
        {
            return View();
        }
        public ActionResult AddMovment()
        {
            TransactionDto model = new TransactionDto();
            model.TransactionTypeId = 3;
            model.IsActive = true;
            return PartialView("_AddMovment", model);
        }

        [HttpPost]
        public ActionResult AddMovment(TransactionDto model)
        {
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            TransactionService.AddTransactionMovment(model);
            UnitOfWork.Complete();
            return PartialView("_AddMovment", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");
        }

        public ActionResult EditMovment(int id)
        {
            TransactionDto model = TransactionService.Get(id);
            return PartialView("_EditMovment", model);
        }

        [HttpPost]
        public ActionResult EditMovment(TransactionDto model)
        {
            TransactionService.EditMovment(model);
            UnitOfWork.Complete();
            return PartialView("_EditMovment", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        }



        [HttpPost]
        public ActionResult LoadMovmentData()
        {

            var draw = Request.Form.GetValues("draw").FirstOrDefault();
            var start = Request.Form.GetValues("start").FirstOrDefault();
            var length = Request.Form.GetValues("length").FirstOrDefault();
            //Find Order Column
            var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
            var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
            //var searchKey = Request.Form.GetValues("search[value]").FirstOrDefault();


            int pageSize = length != null ? Convert.ToInt32(length) : 0;
            int skip = start != null ? Convert.ToInt32(start) : 0;
            int recordsTotal = 0;


            //getData



            var data = TransactionService.GetAllMovment(sortColumn, sortColumnDir, skip, pageSize, out recordsTotal);


            var result = JsonConvert.SerializeObject(new { draw, recordsFiltered = recordsTotal, recordsTotal, data },
                Formatting.None,
                new JsonSerializerSettings()
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });
            return Content(result, "application/json");


        }


        #endregion

        #region RestorationToSupplier

        public ActionResult IndexRestorationSupplier()
        {
            return View();
        }
        public ActionResult AddRestoration()
        {
            TransactionDto model = new TransactionDto();
            model.TransactionTypeId = 6;
            model.DepartmentId = null;
            model.IsActive = true;
            return PartialView("_AddRestoration", model);
        }

        [HttpPost]
        public ActionResult AddRestoration(TransactionDto model)
        {
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            TransactionService.AddRestorationToSupplier(model);
            UnitOfWork.Complete();
            return PartialView("_AddRestoration", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");
        }

        public ActionResult EditRestoration(int id)
        {
            TransactionDto model = TransactionService.Get(id);
            return PartialView("_EditRestoration", model);
        }

        [HttpPost]
        public ActionResult EditRestoration(TransactionDto model)
        {
            TransactionService.EditRestorationToSupplier(model);
            UnitOfWork.Complete();
            return PartialView("_EditRestoration", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        }



        [HttpPost]
        public ActionResult LoadRestorationData()
        {

            var draw = Request.Form.GetValues("draw").FirstOrDefault();
            var start = Request.Form.GetValues("start").FirstOrDefault();
            var length = Request.Form.GetValues("length").FirstOrDefault();
            //Find Order Column
            var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
            var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
            //var searchKey = Request.Form.GetValues("search[value]").FirstOrDefault();


            int pageSize = length != null ? Convert.ToInt32(length) : 0;
            int skip = start != null ? Convert.ToInt32(start) : 0;
            int recordsTotal = 0;


            //getData



            var data = TransactionService.GetAllRestorationToSupplier(sortColumn, sortColumnDir, skip, pageSize, out recordsTotal);


            var result = JsonConvert.SerializeObject(new { draw, recordsFiltered = recordsTotal, recordsTotal, data },
                Formatting.None,
                new JsonSerializerSettings()
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });
            return Content(result, "application/json");


        }


        #endregion

        #region Destruction

        public ActionResult IndexDestruction()
        {
            return View();
        }
        public ActionResult AddDestruction()
        {
            TransactionDto model = new TransactionDto();
            model.TransactionTypeId = 4;
            model.IsActive = true;
            return PartialView("_AddDestruction", model);
        }

        [HttpPost]
        public ActionResult AddDestruction(TransactionDto model)
        {
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            TransactionService.AddTransactionDestruction(model);
            UnitOfWork.Complete();
            return PartialView("_AddDestruction", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");
        }

        public ActionResult EditDestruction(int id)
        {
            TransactionDto model = TransactionService.Get(id);
            return PartialView("_EditDestruction", model);
        }

        [HttpPost]
        public ActionResult EditDestruction(TransactionDto model)
        {
            TransactionService.EditDestruction(model);
            UnitOfWork.Complete();
            return PartialView("_EditDestruction", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        }



        [HttpPost]
        public ActionResult LoadDestructionData()
        {

            var draw = Request.Form.GetValues("draw").FirstOrDefault();
            var start = Request.Form.GetValues("start").FirstOrDefault();
            var length = Request.Form.GetValues("length").FirstOrDefault();
            //Find Order Column
            var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
            var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
            //var searchKey = Request.Form.GetValues("search[value]").FirstOrDefault();


            int pageSize = length != null ? Convert.ToInt32(length) : 0;
            int skip = start != null ? Convert.ToInt32(start) : 0;
            int recordsTotal = 0;


            //getData



            var data = TransactionService.GetAllDestruction(sortColumn, sortColumnDir, skip, pageSize, out recordsTotal);


            var result = JsonConvert.SerializeObject(new { draw, recordsFiltered = recordsTotal, recordsTotal, data },
                Formatting.None,
                new JsonSerializerSettings()
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });
            return Content(result, "application/json");


        }


        #endregion

        #region Inventory

        public ActionResult IndexInventory()
        {
            return View();
        }
        public ActionResult AddInventory()
        {
            TransactionDto model = new TransactionDto();
            model.TransactionTypeId = 5;
            model.IsActive = true;
            return PartialView("_AddInventory", model);
        }

        [HttpPost]
        public ActionResult AddInventory(TransactionDto model)
        {
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            TransactionService.AddTransactionInventory(model);
            UnitOfWork.Complete();
            return PartialView("_AddInventory", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");
        }

        public ActionResult EditInventory(int id)
        {
            TransactionDto model = TransactionService.Get(id);
            return PartialView("_EditInventory", model);
        }

        [HttpPost]
        public ActionResult EditInventory(TransactionDto model)
        {
            TransactionService.EditInventory(model);
            UnitOfWork.Complete();
            return PartialView("_EditInventory", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        }



        [HttpPost]
        public ActionResult LoadInventoryData()
        {

            var draw = Request.Form.GetValues("draw").FirstOrDefault();
            var start = Request.Form.GetValues("start").FirstOrDefault();
            var length = Request.Form.GetValues("length").FirstOrDefault();
            //Find Order Column
            var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
            var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
            //var searchKey = Request.Form.GetValues("search[value]").FirstOrDefault();


            int pageSize = length != null ? Convert.ToInt32(length) : 0;
            int skip = start != null ? Convert.ToInt32(start) : 0;
            int recordsTotal = 0;


            //getData



            var data = TransactionService.GetAllInventory(sortColumn, sortColumnDir, skip, pageSize, out recordsTotal);


            var result = JsonConvert.SerializeObject(new { draw, recordsFiltered = recordsTotal, recordsTotal, data },
                Formatting.None,
                new JsonSerializerSettings()
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });
            return Content(result, "application/json");


        }


        #endregion

        #region RestorationToRepository

        public ActionResult IndexRestorationDepartment()
        {
            return View();
        }
        public ActionResult AddRestorationDepartment()
        {
            TransactionDto model = new TransactionDto();
            model.TransactionTypeId = 7;
            model.SupplierId = null;
            model.IsActive = true;
            return PartialView("_AddRestorationDepartment", model);
        }

        [HttpPost]
        public ActionResult AddRestorationDepartment(TransactionDto model)
        {
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            TransactionService.AddTransactionMovment(model);
            UnitOfWork.Complete();
            return PartialView("_AddRestorationDepartment", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");
        }

        public ActionResult EditRestorationDepartment(int id)
        {
            TransactionDto model = TransactionService.Get(id);
            return PartialView("_EditRestorationDepartment", model);
        }

        [HttpPost]
        public ActionResult EditRestorationDepartment(TransactionDto model)
        {
            TransactionService.EditMovment(model);
            UnitOfWork.Complete();
            return PartialView("_EditRestorationDepartment", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        }



        [HttpPost]
        public ActionResult LoadRestorationDepartmentData()
        {

            var draw = Request.Form.GetValues("draw").FirstOrDefault();
            var start = Request.Form.GetValues("start").FirstOrDefault();
            var length = Request.Form.GetValues("length").FirstOrDefault();
            //Find Order Column
            var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
            var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
            //var searchKey = Request.Form.GetValues("search[value]").FirstOrDefault();


            int pageSize = length != null ? Convert.ToInt32(length) : 0;
            int skip = start != null ? Convert.ToInt32(start) : 0;
            int recordsTotal = 0;


            //getData



            var data = TransactionService.GetAllRestorationToRepository(sortColumn, sortColumnDir, skip, pageSize, out recordsTotal);


            var result = JsonConvert.SerializeObject(new { draw, recordsFiltered = recordsTotal, recordsTotal, data },
                Formatting.None,
                new JsonSerializerSettings()
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });
            return Content(result, "application/json");


        }


        #endregion
    }
}
