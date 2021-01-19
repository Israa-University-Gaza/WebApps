using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.Tree;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using log4net;

namespace IsraaSystem.Application.Administration.OrganizationUnit
{
    public interface IOrganizationUnitService : IIsraaService
    {
        List<TreeDto> GetAll();
        List<TreeDto> GetAllchildren(int? parentId);
        bool AddDepartment(DepartmentDto input);
        void EditDepartment(DepartmentDto input);
        int DeleteDepartment(int id);
        DepartmentDto Get(int id);
    }
    public class OrganizationUnitService : IsraaService, IOrganizationUnitService
    {
        public OrganizationUnitService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }

        public bool AddDepartment(DepartmentDto input)
        {
            bool status;
            var type = (from a in unitOfWork.HumanResource.Department
                        where a.ArName == input.ArName && a.DepartmentTypeID == input.DepartmentTypeID && a.IsActive == input.IsActive && a.IsDelete == false
                        select a).ToList();
            if (type.Count > 0)
            {
                return status = false;
            }
            else
            {
                var model = AutoMapper.Mapper.Map<Department>(input);
                model.InsertDate = DateTime.Now;
                unitOfWork.HumanResource.Department.Add(model);
                return status = true;
            }
        }

        public int DeleteDepartment(int id)
        {
            int status;
            var model = unitOfWork.HumanResource.Department.Find(id);

            var placement = (from s in unitOfWork.HumanResource.EmployeePlacement
                             where s.DepartmentID == model.ID && s.IsDelete == false
                             select s).ToList();

            var jops = (from s in unitOfWork.HumanResource.Job
                        where s.DepartmentID == model.ID && s.IsDelete == false
                        select s).ToList();

            var childs = (from t in unitOfWork.HumanResource.Department
                          where t.ParentID == model.ID && t.IsDelete == false
                          select t).ToList();
            if (placement.Count > 0)
            {
                return status = 0;
            }
            else if (childs.Count > 0)
            {

                return status = 1;
            }
            else if (jops.Count > 0)
            {

                return status = 3;
            }
            else
            {
                model.IsDelete = true;
                model.IsActive = false;
                return status = 2;
            }
        }

        public void EditDepartment(DepartmentDto input)
        {
            var model = unitOfWork.HumanResource.Department.Find(input.ID);
            model.ArName = input.ArName;
            model.DisplayName = input.ArName;
            model.DepartmentTypeID = input.DepartmentTypeID;
            model.ParentID = input.ParentID;
            model.IsActive = input.IsActive;
        }

        public List<TreeDto> GetAll()
        {
            var query = unitOfWork.HumanResource.Department.Where(x => x.DepartmentTypeID == 1 && x.IsDelete == false)
                .Select(x => new TreeDto
                {
                    id = x.ID,
                    text = x.DisplayName,
                    children = x.Department1.Any(),
                    ParentID = x.ParentID,
                    type = x.DepartmentTypeID.ToString()
                });

            return query.ToList();
        }
        public List<TreeDto> GetAllchildren(int? parentId)
        {
            var query = unitOfWork.HumanResource.Department.Where(x => x.IsDelete == false)
                .WhereIf(parentId.HasValue, x => x.ParentID == parentId)
                .Select(x => new TreeDto
                {
                    id = x.ID,
                    text = x.DisplayName,
                    children = x.Department1.Any(),
                    ParentID = x.ParentID,
                    type = x.DepartmentTypeID.ToString()

                });

            return query.ToList();
        }

        public DepartmentDto Get(int id)
        {
            var data = unitOfWork.HumanResource.Department.Find(id);
            return Mapper.Map<DepartmentDto>(data);
        }


    }

    public class DepartmentDto
    {
        public int ID { get; set; }
        public string ArName { get; set; }
        public string EnName { get; set; }
        public string DisplayName { get; set; }
        public int? ParentID { get; set; }
        public int DepartmentTypeID { get; set; }
        public bool IsActive { get; set; }
        public bool IsDelete { get; set; }
        public DateTime InsertDate { get; set; }
        public int InsertEmployeeID { get; set; }
        public DateTime? UpdateDate { get; set; }
        public int? UpdateEmployeeID { get; set; }
        public DateTime? DeleteDate { get; set; }
        public int? DeleteEmployeeID { get; set; }

        public virtual ICollection<EmployeePlacement> EmployeePlacement { get; set; }
        public virtual ICollection<Department> Department1 { get; set; }
        public virtual Department Department2 { get; set; }
    }
}


