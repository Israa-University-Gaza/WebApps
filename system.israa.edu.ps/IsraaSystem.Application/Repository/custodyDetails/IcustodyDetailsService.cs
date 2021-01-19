using AutoMapper;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Core.Shared;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaRepository;
using log4net;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Linq.Dynamic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using static IsraaSystem.Application.Repository.custodyDetails.CustodyDetailsService;

namespace IsraaSystem.Application.Repository.custodyDetails
{
    public interface ICustodyDetailsService : IIsraaService
    {
        #region صرف عهدة
        bool AddExportCustody(CustodyDetailsDto input);
        List<GetAllDetailsOutput> GetAllExportCustody(QueryOptions queryOptions, int? DepartmentId, int? EmployeeId);
        CustodyDetailsDto Get(int id);
        void EditCustody(CustodyDetailsDto model);
        #endregion

        #region سحب عهدة
        void AddWithdrawalCustody(CustodyDetailsDto input);
        List<GetAllDetailsOutput> GetAllWithdrawalCustody(QueryOptions queryOptions);
        #endregion

        #region نقل عهدة
        bool AddMovmentCustody(CustodyDetailsDto input);
        List<GetAllDetailsOutput> GetAllMovmentCustody(QueryOptions queryOptions);
        #endregion

        #region عهد الموظفين
        List<GetAllDetailsOutput> GetAllRepositoryCustody(QueryOptions queryOptions, GetAllInput input);

        #endregion
    }

    public class CustodyDetailsService : IsraaService, ICustodyDetailsService
    {
        public CustodyDetailsService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }


        #region صرف عهدة
        public bool AddExportCustody(CustodyDetailsDto input)
        {
            bool status;

            var Balance = unitOfWork.Repository.RepositoryBalance.Where(x => x.RepositoryDeparmentId == input.RepositoryDepartmentId && x.MaterialId == input.MaterialId).FirstOrDefault();
            var Custody = unitOfWork.Repository.RepositoryCustody.Where(x => x.CustodyDetailsId == input.Id && x.MaterialId == input.MaterialId && x.EmployeeId == input.EmployeeId).FirstOrDefault();
            if (Balance.Quantity == 0 || Balance.Quantity <= input.Quantity)
            {
                //الكمية في المخزن = 0 او اقل من الكمية المطلوب صرفها
                return status = false;
            }
            else
            {
                // تحقق شرط الصرف
                var model = AutoMapper.Mapper.Map<CustodyDetails>(input);
                model.CustodyTypeId = 1;
                model.InsertedDate = DateTime.Now;
                unitOfWork.Repository.CustodyDetails.Add(model);
                input.Quantity = input.Quantity * -1;
                int currentBalance = Balance.Quantity;
                currentBalance = currentBalance + input.Quantity;
                Balance.Quantity = currentBalance;
                if (Custody == null)
                {
                    RepositoryCustodyDto model2 = new RepositoryCustodyDto();
                    model2.CustodyDetailsId = model.Id;
                    model2.EmployeeId = model.EmployeeId;
                    model2.MaterialId = model.MaterialId;
                    model2.Quantity = model.Quantity;
                    model2.IsActive = true;
                    model2.InsertedDate = DateTime.Now;
                    unitOfWork.Repository.RepositoryCustody.Add(AutoMapper.Mapper.Map<RepositoryCustody>(model2));
                    return status = true;
                }
                else
                {
                    int CustodyQuantity = Custody.Quantity;
                    CustodyQuantity = CustodyQuantity + input.Quantity;
                    Custody.Quantity = CustodyQuantity;
                }
                return status = true;
            }


        }



        public List<GetAllDetailsOutput> GetAllExportCustody(QueryOptions queryOptions, int? DepartmentId, int? EmployeeId)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;
            string searchKey = queryOptions.search.value;

