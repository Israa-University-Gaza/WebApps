using AutoMapper;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaRepository;
using log4net;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;

namespace IsraaSystem.Application.Repository.transactionType
{
    public interface ITransactionTypeService: IIsraaService
    {
        void AddTransactionType(TransactionDto input);

        List<TransactionDto> GetAll(string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);

        TransactionDto Get(int id);
        void Edit(TransactionDto model);

        void Delete(int id);

    }




    public class TransactionTypeService : IsraaService, ITransactionTypeService
    {
        public TransactionTypeService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {

        }


        public void AddTransactionType(TransactionDto input)
        {

            var model = AutoMapper.Mapper.Map<TransactionType>(input);
            model.InsertedDate = DateTime.Now;
            unitOfWork.Repository.TransactionType.Add(model);

        }



        public List<TransactionDto> GetAll(string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            //Search
            var query = unitOfWork.Repository.TransactionType.Clean().WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Name.Contains(searchKey));

            //SORT
            if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDir)))
            {
                query = query.Sort(sortColumn, sortColumnDir == "desc");
            }
            else
            {
                query = query.OrderBy(x => x.Id);

            }

            //totalRecords
            recordsTotal = query.Count();

            //Paging
            query = query.Skip(skip);
            if (pageSize > 0)
            {
                query = query.Take(pageSize);
            }
            var data = query.ToList();

            return Mapper.Map<List<TransactionDto>>(data);
        }


        public TransactionDto Get(int id)
        {
            var data = unitOfWork.Repository.TransactionType.Find(id);
            return Mapper.Map<TransactionDto>(data);
        }


        public void Edit(TransactionDto input)
        {
            var model = unitOfWork.Repository.TransactionType.Find(input.Id);
            model.Name = input.Name;          
            model.IsActive = input.IsActive;
       
        }


        public void Delete(int id)
        {
            var model = unitOfWork.Repository.TransactionType.Find(id);
            model.IsDelete = true;
        }

    }


    public class TransactionDto
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "يجب ادخال نوع الحركة")]
        public string Name { get; set; }
        public int? InsertEmployeeId { get; set; }
        public bool IsActive { get; set; }     

        public virtual ICollection<Transaction> Transaction { get; set; }

    }
}
