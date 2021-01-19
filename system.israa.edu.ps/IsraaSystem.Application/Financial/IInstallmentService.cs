using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Core.Shared;
using IsraaSystem.DataAccess.EntityFrameWork.IsraData;
using log4net;

namespace IsraaSystem.Application.Financial
{


    public interface IInstallmentService : IIsraaService
    {
        List<InstallmentService.StudentInstallmentOrderDto> GetAll(QueryOptions queryOptions, int? semesterId, int? studentId, DateTime? insertDateFrom, DateTime? insertDateTo);

        IQueryable<StudentInstallment> StudentInstallment(int studentId, int semesterId);

        void Accerdiate(List<int> installmentOrderIds, int employeeId,
            InstallmentAccreditationTypeEnum accreditationType);

        List<StudentInstallment> GetAllStudentSemesterInstallment(int studentId, SemestersEnum semestersEnum);
    }

    public class InstallmentService : IsraaService, IInstallmentService
    {
        public InstallmentService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }


        public class StudentInstallmentOrderDto
        {
            public int InstallmentOrderId;
            public string StudentNo { get; set; }
            public string StudentName { get; set; }
            public IEnumerable<StudentInstallment> studentInstallments { get; set; }
            public DateTime InsertDate { get; set; }
            public int? GrantPercentage { get; set; }
            public int? LastFinancialPayment { get; set; }
            public bool AffairsManagerAccreditation { get; set; }
            public bool AcademicAccerdiation { get; set; }
            public bool ManagmentAccreditation { get; set; }
            public bool LoansDivisionAccerdiation { get; set; }
            public bool Accreditation { get; set; }

            public int? StudentInstallmentCount { get; set; }

            public string ChickBox
            {
                get
                {
                    return
                        "< label class=\"mt-checkbox mt-checkbox-single mt-checkbox-outline\"><input name=\"id[]\" type=\"checkbox\" class=\"checkboxes\" value=\"51\"/><span></span></label>";
                }

            }

            public int SemesterID { get; set; }
            public int StudentID { get; set; }
        }

        public List<StudentInstallmentOrderDto> GetAll(QueryOptions queryOptions, int? semesterId, int? studentId, DateTime? insertDateFrom, DateTime? insertDateTo)
        {

            string searchKey = queryOptions.search.value;
            int id;
            if (int.TryParse(searchKey, out id))
            {
                studentId = id;
            }

            var query = unitOfWork.IsraaData.InstallmentOrder
                .WhereIf(!string.IsNullOrEmpty(searchKey), x => x.StudentData.ArFirstName.Contains(searchKey) || x.StudentData.ArFamilyName.Contains(searchKey))
                .WhereIf(semesterId.HasValue, x => x.SemesterID == semesterId)
                .WhereIf(studentId.HasValue, x => x.StudentID == studentId)
                //.WhereIf(insertDateFrom.HasValue, x => EntityFunctions.TruncateTime(x.InsertDate.Date) >= EntityFunctions.TruncateTime(insertDateTo.Value.Date))
                //.WhereIf(insertDateTo.HasValue, x => EntityFunctions.TruncateTime(x.InsertDate.Date) <= EntityFunctions.TruncateTime(insertDateTo.Value.Date))
                .Clean()
                .Select(x => new StudentInstallmentOrderDto
                {
                    InstallmentOrderId = x.ID,
                    StudentNo = x.StudentData.StudentNo,
                    StudentName = x.StudentData.ArFirstName + " " + x.StudentData.ArSecoundName + " " + x.StudentData.ArFamilyName,
                    StudentInstallmentCount = x.StudentInstallment.Count,
                    InsertDate = x.InsertDate,
                    GrantPercentage = x.GrantPercentage,
                    LastFinancialPayment = x.LastFinancialPayment,
                    AffairsManagerAccreditation = x.AffairsManagerAccreditation,
                    AcademicAccerdiation = x.AcademicAccerdiation,
                    ManagmentAccreditation = x.ManagmentAccreditation,
                    LoansDivisionAccerdiation = x.LoansDivisionAccerdiation,
                    Accreditation = x.Accreditation,
                    SemesterID = x.SemesterID,
                    StudentID = x.StudentID
                });









            query = query.AplayQueryOptions(queryOptions);

            return query.ToList();
        }

        public IQueryable<StudentInstallment> StudentInstallment(int studentId, int semesterId)
        {
            return unitOfWork.IsraaData.StudentInstallment.Where(x => x.StudentID == studentId && x.SemesterID == semesterId);
        }



        public void Accerdiate(List<int> installmentOrderIds, int employeeId, InstallmentAccreditationTypeEnum accreditationType)
        {


            var modelList = unitOfWork.IsraaData.InstallmentOrder.Where(x => installmentOrderIds.Contains(x.ID)).ToList();

            foreach (var model in modelList)
            {
                switch (accreditationType)
                {
                    case InstallmentAccreditationTypeEnum.LoansDivision:
                        model.LoansDivisionAccerdiation = true;
                        model.LoansDivisionAccerdiationEmpID = employeeId;
                        model.LoansDivisionAccerdiationDate = DateTime.Now;
                        break;
                    case InstallmentAccreditationTypeEnum.AffairsManager:
                        model.AffairsManagerAccreditation = true;
                        model.AffairsManagerAccreditationEmpID = employeeId;
                        model.AffairsManagerAccreditationDate = DateTime.Now;
                        break;
                    case InstallmentAccreditationTypeEnum.Academic:
                        model.AcademicAccerdiation = true;
                        model.AcademicAccerdiationEmpID = employeeId;
                        model.AcademicAccerdiationDate = DateTime.Now;
                        break;
                    case InstallmentAccreditationTypeEnum.Managment:
                        model.ManagmentAccreditation = true;
                        model.ManagmentAccreditationEmpID = employeeId;
                        model.AcademicAccerdiationDate = DateTime.Now;
                        break;
                }
                if (model.LoansDivisionAccerdiation & model.AffairsManagerAccreditation & model.AcademicAccerdiation & model.ManagmentAccreditation)
                {
                    model.Accreditation = true;
                }


            }


        }


        public List<StudentInstallment> GetAllStudentSemesterInstallment(int studentId, SemestersEnum semestersEnum)
        {
            var studentInstallment = unitOfWork.IsraaData.StudentData.Find(studentId).StudentInstallment.Clean().Where(x => x.SemesterID == (int)semestersEnum && x.AcademicAccreditation).ToList();
            return studentInstallment;
        }
    }




}