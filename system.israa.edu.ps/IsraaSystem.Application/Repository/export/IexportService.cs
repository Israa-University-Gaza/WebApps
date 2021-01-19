using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq.Dynamic;
using AutoMapper;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaRepository;
using log4net;

namespace IsraaSystem.Application.Repository.export
{
    public interface IExportService : IIsraaService
    {
        //void AddExport(ExportDto input);
        //void DistributionExport(TransactionDto input);
        //List<ExportDto> GetAll(string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);

        //ExportDto Get(int id);

        //void Edit(ExportDto model);

        //void Delete(int id);
        //int MaterialRemainingQuantity(int matrialId);
        //String MaterialDepartment(int matrialId);
    }

    public class ExportService : IsraaService, IExportService
    {
        public ExportService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }


        //public int MaterialRemainingQuantity(int matrialId)
        //{
        //    var model = (from a in unitOfWork.Repository.RepositoryTransaction
        //                 where a.MaterialId == matrialId && a.IsDelete == false && a.IsActive == true && a.ExportId==null
        //                 select a.Quantity).Sum();
        //    return model;
        //}

        //public String MaterialDepartment(int matrialId)
        //{
        //    var model = (from a in unitOfWork.Repository.RepositoryTransaction
        //                 where a.MaterialId == matrialId && a.IsDelete == false && a.IsActive == true && a.ExportId == null
        //                 select a.RepositoryDepartment.Name).ToList();
        //    return model.ToString();
        //}

        //public void AddExport(ExportDto input)
        //{

        //    var model = AutoMapper.Mapper.Map<Export>(input);
        //    model.InsertedDate = DateTime.Now;
        //    unitOfWork.Repository.Export.Add(model);

        //}

        

        //public void DistributionExport(TransactionDto input)
        //{
        //    var model = AutoMapper.Mapper.Map<RepositoryTransaction>(input);
        //    model.ImportId = null;
        //    model.Quantity = model.Quantity * -1;
        //    model.InsertedDate = DateTime.Now;
        //    unitOfWork.Repository.RepositoryTransaction.Add(model);

        //}

        //public List<ExportDto> GetAll(string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        //{
        //    unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

        //    //Search
        //    //todo add clean() here
        //    //todo make isdelete not nullable
        //    var query = unitOfWork.Repository.Export.Where(x => x.IsDelete != true).WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Material.Name.Contains(searchKey));

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
        //    var data = query.Include(x => x.Material).Include(x => x.RepositoryTransaction).ToList();

        //    return Mapper.Map<List<ExportDto>>(data);
        //}


        //public ExportDto Get(int id)
        //{
        //    var data = unitOfWork.Repository.Export.Find(id);
        //    return Mapper.Map<ExportDto>(data);
        //}


        //public void Edit(ExportDto input)
        //{
        //    var model = unitOfWork.Repository.Export.Find(input.Id);
        //    model.MaterialId = input.MaterialId;
        //    model.Quantity = input.Quantity;
        //    model.DateOfExport = input.DateOfExport;
        //    model.IsActive = input.IsActive;           
        //}


        //public void Delete(int id)
        //{
        //    var model = unitOfWork.Repository.Export.Find(id);
        //    model.IsDelete = true;
        //}

    }


    //public class ExportDto
    //{
    //    public int Id { get; set; }
    //    [Required]
    //    public int MaterialId { get; set; }
    //    public int Quantity { get; set; }
    //    public DateTime? DateOfExport { get; set; }
    //    public int? InsertEmployeeId { get; set; }
    //    public bool IsActive { get; set; }

    //    public virtual Material Material { get; set; }
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