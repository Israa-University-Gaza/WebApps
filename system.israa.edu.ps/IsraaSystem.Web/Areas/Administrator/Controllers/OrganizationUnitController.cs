using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Administration.OrganizationJop;
using IsraaSystem.Application.Administration.OrganizationUnit;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Web.Common;
using IsraaSystem.Web.Controllers;
using log4net;

namespace IsraaSystem.Web.Areas.Administrator.Controllers
{
    public class OrganizationUnitController : IsraaBaseController
    {
        private IOrganizationUnitService OrganizationUnitService;
        private IOrganizationJopService OrganizationJopService;
        // GET: Administrator/OrganizationUnit

        public OrganizationUnitController(ILog looger, IUnitOfWork unitOfWork, IOrganizationUnitService organizationUnitService, IOrganizationJopService organizationJopService) : base(looger, unitOfWork)
        {
            OrganizationUnitService = organizationUnitService;
            OrganizationJopService = organizationJopService;
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult TreeData(int? parentId)
        {
            UnitOfWork.HumanResource.Configuration.ProxyCreationEnabled = false;
            if (parentId != null)
            {
                var items = OrganizationUnitService.GetAllchildren(parentId);
                return Json(items, JsonRequestBehavior.AllowGet);
            }
            else
            {
                var items = OrganizationUnitService.GetAll();
                return Json(items, JsonRequestBehavior.AllowGet);
            }

        }

        public ActionResult Add(int? id)
        {
            DepartmentDto model = new DepartmentDto();
            if (id == null)
            {
                model.ParentID = null;
            }
            else
            {
                model.ParentID = id;
            }
            model.IsActive = true;
            return PartialView("_Add", model);
        }

        [HttpPost]
        public ActionResult Add(DepartmentDto model)
        {
            model.InsertEmployeeID = Convert.ToInt32(User.Identity.Name);
            bool s = OrganizationUnitService.AddDepartment(model);
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
            DepartmentDto model = OrganizationUnitService.Get(id);
            return PartialView("_Edit", model);
        }

        [HttpPost]
        public ActionResult Edit(DepartmentDto model)
        {
            OrganizationUnitService.EditDepartment(model);
            UnitOfWork.Complete();
            return PartialView("_Edit", model).WithToastSuccess("تم التعديل بنجاح", "demo");
        }

        public ActionResult Delete(int id)
        {
            int s = OrganizationUnitService.DeleteDepartment(id);
            if (s == 2)
            {
                UnitOfWork.Complete();
                return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "demo");
            }
            else if (s == 0)
            {
                return View("_ALERTS").WithToastError("لا يمكن حذف قسم مرتبط به موظف", "demo");
            }
            else if (s == 1)
            {
                return View("_ALERTS").WithToastError("لا يمكن حذف قسم مرتبط به أقسام أخرى", "demo");
            }
            else
            {
                return View("_ALERTS").WithToastError("ا يمكن حذف قسم مرتبطة به وظيفة", "demo");

            }
        }

        public ActionResult JopList(int DepartmentId)
        {
            var model = OrganizationJopService.GetJopsFromDepartment(DepartmentId);
            return View("_JopList", model);
        }


    }
}