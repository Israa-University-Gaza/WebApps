using IsraaSystem.Application.Repository.transaction;
using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.UnitOfWork;
using log4net;
using Newtonsoft.Json;
using IsraaSystem.Web.Common;
using IsraaSystem.Application.Helper;

namespace IsraaSystem.Web.Areas.Repository.Controllers
{
    public class TransactionDetailsController : IsraaBaseController
    {
        public IRepoTransactionService TransactionService;

        public TransactionDetailsController(ILog looger, IUnitOfWork unitOfWork, IRepoTransactionService transactionService) : base(looger, unitOfWork)
        {
            TransactionService = transactionService;
        }

        public ActionResult GetMaterialByDepartment(int DepartmentId)
        {
            var v = DropDownHelpper.GetMaterialsByDepartment(DepartmentId);
            return Json(v, JsonRequestBehavior.AllowGet);
        }

        #region تفاصيل وارد

        // GET: Repository/TransactionDetails
        public ActionResult Index(int transactionId)
        {
            var Transaction = TransactionService.Get(transactionId);
            TransactionDetailsDto model = new TransactionDetailsDto()
            {
                TransactionId = transactionId,
                TransactionTypeName = Transaction.TransactionType.Name
            };
            return View(model);
        }

        public ActionResult AddImportDetail(int TransactionId)
        {
            TransactionDetailsDto model = new TransactionDetailsDto();
            model.IsActive = true;
            model.TransactionId = TransactionId;
            return PartialView("_AddImportDetail", model);
        }

        [HttpPost]
        public ActionResult AddImportDetail(TransactionDetailsDto model)
        {
            var material = UnitOfWork.Repository.Material.Find(model.MaterialId);
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            model.UnitId = material.UnitId;
            TransactionService.AddTransactionImportDetails(model);
            UnitOfWork.Complete();
            return PartialView("_AddImportDetail", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");
        }


        public ActionResult Delete(int id)
        {
            TransactionService.DeleteImportDetail(id);
            UnitOfWork.Complete();
            return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "israa-form");

        }




        [HttpPost]
        public ActionResult LoadData(int TransactionId)
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



            var data = TransactionService.GetAllImportDetails(TransactionId, searchKey, sortColumn, sortColumnDir, skip, pageSize, out recordsTotal);



