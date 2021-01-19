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
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaRepository;
using log4net;
using IsraaSystem.Core.Shared;
using static IsraaSystem.Application.Repository.transaction.RepoTransactionService;

namespace IsraaSystem.Application.Repository.transaction
{
    public interface IRepoTransactionService : IIsraaService
    {
        #region Transaction عام

        TransactionDto Get(int id);
        bool Delete(int id);
        #endregion

        #region وارد

        void AddTransactionImport(TransactionDto input);
        List<TransactionDto> GetAllImport(string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);
        void EditImport(TransactionDto model);

        #endregion
        #region TransactionImportDetails وارد

        void AddTransactionImportDetails(TransactionDetailsDto input);
        List<TransactionDetailsDto> GetAllImportDetails(int TransactionId, string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);
        //void EditTransactionDetails(TransactionDetailsDto input);
        //TransactionDetailsDto GetId(int id);
        void DeleteImportDetail(int id);

        #endregion

        #region صادر

        void AddTransactionExport(TransactionDto input);
        List<TransactionDto> GetAllExport(string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);
        void EditExport(TransactionDto input);

        #endregion
        #region TransactionExportDetails صادر

        int AddTransactionExportDetails(TransactionDetailsDto input);
        List<GetAllExportDetailsOutput> GetAllExportDetails(int TransactionId, string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);
        //void EditTransactionDetails(TransactionDetailsDto input);
        //TransactionDetailsDto GetId(int id);
        void DeleteExportDetail(int id);

        #endregion

        #region نقل
        void AddTransactionMovment(TransactionDto input);
        List<TransactionDto> GetAllMovment(string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);
        void EditMovment(TransactionDto input);
        #endregion
        #region TransactionMovmentDetails نقل

        int AddTransactionMovmentDetails(TransactionDetailsDto input);
        List<GetAllMovmentDetailsOutput> GetAllMovmentDetails(int TransactionId, string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);
        //void DeleteMovmentDetail(int id);

        #endregion

        #region اتلاف
        void AddTransactionDestruction(TransactionDto input);
        List<TransactionDto> GetAllDestruction(string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);
        void EditDestruction(TransactionDto input);
        #endregion
        #region TransactionDestructionDetails اتلاف

        int AddTransactionDestructionDetails(TransactionDetailsDto input);
        List<GetAllExportDetailsOutput> GetAllDestructionDetails(int TransactionId, string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);
        void DeleteDestructionDetail(int id);

        #endregion

        #region ارجاع الى المورد
        void AddRestorationToSupplier(TransactionDto input);
        List<GetAllRestorationOutput> GetAllRestorationToSupplier(string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);
        void EditRestorationToSupplier(TransactionDto input);
        #endregion
        #region TransactionRestorationDetails ارجاع

        int AddRestorationToSupplierDetails(TransactionDetailsDto input);
        List<GetAllExportDetailsOutput> GetAllRestorationToSupplierDetails(int TransactionId, string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);
        void DeleteRestorationToSupplierDetail(int id);

        #endregion

        #region ارجاع الى المخزن
        void AddRestorationToRepository(TransactionDto input);
        List<GetAllRestorationOutput> GetAllRestorationToRepository(string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);
        void EditRestorationToRepository(TransactionDto input);
        #endregion
        #region TransactionRestorationDetails ارجاع الى المخزن

        void AddRestorationToRepositoryDetails(TransactionDetailsDto input);
        List<GetAllExportDetailsOutput> GetAllRestorationToRepositoryDetails(int TransactionId, string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);
        void DeleteRestorationToRepositoryDetail(int id);

        #endregion

        #region جرد
        void AddTransactionInventory(TransactionDto input);
        List<TransactionDto> GetAllInventory(string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);
        void EditInventory(TransactionDto input);
        #endregion
        #region TransactionInventoryDetails جرد

        void AddTransactionInventoryDetails(TransactionDetailsDto input);
        List<GetAllExportDetailsOutput> GetAllInventoryDetails(int TransactionId, string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal);

        #endregion

        #region balance
        RepositoryBalanceDto GetId(int id);
        List<GetAllExportDetailsOutput> GetAllMaterials(QueryOptions queryOptions, string MaterialName);
        List<GetMaterialDetailsDto> GetAllTransactionDetails(QueryOptions queryOptions, GetAllTransactionDetailsInput input);
        List<GetAllExportDetailsOutput> GetAllRepositoryBalance(QueryOptions queryOptions, GetAllBalanceInput input);
        #endregion
    }

    public class RepoTransactionService : IsraaService, IRepoTransactionService
    {
        public RepoTransactionService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }

        #region Transaction عام

        public TransactionDto Get(int id)
        {
            var data = unitOfWork.Repository.Transaction.Find(id);
            return Mapper.Map<TransactionDto>(data);
        }

        public bool Delete(int id)
        {
            bool status;
            var model = unitOfWork.Repository.Transaction.Find(id);
            var transactionDetails = (from s in unitOfWork.Repository.TransactionDetails
                                      where s.TransactionId == model.Id && s.IsDelete == false
                                      select s).ToList();

            if (transactionDetails.Count > 0)
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

        #endregion

        #region وارد

        public void AddTransactionImport(TransactionDto input)
        {
            var model = AutoMapper.Mapper.Map<Transaction>(input);
            model.InsertedDate = DateTime.Now;
            unitOfWork.Repository.Transaction.Add(model);
        }

        public List<TransactionDto> GetAllImport(string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            var query = unitOfWork.Repository.Transaction.Where(x => x.IsDelete != true && x.TransactionTypeId == 1).WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Supplier.Name.Contains(searchKey));

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
            //todo departmentid relation
            var data = query.Include(x => x.TransactionType).Include(x => x.Supplier);

            return Mapper.Map<List<TransactionDto>>(data.ToList());
        }

