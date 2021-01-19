using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IsraaSystem.Application.Common.UnitOfWork;
using log4net;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using AutoMapper;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.Tree;

namespace IsraaSystem.Application.Administration.OrganizationJop
{
    public interface IOrganizationJopService : IIsraaService
    {
        #region Jop
        List<TreeDto> GetAllJops(int? managerJobId);
        bool AddJop(JopDTO input);
        void EditJop(JopDTO input);
        int DeleteJop(int id);
        JopDTO GetJop(int id);
        List<JopDTO> GetJopsFromDepartment(int departmentId);


        #endregion
    }

    public class OrganizationJopService : IsraaService, IOrganizationJopService
    {
        public OrganizationJopService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }


        public List<TreeDto> GetAllJops(int? managerJobId)
        {
            var query = unitOfWork.HumanResource.Job
                .Where(x => x.IsDelete == false)
                .Where(x => x.ManagerJobID == managerJobId)
                .Select(x => new TreeDto
                {
                    id = x.ID,
                    text = x.JobTitle,
                    children = x.Job1.Any(),
                    ParentID = x.ManagerJobID,

                });

            return query.ToList();
        }

        public bool AddJop(JopDTO input)
        {
            bool status;
            var type = (from a in unitOfWork.HumanResource.Job
                        where a.JobTitle == input.JobTitle && a.DepartmentID == input.DepartmentID && a.IsActive == input.IsActive
                              && a.CaderID == input.CaderID && a.CaderDegreeID == input.CaderDegreeID && a.ManagerJobID == input.ManagerJobID && a.IsDelete == false
                        select a).ToList();
            if (type.Count > 0)
            {
                return status = false;
            }
            else
            {
                var model = Mapper.Map<Job>(input);
                model.InsertDate = DateTime.Now;
                unitOfWork.HumanResource.Job.Add(model);
                return status = true;
            }
        }

        public void EditJop(JopDTO input)
        {
            var model = unitOfWork.HumanResource.Job.Find(input.ID);
            model.JobTitle = input.JobTitle;
            model.JobGoal = input.JobGoal;
            model.EmployeeCount = input.EmployeeCount;
            model.DepartmentID = input.DepartmentID;
            model.CaderID = input.CaderID;
            model.CaderDegreeID = input.CaderDegreeID;
            model.ManagerJobID = input.ManagerJobID;
            model.OtherJobRelation = input.OtherJobRelation;
            model.IsActive = input.IsActive;
        }

        public int DeleteJop(int id)
        {
            int status;
            var model = unitOfWork.HumanResource.Job.Find(id);

            var placement = (from s in unitOfWork.HumanResource.EmployeePlacement
                             where s.JobID == model.ID && s.IsDelete == false
                             select s).ToList();

            var childs = (from t in unitOfWork.HumanResource.Job
                          where t.ManagerJobID == model.ID && t.IsActive == true && t.IsDelete == false
                          select t).ToList();

            if (placement.Count > 0)
            {
                return status = 0;
            }
            else if (childs.Count > 0)
            {

                return status = 1;
            }
            else
            {
                model.IsDelete = true;
                model.IsActive = false;
                return status = 2;
            }
        }

        public JopDTO GetJop(int id)
        {
            var data = unitOfWork.HumanResource.Job.Find(id);
            return Mapper.Map<JopDTO>(data);
        }

        public List<JopDTO> GetJopsFromDepartment(int departmentId)
        {
            var query = unitOfWork.HumanResource.Job.Where(x => x.IsDelete == false && x.IsActive == true && x.DepartmentID == departmentId)
                .Select(x => new JopDTO
                {
                    JobTitle = x.JobTitle
                });

            return Mapper.Map<List<JopDTO>>(query.ToList());
        }
    }


    public class JopDTO
    {
        public int ID { get; set; }
        public string JobTitle { get; set; }
        public string JobGoal { get; set; }
        public int DepartmentID { get; set; }
        public int CaderID { get; set; }
        public int CaderDegreeID { get; set; }
        public int? ManagerJobID { get; set; }
        public string OtherJobRelation { get; set; }
        public int EmployeeCount { get; set; }
        public bool IsActive { get; set; }
        public bool IsDelete { get; set; }
        public DateTime InsertDate { get; set; }
        public int InsertEmployeeID { get; set; }
        public DateTime? UpdateDate { get; set; }
        public int? UpdateEmployeeID { get; set; }
        public DateTime? DeleteDate { get; set; }
        public int? DeleteEmployeeID { get; set; }
        public virtual ICollection<EmployeePlacement> EmployeePlacement { get; set; }
        public virtual ICollection<Job> Job1 { get; set; }
        public virtual Job Job2 { get; set; }
    }
}
