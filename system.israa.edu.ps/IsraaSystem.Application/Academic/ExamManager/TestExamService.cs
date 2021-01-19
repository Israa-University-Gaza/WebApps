using System;
using System.Collections.Generic;
using Common.Session;
using IsraaSystem.Entity.IsraaAcademic;
using log4net;
using Repository.Pattern.Repositories;
using Service.Pattern;

namespace IsraaSystem.Data.Exam
{

    public interface ITestExamService : IIsraaService<FinalExamSection>
    {
        IEnumerable<FinalExamSection> GetAllExamSections();
        void Testlog();

    }




    public class TestExamService : IsraaService<FinalExamSection>, ITestExamService
    {

        private readonly IRepositoryAsync<FinalExamSection> _repository;

        private readonly ILog log;



        public TestExamService(IRepositoryAsync<FinalExamSection> repository) : base(repository)
        {
            _repository = repository;
            // log = logger;
        }

        public IEnumerable<FinalExamSection> GetAllExamSections()
        {

            return _repository.Queryable();
        }

        public void Testlog()
        {

            log.Info("Starting TestLog method...");
            log.Debug("No input parameters for method.");

            log.Info("Starting loop.");
            for (var i = 0; i <= 10; i++)
            {
                log.Debug("Current value: " + i);
            }
            log.Info("Loop complete.");

            log.Warn("Warning area from testlog method.");

            try
            {
                throw new Exception("Evil exception test!");
            }
            catch (Exception ex)
            {
                log.Error("Bad Bad Bad!", ex);
            }

        }
    }
}