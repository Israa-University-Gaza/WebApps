using IsraaSystem.Application.Common.UnitOfWork;
using log4net;
using IsraaSystem.Application.Common.DtoBase;
using System.Collections.Generic;
using IsraaSystem.DataAccess.EntityFrameWork.IsraData;
using System;
using System.Linq;
using IsraaSystem.Application.Academic.CalendarManger;
using Hangfire;
using IsraaSystem.Application.Financial;
using System.Data;
using IsraaSystem.Application.Academic.BackgroundJobManger;
using IsraaSystem.Application.Administration.Settings;
using IsraaSystem.Application.Common.ChickResult;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;

namespace IsraaSystem.Application.Financial
{

    public interface ITransactionService : IIsraaService
    {
        List<CheckResult> TransactionAdd(out int? id, int studentId, decimal amount, int actionId, SemestersEnum semestersEnum = SemestersEnum.CurentSemester, int? voucherId = null, int? accountId = null, float? quantity = null, int? insertStudentId = null, int? insertEmployeeId = null);

        void SemesterServiceFeesAdd(int studentId, int employeeid, SemestersEnum semestersEnum);
        ActionInfoDto GetActionInfoByActionID(int actionId);

    }
    public class TransactionService : IsraaService, ITransactionService

    {
        private readonly ISettingService _settingService;
        private readonly ICheckResultService _checkResultService;
        private readonly ISemesterCalendarService _semesterCalendarService;
        private readonly IStudentFinancialService _studentFinancialService;
        private readonly IBackgroundJobService _backgroundJobService;
        public TransactionService(IUnitOfWork unitOfWork, ILog logger, ISettingService settingService, ICheckResultService checkResultService, ISemesterCalendarService semesterCalendarService, IStudentFinancialService studentFinancialService, IBackgroundJobService backgroundJobService) : base(unitOfWork, logger)
        {
            _settingService = settingService;
            _checkResultService = checkResultService;
            _semesterCalendarService = semesterCalendarService;
            _studentFinancialService = studentFinancialService;
            _backgroundJobService = backgroundJobService;

        }



        public List<CheckResult> TransactionAdd(out int? id, int studentId, decimal amount, int actionId, SemestersEnum semestersEnum = SemestersEnum.CurentSemester, int? voucherId = null, int? accountId = null, float? quantity = null, int? insertStudentId = null, int? insertEmployeeId = null)

        {
            id = null;

            var student = unitOfWork.IsraaData.StudentData.Find(studentId);
            //if (_semesterCalendarService.IsRegisterBeginning(semestersEnum) && _semesterCalendarService.IsEndRegester(semestersEnum))
            //{
            if (amount >= 0)
            {
                var cDFlag = unitOfWork.IsraaData.Action.Find(actionId).CDType;
                var transaction = new Transaction
                {
                    SemesterID = (int)semestersEnum,
                    CDFlag = cDFlag,
                    Amount = amount,
                    ActionID = actionId,
                    VoucherID = voucherId,
                    AccountID = accountId,
                    Quantity = quantity,
                    InsertDate = DateTime.Now,
                    InsertStudentID = insertStudentId,
                    InsertEmployeeID = insertEmployeeId
                };
                student.Transaction.Add(transaction);
                unitOfWork.Complete();
                id = transaction.ID;
                _checkResultService.AddResult(1, "تم إضافة التحويل المالي بنجاح", transaction.ID);

            }

            else
            {
                _checkResultService.AddResult(0, "لا يمكن إضافة تحويل مالي بكمية سالبة");
            }
            //}
            //else
            //{
            //    _checkResultService.AddResult(0, "يرجى مراجعة التقويم الأكاديمي الخاص بالتسجيل");

            //}

            return _checkResultService.GetResult();

        }
        public void SemesterServiceFeesAdd(int studentId, int employeeid, SemestersEnum semestersEnum)

        {
            var semsterTrans = unitOfWork.IsraaData.StudentData.Find(studentId).Transaction.Clean().FirstOrDefault(X => X.SemesterID == (int)semestersEnum && X.Action.ActionTypeID == 11);

            if (semsterTrans == null)
            {
                var action = unitOfWork.IsraaData.Action.Where(x => x.ActionTypeID == 11).ToList();

                action.ForEach(x =>
                {
                    int? id = null;
                    var ActionInfo = GetActionInfoByActionID(x.ID);
                    TransactionAdd(out id, studentId, ActionInfo.amount, x.ID, semestersEnum, insertEmployeeId: employeeid, insertStudentId: studentId);

                });
            }

        }

        public ActionInfoDto GetActionInfoByActionID(int actionId)
        {
            var action = unitOfWork.IsraaData.Action.Find(actionId);
            var actionPrice = action.Currency.CurrencyPrice.Clean().LastOrDefault().Price;
            var actionValue = (decimal)action.Value;
            var amount = actionValue / actionPrice;

            var result = new ActionInfoDto
            {
                actionPrice = actionPrice,
                actionValue = actionValue,
                amount = amount
            };
            return result;
        }




    }

    public class ActionInfoDto
    {
        public decimal actionPrice { get; set; }
        public decimal actionValue { get; set; }
        public decimal amount { get; set; }

    }
}
