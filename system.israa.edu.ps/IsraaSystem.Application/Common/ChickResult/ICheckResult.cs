using System.Collections.Generic;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using log4net;

namespace IsraaSystem.Application.Common.ChickResult
{
    public interface ICheckResultService : IIsraaService
    {
        List<CheckResult> CheckResultList { get; set; }

        void AddResult(int status, string msg = "", int? id = null);

        List<CheckResult> GetResult();
    }


    public class CheckResultService : IsraaService, ICheckResultService
    {
        public CheckResultService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }

        public List<CheckResult> CheckResultList { get; set; }


        public void AddResult(int status, string msg = "", int? id = null)
        {
            if (CheckResultList == null)
            {
                CheckResultList = new List<CheckResult>();
            }
            var m = new CheckResult
            {
                Id = id,
                Msg = msg,
                Status = status
            };
            CheckResultList.Add(m);

        }


        public List<CheckResult> GetResult()
        {
            return CheckResultList;

        }
    }


    public class CheckResult
    {

        public int Status { get; set; }
        public string Msg { get; set; }
        public int? Id { get; set; }


    }

}