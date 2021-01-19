using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Repository.materialType;
using IsraaSystem.Web.Common;
using IsraaSystem.Web.Controllers;
using log4net;
using Newtonsoft.Json;
using System;
using System.Linq;
using System.Web.Mvc;
using IsraaSystem.Application.Common.ExtensionMethods;

namespace IsraaSystem.Web.Areas.Repository.Controllers
{
    public class MaterialTypeController : IsraaBaseController
    {
        private IMaterialTypeService MaterialTypeService;
        public MaterialTypeController(ILog looger, IUnitOfWork unitOfWork, IMaterialTypeService materialTypeService) : base(looger, unitOfWork)
        {
            MaterialTypeService = materialTypeService;
        }

        // GET: Repository/MaterialType
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Add(int? id)
        {
            MaterialTypeDto model = new MaterialTypeDto();
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
        public ActionResult Add(MaterialTypeDto model)
        {
            model.InsertEmployeeId = Convert.ToInt32(User.Identity.Name);
            bool s = MaterialTypeService.AddMaterialType(model);
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

        public ActionResult test(int ifd)
        {
            var i = ifd;
            //MaterialTypeDto model = MaterialTypeService.Get(id);
            return View();
        }

        public ActionResult Edit(int id)
        {
            MaterialTypeDto model = MaterialTypeService.Get(id);
            return PartialView("_Edit", model);
        }

        [HttpPost]
        public ActionResult Edit(MaterialTypeDto model)
        {
            MaterialTypeService.EditMaterialType(model);
            UnitOfWork.Complete();
            return PartialView("_Edit", model).WithToastSuccess("تم التعديل بنجاح", "tree-demo");
        }

        public ActionResult Delete(int id)
        {
            int s = MaterialTypeService.DeleteMaterialType(id);
            if (s == 2)
            {
                UnitOfWork.Complete();
                return View("_ALERTS").WithToastSuccess("تم الحذف بنجاح", "tree-demo");
            }
            else if (s == 0)
            {
                return View("_ALERTS").WithToastError("لا يمكن الحذف لارتباطها بصنف", "tree-demo");
            }
            else
            {
                return View("_ALERTS").WithToastError("لا يمكن الحذف لارتباطها بتصنيفات فرعية", "tree-demo");

            }
        }
        public ActionResult MaterialTypeList()
        {
            String outputTreeData = "[";
            var items = UnitOfWork.Repository.MaterialType.Where(x => x.ParentID == null && x.IsDelete == false && x.IsActive == true).ToList();
            foreach (var item in items)
            {
                outputTreeData += "{ id: \"" + item.ID + "\",text: \"" + item.Name + "\",state: { opened:true }";
                var Subitems = UnitOfWork.Repository.MaterialType.Where(x => x.ParentID == item.ID && x.IsDelete == false && x.IsActive == true).ToList();
                if (Subitems.Count > 0)
                {
                    outputTreeData += ",children:[";
                    foreach (var Subitem in Subitems)
                    {
                        outputTreeData += "{ id: \"" + Subitem.ID + "\",text: \"" + Subitem.Name + "\",state: { opened:true }";

                        var Subitems2 = UnitOfWork.Repository.MaterialType.Where(x => x.ParentID == Subitem.ID && x.IsDelete == false && x.IsActive == true).ToList();
                        if (Subitems2.Count > 0)
                        {
                            outputTreeData += ",children:[";
                            foreach (var Subitem2 in Subitems2)
                            {
                                outputTreeData += "{ id: \"" + Subitem2.ID + "\",text: \"" + Subitem2.Name + "\",state: { opened:true }";
                                outputTreeData += "},";
                            }
                            outputTreeData = outputTreeData.Substring(0, outputTreeData.Length - 1);
                            outputTreeData += "]";
                        }

                        outputTreeData += "},";
                    }
                    outputTreeData = outputTreeData.Substring(0, outputTreeData.Length - 1);
                    outputTreeData += "]";
                }
                outputTreeData += "},";
            }
            outputTreeData = outputTreeData.Substring(0, outputTreeData.Length - 1);
            outputTreeData += "]";
            ViewBag.ss = outputTreeData;
            //return Json(outputTreeData, JsonRequestBehavior.AllowGet);
            return View();
        }
        public ActionResult MaterialTypeList2()
        {
            String outputTreeData = "[";
            var items = UnitOfWork.Repository.MaterialType.Where(x => x.ParentID == null).ToList();
            foreach (var item in items)
            {
                outputTreeData += "{ id: \"" + item.ID + "\",text: \"" + item.Name + "\",state: { opened:true }";
                var Subitems = UnitOfWork.Repository.MaterialType.Where(x => x.ParentID == item.ID).ToList();
                if (Subitems.Count > 0)
                {
                    outputTreeData += ",children:[";
                    foreach (var Subitem in Subitems)
                    {
                        outputTreeData += "{ id: \"" + Subitem.ID + "\",text: \"" + Subitem.Name + "\",state: { opened:true }";

                        var Subitems2 = UnitOfWork.Repository.MaterialType.Where(x => x.ParentID == Subitem.ID).ToList();
                        if (Subitems2.Count > 0)
                        {
                            outputTreeData += ",children:[";
                            foreach (var Subitem2 in Subitems2)
                            {
                                outputTreeData += "{ id: \"" + Subitem2.ID + "\",text: \"" + Subitem2.Name + "\",state: { opened:true }";
                                outputTreeData += "},";
                            }
                            outputTreeData = outputTreeData.Substring(0, outputTreeData.Length - 1);
                            outputTreeData += "]";
                        }

                        outputTreeData += "},";
                    }
                    outputTreeData = outputTreeData.Substring(0, outputTreeData.Length - 1);
                    outputTreeData += "]";
                }
                outputTreeData += "},";
            }
            outputTreeData = outputTreeData.Substring(0, outputTreeData.Length - 1);
            outputTreeData += "]}";
            return Json(outputTreeData, JsonRequestBehavior.AllowGet);
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

            var data = MaterialTypeService.GetAll(searchKey, sortColumn, sortColumnDir, skip, pageSize, out recordsTotal);

            var result = JsonConvert.SerializeObject(new { draw, recordsFiltered = recordsTotal, recordsTotal, data },
                Formatting.None,
                new JsonSerializerSettings()
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });
            return Content(result, "application/json");

        }




        public ActionResult TreeData(int? parentId)
        {

            UnitOfWork.Repository.Configuration.ProxyCreationEnabled = false;
            var items = UnitOfWork.Repository.MaterialType
                .Where(x => x.IsDelete == false && x.IsActive == true)
                .WhereIf(parentId.HasValue, x => x.ParentID == parentId)
                .Select(x => new
                {
                    id = x.ID,
                    text = x.Name,
                    children = x.MaterialType1.Any(),
                    x.ParentID
                })
                .ToList();

            return Json(items, JsonRequestBehavior.AllowGet);

        }

    }
}