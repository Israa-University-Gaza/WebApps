using IsraaSystem.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Common.UnitOfWork;
using log4net;
using System.Threading.Tasks;
using IsraaSystem.Web.Common;
using Newtonsoft.Json;
using IsraaSystem.Application.Repository.department;

namespace IsraaSystem.Web.Areas.Repository.Controllers
{
    public class DepartmentController : IsraaBaseController
    {
        private IDepartmentService DepartmentService;

        public DepartmentController(ILog looger, IUnitOfWork unitOfWork , IDepartmentService departmentService) : base(looger, unitOfWork)
        {
            DepartmentService = departmentService;
        }

        // GET: Repository/Department
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add()
        {
            DepartmentDto model = new DepartmentDto();
            model.IsActive = true;
            return PartialView("_Add", model);
        }

        [HttpPost]
        public ActionResult Add(DepartmentDto model , int ?  parentId)
        {
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            DepartmentService.AddDepartment(model, parentId);
            UnitOfWork.Complete();

            return PartialView("_Add", model).WithToastSuccess("تمت الاضافة بنجاح", "israa-form");

        }


        public ActionResult Edit(int id)
        {
            DepartmentDto model = DepartmentService.Get(id);
            return PartialView("_Edit", model);
        }

        [HttpPost]
        public ActionResult Edit(DepartmentDto model, int? parentId)
        {
            DepartmentService.Edit(model , parentId);
            UnitOfWork.Complete();
            return PartialView("_Edit", model).WithToastSuccess("تم التعديل بنجاح", "israa-form");
        }


        public ActionResult Delete(int id)
        {
            DepartmentService.Delete(id);
            UnitOfWork.Complete();
            return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "israa-form");

        }


        //public ActionResult List()
        //{
        //    var data = DepartmentService.GetAll();
        //    return PartialView("_List", data);
        //}

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



            var data = DepartmentService.GetAll(searchKey, sortColumn, sortColumnDir, skip, pageSize, out recordsTotal);






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