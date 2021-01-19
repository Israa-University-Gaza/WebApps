using AutoMapper;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Core.Shared;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaRepository;
using log4net;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;

namespace IsraaSystem.Application.Repository.materialUnit
{
    public interface IMaterialUnitService : IIsraaService
    {
        bool AddMaterialUnit(MaterialUnitDto input);
        void Edit(MaterialUnitDto input);
        bool Delete(int id);
        MaterialUnitDto Get(int id);
        List<MaterialUnitDto> GetAll(QueryOptions queryOptions);
    }


    public class MaterialUnitService : IsraaService, IMaterialUnitService
    {
        public MaterialUnitService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }

        public bool AddMaterialUnit(MaterialUnitDto input)
        {
            bool status;
            var unit = (from a in unitOfWork.Repository.MaterialUnit
                        where a.Name == input.Name && a.IsActive == input.IsActive && a.IsDelete == false
                        select a).ToList();
            if (unit.Count > 0)
            {
                return status = false;
            }
            else
            {
                var model = AutoMapper.Mapper.Map<MaterialUnit>(input);
                model.InsertedDate = DateTime.Now;
                model.IsDelete = false;
                unitOfWork.Repository.MaterialUnit.Add(model);
                return status = true;
            }
        }

        public bool Delete(int id)
        {
            bool status;
            var model = unitOfWork.Repository.MaterialUnit.Find(id);
            var material = (from s in unitOfWork.Repository.Material
                            where s.UnitId == model.ID && s.IsDelete == false
                            select s).ToList();
            if (material.Count > 0)
            {
                return status = false;
            }
            else
            {
                model.IsDelete = true;
                model.IsActive = false;
                return status = true;
            }
        }

        public void Edit(MaterialUnitDto input)
        {
            var model = unitOfWork.Repository.MaterialUnit.Find(input.Id);
            model.Name = input.Name;
            model.IsActive = input.IsActive;
        }

        public MaterialUnitDto Get(int id)
        {
            var data = unitOfWork.Repository.MaterialUnit.Find(id);
            return Mapper.Map<MaterialUnitDto>(data);
        }

        public List<MaterialUnitDto> GetAll(QueryOptions queryOptions)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;
            string searchKey = queryOptions.search.value;

            var query = unitOfWork.Repository.MaterialUnit
                .IsNotDelete()
                .WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Name.Contains(searchKey));


            var data = query.AplayQueryOptions(queryOptions).ToList();

            return Mapper.Map<List<MaterialUnitDto>>(data);


        }
    }

    public class MaterialUnitDto
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "يجب ادخال وحدة الصنف")]
        public string Name { get; set; }
        public bool IsActive { get; set; }
        public DateTime? InsertedDate { get; set; }
        public int? InsertEmployeeId { get; set; }
        public virtual ICollection<Material> Material { get; set; }
    }
}
