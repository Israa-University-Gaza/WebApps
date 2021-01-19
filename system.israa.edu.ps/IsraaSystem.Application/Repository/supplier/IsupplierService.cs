using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq.Dynamic;
using System.Runtime.InteropServices;
using AutoMapper;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Core.Shared;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaRepository;
using log4net;
using static IsraaSystem.Application.Repository.supplier.SupplierService;

namespace IsraaSystem.Application.Repository.supplier
{
    public interface ISupplierService : IIsraaService
    {
        void AddSupplier(SupplierDto input);

        List<SupplierDto> GetAll(QueryOptions queryOptions, GetAllInput input);

        SupplierDto Get(int id);

        void Edit(SupplierDto model);

        void EditMaterials(int supplierId, List<int> Materials);

        void Delete(int id);
    }

    public class SupplierService : IsraaService, ISupplierService
    {
        public SupplierService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }



        public void AddSupplier(SupplierDto input)
        {

            var model = AutoMapper.Mapper.Map<Supplier>(input);
            model.InsertedDate = DateTime.Now;
            unitOfWork.Repository.Supplier.Add(model);

        }

        public class GetAllInput
        {
            public string Name { get; set; }
            public string Address { get; set; }
            public string Mobile { get; set; }
            public int? IsActive { get; set; }

        }
        public List<SupplierDto> GetAll(QueryOptions queryOptions , GetAllInput input)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            var query = unitOfWork.Repository.Supplier
                .IsNotDelete()
                .WhereIf(!string.IsNullOrEmpty(queryOptions.SearchKey), x => x.Name.Contains(queryOptions.SearchKey))
                .WhereIf(!string.IsNullOrEmpty(input.Name), x => x.Name.Contains(input.Name))
                .WhereIf(!string.IsNullOrEmpty(input.Address), x => x.Address.Contains(input.Address))
                .WhereIf(!string.IsNullOrEmpty(input.Mobile), x => x.Mobile.Contains(input.Mobile))
                .WhereIf(input.IsActive.HasValue, x => x.IsActive == (input.IsActive.Value == 1));


            query = query.AplayQueryOptions(queryOptions);
            var data = query.Include(x => x.Material).ToList();

            return Mapper.Map<List<SupplierDto>>(data);
        }


        public SupplierDto Get(int id)
        {
            var data = unitOfWork.Repository.Supplier.Find(id);
            return Mapper.Map<SupplierDto>(data);
        }


        public void Edit(SupplierDto input)
        {
            var model = unitOfWork.Repository.Supplier.Find(input.Id);
            model.Name = input.Name;
            model.Address = input.Address;
            model.Mobile = input.Mobile;
            model.IsActive = input.IsActive;
        }


        public void EditMaterials(int supplierId, List<int> Materials)
        {
            var model = unitOfWork.Repository.Supplier.Find(supplierId);


            if (model.Material.Count > 0)
            {
                model.Material.Clear();
            }

            if (Materials == null) return;

            Materials.ForEach(x =>
            {
                var m = unitOfWork.Repository.Material.Find(x);
                model.Material.Add(m);
            });

        }



        public void Delete(int id)
        {
            var model = unitOfWork.Repository.Supplier.Find(id);
            model.IsDelete = true;
        }

    }


    public class SupplierDto
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "يجب ادخال اسم المورد")]
        public string Name { get; set; }
        [Required(ErrorMessage = "يجب ادخال عنوان المورد")]

        public string Address { get; set; }
        [Required(ErrorMessage = "يجب ادخال رقم الجوال")]

        public string Mobile { get; set; }
        public int? InsertEmployeeId { get; set; }
        public bool IsActive { get; set; }

        public virtual ICollection<Material> Material { get; set; }



    }

}