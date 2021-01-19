using IsraaSystem.DataAccess.EntityFrameWork.IsraaPermission;
using IsraaSystem.Web.Controllers;
using System;
using System.Linq;
using System.Reflection;
using System.Web.Mvc;
using Controller = IsraaSystem.DataAccess.EntityFrameWork.IsraaPermission.Controller;

namespace IsraaSystem.Web.Areas.Administrator.Controllers
{
    public class PermissionController : BaseController
    {



        public ActionResult PermissionsImport()
        {
            var controllerTypes = AppDomain.CurrentDomain.GetAssemblies()
                .SelectMany(a => a.GetTypes())
                .Where(t => t != null
                    && t.IsPublic
                    && t.Name.EndsWith("Controller", StringComparison.OrdinalIgnoreCase)
                    && !t.IsAbstract
                    && typeof(IController).IsAssignableFrom(t));

            var controllerMethods = controllerTypes.ToDictionary(controllerType => controllerType,
                    controllerType => controllerType.GetMethods(BindingFlags.Public | BindingFlags.Instance)
                    .Where(m => typeof(ActionResult).IsAssignableFrom(m.ReturnType)));

            using (IsraPermissionEntities dbPermissionEntities = new IsraPermissionEntities())
            {
                foreach (var controller in controllerMethods)
                {

                    foreach (var controllerAction in controller.Value)
                    {
                        string controllerName = controller.Key.Name;
                       
                        string controllerActionName = controllerAction.Name;

                        string area = null;

                        if (controllerName.EndsWith("Controller"))
                        {
                            if (controller.Key.FullName.Contains("Areas"))
                            {
                                area = controller.Key.FullName.Split('.')[3];
                            }
                            controllerName = controllerName.Substring(0, controllerName.LastIndexOf("Controller"));

                        }

                        string permissionDescription;
                        if (!String.IsNullOrEmpty(area))
                            permissionDescription = $"{area}.{controllerName}.{controllerActionName}";
                        else
                            permissionDescription = $"{controllerName}.{controllerActionName}";

                        var aa = dbPermissionEntities.Area.FirstOrDefault(x => x.Name == area);
                        var areaId = aa?.ID ?? 1;

                        var permission = dbPermissionEntities.Permission.FirstOrDefault(p => p.Name == permissionDescription);


                        //add controller

                        var cont = dbPermissionEntities.Controller
                            .Where(x => x.AreaId == areaId)

                            .FirstOrDefault(x => x.Name == controllerName);

                        if (cont == null)
                        {
                            cont = dbPermissionEntities.Controller.Add(
                                  new Controller
                                  {
                                      AreaId = areaId,
                                      Name = controllerName,
                                      DispalyName = controllerName
                                  });
                        }



                        //add or update permission



                        if (permission == null)
                        {
                            if (!ModelState.IsValid) continue;
                            Permission perm = new Permission();
                            perm.Name = permissionDescription;
                            perm.InsertDate = DateTime.Now;
                            perm.InsertEmployeeID = 1;
                            perm.ControllerId = cont.Id;



                            perm.AreaID = areaId;
                            perm.Controller = controllerName;
                            perm.Action = controllerActionName;


                            dbPermissionEntities.Permission.Add(perm);

                        }
                        else if (!permission.ControllerId.HasValue)
                        {


                            permission.ControllerId = cont.Id;

                        }

                        dbPermissionEntities.SaveChanges();




                    }
                }
            }

            return Json(new { result = "Done" }, JsonRequestBehavior.AllowGet);
        }

    }
}