        public void EditImport(TransactionDto input)
        {
            var model = unitOfWork.Repository.Transaction.Find(input.Id);
            model.SupplierId = input.SupplierId;
            model.TransactionDate = input.TransactionDate;
            model.IsActive = input.IsActive;

        }

        #endregion

        #region Transaction Details وارد

        public void AddTransactionImportDetails(TransactionDetailsDto input)
        {
            var currentBalance = unitOfWork.Repository.RepositoryBalance.Where(x => x.MaterialId == input.MaterialId && x.UnitId == input.UnitId && x.RepositoryDeparmentId == input.RepositoryDepartmentId).FirstOrDefault();

            if (currentBalance == null)
            {
                var model = AutoMapper.Mapper.Map<TransactionDetails>(input);
                model.InsertedDate = DateTime.Now;
                unitOfWork.Repository.TransactionDetails.Add(model);
                RepositoryBalanceDto model2 = new RepositoryBalanceDto();
                model2.MaterialId = model.MaterialId;
                model2.RepositoryDeparmentId = model.RepositoryDepartmentId;
                model2.UnitId = model.UnitId;
                model2.Quantity = model.Quantity;
                model2.IsActive = true;
                model2.InsertedDate = DateTime.Now;
                unitOfWork.Repository.RepositoryBalance.Add(AutoMapper.Mapper.Map<RepositoryBalance>(model2));
            }
            else
            {
                var model = AutoMapper.Mapper.Map<TransactionDetails>(input);
                model.InsertedDate = DateTime.Now;
                unitOfWork.Repository.TransactionDetails.Add(model);

                int cutentQuntity = currentBalance.Quantity;
                cutentQuntity = cutentQuntity + input.Quantity;

                currentBalance.Quantity = cutentQuntity;
            }

        }

        public void DeleteImportDetail(int id)
        {
            var model = unitOfWork.Repository.TransactionDetails.Find(id);
            var currentBalance = unitOfWork.Repository.RepositoryBalance.Where(x => x.MaterialId == model.MaterialId && x.UnitId == model.UnitId && x.RepositoryDeparmentId == model.RepositoryDepartmentId).FirstOrDefault();
            if (currentBalance == null)
            {
                model.IsDelete = true;
                model.IsActive = false;
            }
            else
            {
                int cutentQuntity = currentBalance.Quantity;
                cutentQuntity = cutentQuntity - model.Quantity;
                currentBalance.Quantity = cutentQuntity;
                model.IsDelete = true;
                model.IsActive = false;
            }

        }

        public List<TransactionDetailsDto> GetAllImportDetails(int TransactionId, string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            var query = unitOfWork.Repository.TransactionDetails.Where(x => x.IsDelete != true && x.TransactionId == TransactionId).WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Material.Name.Contains(searchKey));

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
            //todo departmentid relation
            var data = query.Include(x => x.Transaction).Include(x => x.Material).Include(x => x.MaterialUnit).Include(x => x.RepositoryDepartment).ToList();

