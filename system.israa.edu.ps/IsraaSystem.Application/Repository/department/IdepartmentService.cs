using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Linq.Dynamic;
using System.Threading.Tasks;
using AutoMapper;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaRepository;
using log4net;


namespace IsraaSystem.Application.Repository.department
{

    public interface IDepartmentService : IIsraaService
    {
        void AddDepartment(DepartmentDto input, int? ParentId);

        List<DepartmentDto> GetAll(string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);

        DepartmentDto Get(int id);

        void Edit(DepartmentDto model, int? ParentId);

        void Delete(int id);

    }




    public class DepartmentService : IsraaService, IDepartmentService
    {


        public DepartmentService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {

        }


        public void AddDepartment(DepartmentDto input, int? ParentId)
        {
            var model = AutoMapper.Mapper.Map<RepositoryDepartment>(input);
            model.ParentId = ParentId;
            if (ParentId == null)
            {
                ParentId = 0;
                model.InsertedDate = DateTime.Now;
                model.ParentId = ParentId;
                unitOfWork.Repository.RepositoryDepartment.Add(model);
            }
            else
            {
                model.InsertedDate = DateTime.Now;
                model.ParentId = ParentId;
                unitOfWork.Repository.RepositoryDepartment.Add(model);
            }

        }



        public List<DepartmentDto> GetAll(string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            //Search
            var query = unitOfWork.Repository.RepositoryDepartment.Where(x => x.IsDelete != true).WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Name.Contains(searchKey));

            //SORT
            //if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDir)))
            //{
            //    query = query.Sort(sortColumn, sortColumnDir == "desc");
            //}
            //else
            //{
            //    query = query.OrderBy(x => x.Id);

            //}

            //totalRecords
            recordsTotal = query.Count();

            //Paging
            //query = query.Skip(skip);
            //if (pageSize > 0)
            //{
            //    query = query.Take(pageSize);
            //}
            var data = query/*.Include(x => x.RepositoryTransaction)*/.ToList();

            return Mapper.Map<List<DepartmentDto>>(data);
        }


        public DepartmentDto Get(int id)
        {
            var data = unitOfWork.Repository.RepositoryDepartment.Find(id);
            return Mapper.Map<DepartmentDto>(data);
        }


        public void Edit(DepartmentDto input, int? ParentId)
        {
            var model = unitOfWork.Repository.RepositoryDepartment.Find(input.Id);
            model.ParentId = ParentId;
            if (ParentId == null)
            {
                ParentId = 0;
                model.Name = input.Name;
                model.ParentId = ParentId;
                model.IsActive = input.IsActive;
            }
            else
            {
                model.Name = input.Name;
                model.ParentId = ParentId;
                model.IsActive = input.IsActive;
            }
        }


        public void Delete(int id)
        {
            var model = unitOfWork.Repository.RepositoryDepartment.Find(id);
            model.IsDelete = true;
        }

    }


    public class DepartmentDto
    {

        public int Id { get; set; }
        [Required(ErrorMessage = "يجب ادخال اسم قسم المخزن")]
        public string Name { get; set; }
        public int? ParentId { get; set; }
        public int? InsertEmployeeId { get; set; }
        public bool IsActive { get; set; }

        public virtual ICollection<TransactionDetails> TransactionDetails { get; set; }
        public virtual ICollection<RepositoryBalance> RepositoryBalance { get; set; }
        public virtual ICollection<TransactionDetails> TransactionDetails1 { get; set; }


    }

}