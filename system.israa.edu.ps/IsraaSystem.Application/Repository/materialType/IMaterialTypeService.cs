using AutoMapper;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaRepository;
using log4net;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;

namespace IsraaSystem.Application.Repository.materialType
{
    public interface IMaterialTypeService : IIsraaService
    {
        bool AddMaterialType(MaterialTypeDto input);
        void EditMaterialType(MaterialTypeDto input);
        int DeleteMaterialType(int id);
        MaterialTypeDto Get(int id);
        List<MaterialTypeDto> GetAll(string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);
    }

    public class MaterialTypeService : IsraaService, IMaterialTypeService
    {
        public MaterialTypeService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }

        public bool AddMaterialType(MaterialTypeDto input)
        {
            bool status;
            var type = (from a in unitOfWork.Repository.MaterialType
                        where a.Name == input.Name && a.IsActive == input.IsActive && a.IsDelete == false
                        select a).ToList();
            if (type.Count > 0)
            {
                return status = false;
            }
            else
            {
                var model = AutoMapper.Mapper.Map<MaterialType>(input);
                model.InsertedDate = DateTime.Now;
                unitOfWork.Repository.MaterialType.Add(model);
                return status = true;
            }
        }

        public int DeleteMaterialType(int id)
        {
            //todo dont delete if on have child
            int status;
            var model = unitOfWork.Repository.MaterialType.Find(id);
            var material = (from s in unitOfWork.Repository.Material
                            where s.TypeID == model.ID && s.IsDelete == false
                            select s).ToList();

            var childs = (from t in unitOfWork.Repository.MaterialType
                          where t.ParentID == model.ID && t.IsDelete == false
                          select t).ToList();
            if (material.Count > 0)
            {
                return status = 0;
            }
            else if (childs.Count > 0)
            {

                return status = 1;
            }
            else
            {
                model.IsDelete = true;
                model.IsActive = false;
                return status = 2;
            }
        }

        public void EditMaterialType(MaterialTypeDto input)
        {
            //in edite we dont need parentid, we need it gust in one case if he want to set the chaile as parentid=0

            var model = unitOfWork.Repository.MaterialType.Find(input.Id);
                model.Name = input.Name;
                model.ParentID = input.ParentID;
                model.IsActive = input.IsActive;
        }

        public MaterialTypeDto Get(int id)
        {
            var data = unitOfWork.Repository.MaterialType.Find(id);
            return Mapper.Map<MaterialTypeDto>(data);
        }

        public List<MaterialTypeDto> GetAll(string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            //Search
            var query = unitOfWork.Repository.MaterialType.Clean().WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Name.Contains(searchKey));

            //SORT
            if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDir)))
            {
                query = query.Sort(sortColumn, sortColumnDir == "desc");
            }
            else
            {
                query = query.OrderBy(x => x.ID);

            }

            //totalRecords
            recordsTotal = query.Count();

            //Paging
            query = query.Skip(skip);
            if (pageSize > 0)
            {
                query = query.Take(pageSize);
            }

            return Mapper.Map<List<MaterialTypeDto>>(query.ToList());
        }
    }

    public class MaterialTypeDto
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "يجب ادخال اسم التصنيف")]
        public string Name { get; set; }
        public int? ParentID { get; set; }
        public bool IsActive { get; set; }
        public DateTime? InsertedDate { get; set; }
        public int? InsertEmployeeId { get; set; }
        public virtual ICollection<Material> Material { get; set; }
    }
}
