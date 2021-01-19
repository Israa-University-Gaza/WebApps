using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IsraaSystem.Application.Administration;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Web.Common;
using IsraaSystem.Web.Controllers;
using log4net;
using IsraaSystem.Application.Administration.OrganizationJop;
using IsraaSystem.Application.Administration.Permistions;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaPermission;

namespace IsraaSystem.Web.Areas.Administrator.Controllers
{
    public class OrganizationJopController : IsraaBaseController
    {
        private readonly IOrganizationJopService _organizationJopService;

        private readonly IPermistionService _permistionService;

        // GET: Administrator/OrganizationJops
        public OrganizationJopController(ILog looger, IUnitOfWork unitOfWork,
            IOrganizationJopService organizationJopService, IPermistionService permistionService) : base(looger,
            unitOfWork)
        {
            _organizationJopService = organizationJopService;
            _permistionService = permistionService;
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult TreeData(int? managerJobId)
        {
            UnitOfWork.HumanResource.Configuration.ProxyCreationEnabled = false;

            var items = _organizationJopService.GetAllJops(managerJobId);
            return Json(items, JsonRequestBehavior.AllowGet);
        }

        public ActionResult AreaTreeData(int jobId)
        {
            UnitOfWork.HumanResource.Configuration.ProxyCreationEnabled = false;






            var areas = UnitOfWork.Permission.Area.Clean()
                .Select(x => new
                {
                    id = x.Name,
                    text = x.DisplayName,
                    ParentID = "",
                    type = "Area",
                    children = x.Controller.Select(c => new
                    {
                        id = c.Area.Name + "." + c.Name,
                        text = c.DispalyName,
                        ParentID = c.Area.Name,
                        type = "Controller",
                        children = c.Permission.Select(p => new
                        {
                            id = p.ID.ToString(),
                            text = p.Name,
                            ParentID = c.Area.Name + "." + p.Controller1.Name,
                            type = "Permission",
                            state = new
                            {
                                selected = p.PermissionJob.Any(j => j.JobId == jobId)

                            }
                        })
                    })
                })
                .ToList();

            return Json(areas, JsonRequestBehavior.AllowGet);
        }


        public void EditJobPermissions(List<string> permissions, int jobId)
        {
            permissions = permissions?.Where(x => !x.Contains(".")).ToList();
            var per = UnitOfWork.Permission.PermissionJob.Where(x => x.JobId == jobId).ToList();
            UnitOfWork.Permission.PermissionJob.RemoveRange(per);
            List<PermissionJob> list = new List<PermissionJob>();
            permissions?.ForEach(x =>
            {
                int permissionId = 0;
                if (int.TryParse(x, out permissionId) & permissionId != 0)
                {
                    list.Add(new PermissionJob
                    {
                        JobId = jobId,
                        PermissionId = Convert.ToInt32(x)
                    });
                }

            });

            UnitOfWork.Permission.PermissionJob.AddRange(list);
            UnitOfWork.Complete();

        }


        public ViewResult _JobPermissions(int jobId)
        {
            return View(jobId);
        }


        public ActionResult Add(int? id)
        {
            JopDTO model = new JopDTO();
            if (id == null)
            {
                model.ManagerJobID = null;
            }
            else
            {
                model.ManagerJobID = id;
            }

            model.IsActive = true;
            return PartialView("_Add", model);
        }

        [HttpPost]
        public ActionResult Add(JopDTO model)
        {
            model.InsertEmployeeID = Convert.ToInt32(User.Identity.Name);
            bool s = _organizationJopService.AddJop(model);
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
            JopDTO model = _organizationJopService.GetJop(id);
            return PartialView("_Edit", model);
        }

        [HttpPost]
        public ActionResult Edit(JopDTO model)
        {
            _organizationJopService.EditJop(model);
            UnitOfWork.Complete();
            return PartialView("_Edit", model).WithToastSuccess("تم التعديل بنجاح", "demo");
        }

        public ActionResult Delete(int id)
        {
            int s = _organizationJopService.DeleteJop(id);
            if (s == 0)
            {
                return View("_ALERTS").WithToastError("لا يمكن حذف الوظيفة لارتباط موظف بها", "demo");
            }
            else if (s == 1)
            {
                return View("_ALERTS").WithToastError("ا يمكن حذف الوظيفة لارتباط وظائف أخرى بها", "demo");
            }
            else
            {
                UnitOfWork.Complete();
                return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "demo");
            }
        }
    }
}