using IsraaSystem.Application.Common.UnitOfWork;
using log4net;
using IsraaSystem.DataAccess.EntityFrameWork.IsraData;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using IsraaSystem.Application.Administration.Settings;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;

namespace IsraaSystem.Application.Financial
{

    public interface IStudentFinancialService : IIsraaService
    {
        decimal GetStudentBalance(int studentId);
        decimal CalculateBalance(int studentid);
        List<StudentScholarship> GetAllStudentSemesterScholarship(int studentId, SemestersEnum semestersEnum);
        StudentScholarship GetActiveStudentSemesterScholarship(int studentId, SemestersEnum semestersEnum);

    }
    public class StudentFinancialService : IsraaService, IStudentFinancialService

    {
        private readonly ISettingService _settingService;
        public StudentFinancialService(IUnitOfWork unitOfWork, ILog logger, ISettingService settingService) : base(unitOfWork, logger)
        {
            _settingService = settingService;
        }
        public decimal GetStudentBalance(int studentId)
        {
            var balance = unitOfWork.IsraaData.StudentData.Find(studentId).Balance;

            return balance;
        }

        public decimal CalculateBalance(int studentid)

        {
            var studentData = unitOfWork.IsraaData.StudentData.Find(studentid);
            //var studentPermissions = unitOfWork.IsraaPermissions.Student.Find(studentid);
            var tran = studentData.Transaction.Select(x => new
            {
                cdFlag = x.CDFlag,
                amount = x.Amount
            });

            var studentbalance = tran.Sum(x => x.cdFlag * x.amount);
            studentData.Balance = studentbalance;
   
          
            return studentbalance;
        }

        public List<StudentScholarship> GetAllStudentSemesterScholarship(int studentId, SemestersEnum semestersEnum)
        {
            var studentScholarship = unitOfWork.IsraaData.StudentData.Find(studentId).StudentScholarship.Clean().Where(x => x.SemesterID == (int)semestersEnum && x.AcademicAccreditation).OrderBy(x => x.Action.Value).ToList();
            return studentScholarship;
        }



        public StudentScholarship GetActiveStudentSemesterScholarship(int studentId, SemestersEnum semestersEnum)
        {
            var studentScholarship = GetAllStudentSemesterScholarship(studentId, semestersEnum);
            var activeStudentScholarship = studentScholarship.FirstOrDefault();
            return activeStudentScholarship;
        }



    }
}
////