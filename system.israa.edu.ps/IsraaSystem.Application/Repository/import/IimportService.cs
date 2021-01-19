using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Linq.Dynamic;
using System.Threading.Tasks;
using AutoMapper;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaRepository;
using log4net;

namespace IsraaSystem.Application.Repository.import
{



    public interface IImportService : IIsraaService
    {
        //void AddImport(ImportDto input);
        //void DistributionImport(TransactionDto input);
        //List<ImportDto> GetAll(string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);

        //ImportDto Get(int id);
        //void Edit(ImportDto model);

        //void Delete(int id);

        

    }




    public class ImportService : IsraaService, IImportService
    {


        public ImportService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {

        }

        
        //public void AddImport(ImportDto input)
        //{

        //    var model = AutoMapper.Mapper.Map<Import>(input);
        //    model.InsertedDate = DateTime.Now;
        //    unitOfWork.Repository.Import.Add(model);

        //}
        //public void DistributionImport(TransactionDto input)
        //{
        //    var model = AutoMapper.Mapper.Map<RepositoryTransaction>(input);
        //    model.ExportId = null;
        //    model.InsertedDate = DateTime.Now;
        //    unitOfWork.Repository.RepositoryTransaction.Add(model);

        //}



        //public List<ImportDto> GetAll(string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        //{
        //    unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

        //    //Search
        //    var query = unitOfWork.Repository.Import.Where(x => x.IsDelete != true).WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Material.Name.Contains(searchKey));

        //    //SORT
        //    //if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDir)))
        //    //{
        //    //    query = query.Sort(sortColumn, sortColumnDir == "desc");
        //    //}
        //    //else
        //    //{
        //    //    query = query.OrderBy(x => x.Id);

        //    //}

        //    //totalRecords
        //    recordsTotal = query.Count();

        //    //Paging
        //    //query = query.Skip(skip);
        //    //if (pageSize > 0)
        //    //{
        //    //    query = query.Take(pageSize);
        //    //}
        //    var data = query.Include(x => x.Material).Include(x => x.Supplier).Include(x => x.RepositoryTransaction).ToList();

        //    return Mapper.Map<List<ImportDto>>(data);
        //}


        //public ImportDto Get(int id)
        //{
        //    var data = unitOfWork.Repository.Import.Find(id);
        //    return Mapper.Map<ImportDto>(data);
        //}


        //public void Edit(ImportDto input)
        //{
        //    var model = unitOfWork.Repository.Import.Find(input.Id);
        //    model.MaterialId = input.MaterialId;
        //    model.SupplierId = input.SupplierId;
        //    model.Quantity = input.Quantity;
        //    model.QuantityPrice = input.QuantityPrice;
        //    model.RemainingQuantity = input.RemainingQuantity;
        //    model.DateOfImport = input.DateOfImport;
        //    model.IsActive = input.IsActive;
        //    //if (model.Supplier.Count > 0)
        //    //{
        //    //    model.Supplier.Clear();
        //    //}
        //    //if (Suppliers == null) return;
        //    //Suppliers.ForEach(x =>
        //    //{
        //    //    var s = unitOfWork.Repository.Supplier.Find(x);
        //    //    model.Supplier.Add(s);
        //    //});
        //}

        //public void AddImportDepartment(ImportDto input)
        //{
        //    var model = unitOfWork.Repository.Import.Find(input.Id);

        //    //model.RepositoryDepartment = input.RepositoryDepartments;
        //    //model.UnitId = input.UnitId;
        //    //model.Price = input.Price;
        //    //model.ExpirationDate = input.ExpirationDate;
        //    //model.TypeID = input.TypeID;
        //    //model.IsActive = input.IsActive;
        //    //if (model.RepositoryDepartment.Count > 0)
        //    //{
        //    //    model.RepositoryDepartment.Clear();
        //    //}
        //    //if (Suppliers == null) return;
        //    //Suppliers.ForEach(x =>
        //    //{
        //    //    var s = unitOfWork.Repository.Supplier.Find(x);
        //    //    model.Supplier.Add(s);
        //    //});


        //    //var model = unitOfWork.Repository.Import.Find(input.Id);
        //    //model.MaterialId = input.MaterialId;
        //    //model.SupplierId = input.SupplierId;
        //    //model.Quantity = input.Quantity;
        //    //model.QuantityPrice = input.QuantityPrice;
        //    //model.IsActive = input.IsActive;
        //    //if (model.Supplier.Count > 0)
        //    //{
        //    //    model.Supplier.Clear();
        //    //}
        //    //if (Suppliers == null) return;
        //    //Suppliers.ForEach(x =>
        //    //{
        //    //    var s = unitOfWork.Repository.Supplier.Find(x);
        //    //    model.Supplier.Add(s);
        //    //});
        //}

        //public void Delete(int id)
        //{
        //    var model = unitOfWork.Repository.Import.Find(id);
        //    model.IsDelete = true;
        //}

    }


    //public class hamzaDTO
    //{
    //    public Import Import { get; set; }
    //    public List<RepositoryDepartment> RepositoryDepartments { get; set; }
    //}

    //public class ImportDto
    //{
    //    public int Id { get; set; }
    //    [Required]
    //    public int MaterialId { get; set; }
    //    public int SupplierId { get; set; }
    //    public int Quantity { get; set; }
    //    public int? RemainingQuantity { get; set; }
    //    public double QuantityPrice { get; set; }
    //    public DateTime? DateOfImport { get; set; }
    //    public bool IsActive { get; set; }
    //    public int? InsertEmployeeId { get; set; }

    //    public virtual Material Material { get; set; }
    //    public virtual Supplier Supplier { get; set; }
    //    public virtual ICollection<RepositoryTransaction> RepositoryTransaction { get; set; }
    //}
    //public class TransactionDto
    //{
    //    public int Id { get; set; }
    //    public int? ImportId { get; set; }
    //    public int? ExportId { get; set; }
    //    public int DepartmentId { get; set; }
    //    public int MaterialId { get; set; }
    //    public int Quantity { get; set; }
    //    public string TransactionSide { get; set; } 
    //    public bool IsActive { get; set; }
    //    public DateTime InsertedDate { get; set; }
    //    public int? InsertEmployeeId { get; set; }

    //    public virtual Export Export { get; set; }
    //    public virtual Import Import { get; set; }
    //    public virtual Material Material { get; set; }
    //    public virtual RepositoryDepartment RepositoryDepartment { get; set; }

    //}

}