            var query = unitOfWork.Repository.CustodyDetails
                       .Where(x => x.IsDelete == false && x.CustodyTypeId == 1)
                       .WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Material.Name.Contains(searchKey))
                       .WhereIf(DepartmentId.HasValue, x => x.DepartmentId == DepartmentId)
                       .WhereIf(EmployeeId.HasValue, x => x.EmployeeId == EmployeeId)
                       .Select(x => new GetAllDetailsOutput()
                       {
                           Id = x.Id,
                           CustodyTypeName = x.CustodyType.Name,
                           CustodyDate = x.CustodyDate,
                           RepositoryDepartmentName = x.RepositoryDepartment.Name,
                           MaterialName = x.Material.Name,
                           DepartmentId = x.DepartmentId,
                           EmployeeId = x.EmployeeId,
                           ToEmployeeId = x.ToEmployeeId,
                           Quantity = x.Quantity,
                           Notes = x.Notes,
                           RequestStatusName = x.RequestStatus.Name,
                           CustodyStatus = x.CustodyStatus,
                           DateOfReturnCustody = x.DateOfReturnCustody,
                           IsActive = x.IsActive,
                       });

            query = query.AplayQueryOptions(queryOptions);
            var g = query.ToList();
            return g;
        }


        public CustodyDetailsDto Get(int id)
        {
            var data = unitOfWork.Repository.CustodyDetails.Find(id);
            return Mapper.Map<CustodyDetailsDto>(data);
        }


        public void EditCustody(CustodyDetailsDto input)
        {
            var model = unitOfWork.Repository.CustodyDetails.Find(input.Id);
            model.CustodyDate = input.CustodyDate;
            model.Notes = input.Notes;
            model.RequestStatusId = input.RequestStatusId;
            model.CustodyStatus = input.CustodyStatus;
            model.DateOfReturnCustody = input.DateOfReturnCustody;
            model.IsActive = input.IsActive;
        }




        #endregion
        #region سحب عهدة
        public void AddWithdrawalCustody(CustodyDetailsDto input)
        {
            var Balance = unitOfWork.Repository.RepositoryBalance.Where(x => x.RepositoryDeparmentId == input.RepositoryDepartmentId && x.MaterialId == input.MaterialId).FirstOrDefault();
            var Custody = unitOfWork.Repository.RepositoryCustody.Where(x => x.MaterialId == input.MaterialId && x.EmployeeId == input.EmployeeId).FirstOrDefault();

            // تحقق شرط السحب
            var model = AutoMapper.Mapper.Map<CustodyDetails>(input);
            model.CustodyTypeId = 2;
            model.InsertedDate = DateTime.Now;
            unitOfWork.Repository.CustodyDetails.Add(model);
            int currentBalance = Balance.Quantity;
            currentBalance = currentBalance + input.Quantity;
            Balance.Quantity = currentBalance;
            int CustodyQuantity = Custody.Quantity;
            CustodyQuantity = CustodyQuantity + (input.Quantity * -1);
            Custody.Quantity = CustodyQuantity;

        }

        public List<GetAllDetailsOutput> GetAllWithdrawalCustody(QueryOptions queryOptions)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;
            string searchKey = queryOptions.search.value;

            var query = unitOfWork.Repository.CustodyDetails
                       .Where(x => x.IsDelete == false && x.CustodyTypeId == 2)
                       .WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Material.Name.Contains(searchKey))
                       .Select(x => new GetAllDetailsOutput()
                       {
                           Id = x.Id,
                           CustodyTypeName = x.CustodyType.Name,
                           CustodyDate = x.CustodyDate,
                           RepositoryDepartmentName = x.RepositoryDepartment.Name,
                           MaterialName = x.Material.Name,
                           DepartmentId = x.DepartmentId,
                           EmployeeId = x.EmployeeId,
                           ToEmployeeId = x.ToEmployeeId,
                           Quantity = x.Quantity,
                           Notes = x.Notes,
                           RequestStatusName = x.RequestStatus.Name,
                           CustodyStatus = x.CustodyStatus,
                           DateOfReturnCustody = x.DateOfReturnCustody,
                           IsActive = x.IsActive,
                       });

            query = query.AplayQueryOptions(queryOptions);
            var g = query.ToList();
            return g;
        }



        #endregion

        #region نقل عهدة

        public bool AddMovmentCustody(CustodyDetailsDto input)
        {
            var EmployeeCustody = unitOfWork.Repository.RepositoryCustody.Where(x => x.MaterialId == input.MaterialId && x.EmployeeId == input.EmployeeId).FirstOrDefault();
            var ToEmployeeCustody = unitOfWork.Repository.RepositoryCustody.Where(x => x.MaterialId == input.MaterialId && x.EmployeeId == input.ToEmployeeId).FirstOrDefault();
            bool status;

            if (EmployeeCustody.Quantity == 0 || EmployeeCustody.Quantity < input.Quantity)
            {
                //الكمية في عهد الموظف  الاول = 0 او اقل من الكمية المطلوب نقلها
                return status = false;
            }
            else
            {
                // تحقق شرط النقل
                var model = AutoMapper.Mapper.Map<CustodyDetails>(input);
                model.CustodyTypeId = 3;
                model.ToEmployeeId = input.ToEmployeeId;
                model.RepositoryDepartmentId = null;
                model.InsertedDate = DateTime.Now;
                unitOfWork.Repository.CustodyDetails.Add(model);
                int EmployeeQuantity = EmployeeCustody.Quantity;
                EmployeeQuantity = EmployeeQuantity + (input.Quantity * -1);
                EmployeeCustody.Quantity = EmployeeQuantity;
                // فحص الموظف الثاني له عهدة ام لا
                if (ToEmployeeCustody == null)
                {
                    RepositoryCustodyDto model2 = new RepositoryCustodyDto();
                    model2.CustodyDetailsId = model.Id;
                    model2.EmployeeId = model.ToEmployeeId.Value;
                    model2.MaterialId = model.MaterialId;
                    model2.Quantity = model.Quantity;
                    model2.IsActive = true;
                    model2.InsertedDate = DateTime.Now;
                    unitOfWork.Repository.RepositoryCustody.Add(AutoMapper.Mapper.Map<RepositoryCustody>(model2));
                    return status = true;
                }
                else
                {
                    int ToEmployeeQuantity = ToEmployeeCustody.Quantity;
                    ToEmployeeQuantity = ToEmployeeQuantity + input.Quantity;
                    ToEmployeeCustody.Quantity = ToEmployeeQuantity;
                }
                return status = true;
            }

        }

        public List<GetAllDetailsOutput> GetAllMovmentCustody(QueryOptions queryOptions)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;
            string searchKey = queryOptions.search.value;

            var query = unitOfWork.Repository.CustodyDetails
                       .Where(x => x.IsDelete == false && x.CustodyTypeId == 3)
                       .WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Material.Name.Contains(searchKey))
                       .Select(x => new GetAllDetailsOutput()
                       {
                           Id = x.Id,
                           CustodyTypeName = x.CustodyType.Name,
                           CustodyDate = x.CustodyDate,
                           RepositoryDepartmentName = x.RepositoryDepartment.Name,
                           MaterialName = x.Material.Name,
                           DepartmentId = x.DepartmentId,
                           EmployeeId = x.EmployeeId,
                           ToEmployeeId = x.ToEmployeeId,
                           Quantity = x.Quantity,
                           Notes = x.Notes,
                           RequestStatusName = x.RequestStatus.Name,
                           CustodyStatus = x.CustodyStatus,
                           DateOfReturnCustody = x.DateOfReturnCustody,
                           IsActive = x.IsActive,
                       });

            query = query.AplayQueryOptions(queryOptions);
            var g = query.ToList();
            return g;
        }



        #endregion


        #region عهد الموظفين

        public class GetAllInput
        {
            public int Id { get; set; }
            public int? DepartmentId { get; set; }
            public int? EmployeeId { get; set; }
            public int? MaterialName { get; set; }
            public int? IsActive { get; set; }
            public int? Quantity { get; set; }

        }


        public List<GetAllDetailsOutput> GetAllRepositoryCustody(QueryOptions queryOptions, GetAllInput input)
        {
            unitOfWork.Repository.Configuration.ProxyCreationEnabled = false;
            string searchKey = queryOptions.search.value;

            var query = unitOfWork.Repository.RepositoryCustody
                       .Where(x => x.IsDelete == false && x.Quantity > 0)
                       .WhereIf(!string.IsNullOrEmpty(searchKey), x => x.Material.Name.Contains(searchKey))
                        //.WhereIf(DepartmentId.HasValue, x => x.CustodyDetails.DepartmentId == DepartmentId)
                       .WhereIf(input.DepartmentId.HasValue, x => x.EmployeeId == input.DepartmentId)
                       .WhereIf(input.EmployeeId.HasValue, x => x.EmployeeId == input.EmployeeId)
                       .WhereIf(input.MaterialName.HasValue, x => x.MaterialId == input.MaterialName)
                       .WhereIf(input.Quantity.HasValue, x => x.Quantity == input.Quantity)
                       .WhereIf(input.IsActive.HasValue, x => x.IsActive == (input.IsActive.Value == 1))
                       .Select(x => new GetAllDetailsOutput()
                       {
                           Id = x.Id,
                           MaterialName = x.Material.Name,
                           EmployeeId = x.EmployeeId,
                           Quantity = x.Quantity,
                           IsActive = x.IsActive,
                       });

            query = query.AplayQueryOptions(queryOptions);
            var g = query.ToList();
            return g;

        }


        #endregion
    }

    public class GetAllDetailsOutput
    {
        public int Id { get; set; }
        public string CustodyTypeName { get; set; }
        public DateTime CustodyDate { get; set; }
        public string RepositoryDepartmentName { get; set; }
        public int DepartmentId { get; set; }
        public int EmployeeId { get; set; }
        public int? ToEmployeeId { get; set; }
        public string MaterialName { get; set; }
        public int Quantity { get; set; }
        public string Notes { get; set; }
        public string RequestStatusName { get; set; }
        public DateTime? DateOfReturnCustody { get; set; }
        public bool CustodyStatus { get; set; }
        public bool IsActive { get; set; }


    }
    public class CustodyDetailsDto
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "يجب ادخال ")]
        public int CustodyTypeId { get; set; }
        [Required(ErrorMessage = "يجب ادخال تارخ العهدة ")]
        public DateTime CustodyDate { get; set; }
        [Required(ErrorMessage = "يجب اختيار قسم المخزن ")]
        public int RepositoryDepartmentId { get; set; }
        [Required(ErrorMessage = "يجب اختيار الجهة ")]
        public int DepartmentId { get; set; }
        [Required(ErrorMessage = "يجب اختيار الموظف  ")]
        public int EmployeeId { get; set; }
        [Required(ErrorMessage = "يجب اختيار الموظف الثاني ")]
        public int ToEmployeeId { get; set; }
        [Required(ErrorMessage = "يجب اختيار الصنف ")]
        public int MaterialId { get; set; }
        [Required(ErrorMessage = "يجب ادخال الكمية ")]
        public int Quantity { get; set; }
        public string Notes { get; set; }
        [Required(ErrorMessage = "يجب اختيار حالة الطلب  ")]
        public int RequestStatusId { get; set; }
        public bool CustodyStatus { get; set; }
        public DateTime? DateOfReturnCustody { get; set; }
        public bool IsActive { get; set; }
        public int? InsertEmployeeId { get; set; }

        public virtual CustodyType CustodyType { get; set; }
        public virtual Material Material { get; set; }
        public virtual RepositoryDepartment RepositoryDepartment { get; set; }
        public virtual RequestStatus RequestStatus { get; set; }
        public virtual ICollection<RepositoryCustody> RepositoryCustody { get; set; }



    }
    public class RepositoryCustodyDto
    {
        public int Id { get; set; }
        public int CustodyDetailsId { get; set; }
        public int EmployeeId { get; set; }
        public int MaterialId { get; set; }
        public int Quantity { get; set; }
        public bool IsActive { get; set; }
        public int? InsertEmployeeId { get; set; }
        public DateTime InsertedDate { get; set; }


        public virtual CustodyDetails CustodyDetails { get; set; }
        public virtual Material Material { get; set; }
    }

}