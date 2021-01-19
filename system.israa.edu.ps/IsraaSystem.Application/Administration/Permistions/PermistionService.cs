using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.Tree;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaPermission;
using log4net;

namespace IsraaSystem.Application.Administration.Permistions
{





    public interface IPermistionService : IIsraaService
    {
        IEnumerable<Area> GetUserAreas(int userId);
        List<TreeDto> GetAreasTreeDtoList();
        List<TreeDto> GetRolesTreeDtoList(int AreaId);

        List<CustomeTreeDto> GetControllersToTree(int areaId);
        List<CustomeTreeDto> GetPermissionsToTree(int controllerId);
    }






    public class PermistionService : IsraaService, IPermistionService
    {
        public PermistionService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }



        public List<CustomeTreeDto> GetControllersToTree(int areaId)
        {
            var query = unitOfWork.Permission.Controller
                .Where(x => x.AreaId == areaId)
                .Select(x => new CustomeTreeDto
                {
                    id = x.AreaId.Value.ToString() + "_" + x.Id,
                    postId = x.Id,
                    text = x.DispalyName,
                    ParentID = x.AreaId.ToString(),
                    type = "Controller"

                });

            return query.ToList();

        }



        public List<CustomeTreeDto> GetPermissionsToTree(int controllerId)
        {

            var c = unitOfWork.Permission.Controller.Find(controllerId);
            var query = unitOfWork.Permission.Permission
                .Where(x => x.Controller == c.Name)
                .Select(x => new CustomeTreeDto
                {
                    id = x.ID.ToString(),
                    text = x.Name,
                    ParentID = x.AreaID + "_" + c.Id,
                    type = "Permission"
                });

            return query.ToList();

        }


        public IEnumerable<Area> GetUserAreas(int userId)
        {
            unitOfWork.Permission.EmployeeArea.Load();
            return unitOfWork.Permission.EmployeeArea.Local.Where(x => x.Employee.ID == userId).Select(c => c.Area);

        }


        public List<TreeDto> GetAreasTreeDtoList()
        {
            var query = unitOfWork.Permission.Area
                .Clean()
                .Select(x => new TreeDto
                {
                    id = x.ID,
                    text = x.Name,
                    children = x.Role.Any(),
                    ParentID = null,
                    type = "Area"
                });

            return query.ToList();
        }

        public List<TreeDto> GetRolesTreeDtoList(int AreaId)
        {
            var query = unitOfWork.Permission.Area.Where(x => x.ID == AreaId)
                .SelectMany(x => x.Role)
                .Clean()
                .Select(x => new TreeDto
                {
                    id = x.ID,
                    text = x.Name,
                    children = x.RolePermission.Any(d => !d.IsDelete),
                    ParentID = x.AreaID
                });

            return query.ToList();
        }


        public List<RoleListDto> RolesGetAll(int? areaId = null)
        {
            var query = unitOfWork.Permission.Role
                .WhereIf(areaId.HasValue, x => x.AreaID == areaId)
                .IsNotDelete().Select(x => new RoleListDto
                {
                    ID = x.ID,
                    AreaName = x.Area.Name,
                    IsActive = x.IsActive,
                    Name = x.Name
                });

            return query.ToList();
        }



        public void PermissionsGetAll(int? roleId = null, int? empId = null)
        {
            var query = unitOfWork.Permission.Role
                .WhereIf(roleId.HasValue, x => x.ID == roleId)
                .WhereIf(empId.HasValue, x => x.EmployeeRole.Any(r => r.EmployeeID == empId))
                .SelectMany(x => x.RolePermission)
                .Select(x => x.Permission);


        }




        #region Dtos

        public class RoleListDto
        {
            public int ID { get; set; }
            public string AreaName { get; set; }
            public bool IsActive { get; set; }
            public string Name { get; set; }
        }


        #endregion

    }

    public class CustomeTreeDto
    {
        public string id { get; set; }
        public string text { get; set; }
        //public bool children { get; set; }
        public string ParentID { get; set; }
        public string type { get; set; }
        public int postId { get; set; }
        public List<CustomeTreeDto> children { get; set; }
        public string ControllerName { get; set; }
        public int AreaId { get; set; }

    }

}