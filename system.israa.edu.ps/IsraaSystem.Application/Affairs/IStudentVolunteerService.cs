using AutoMapper;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Core.Shared;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using log4net;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity.Core.Common.CommandTrees;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IsraaSystem.Application.Academic.StudentManager;
using IsraaSystem.Application.Common.Constants;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;

namespace IsraaSystem.Application.Affairs
{
    public interface IStudentVolunteerService : IIsraaService
    {
        void AddStudentVolunteer(StudentVolunteerDto input);
        List<VolunteerStudentsListDto> GetAllVolunteerStudents(QueryOptions queryOptions);
        List<StudentVolunteerRequestDto> StudentVolunteerRequests(int studentId);
        void AccreditRequest(int id);
    }
    public class StudentVolunteerService : IsraaService, IStudentVolunteerService
    {
        public StudentVolunteerService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }

        public void AddStudentVolunteer(StudentVolunteerDto input)
        {

            StudentVolunteer model = Mapper.Map<StudentVolunteer>(input);

            model.StudentID = input.StudentID;
            model.IsActive = true;
            if (input.VolunteerCategoryID == 6)//اخرى
            {
                model.VolunteerCategoryName = input.VolunteerCategoryName;
            }
            else
            {
                var VolntCategName = unitOfWork.Academic.VolunteerCategory.Find(input.VolunteerCategoryID);
                model.VolunteerCategoryName = VolntCategName.Name;
            }
            model.InsertDate = DateTime.Now;
            model.IsDelete = false;
            model.IsAccept = false;
            unitOfWork.Academic.StudentVolunteer.Add(model);


        }

        public List<VolunteerStudentsListDto> GetAllVolunteerStudents(QueryOptions queryOptions)
        {

            //int dipReqHours = unitOfWork.Administration.VolunteerSetting.ToList().Last(x => x.ProgramID == 1).VolunteerHour;
            //int baReqHours = unitOfWork.Administration.VolunteerSetting.ToList().Last(x => x.ProgramID == 2).VolunteerHour;



            //Search
            string searchKey = queryOptions.search.value;
            var studentNo = 0;
            int.TryParse(searchKey, out studentNo);

            var query = unitOfWork.Academic.StudentAcademic.Clean()
                .WhereIf(studentNo > 0, x => x.StudentNo == studentNo)
                .WhereIf(studentNo == 0 && !string.IsNullOrEmpty(searchKey), x => x.StudentPersonal.ArFirstName.Contains(searchKey) || x.StudentPersonal.ArFamilyName.Contains(searchKey))
                .Where(x => x.StudentVolunteer.Any(b => b.IsActive && !b.IsDelete))
                .Select(b => new VolunteerStudentsListDto
                {
                    StudentID = b.StudentID,
                    StudentNo = b.StudentNo,
                    StudentName = b.StudentPersonal.ArFirstName + " " + b.StudentPersonal.ArSecoundName + " " + b.StudentPersonal.ArFamilyName,
                    ProgramName = b.Program.ArName,
                    CollegeName = b.Department.College.ArName,
                    DepartmentName = b.Department.ArName,
                    StudyLevel = b.StudyLevel1.ArName,
                    GraduationStatus = b.GraduationStatus.Name,
                    VolunteerHours = b.VolunteerHours,
                    StudentVolunteer = b.StudentVolunteer.Count(x => !x.IsDelete && x.IsActive),
                    AcceptedNo = b.StudentVolunteer.Count(x => x.IsAccept && !x.IsDelete && x.IsActive),
                    RequierdHours = (b.ProgramID == 1) ? 40 : 80,
                    IsVolunteerDone = b.IsVolunteerDone
                });
            query = query.AplayQueryOptions(queryOptions);

            return query.ToList();
        }



        public List<StudentVolunteerRequestDto> StudentVolunteerRequests(int studentId)
        {
            var result = unitOfWork.Academic.StudentVolunteer
                .Clean()
                .Where(x => x.StudentID == studentId)
                .Select(x => new StudentVolunteerRequestDto
                {
                    ID = x.ID,
                    SemesterName = x.Semester.ArShortName,
                    VolunteerTypeName = x.VolunteerType.Name,
                    VolunteerCategoryName = x.VolunteerCategoryName,
                    Name = x.VolunteerType.Name,
                    IsAccept = x.IsAccept,
                    OrganizationName = x.OrganizationName,
                    OrganizationHour = x.OrganizationHour,
                    DateFrom = x.DateFrom,
                    DateTo = x.DateTo
                });

            return result.ToList();

        }