            return Mapper.Map<List<TransactionDetailsDto>>(data);
        }

        #endregion

        #region صادر

        public void AddTransactionExport(TransactionDto input)
        {
            var model = AutoMapper.Mapper.Map<Transaction>(input);
            model.InsertedDate = DateTime.Now;
            unitOfWork.Repository.Transaction.Add(model);
        }

        public List<TransactionDto> GetAllExport(string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            var query = unitOfWork.Repository.Transaction.Where(x => x.IsDelete != true && x.TransactionTypeId == 2).WhereIf(!string.IsNullOrEmpty(searchKey), x => x.DepartmentId.ToString().Contains(searchKey));

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
            //todo departmentid relation
            var data = query.Include(x => x.TransactionType).Include(x => x.Supplier);

            return Mapper.Map<List<TransactionDto>>(data.ToList());
        }

        public void EditExport(TransactionDto input)
        {
            var model = unitOfWork.Repository.Transaction.Find(input.Id);
            model.DepartmentId = input.DepartmentId;
            model.TransactionDate = input.TransactionDate;
            model.IsActive = input.IsActive;
        }
        #endregion

        #region TransactionExportDetails صادر
        public int AddTransactionExportDetails(TransactionDetailsDto input)
        {
            int stauts;

            var currentBalance = unitOfWork.Repository.RepositoryBalance.Where(x => x.MaterialId == input.MaterialId && x.UnitId == input.UnitId && x.RepositoryDeparmentId == input.RepositoryDepartmentId).FirstOrDefault();

            if (currentBalance == null)
            {
                //لا يمكن التصدير لعدم وجود الصنف
                return stauts = 0;
            }
            else
            {
                if (currentBalance.Quantity == 0 || currentBalance.Quantity <= input.Quantity)
                {
                    //الكمية في المخزن = 0 او اقل من الكمية المطلوب تصديرها
                    return stauts = 1;
                }
                else
                {
                    // تحقق شرط التصدير
                    var model = AutoMapper.Mapper.Map<TransactionDetails>(input);
                    model.InsertedDate = DateTime.Now;
                    unitOfWork.Repository.TransactionDetails.Add(model);
                    input.Quantity = input.Quantity * -1;
                    int cutentQuntity = currentBalance.Quantity;
                    cutentQuntity = cutentQuntity + input.Quantity;
                    currentBalance.Quantity = cutentQuntity;
                    return stauts = 2;
                }
            }

        }


        public List<GetAllExportDetailsOutput> GetAllExportDetails(int TransactionId, string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            var query = unitOfWork.Repository.TransactionDetails.Where(x => x.IsDelete != true && x.TransactionId == TransactionId).WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Material.Name.Contains(searchKey));

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
            query = query.Skip(0);

            if (pageSize > 0)
            {
                query = query.Take(pageSize);
            }

            //todo departmentid relation
            //var data = query.Include(x => x.Transaction).Include(x => x.Material).Include(x => x.MaterialUnit).Include(x => x.RepositoryDepartment).ToList();

            var data = query.Select(x => new GetAllExportDetailsOutput()
            {
                Id = x.Id,
                RepositoryDepartmentName = x.RepositoryDepartment.Name,
                MaterialName = x.Material.Name,
                MaterialUnitName = x.MaterialUnit.Name,
                Quantity = x.Quantity,
                IsActive = x.IsActive,
                Price = x.Price
            });


            return data.ToList();
        }

        public void DeleteExportDetail(int id)
        {
            var model = unitOfWork.Repository.TransactionDetails.Find(id);
            var currentBalance = unitOfWork.Repository.RepositoryBalance.Where(x => x.MaterialId == model.MaterialId && x.UnitId == model.UnitId && x.RepositoryDeparmentId == model.RepositoryDepartmentId).FirstOrDefault();
            if (currentBalance == null)
            {
                model.IsDelete = true;
                model.IsActive = false;
            }
            else
            {
                int cutentQuntity = currentBalance.Quantity;
                cutentQuntity = cutentQuntity + model.Quantity;
                currentBalance.Quantity = cutentQuntity;
                model.IsDelete = true;
                model.IsActive = false;
            }
        }

        #endregion

        #region نقل

        public void AddTransactionMovment(TransactionDto input)
        {
            var model = AutoMapper.Mapper.Map<Transaction>(input);
            model.InsertedDate = DateTime.Now;
            unitOfWork.Repository.Transaction.Add(model);
        }

        public List<TransactionDto> GetAllMovment(string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            var query = unitOfWork.Repository.Transaction.Where(x => x.IsDelete != true && x.TransactionTypeId == 3);

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
            //todo departmentid relation
            var data = query.Include(x => x.TransactionType);

            return Mapper.Map<List<TransactionDto>>(data.ToList());
        }

        public void EditMovment(TransactionDto input)
        {
            var model = unitOfWork.Repository.Transaction.Find(input.Id);
            model.TransactionDate = input.TransactionDate;
            model.IsActive = input.IsActive;
        }

        #endregion

        #region TransactionMovmentDetails نقل
        public int AddTransactionMovmentDetails(TransactionDetailsDto input)
        {
            int status;

            var repodepartmentQuntity1 = unitOfWork.Repository.RepositoryBalance.Where(x => x.MaterialId == input.MaterialId && x.UnitId == input.UnitId && x.RepositoryDeparmentId == input.RepositoryDepartmentId && x.IsDelete == false && x.IsActive == true).FirstOrDefault();
            var repodepartmentQuntity2 = unitOfWork.Repository.RepositoryBalance.Where(x => x.MaterialId == input.MaterialId && x.UnitId == input.UnitId && x.RepositoryDeparmentId == input.ToRepositoryDepartmentId && x.IsDelete == false && x.IsActive == true).FirstOrDefault();

            if (input.RepositoryDepartmentId == input.ToRepositoryDepartmentId)
            {
                // لا يمكن النقل لنفس القسم
                return status = 2;
            }
            //اذا لم يوجد صف داخل جدول الميزانية يقوم باضافة جديد بالقسم الثاني مع الكمية
            else if (repodepartmentQuntity2 == null)
            {
                if (repodepartmentQuntity1.Quantity == 0 || repodepartmentQuntity1.Quantity < input.Quantity)
                {
                    //الكمية في المخزن الأول = 0 او اقل من الكمية المطلوب نقلها
                    return status = 1;
                }
                else
                {
                    //add row in TransactionDetails
                    var details = AutoMapper.Mapper.Map<TransactionDetails>(input);
                    details.InsertedDate = DateTime.Now;
                    unitOfWork.Repository.TransactionDetails.Add(details);

                    // يقوم بانقاص الكمية من القسم الاول واضافة صف جديد في جدول الميزانية للكمية الثانية
                    //calc quntity1 in balance
                    int quntity1 = (input.Quantity * -1);

                    repodepartmentQuntity1.Quantity = repodepartmentQuntity1.Quantity + quntity1;

                    //add quntity2 in balance
                    var balance = new RepositoryBalanceDto
                    {
                        RepositoryDeparmentId = input.ToRepositoryDepartmentId.Value,
                        MaterialId = input.MaterialId,
                        UnitId = input.UnitId,
                        Quantity = input.Quantity,
                        IsActive = true,
                        InsertedDate = DateTime.Now
                    };
                    unitOfWork.Repository.RepositoryBalance.Add(AutoMapper.Mapper.Map<RepositoryBalance>(balance));

                    ////في حال تم نقل كل الكمية من القسم الأول احذف الصف من جدول الميزانية
                    //if (repodepartmentQuntity1.Quantity == 0)
                    //{
                    //    repodepartmentQuntity1.IsActive = false;
                    //    repodepartmentQuntity1.IsDelete = true;
                    //}
                    return status = 0;
                }
            }
            else
            {
                if (repodepartmentQuntity1.Quantity == 0 || repodepartmentQuntity1.Quantity < input.Quantity)
                {
                    //الكمية في المخزن الأول = 0 او اقل من الكمية المطلوب نقلها
                    return status = 1;
                }
                else
                {
                    // تحقق شرط النقل
                    // يقوم بانقاص من القسم الاول والزيادة في القسم الثاني

                    var model = AutoMapper.Mapper.Map<TransactionDetails>(input);
                    model.InsertedDate = DateTime.Now;
                    unitOfWork.Repository.TransactionDetails.Add(model);

                    int quntity1 = (input.Quantity * -1);
                    //calc quntity1
                    int departmentQuntity1 = repodepartmentQuntity1.Quantity;
                    departmentQuntity1 = departmentQuntity1 + quntity1;
                    repodepartmentQuntity1.Quantity = departmentQuntity1;

                    //calc quntiy2
                    int departmentQuntity2 = repodepartmentQuntity2.Quantity;
                    departmentQuntity2 = departmentQuntity2 + (quntity1 * -1);
                    repodepartmentQuntity2.Quantity = departmentQuntity2;

                    ////في حال تم نقل كل الكمية من القسم الأول احذف الصف من جدول الميزانية
                    //if (repodepartmentQuntity1.Quantity == 0)
                    //{
                    //    repodepartmentQuntity1.IsActive = false;
                    //    repodepartmentQuntity1.IsDelete = true;
                    //}
                    return status = 0;
                }
            }

        }


        public List<GetAllMovmentDetailsOutput> GetAllMovmentDetails(int TransactionId, string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            var query = unitOfWork.Repository.TransactionDetails.Where(x => x.IsDelete != true && x.TransactionId == TransactionId).WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Material.Name.Contains(searchKey));

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
            query = query.Skip(0);

            if (pageSize > 0)
            {
                query = query.Take(pageSize);
            }

            //todo departmentid relation
            //var data = query.Include(x => x.Transaction).Include(x => x.Material).Include(x => x.MaterialUnit).Include(x => x.RepositoryDepartment).ToList();

            var data = query.Select(x => new GetAllMovmentDetailsOutput()
            {
                Id = x.Id,
                FromRepositoryDepartmentName = x.RepositoryDepartment.Name,
                ToRepositoryDepartmentName = x.RepositoryDepartment1.Name,
                MaterialName = x.Material.Name,
                MaterialUnitName = x.MaterialUnit.Name,
                Quantity = x.Quantity,
                IsActive = x.IsActive
            });

            return data.ToList();
        }

        //public void DeleteMovmentDetail(int id)
        //{

        //    var input = unitOfWork.Repository.TransactionDetails.Find(id);
        //    var repodepartmentQuntity1 = unitOfWork.Repository.RepositoryBalance.Where(x => x.MaterialId == input.MaterialId && x.UnitId == input.UnitId && x.RepositoryDeparmentId == input.RepositoryDepartmentId && x.Usage == input.Usage).FirstOrDefault();
        //    var repodepartmentQuntity2 = unitOfWork.Repository.RepositoryBalance.Where(x => x.MaterialId == input.MaterialId && x.UnitId == input.UnitId && x.RepositoryDeparmentId == input.ToRepositoryDepartmentId && x.Usage == input.Usage && x.Quantity==input.Quantity).FirstOrDefault();
        //    if (repodepartmentQuntity2 != null)
        //    {
        //        repodepartmentQuntity2.IsDelete = true;
        //        repodepartmentQuntity2.IsActive = false;
        //        int departmentQuntity1 = repodepartmentQuntity1.Quantity;
        //        departmentQuntity1 = departmentQuntity1 + (input.Quantity * -1);
        //        repodepartmentQuntity1.Quantity = departmentQuntity1;
        //        input.IsDelete = true;
        //        input.IsActive = false;
        //    }
        //    else
        //    {
        //        input.Quantity = input.Quantity * -1;
        //        int departmentQuntity1 = repodepartmentQuntity1.Quantity;
        //        departmentQuntity1 = departmentQuntity1 + input.Quantity;
        //        repodepartmentQuntity1.Quantity = departmentQuntity1;

        //        //calc quntiy2
        //        int departmentQuntity2 = repodepartmentQuntity2.Quantity;
        //        departmentQuntity2 = departmentQuntity2 + (input.Quantity * -1);
        //        repodepartmentQuntity2.Quantity = departmentQuntity2;
        //        input.IsDelete = true;
        //        input.IsActive = false;
        //    }
        //}
        #endregion

        #region ارجاع الى المورد
        public void AddRestorationToSupplier(TransactionDto input)
        {
            var model = AutoMapper.Mapper.Map<Transaction>(input);
            model.InsertedDate = DateTime.Now;
            unitOfWork.Repository.Transaction.Add(model);
        }

        public List<GetAllRestorationOutput> GetAllRestorationToSupplier(string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            var query = unitOfWork.Repository.Transaction.Where(x => x.IsDelete != true && x.TransactionTypeId == 6 && x.DepartmentId == null);

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
            //todo departmentid relation
            //var data = query.Include(x => x.TransactionType).Include(x => x.Supplier);

            var data = query.Select(x => new GetAllRestorationOutput()
            {
                Id = x.Id,
                TransactionTypeName = x.TransactionType.Name,
                TransactionDate = x.TransactionDate,
                SupplierName = x.Supplier.Name,
                IsActive = x.IsActive,
            });


            return data.ToList();
        }

        public void EditRestorationToSupplier(TransactionDto input)
        {
            var model = unitOfWork.Repository.Transaction.Find(input.Id);
            model.SupplierId = input.SupplierId;
            model.TransactionDate = input.TransactionDate;
            model.IsActive = input.IsActive;
        }



        #endregion

        #region Transaction Restoration Details ارجاع الى المورد

        public int AddRestorationToSupplierDetails(TransactionDetailsDto input)
        {
            int stauts = 0;
            var Transaction = unitOfWork.Repository.Transaction.Where(x => x.Id == input.TransactionId).First();
            var currentBalance = unitOfWork.Repository.RepositoryBalance.Where(x => x.MaterialId == input.MaterialId && x.UnitId == input.UnitId && x.RepositoryDeparmentId == input.RepositoryDepartmentId).FirstOrDefault();
            // اولا في حالة الارجاع للمورد
            if (Transaction.SupplierId != null)
            {
                if (currentBalance == null)
                {
                    // الصنف المراد ارجاعه غير موجود في المخزن
                    return stauts = 0;
                }
                else
                {
                    if (currentBalance.Quantity == 0 || currentBalance.Quantity <= input.Quantity)
                    {
                        //الكمية في المخزن = 0 او اقل من الكمية المطلوب ارجاعها
                        return stauts = 1;
                    }
                    else
                    {
                        // تحقق شرط الارجاع الى المورد
                        var model = AutoMapper.Mapper.Map<TransactionDetails>(input);
                        model.InsertedDate = DateTime.Now;
                        unitOfWork.Repository.TransactionDetails.Add(model);
                        input.Quantity = input.Quantity * -1;
                        int cutentQuntity = currentBalance.Quantity;
                        cutentQuntity = cutentQuntity + input.Quantity;
                        currentBalance.Quantity = cutentQuntity;
                        return stauts = 2;
                    }
                }
            }

            return stauts;
        }

        public void DeleteRestorationToSupplierDetail(int id)
        {
            var model = unitOfWork.Repository.TransactionDetails.Find(id);
            var Transaction = unitOfWork.Repository.Transaction.Where(x => x.Id == model.TransactionId).First();
            var currentBalance = unitOfWork.Repository.RepositoryBalance.Where(x => x.MaterialId == model.MaterialId && x.UnitId == model.UnitId && x.RepositoryDeparmentId == model.RepositoryDepartmentId).FirstOrDefault();
            if (currentBalance == null)
            {
                model.IsDelete = true;
                model.IsActive = false;
            }
            else
            {
                int cutentQuntity = currentBalance.Quantity;
                cutentQuntity = cutentQuntity - model.Quantity;
                currentBalance.Quantity = cutentQuntity;
                model.IsDelete = true;
                model.IsActive = false;
            }

        }

        public List<GetAllExportDetailsOutput> GetAllRestorationToSupplierDetails(int TransactionId, string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            var query = unitOfWork.Repository.TransactionDetails.Where(x => x.IsDelete != true && x.TransactionId == TransactionId).WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Material.Name.Contains(searchKey));

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
            //todo departmentid relation
            var data = query.Select(x => new GetAllExportDetailsOutput()
            {
                Id = x.Id,
                RepositoryDepartmentName = x.RepositoryDepartment.Name,
                MaterialName = x.Material.Name,
                MaterialUnitName = x.MaterialUnit.Name,
                Quantity = x.Quantity,
                IsActive = x.IsActive,
                Price = x.Price
            });


            return data.ToList();
        }
        #endregion

        #region ارجاع الى المخزن
        public void AddRestorationToRepository(TransactionDto input)
        {
            var model = AutoMapper.Mapper.Map<Transaction>(input);
            model.InsertedDate = DateTime.Now;
            unitOfWork.Repository.Transaction.Add(model);
        }

        public List<GetAllRestorationOutput> GetAllRestorationToRepository(string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            var query = unitOfWork.Repository.Transaction.Where(x => x.IsDelete != true && x.TransactionTypeId == 7);

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
            //todo departmentid relation
            //var data = query.Include(x => x.TransactionType).Include(x => x.Supplier);

            var data = query.Select(x => new GetAllRestorationOutput()
            {
                Id = x.Id,
                TransactionTypeName = x.TransactionType.Name,
                TransactionDate = x.TransactionDate,
                DepartmentId = x.DepartmentId,
                IsActive = x.IsActive,
            });


            return data.ToList();
        }

        public void EditRestorationToRepository(TransactionDto input)
        {
            var model = unitOfWork.Repository.Transaction.Find(input.Id);
            model.DepartmentId = input.DepartmentId;
            model.TransactionDate = input.TransactionDate;
            model.IsActive = input.IsActive;
        }



        #endregion

        #region Transaction Restoration Details  ارجاع الى المخزن

        public void AddRestorationToRepositoryDetails(TransactionDetailsDto input)
        {
            var Transaction = unitOfWork.Repository.Transaction.Where(x => x.Id == input.TransactionId).First();
            var currentBalance = unitOfWork.Repository.RepositoryBalance.Where(x => x.MaterialId == input.MaterialId && x.UnitId == input.UnitId && x.RepositoryDeparmentId == input.RepositoryDepartmentId).FirstOrDefault();

            // في حالة الارجاع من دائرة او قسم جامعي
            if (Transaction.DepartmentId != null)
            {
                if (currentBalance == null)
                {
                    var model = AutoMapper.Mapper.Map<TransactionDetails>(input);
                    model.InsertedDate = DateTime.Now;
                    unitOfWork.Repository.TransactionDetails.Add(model);
                    RepositoryBalanceDto model2 = new RepositoryBalanceDto();
                    model2.MaterialId = model.MaterialId;
                    model2.RepositoryDeparmentId = model.RepositoryDepartmentId;
                    model2.UnitId = model.UnitId;
                    model2.Quantity = model.Quantity;
                    model2.IsActive = true;
                    model2.InsertedDate = DateTime.Now;
                    unitOfWork.Repository.RepositoryBalance.Add(AutoMapper.Mapper.Map<RepositoryBalance>(model2));
                }
                else
                {
                    //راح يضيف على الكمية في جدول الميزانية
                    var model = AutoMapper.Mapper.Map<TransactionDetails>(input);
                    model.InsertedDate = DateTime.Now;
                    unitOfWork.Repository.TransactionDetails.Add(model);

                    int cutentQuntity = currentBalance.Quantity;
                    cutentQuntity = cutentQuntity + input.Quantity;

                    currentBalance.Quantity = cutentQuntity;
                }
            }
        }

        public void DeleteRestorationToRepositoryDetail(int id)
        {
            var model = unitOfWork.Repository.TransactionDetails.Find(id);
            var Transaction = unitOfWork.Repository.Transaction.Where(x => x.Id == model.TransactionId).First();
            var currentBalance = unitOfWork.Repository.RepositoryBalance.Where(x => x.MaterialId == model.MaterialId && x.UnitId == model.UnitId && x.RepositoryDeparmentId == model.RepositoryDepartmentId).FirstOrDefault();
            if (currentBalance == null)
            {
                model.IsDelete = true;
                model.IsActive = false;
            }
            else
            {
                int cutentQuntity = currentBalance.Quantity;
                cutentQuntity = cutentQuntity - model.Quantity;
                currentBalance.Quantity = cutentQuntity;
                model.IsDelete = true;
                model.IsActive = false;
            }

        }

        public List<GetAllExportDetailsOutput> GetAllRestorationToRepositoryDetails(int TransactionId, string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            var query = unitOfWork.Repository.TransactionDetails.Where(x => x.IsDelete != true && x.TransactionId == TransactionId).WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Material.Name.Contains(searchKey));

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
            //todo departmentid relation
            var data = query.Select(x => new GetAllExportDetailsOutput()
            {
                Id = x.Id,
                RepositoryDepartmentName = x.RepositoryDepartment.Name,
                MaterialName = x.Material.Name,
                MaterialUnitName = x.MaterialUnit.Name,
                Quantity = x.Quantity,
                IsActive = x.IsActive,
                Price = x.Price
            });


            return data.ToList();
        }
        #endregion

        #region اتلاف
        public void AddTransactionDestruction(TransactionDto input)
        {
            var model = AutoMapper.Mapper.Map<Transaction>(input);
            model.InsertedDate = DateTime.Now;
            unitOfWork.Repository.Transaction.Add(model);
        }

        public List<TransactionDto> GetAllDestruction(string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            var query = unitOfWork.Repository.Transaction.Where(x => x.IsDelete != true && x.TransactionTypeId == 4);

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
            //todo departmentid relation
            var data = query.Include(x => x.TransactionType);

            return Mapper.Map<List<TransactionDto>>(data.ToList());
        }

        public void EditDestruction(TransactionDto input)
        {
            var model = unitOfWork.Repository.Transaction.Find(input.Id);
            model.TransactionDate = input.TransactionDate;
            model.IsActive = input.IsActive;
        }

        #endregion

        #region Transaction Destruction Details اتلاف
        public int AddTransactionDestructionDetails(TransactionDetailsDto input)
        {
            int stauts;

            var currentBalance = unitOfWork.Repository.RepositoryBalance.Where(x => x.MaterialId == input.MaterialId && x.UnitId == input.UnitId && x.RepositoryDeparmentId == input.RepositoryDepartmentId).FirstOrDefault();

            if (currentBalance == null)
            {
                //لا يمكن الاتلاف لعدم وجود الصنف
                return stauts = 0;
            }
            else
            {
                if (currentBalance.Quantity == 0 || currentBalance.Quantity <= input.Quantity)
                {
                    //الكمية في المخزن = 0 او اقل من الكمية المطلوب اتلافها
                    return stauts = 1;
                }
                else
                {
                    // تحقق شرط الاتلاف

                    var model = AutoMapper.Mapper.Map<TransactionDetails>(input);
                    model.InsertedDate = DateTime.Now;
                    unitOfWork.Repository.TransactionDetails.Add(model);
                    input.Quantity = input.Quantity * -1;
                    int cutentQuntity = currentBalance.Quantity;
                    cutentQuntity = cutentQuntity + input.Quantity;
                    currentBalance.Quantity = cutentQuntity;
                    return stauts = 2;
                }
            }
        }

        public List<GetAllExportDetailsOutput> GetAllDestructionDetails(int TransactionId, string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            var query = unitOfWork.Repository.TransactionDetails.Where(x => x.IsDelete != true && x.TransactionId == TransactionId).WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Material.Name.Contains(searchKey));

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
            query = query.Skip(0);

            if (pageSize > 0)
            {
                query = query.Take(pageSize);
            }

            //todo departmentid relation

            var data = query.Select(x => new GetAllExportDetailsOutput()
            {
                Id = x.Id,
                RepositoryDepartmentName = x.RepositoryDepartment.Name,
                MaterialName = x.Material.Name,
                MaterialUnitName = x.MaterialUnit.Name,
                Quantity = x.Quantity,
                IsActive = x.IsActive,
                Price = x.Price
            });


            return data.ToList();
        }

        public void DeleteDestructionDetail(int id)
        {
            var model = unitOfWork.Repository.TransactionDetails.Find(id);
            var currentBalance = unitOfWork.Repository.RepositoryBalance.Where(x => x.MaterialId == model.MaterialId && x.UnitId == model.UnitId && x.RepositoryDeparmentId == model.RepositoryDepartmentId).FirstOrDefault();
            if (currentBalance == null)
            {
                model.IsDelete = true;
                model.IsActive = false;
            }
            else
            {
                int cutentQuntity = currentBalance.Quantity;
                cutentQuntity = cutentQuntity + model.Quantity;
                currentBalance.Quantity = cutentQuntity;
                model.IsDelete = true;
                model.IsActive = false;
            }
        }
        #endregion

        #region الجرد
        public void AddTransactionInventory(TransactionDto input)
        {
            var model = AutoMapper.Mapper.Map<Transaction>(input);
            model.InsertedDate = DateTime.Now;
            unitOfWork.Repository.Transaction.Add(model);
        }

        public List<TransactionDto> GetAllInventory(string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            var query = unitOfWork.Repository.Transaction.Where(x => x.IsDelete != true && x.TransactionTypeId == 5);

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
            //todo departmentid relation
            var data = query.Include(x => x.TransactionType);

            return Mapper.Map<List<TransactionDto>>(data.ToList());
        }

        public void EditInventory(TransactionDto input)
        {
            var model = unitOfWork.Repository.Transaction.Find(input.Id);
            model.TransactionDate = input.TransactionDate;
            model.IsActive = input.IsActive;
        }

        #endregion

        #region Transaction Inventory Details جرد
        public void AddTransactionInventoryDetails(TransactionDetailsDto input)
        {
            var currentBalance = unitOfWork.Repository.RepositoryBalance.Where(x => x.MaterialId == input.MaterialId && x.UnitId == input.UnitId && x.RepositoryDeparmentId == input.RepositoryDepartmentId).FirstOrDefault();
            input.Quantity = currentBalance.Quantity;
            input.QuantityAfterInventory = input.QuantityAfterInventory;
            if (input.Quantity > input.QuantityAfterInventory)
            {
                input.Notes = "عجز";
            }
            else if (input.Quantity < input.QuantityAfterInventory)
            {
                input.Notes = "فائض";
            }
            else
            {
                input.Notes = "قيمة متساوية";
            }
            var model = AutoMapper.Mapper.Map<TransactionDetails>(input);
            unitOfWork.Repository.TransactionDetails.Add(model);
            model.InsertedDate = DateTime.Now;
            int cutentQuntity = currentBalance.Quantity;
            cutentQuntity = input.QuantityAfterInventory.Value;
            currentBalance.Quantity = cutentQuntity;

        }

        public List<GetAllExportDetailsOutput> GetAllInventoryDetails(int TransactionId, string searchKey, string sortColumn, string sortColumnDir, int skip, int pageSize, out int recordsTotal)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;

            var query = unitOfWork.Repository.TransactionDetails.Where(x => x.IsDelete != true && x.TransactionId == TransactionId).WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Material.Name.Contains(searchKey));

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
            query = query.Skip(0);

            if (pageSize > 0)
            {
                query = query.Take(pageSize);
            }

            //todo departmentid relation

            var data = query.Select(x => new GetAllExportDetailsOutput()
            {
                Id = x.Id,
                RepositoryDepartmentName = x.RepositoryDepartment.Name,
                MaterialName = x.Material.Name,
                MaterialUnitName = x.MaterialUnit.Name,
                Quantity = x.Quantity,
                QuantityAfterInventory = x.QuantityAfterInventory,
                IsActive = x.IsActive,
                Price = x.Price,
                Notes = x.Notes
            });


            return data.ToList();
        }
        #endregion

        #region Repository Balance

        public class GetAllBalanceInput
        {
            public int? RepositoryDepartmentName { get; set; }
            public int? MaterialName { get; set; }
            public int? MaterialUnitName { get; set; }
            public int? Quantity { get; set; }
            public int? IsActive { get; set; }
        }

        public List<GetAllExportDetailsOutput> GetAllRepositoryBalance(QueryOptions queryOptions, GetAllBalanceInput input)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;
            string searchKey = queryOptions.search.value;

            var query = unitOfWork.Repository.RepositoryBalance
                       .Where(x => x.IsDelete == false)
                       .WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Material.Name.Contains(searchKey))
                       .WhereIf((input.RepositoryDepartmentName.HasValue), x => x.RepositoryDeparmentId == (input.RepositoryDepartmentName))
                       .WhereIf((input.MaterialName.HasValue), x => x.MaterialId == (input.MaterialName))
                       .WhereIf((input.MaterialUnitName.HasValue), x => x.UnitId == (input.MaterialUnitName))
                       .WhereIf((input.Quantity.HasValue), x => x.Quantity == (input.Quantity))
                       .WhereIf(input.IsActive.HasValue, x => x.IsActive == (input.IsActive.Value == 1))
                       .Select(x => new GetAllExportDetailsOutput()
                       {
                           Id = x.Id,
                           RepositoryDepartmentName = x.RepositoryDepartment.Name,
                           MaterialName = x.Material.Name,
                           MaterialUnitName = x.MaterialUnit.Name,
                           Quantity = x.Quantity,
                           IsActive = x.IsActive,
                       });

            query = query.AplayQueryOptions(queryOptions);
            var g = query.ToList();
            return g;
        }

        public List<GetAllExportDetailsOutput> GetAllMaterials(QueryOptions queryOptions, string MaterialName)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;
            string searchKey = queryOptions.search.value;

            var query = unitOfWork.Repository.RepositoryBalance
                       .Where(x => x.IsDelete == false)
                       .WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Material.Name.Contains(searchKey))
                       .WhereIf(!string.IsNullOrEmpty(MaterialName), x => x.Material.Name.Contains(MaterialName))
                       .Select(x => new GetAllExportDetailsOutput()
                       {
                           Id = x.Material.Id,
                           MaterialName = x.Material.Name /*+ "-" + x.Material.MaterialUnit.Name,*/,
                           MaterialUnitName = x.Material.MaterialUnit.Name
                       }).Distinct();
            query = query.AplayQueryOptions(queryOptions);
            var g = query.ToList();
            return g;
        }

        public class GetAllTransactionDetailsInput
        {
            public int? RepositoryDepartmentName { get; set; }
            public int? ToRepositoryDepartmentName { get; set; }
            public double? Price { get; set; }
            public double? PriceTo { get; set; }
            public int? TransactionTypeName { get; set; }
            public string TransactionDateFrom { get; set; }
            public string TransactionDateTo { get; set; }
            public int? SupplierName { get; set; }
            public int? DepartmentId { get; set; }
            public string MaterialName { get; set; }
            public int MaterialId { get; set; }
            public int QuantityBalanc { get; set; }

        }
        public List<GetMaterialDetailsDto> GetAllTransactionDetails(QueryOptions queryOptions, GetAllTransactionDetailsInput input)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;
            string searchKey = queryOptions.search.value;
            var list = unitOfWork.Repository.TransactionDetails
                 .Where(td=>td.MaterialId== input.MaterialId)
                 .WhereIf(input.TransactionTypeName.HasValue, td => td.Transaction.TransactionTypeId == (input.TransactionTypeName))
                 .WhereIf(input.RepositoryDepartmentName.HasValue, td => td.RepositoryDepartmentId == (input.RepositoryDepartmentName))
                 .WhereIf(input.ToRepositoryDepartmentName.HasValue, td => td.ToRepositoryDepartmentId == (input.ToRepositoryDepartmentName))
                 .WhereIf(input.Price.HasValue, td => td.Price >= (input.Price))
                 .WhereIf(input.Price.HasValue, td => td.Price <= (input.PriceTo))
                 //.WhereIf(!string.IsNullOrEmpty(input.TransactionDateFrom), td => td.Transaction.TransactionDate >= (DateTime.ParseExact(input.TransactionDateFrom, "yyyy-MM-dd HH:mm tt", null)))
                 .WhereIf(input.Price.HasValue, td => td.Price <= (input.PriceTo))
                 .WhereIf(input.SupplierName.HasValue, td => td.Transaction.SupplierId == (input.SupplierName))
                 .WhereIf(input.DepartmentId.HasValue, td => td.Transaction.DepartmentId == (input.DepartmentId))
                 .Select(td => new GetMaterialDetailsDto
                 {
                     TransactionTypeName = td.Transaction.TransactionType.Name,
                     TransactionDate = td.Transaction.TransactionDate,
                     Quantity = td.Quantity,
                     RepositoryDepartmentName = td.RepositoryDepartment.Name,
                     ToRepositoryDepartmentName = td.RepositoryDepartment1.Name,
                     Price = td.Price,
                     SupplierName = td.Transaction.Supplier.Name,
                     DepartmentId = td.Transaction.DepartmentId,
                     MaterialId = td.MaterialId

                 });
                
     
            var test = list.Count();
            list = list.AplayQueryOptions(queryOptions);
            var g = list.ToList();
            return g;
        }

        public RepositoryBalanceDto GetId(int id)
        {
            var data = unitOfWork.Repository.RepositoryBalance.Find(id);
            return Mapper.Map<RepositoryBalanceDto>(data);
        }


        #endregion
    }

    public class GetMaterialDetailsDto
    {
        public string TransactionTypeName { get; set; }
        public DateTime TransactionDate { get; set; }
        public string SupplierName { get; set; }
        public int? DepartmentId { get; set; }
        public string RepositoryDepartmentName { get; set; }
        public string ToRepositoryDepartmentName { get; set; }
        public string MaterialName { get; set; }
        public int MaterialId { get; set; }
        public string MaterialUnitName { get; set; }
        public int Quantity { get; set; }
        public int? QuantityAfterInventory { get; set; }
        public double? Price { get; set; }
        public int QuantityBalanc { get; set; }
        public string Notes { get; set; }

    }


    public class GetAllRestorationOutput
    {
        public int Id { get; set; }
        public string TransactionTypeName { get; set; }
        public DateTime TransactionDate { get; set; }
        public string SupplierName { get; set; }
        public int? DepartmentId { get; set; }
        public bool IsActive { get; set; }

    }
    public class GetAllExportDetailsOutput
    {
        public int Id { get; set; }
        public string RepositoryDepartmentName { get; set; }
        public string MaterialName { get; set; }
        public string MaterialUnitName { get; set; }
        public int Quantity { get; set; }
        public int? QuantityAfterInventory { get; set; }
        public bool IsActive { get; set; }
        public double? Price { get; set; }
        public string Notes { get; set; }

    }

    public class GetAllMovmentDetailsOutput
    {
        public int Id { get; set; }
        public string TransactionTypeName { get; set; }
        public int? TransactionId { get; set; }
        public string FromRepositoryDepartmentName { get; set; }
        public string ToRepositoryDepartmentName { get; set; }
        public string MaterialName { get; set; }
        public string MaterialUnitName { get; set; }
        public int Quantity { get; set; }
        public bool IsActive { get; set; }
    }

    public class TransactionDto
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "يجب اختيار نوع الحركة")]
        public int TransactionTypeId { get; set; }
        [Required(ErrorMessage = "يجب ادخال تاريخ الحركة")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime TransactionDate { get; set; }
        [Required(ErrorMessage = "يجب اختيار المورد")]
        public int? SupplierId { get; set; }
        [Required(ErrorMessage = "يجب اختيار الجهة الطالبة")]
        public int? DepartmentId { get; set; }
        public bool IsActive { get; set; }
        public int? InsertEmployeeId { get; set; }

        public virtual Supplier Supplier { get; set; }
        public virtual TransactionType TransactionType { get; set; }
        public virtual ICollection<TransactionDetails> TransactionDetails { get; set; }


    }
    public class TransactionDetailsDto
    {
        public int Id { get; set; }
        public int TransactionId { get; set; }
        [Required(ErrorMessage = "يجب اختيار قسم المخزن")]
        public int RepositoryDepartmentId { get; set; }
        public int? ToRepositoryDepartmentId { get; set; }
        [Required(ErrorMessage = "يجب اختيار صنف")]
        public int MaterialId { get; set; }
        [Required(ErrorMessage = "يجب اختيار وحدة الصنف")]
        public int UnitId { get; set; }
        [RegularExpression(@"^[1-9][0-9]*$", ErrorMessage = "يجب ادخال قيمة أكبر من صفر")]
        [Required]
        public int Quantity { get; set; }
        [RegularExpression(@"^[1-9][0-9]*$", ErrorMessage = "يجب ادخال قيمة أكبر من صفر")]
        public int? QuantityAfterInventory { get; set; }
        public double? Price { get; set; }
        public DateTime? ExpirationDate { get; set; }
        public string Notes { get; set; }
        public bool IsActive { get; set; }
        public int? InsertEmployeeId { get; set; }

        public string TransactionTypeName { get; set; }

        public virtual Material Material { get; set; }
        public virtual MaterialUnit MaterialUnit { get; set; }
        public virtual RepositoryDepartment RepositoryDepartment { get; set; }
        public virtual RepositoryDepartment RepositoryDepartment1 { get; set; }
        public virtual Transaction Transaction { get; set; }
    }
    public class RepositoryBalanceDto
    {
        public int Id { get; set; }
        public int RepositoryDeparmentId { get; set; }
        public int MaterialId { get; set; }
        public int UnitId { get; set; }
        public int Quantity { get; set; }
        public bool IsActive { get; set; }
        public DateTime? InsertedDate { get; set; }
        public int? InsertEmployeeId { get; set; }

        public virtual Material Material { get; set; }
        public virtual MaterialUnit MaterialUnit { get; set; }
        public virtual RepositoryDepartment RepositoryDepartment { get; set; }

    }

}