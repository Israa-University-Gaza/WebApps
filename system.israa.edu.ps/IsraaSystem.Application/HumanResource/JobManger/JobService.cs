using System;
using System.Collections.Generic;
using System.Linq;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using log4net;

namespace IsraaSystem.Application.HumanResource.JobManger
{


    public interface IJobService : IIsraaService
    {
        Job Get(int id);
        List<Job> GetJobParentes(int jobId);

        void updateEmployeePlacmentManger(int jobId);

        List<EmployeePlacement> GetJobParentesPlacments(int jobId, DateTime date);

    }


    public class JobService : IsraaService, IJobService
    {



        public JobService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {



        }

        public Job Get(int id)
        {
            return unitOfWork.HumanResource.Job.Find(id);
        }

        public List<Job> GetJobParentes(int jobId)
        {
            var list = new List<Job>();
            var job = unitOfWork.HumanResource.Job.Find(jobId);
            while (hasParent(job))
            {
                list.Add(job.Job2);
                job = job.Job2;
            }

            return list;
        }


        public List<EmployeePlacement> GetJobParentesPlacments(int jobId, DateTime date)
        {
            var list = new List<EmployeePlacement>();
            var job = unitOfWork.HumanResource.Job.Find(jobId);
            while (hasParent(job))
            {
                list.Add(job.Job2.EmployeePlacement.Clean().Where(x => x.DateFrom <= date && (x.DateTo >= date || x.DateTo == null)).LastOrDefault());
                job = job.Job2;
            }

            return list;
        }





        protected bool hasParent(Job job)
        {
            return job.Job2 != null;
        }

        public int GetJobActiveManger(int jobId, DateTime date)
        {

            var JobManger = GetJobParentesPlacments(jobId, date).FirstOrDefault().EmployeeID;
            return JobManger;
        }

        public void updateEmployeePlacmentManger(int jobId)
        {
            var date = DateTime.Now;
            var JobManger = GetJobParentesPlacments(jobId, date).FirstOrDefault(x => x != null).EmployeeID;
            var list = unitOfWork.HumanResource.EmployeePlacement.Clean().Where(x =>
                x.DateFrom <= date && (x.DateTo >= date || x.DateTo == null) && x.JobID == jobId).ToList();
            foreach (var x in list)
            {
                x.DManagerID = JobManger;
            }

            unitOfWork.Complete();

        }

    }

}