        public void AccreditRequest(int id)
        {
            var student = unitOfWork.Academic.StudentVolunteer.Find(id);
            var programhour = unitOfWork.Administration.VolunteerSetting.Where(x => x.ProgramID == student.StudentAcademic.ProgramID).OrderByDescending(x => x.ID).FirstOrDefault().VolunteerHour;
            var volunteerHours = unitOfWork.Academic.StudentVolunteer.Clean().Where(s => s.StudentID == student.StudentID).Sum(x => x.OrganizationHour);
            student.IsAccept = true;
            student.StudentAcademic.VolunteerHours = volunteerHours;
            student.StudentAcademic.IsVolunteerDone = student.StudentAcademic.VolunteerHours == programhour;
        }

    }


    public class StudentVolunteerRequestDto
    {
        public int ID { get; set; }
        public string VolunteerCategoryName { get; set; }
        public string Name { get; set; }
        public bool IsAccept { get; set; }
        public string OrganizationName { get; set; }
        public int OrganizationHour { get; set; }
        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public string SemesterName { get; set; }
        public string VolunteerTypeName { get; set; }
    }



    public class VolunteerStudentsListDto
    {
        public int StudentID { get; set; }
        public int StudentNo { get; set; }
        public string StudentName { get; set; }
        public string ProgramName { get; set; }
        public string CollegeName { get; set; }
        public string DepartmentName { get; set; }
        public string StudyLevel { get; set; }
        public string GraduationStatus { get; set; }
        public int VolunteerHours { get; set; }
        public int StudentVolunteer { get; set; }
        public int AcceptedNo { get; set; }
        public int RequierdHours { get; set; }
        public bool IsVolunteerDone { get; set; }
    }


    public class StudentVolunteerDto
    {
        public StudentVolunteerDto()
        {
            IsActive = true;

        }


        public int ID { get; set; }
        public int StudentID { get; set; }


        [Required(ErrorMessage = ValidationMessages.RequiredErrorMessage)]
        public int SemesterID { get; set; }


        [Required(ErrorMessage = ValidationMessages.RequiredErrorMessage)]
        public int VolunteerTypeID { get; set; }


        [Required(ErrorMessage = ValidationMessages.RequiredErrorMessage)]
        public int VolunteerCategoryID { get; set; }
        public string VolunteerCategoryName { get; set; }


        [Required(ErrorMessage = ValidationMessages.RequiredErrorMessage)]
        public string OrganizationName { get; set; }


        [Required(ErrorMessage = ValidationMessages.RequiredErrorMessage)]
        [Range(1, int.MaxValue, ErrorMessage = ValidationMessages.BiggerThan + "{1}")]
        public int OrganizationHour { get; set; }


        [Required(ErrorMessage = ValidationMessages.RequiredErrorMessage)]
        public DateTime? DateFrom { get; set; }


        [Required(ErrorMessage = ValidationMessages.RequiredErrorMessage)]
        public DateTime? DateTo { get; set; }

        public bool IsAccept { get; set; }
        public bool IsActive { get; set; }
        public bool IsDelete { get; set; }
        public DateTime? AcceptDate { get; set; }
        public int? AcceptEmployeeID { get; set; }
        public DateTime InsertDate { get; set; }
        public int InsertEmployeeID { get; set; }
        public DateTime? UpdateDate { get; set; }
        public int? UpdateEmployeeID { get; set; }
        public DateTime? DeleteDate { get; set; }
        public int? DeleteEmployeeID { get; set; }

        public virtual Semester Semester { get; set; }
        public virtual StudentAcademic StudentAcademic { get; set; }
        public virtual VolunteerCategory VolunteerCategory { get; set; }
        public virtual VolunteerType VolunteerType { get; set; }

    }

    public class StudentVolunteerOutput
    {
        public int ID { get; set; }
        public int StudentNo { get; set; }
        public string StudentName { get; set; }
        public string VolunteerTypeName { get; set; }
        public string VolunteerCategoryName { get; set; }

        public string OrganizationName { get; set; }
        public int OrganizationHour { get; set; }

    }
}