            var result = JsonConvert.SerializeObject(new { draw, recordsFiltered = recordsTotal, recordsTotal, data },
                Formatting.None,
                new JsonSerializerSettings()
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });
            return Content(result, "application/json");


        }
        #endregion


        #region تفاصيل الصادر

        public ActionResult IndexExport(int transactionId)
        {
            var Transaction = TransactionService.Get(transactionId);
            TransactionDetailsDto model = new TransactionDetailsDto()
            {
                TransactionId = transactionId,
                TransactionTypeName = Transaction.TransactionType.Name
            };
            return View(model);
        }

        public ActionResult AddExportDetail(int TransactionId)
        {
            TransactionDetailsDto model = new TransactionDetailsDto();
            model.IsActive = true;
            model.TransactionId = TransactionId;
            return PartialView("_AddExportDetail", model);
        }

        [HttpPost]
        public ActionResult AddExportDetail(TransactionDetailsDto model)
        {
            var material = UnitOfWork.Repository.Material.Find(model.MaterialId);
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            model.UnitId = material.UnitId;
            int status = TransactionService.AddTransactionExportDetails(model);
            if (status == 0)
            {
                return PartialView("_AddExportDetail", model).WithToastError("لا يمكن تصدير الصنف غير متواجد في المخزن", "israa-form");
            }
            else if (status == 1)
            {
                return PartialView("_AddExportDetail", model).WithToastError("كمية الصنف المطلوب تصديرها غير متاحة ", "israa-form");
            }
            else if (status == 2)
            {
                UnitOfWork.Complete();
                return PartialView("_AddExportDetail", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");
            }
            else
            {
                return View();
            }

        }
        [HttpPost]
        public ActionResult LoadExportData(int TransactionId)
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



            var data = TransactionService.GetAllExportDetails(TransactionId, searchKey, sortColumn, sortColumnDir, skip, pageSize, out recordsTotal).ToList();



            var result = JsonConvert.SerializeObject(new { draw, recordsFiltered = recordsTotal, recordsTotal, data },
                Formatting.None,
                new JsonSerializerSettings()
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });
            return Content(result, "application/json");


        }
        public ActionResult DeleteExportDetail(int id)
        {
            TransactionService.DeleteExportDetail(id);
            UnitOfWork.Complete();
            return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "israa-form");

        }

        #endregion


        #region Movment Details

        public ActionResult IndexMovment(int transactionId)
        {
            var Transaction = TransactionService.Get(transactionId);
            GetAllMovmentDetailsOutput model = new GetAllMovmentDetailsOutput()
            {
                TransactionId = transactionId,
                TransactionTypeName = Transaction.TransactionType.Name
            };
            return View(model);
        }

        public ActionResult AddMovmentDetail(int TransactionId)
        {
            TransactionDetailsDto model = new TransactionDetailsDto();
            model.IsActive = true;
            model.TransactionId = TransactionId;
            return PartialView("_AddMovmentDetail", model);
        }

        [HttpPost]
        public ActionResult AddMovmentDetail(TransactionDetailsDto model)
        {
            var material = UnitOfWork.Repository.Material.Find(model.MaterialId);
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            model.UnitId = material.UnitId;
            int status = TransactionService.AddTransactionMovmentDetails(model);
            if (status == 2)
            {
                return PartialView("_AddMovmentDetail", model).WithToastError("لا يمكن النقل لنفس القسم ! ", "israa-form");

            }
            else if (status == 0)
            {
                UnitOfWork.Complete();
                return PartialView("_AddMovmentDetail", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");
            }
            else
            {
                return PartialView("_AddMovmentDetail", model).WithToastError("كمية الصنف المطلوب نقلها غير متاحة ", "israa-form");
            }

        }
        [HttpPost]
        public ActionResult LoadMovmentData(int TransactionId)
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



            var data = TransactionService.GetAllMovmentDetails(TransactionId, searchKey, sortColumn, sortColumnDir, skip, pageSize, out recordsTotal).ToList();



            var result = JsonConvert.SerializeObject(new { draw, recordsFiltered = recordsTotal, recordsTotal, data },
                Formatting.None,
                new JsonSerializerSettings()
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });
            return Content(result, "application/json");


        }
        //public ActionResult DeleteMovmentDetail(int id)
        //{
        //    TransactionService.DeleteMovmentDetail(id);
        //    UnitOfWork.Complete();
        //    return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "israa-form");

        //}

        #endregion


        #region تفاصيل الارجاع الى المورد

        public ActionResult IndexRestoration(int transactionId)
        {
            var Transaction = TransactionService.Get(transactionId);
            TransactionDetailsDto model = new TransactionDetailsDto()
            {
                TransactionId = transactionId,
                TransactionTypeName = Transaction.TransactionType.Name
            };
            return View(model);
        }

        public ActionResult AddRestorationDetail(int TransactionId)
        {
            TransactionDetailsDto model = new TransactionDetailsDto();
            var Transaction = UnitOfWork.Repository.Transaction.Where(x => x.Id == TransactionId).First();
            model.IsActive = true;
            model.TransactionId = TransactionId;
            return PartialView("_AddRestorationDetail", model);
        }

        [HttpPost]
        public ActionResult AddRestorationDetail(TransactionDetailsDto model)
        {
            var material = UnitOfWork.Repository.Material.Find(model.MaterialId);
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            model.UnitId = material.UnitId;
            int status = TransactionService.AddRestorationToSupplierDetails(model);
            if (status == 0)
            {
                return PartialView("_AddRestorationDetail", model).WithToastError("لا يمكن ارجاع الصنف غير متواجد في المخزن", "israa-form");
            }
            else if (status == 1)
            {
                return PartialView("_AddRestorationDetail", model).WithToastError("كمية الصنف المطلوب ارجاعها غير متاحة ", "israa-form");
            }
            else if (status == 2)
            {
                UnitOfWork.Complete();
                return PartialView("_AddRestorationDetail", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");
            }
            else
            {
                return View();
            }



        }
        [HttpPost]
        public ActionResult LoadRestorationData(int TransactionId)
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



            var data = TransactionService.GetAllRestorationToSupplierDetails(TransactionId, searchKey, sortColumn, sortColumnDir, skip, pageSize, out recordsTotal).ToList();



            var result = JsonConvert.SerializeObject(new { draw, recordsFiltered = recordsTotal, recordsTotal, data },
                Formatting.None,
                new JsonSerializerSettings()
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });
            return Content(result, "application/json");


        }
        public ActionResult DeleteRestorationDetail(int id)
        {
            TransactionService.DeleteRestorationToSupplierDetail(id);
            UnitOfWork.Complete();
            return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "israa-form");

        }

        #endregion

        #region تفاصيل الارجاع الى المخزن

        public ActionResult IndexRestorationDepartment(int transactionId)
        {
            var Transaction = TransactionService.Get(transactionId);
            TransactionDetailsDto model = new TransactionDetailsDto()
            {
                TransactionId = transactionId,
                TransactionTypeName = Transaction.TransactionType.Name
            };
            return View(model);
        }

        public ActionResult AddRestorationDepartmentDetail(int TransactionId)
        {
            TransactionDetailsDto model = new TransactionDetailsDto();
            var Transaction = UnitOfWork.Repository.Transaction.Where(x => x.Id == TransactionId).First();
            model.IsActive = true;
            model.TransactionId = TransactionId;
            return PartialView("_AddRestorationDepartmentDetail", model);

        }

        [HttpPost]
        public ActionResult AddRestorationDepartmentDetail(TransactionDetailsDto model)
        {
            var material = UnitOfWork.Repository.Material.Find(model.MaterialId);
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            model.UnitId = material.UnitId;
            TransactionService.AddRestorationToRepositoryDetails(model);
            UnitOfWork.Complete();
            return PartialView("_AddRestorationDepartmentDetail", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");
        }
        [HttpPost]
        public ActionResult LoadRestorationDepartmentData(int TransactionId)
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



            var data = TransactionService.GetAllRestorationToRepositoryDetails(TransactionId, searchKey, sortColumn, sortColumnDir, skip, pageSize, out recordsTotal).ToList();



            var result = JsonConvert.SerializeObject(new { draw, recordsFiltered = recordsTotal, recordsTotal, data },
                Formatting.None,
                new JsonSerializerSettings()
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });
            return Content(result, "application/json");


        }
        public ActionResult DeleteRestorationDepartmentDetail(int id)
        {
            TransactionService.DeleteRestorationToRepositoryDetail(id);
            UnitOfWork.Complete();
            return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "israa-form");

        }

        #endregion
        #region تفاصيل الاتلاف

        public ActionResult IndexDestruction(int transactionId)
        {
            var Transaction = TransactionService.Get(transactionId);
            TransactionDetailsDto model = new TransactionDetailsDto()
            {
                TransactionId = transactionId,
                TransactionTypeName = Transaction.TransactionType.Name
            };
            return View(model);
        }

        public ActionResult AddDestructionDetail(int TransactionId)
        {
            TransactionDetailsDto model = new TransactionDetailsDto();
            model.IsActive = true;
            model.TransactionId = TransactionId;
            return PartialView("_AddDestructionDetail", model);
        }

        [HttpPost]
        public ActionResult AddDestructionDetail(TransactionDetailsDto model)
        {
            var material = UnitOfWork.Repository.Material.Find(model.MaterialId);
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            model.UnitId = material.UnitId;
            int status = TransactionService.AddTransactionDestructionDetails(model);
            if (status == 0)
            {
                return PartialView("_AddDestructionDetail", model).WithToastError("لا يمكن الاتلاف الصنف غير متواجد في المخزن", "israa-form");
            }
            else if (status == 1)
            {
                return PartialView("_AddDestructionDetail", model).WithToastError("كمية الصنف المطلوب اتلافها غير متاحة ", "israa-form");
            }
            else if (status == 2)
            {
                UnitOfWork.Complete();
                return PartialView("_AddDestructionDetail", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");
            }
            else
            {
                return View();
            }

        }
        [HttpPost]
        public ActionResult LoadDestructionData(int TransactionId)
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



            var data = TransactionService.GetAllDestructionDetails(TransactionId, searchKey, sortColumn, sortColumnDir, skip, pageSize, out recordsTotal).ToList();



            var result = JsonConvert.SerializeObject(new { draw, recordsFiltered = recordsTotal, recordsTotal, data },
                Formatting.None,
                new JsonSerializerSettings()
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });
            return Content(result, "application/json");


        }
        public ActionResult DeleteDestructionDetail(int id)
        {
            TransactionService.DeleteDestructionDetail(id);
            UnitOfWork.Complete();
            return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "israa-form");

        }

        #endregion


        #region تفاصيل الجرد

        public ActionResult IndexInventory(int transactionId)
        {
            var Transaction = TransactionService.Get(transactionId);
            TransactionDetailsDto model = new TransactionDetailsDto()
            {
                TransactionId = transactionId,
                TransactionTypeName = Transaction.TransactionType.Name
            };
            return View(model);
        }

        public ActionResult AddInventoryDetail(int TransactionId)
        {
            TransactionDetailsDto model = new TransactionDetailsDto();
            model.IsActive = true;
            model.TransactionId = TransactionId;
            return PartialView("_AddInventoryDetail", model);
        }

        [HttpPost]
        public ActionResult AddInventoryDetail(TransactionDetailsDto model)
        {
            var material = UnitOfWork.Repository.Material.Find(model.MaterialId);
            model.UnitId = material.UnitId;
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            TransactionService.AddTransactionInventoryDetails(model);
            UnitOfWork.Complete();
            return PartialView("_AddInventoryDetail", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");


        }
        [HttpPost]
        public ActionResult LoadInventoryData(int TransactionId)
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



            var data = TransactionService.GetAllInventoryDetails(TransactionId, searchKey, sortColumn, sortColumnDir, skip, pageSize, out recordsTotal).ToList();



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