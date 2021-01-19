using AutoMapper;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Core.Shared;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaRepository;
using log4net;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using static IsraaSystem.Application.Repository.material.MaterialService;

namespace IsraaSystem.Application.Repository.material
{
    public interface IMaterialService : IIsraaService
    {
        void AddMaterial(MaterialDto input);

        List<MaterialDto> GetAll(QueryOptions queryOptions, GetAllInput model/*int? SupplierId, int? UnitId,int? MaterialUnitId*/);

        MaterialDto Get(int id);
        void Edit(MaterialDto model);

        void EditSuppliers(MaterialDto model, List<int> Suppliers);

        bool Delete(int id);

    }




    public class MaterialService : IsraaService, IMaterialService
    {
        public MaterialService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {

        }


        public void AddMaterial(MaterialDto input)
        {

            var model = AutoMapper.Mapper.Map<Material>(input);
            model.InsertedDate = DateTime.Now;
            unitOfWork.Repository.Material.Add(model);

        }

        public class GetAllInput
        {
            public string Code { get; set; }
            public string Name { get; set; }
            public int? TypeID { get; set; }
            public int? UnitId { get; set; }
            public int? PriceFrom { get; set; }
            public int? PriceTo { get; set; }
            public int? UsageStatus { get; set; }
            public int? IsConsumed { get; set; }
            public int? RequestLimit { get; set; }
            public int? IsActive { get; set; }
            //public bool UsageStatusFinal1 { get { return (UsageStatus == 1); } }






        }

        public List<MaterialDto> GetAll(QueryOptions queryOptions, GetAllInput input)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            //Search
            string searchKey = queryOptions.search.value;

            var query = unitOfWork.Repository.Material.IsNotDelete()
            .WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Name.Contains(searchKey))
            .WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Code.Contains(input.Code))
            .WhereIf(!string.IsNullOrEmpty(input.Name), x => x.Name.Contains(input.Name))
            //.WhereIf(SupplierId.HasValue, x => x.Supplier.Any(s => s.Id == SupplierId))
            .WhereIf(input.TypeID.HasValue, x => x.TypeID == input.TypeID)
            .WhereIf(input.UnitId.HasValue, x => x.UnitId == input.UnitId)
            .WhereIf(input.PriceFrom.HasValue, x => x.Price >= input.PriceFrom)
            .WhereIf(input.PriceTo.HasValue, x => x.Price <= input.PriceTo)
            .WhereIf(input.RequestLimit.HasValue, x => x.RequestLimit == input.RequestLimit)
            .WhereIf(input.UsageStatus.HasValue, x => x.UsageStatus == (input.UsageStatus.Value == 1))
            .WhereIf(input.IsConsumed.HasValue, x => x.IsConsumed == (input.IsConsumed.Value == 1))
            .WhereIf(input.IsActive.HasValue, x => x.IsActive == (input.IsActive.Value == 1));


            query = query.AplayQueryOptions(queryOptions);


            var data = query.Include(x => x.MaterialType).Include(x => x.MaterialUnit).ToList();

            return Mapper.Map<List<MaterialDto>>(data);
        }


        public MaterialDto Get(int id)
        {
            var data = unitOfWork.Repository.Material.Find(id);
            return Mapper.Map<MaterialDto>(data);
        }


        public void Edit(MaterialDto input)
        {
            var model = unitOfWork.Repository.Material.Find(input.Id);
            model.Code = input.Code;
            model.Name = input.Name;
            model.UnitId = input.UnitId;
            model.Description = input.Description;
            model.IsConsumed = input.IsConsumed;
            model.UsageStatus = input.UsageStatus;
            model.Price = input.Price;
            model.WarningBeforExpir = input.WarningBeforExpir;
            model.TypeID = input.TypeID;
            model.IsActive = input.IsActive;

        }

        public void EditSuppliers(MaterialDto input, List<int> Suppliers)
        {
            var model = unitOfWork.Repository.Material.Find(input.Id);
            if (model.Supplier.Count > 0)
            {
                model.Supplier.Clear();
            }
            if (Suppliers == null) return;
            Suppliers.ForEach(x =>
            {
                var s = unitOfWork.Repository.Supplier.Find(x);
                model.Supplier.Add(s);
            });
        }


        public bool Delete(int id)
        {
            bool status;
            var materialTranz = unitOfWork.Repository.TransactionDetails.Where(x => x.MaterialId == id && x.IsDelete == true).ToList();
            if (materialTranz.Count > 0)
            {
                return status = false;
            }
            else
            {
                var model = unitOfWork.Repository.Material.Find(id);
                model.IsDelete = true;
                model.IsActive = false;
                return status = true;
            }

        }

    }


    public class MaterialDto
    {
        public int Id { get; set; }
        public string Code { get; set; }
        [Required(ErrorMessage = "يجب ادخال اسم الصنف")]
        public string Name { get; set; }
        [Required(ErrorMessage = "يجب اختيار نوع الصنف")]

        public int TypeID { get; set; }
        [Required(ErrorMessage = "يجب اختيار وحدة الصنف")]

        public int UnitId { get; set; }

        public string Description { get; set; }
        [Required(ErrorMessage = "يجب ادخال سعر تقريبي للصنف")]

        public double Price { get; set; }

        public bool UsageStatus { get; set; }
        public bool IsConsumed { get; set; }
        public int? WarningBeforExpir { get; set; }

        [Required(ErrorMessage = "يجب ادخال حد الطلب ")]

        public int RequestLimit { get; set; }
        public int? InsertEmployeeId { get; set; }
        public bool IsActive { get; set; }

        public virtual MaterialType MaterialType { get; set; }
        public virtual MaterialUnit MaterialUnit { get; set; }
        public virtual ICollection<RepositoryBalance> RepositoryBalance { get; set; }
        public virtual ICollection<TransactionDetails> TransactionDetails { get; set; }
        public virtual ICollection<Supplier> Supplier { get; set; }

    }

}