using System;
using System.Linq;
using System.Runtime.CompilerServices;
using Common.Session;
using IsraaSystem.Entity.IsraaAcademic;
using log4net;
using Repository.Pattern.Repositories;
using Service.Pattern;

namespace IsraaSystem.Data.Exam
{
    public interface IExamService : IIsraaService<FinalExamSection>
    {

        void CreatFinalExamSection(FinalExamSection finalExamSection, int countOfStudent);


        void GetFilterdOferdCources(int SemesterID, DateTime ExamDate, DateTime From, DateTime To);

    }




    public class ExamService : IsraaService<FinalExamSection>, IExamService
    {

        #region paramiters

        private IRepositoryAsync<StdStatus> _stdStatusRepository;

        private IRepositoryAsync<StdSection> _stdSectionRepository;

        private ILog logger;


        #endregion



        #region Constructor


        public ExamService(IRepositoryAsync<FinalExamSection> repository, IRepositoryAsync<StdStatus> stdStatusRepository, IRepositoryAsync<StdSection> stdSectionRepository, ILog logger, IIsraaSession israaSession) : base(repository)
        {
            _stdStatusRepository = stdStatusRepository;
            _stdSectionRepository = stdSectionRepository;
            this.logger = logger;
        }

        #endregion



        #region Methods

        public void CreatFinalExamSection(FinalExamSection finalExamSection, int countOfStudent)
        {
            try
            {



                //! stdSection اللي بدي اوزع عليهم الايدي اللي بدي اضيفه بعدد معين

                var _StdStatuss = _stdStatusRepository.Queryable()
                    .GroupBy(p => p.StudentID)
                    .Select(g => g.OrderByDescending(p => p.ID)
                        .FirstOrDefault())
                    .Where(r => r.StatusID == 1);


                var _stdSections = _stdSectionRepository.Queryable().Where(x =>
                    _StdStatuss.Any(r => r.StatusID == x.StudentID) &
                    x.SectionID == finalExamSection.SectionID &
                    x.CourseStatusID == 1 &
                    x.FinalExamSectionID == null);


                this.Insert(finalExamSection);


                if (countOfStudent > _stdSections.Count())
                    _stdSections.ToList().ForEach(x => x.FinalExamSectionID = finalExamSection.ID);
                else
                    _stdSections.Take(countOfStudent).ToList().ForEach(x => x.FinalExamSectionID = finalExamSection.ID);


            }
            catch (Exception e)
            {
                logger.Fatal(e);
            }


        }

        public void GetFilterdOferdCources(int SemesterID, DateTime ExamDate, DateTime From, DateTime To)
        {
        }

        #endregion





    }










}