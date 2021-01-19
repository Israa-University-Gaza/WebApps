using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Common.CommandTrees;
using System.Linq;
using System.Linq.Dynamic;
using System.Security.Cryptography.X509Certificates;
using System.Threading.Tasks;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using IsraaSystem.DataAccess.EntityFrameWork.IsraData;
using log4net;

namespace IsraaSystem.Application.HumanResource
{


    public interface IEmloyeeReportService : IIsraaService
    {
        List<EmployeeDto> EmployeeReportData();

        //List<EmployeeDto> m();

    }


    public class EmployeeDto
    {


        public string EmployeeNo { get; set; }
        public string ArFirstName { get; set; }
        public string ArSecoundName { get; set; }
        public string ArThirdName { get; set; }
        public string ArFamilyName { get; set; }
        public string ArName { get; set; }
        public string EnName { get; set; }
        public string branch { get; set; }
        public int? CityID { get; set; }
        public int? CountryID { get; set; }
        public int? NationalityID { get; set; }
        public int? GovernorateID { get; set; }
        public int? GenderID { get; set; }
        public string Gender { get; set; }
        public string SSN { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public int? MaritalStatusID { get; set; }
        public string MaritalStatus { get; set; }
        public int? ChildrensCount { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string UniversityEmail { get; set; }
        public string Address { get; set; }
        public int? EmployeeStatusID { get; set; }
        public string EmployeeStatus { get; set; }
        public DateTime? StartDateEmpStatus { get; set; }
        public DateTime? EndDateEmpStatus { get; set; }
        public int? EmploymentTypeID { get; set; }
        public string EmploymentType { get; set; }
        public DateTime? StartDateEmpEmploymentType { get; set; }
        public DateTime? EndDateEmpEmploymentType { get; set; }
        public int? JobID { get; set; }
        public string JobTitle { get; set; }
        public int? DManagerID { get; set; }
        public string ManagerName { get; set; }
        public int? CaderID { get; set; }
        public string Cader { get; set; }
        public int? PlacementStatusID { get; set; }
        public string PlacementStatus { get; set; }
        public int? PlacementTypeID { get; set; }
        public string PlacementType { get; set; }
        public int? AttendanceFormatID { get; set; }
        public string AttendanceDefault { get; set; }
        public int? QualificationTypeID { get; set; }
        public string Qualification { get; set; }
        public string Specialization { get; set; }
        public int? QualificationYear { get; set; }
        public string QualificationUniversityName { get; set; }
        public string QualificationCountryName { get; set; }
        public string BasicSalary { get; set; }
        public string BasicSalaryCurrency { get; set; }
        public string Department { get; set; }
        public string College { get; set; }
        public int? CollegeID { get; set; }
        public string Section { get; set; }
        public int? SectionID { get; set; }
        public int EmployeeID { get; set; }
        public int? DepartmentID { get; set; }
        //public IEnumerable<EmloyeeReportService.EmployeePlacementDto> EmployeePlacements { get; set; }

        //public IEnumerable<int?> PlacementIds
        //{
        //    get
        //    {

        //        var result = new List<int?>();
        //        if (EmployeePlacements.Any())
        //        {
        //            result = EmployeePlacements.Select(x => x.Placement?.ID)
        //               .Concat(EmployeePlacements.Select(x => x.PlacementFather?.ID))
        //               .Concat(EmployeePlacements.Select(x => x.PlacementGrandFather?.ID)).ToList();

        //        }

        //        return result;
        //    }

        //}

        public EmloyeeReportService.EmployeePlacementDto employeePlacementDto { get; set; }
        public string IsFullTime { get; set; }
        public string employeePlacementCollegeName { get; set; }
        public string employeePlacementDepartmentName { get; set; }
        public string employeePlacementSectionName { get; set; }
        public int? employeePlacementDManagerID { get; set; }
        public int? employeePlacementDepartmentId { get; set; }
        public int? employeePlacementCaderID { get; set; }
        public int? employeePlacementPlacementTypeID { get; set; }
        public int? employeePlacementPlacementStatusID { get; set; }
        public int? employeePlacementCollegeId { get; set; }
    }

    public class EmloyeeReportService : IsraaService, IEmloyeeReportService
    {
        public EmloyeeReportService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }


        public class EmployeePlacementDto
        {
            public string JobTitle { get; set; }
            public int? DManagerID { get; set; }
            public string ManagerName { get; set; }
            public int CaderID { get; set; }
            public string CaderName { get; set; }
            public int PlacementStatusID { get; set; }
            public string PlacementStatus { get; set; }
            public int PlacementTypeID { get; set; }
            public string PlacementType { get; set; }
            public Department Placement { get; set; }
            public Department PlacementFather { get; set; }
            public Department PlacementGrandFather { get; set; }
            public int DepartmentTypeID { get; set; }




            public string DepartmentName
            {
                get
                {
                    string name = "..";
                    if (DepartmentTypeID == 8 || DepartmentTypeID == 9)
                    {
                        name = Placement.ArName;

                    }
                    else if (DepartmentTypeID == 10 || DepartmentTypeID == 11)
                    {
                        name = PlacementFather.ArName;

                    }
                    return name;
                }
            }

            public string CollegeName
            {
                get
                {
                    string name = "..";
                    if (DepartmentTypeID == 8 || DepartmentTypeID == 9)
                    {
                        name = PlacementFather.ArName;

                    }
                    else if (DepartmentTypeID == 5 || DepartmentTypeID == 6 || DepartmentTypeID == 7)
                    {
                        name = Placement.ArName;
                    }
                    else if (DepartmentTypeID == 10 || DepartmentTypeID == 11)
                    {
                        name = PlacementGrandFather.ArName;

                    }
                    return name;
                }

            }

            public string SectionName
            {
                get
                {
                    string name = "..";
                    if (DepartmentTypeID == 10 || DepartmentTypeID == 11)
                    {
                        name = Placement.ArName;

                    }

                    return name;
                }

            }


            public int DepartmentId
            {
                get
                {
                    int id = 0;
                    if (DepartmentTypeID == 8 || DepartmentTypeID == 9)
                    {
                        id = Placement.ID;

                    }
                    else if (DepartmentTypeID == 10 || DepartmentTypeID == 11)
                    {
                        id = PlacementFather.ID;

                    }
                    return id;
                }
            }

            public int CollegeId
            {
                get
                {
                    int id = 0;
                    if (DepartmentTypeID == 8 || DepartmentTypeID == 9)
                    {
                        id = PlacementFather.ID;

                    }
                    else if (DepartmentTypeID == 5 || DepartmentTypeID == 6 || DepartmentTypeID == 7)
                    {
                        id = Placement.ID;
                    }
                    else if (DepartmentTypeID == 10 || DepartmentTypeID == 11)
                    {
                        id = PlacementGrandFather.ID;

                    }
                    return id;
                }

            }

            public int SectionId
            {
                get
                {
                    int id = 0;
                    if (DepartmentTypeID == 10 || DepartmentTypeID == 11)
                    {
                        id = Placement.ID;

                    }

                    return id;
                }

            }



            public int EmployeeID { get; set; }
        }

        public List<EmployeeDto> EmployeeReportDataOld()
        {
            unitOfWork.HumanResource.Configuration.ProxyCreationEnabled = false;
            var now = DateTime.Now.Date;
            int dayID = ((int)now.DayOfWeek) + 2;
            dayID = (dayID == 8) ? 1 : dayID;


            var result =
                from emp in unitOfWork.HumanResource.EmployeeReportData.Select(b => new
                {
                    b.ID,
                    b.BasicSalary,
                    b.BasicSalaryCurrency,
                })
                join a in unitOfWork.HumanResource.EmployeePersonal.Clean()
                                          .Select(b => new
                                          {
                                              b,
                                              b.EmployeeID,
                                              Governorate = b.Governorate,
                                              City = b.City,
                                              MaritalStatus = b.MaritalStatus,
                                              Gender = b.Gender,
                                              EmployeeFamily = b.EmployeeFamily,
                                              EmpStatus = b.EmpStatus.OrderByDescending(o => o.ID).FirstOrDefault(x =>
                                                  (now >= x.DateFrom && (now <= x.DateTo || x.DateTo == null)) && !x.IsDelete),
                                              EmpEmploymentType = b.EmpEmploymentType.OrderByDescending(o => o.ID).FirstOrDefault(x =>
                                                             !x.IsDelete && (now >= x.DateFrom && (now <= x.DateTo || x.DateTo == null))),
                                              EmployeeAttendanceFormat = b.EmployeeAttendanceFormat.OrderByDescending(o => o.ID).FirstOrDefault(x => !x.IsDelete && (now >= x.ActiveFromDate && (now <= x.ActiveToDate || x.ActiveToDate == null))),
                                              EmployeeQualification = b.EmployeeQualification.OrderByDescending(o => o.QualificationTypeOrderNum).FirstOrDefault(x => !x.IsDelete),
                                          }) on emp.ID equals a.EmployeeID

                join employeePlacementDto in unitOfWork.HumanResource.EmployeePlacement
                    .Where(x => !x.IsDelete && (now >= x.DateFrom && (now <= x.DateTo || x.DateTo == null)))
                    .Select(x => new EmployeePlacementDto
                    {
                        EmployeeID = x.EmployeeID,
                        JobTitle = x.Job.JobTitle,
                        DManagerID = x.DManagerID,
                        ManagerName = x.EmployeePersonal1.ArFirstName + " " +
                                      x.EmployeePersonal1.ArSecoundName + " " +
                                      x.EmployeePersonal1.ArFamilyName,
                        CaderID = x.CaderID,
                        CaderName = x.Cader.Name,
                        PlacementStatusID = x.PlacementStatusID,
                        PlacementStatus = x.PlacementStatus.Name,
                        PlacementTypeID = x.PlacementTypeID,
                        PlacementType = x.PlacementType.Name,
                        Placement = x.Department,
                        PlacementFather = x.Department.Department2,
                        PlacementGrandFather = x.Department.Department2.Department2,
                        DepartmentTypeID = x.Department.DepartmentTypeID
                    }) on a.EmployeeID equals employeePlacementDto.EmployeeID
                select new EmployeeDto
                {
                    EmployeeID = a.b.EmployeeID,
                    EmployeeNo = a.b.EmployeeNo,
                    ArFirstName = a.b.ArFirstName,
                    ArSecoundName = a.b.ArSecoundName,
                    ArThirdName = a.b.ArThirdName,
                    ArFamilyName = a.b.ArFamilyName,
                    ArName = a.b.ArFirstName + " " + a.b.ArSecoundName + " " + a.b.ArThirdName + " " + a.b.ArFamilyName,
                    EnName = a.b.EnFirstName + " " + a.b.EnSecoundName + " " + a.b.EnThirdName + " " + a.b.EnFamilyName,
                    branch = a.b.BranchID == 1 ? "الزهراء" : "يافا",
                    CityID = a.b.CityID,
                    CountryID = a.b.CountryID,
                    NationalityID = a.b.NationalityID,
                    GovernorateID = a.b.GovernorateID,
                    GenderID = a.b.GenderID,
                    Gender = a.Gender.ArName,
                    SSN = a.b.SSN,
                    DateOfBirth = a.b.DateOfBirth,
                    MaritalStatusID = a.b.MaritalStatusID,
                    MaritalStatus = a.MaritalStatus.ArName,
                    ChildrensCount = a.EmployeeFamily.Where(x => x.RelativeTypeID == 7).Count(),
                    Mobile = a.b.Mobile,
                    Email = a.b.Email,
                    UniversityEmail = a.b.UniversityEmail,
                    Address = a.Governorate.ArName + "_" + a.City.ArName + " _ " + a.b.Neighborhood + "_" + a.b.Street,
                    EmployeeStatusID = a.EmpStatus.EmployeeStatusID,
                    EmployeeStatus = a.EmpStatus.EmployeeStatus.ArName,
                    StartDateEmpStatus = a.EmpStatus.DateFrom,
                    EndDateEmpStatus = a.EmpStatus.DateTo,
                    EmploymentTypeID = a.EmpEmploymentType.EmploymentTypeID,
                    EmploymentType = a.EmpEmploymentType.EmploymentType.ArName,
                    StartDateEmpEmploymentType = a.EmpEmploymentType.DateFrom,
                    EndDateEmpEmploymentType = a.EmpEmploymentType.DateTo,
                    AttendanceFormatID = a.EmployeeAttendanceFormat.AttendanceFormatID,
                    AttendanceDefault =
                        a.EmployeeAttendanceFormat.AttendanceFormat.AttendanceFormatDetails
                                                           .FirstOrDefault(x => x.DayID == dayID).AttendanceFrom.ToString() + " __ " +
                                                            a.EmployeeAttendanceFormat.AttendanceFormat.AttendanceFormatDetails
                                                           .FirstOrDefault(x => x.DayID == dayID).AttendanceTo.ToString()
                                                           ,
                    QualificationTypeID = a.EmployeeQualification.QualificationTypeID,
                    Qualification = a.EmployeeQualification.QualificationType.ArName,
                    Specialization = a.EmployeeQualification.Department,
                    QualificationYear = a.EmployeeQualification.GraduateYear,
                    QualificationUniversityName = a.EmployeeQualification.UniversityName,
                    QualificationCountryName = a.EmployeeQualification.Country.ArName,
                    BasicSalary = emp.BasicSalary,
                    BasicSalaryCurrency = emp.BasicSalaryCurrency,
                    //employeePlacementDto = employeePlacementDto,
                    IsFullTime = a.b.IsFullTime.Value ? "متفرغ" : "غير متفرغ"

                };


            return result.ToList();
        }

        public List<EmployeeDto> EmployeeReportData()
        {
            unitOfWork.HumanResource.Configuration.ProxyCreationEnabled = false;
            var now = DateTime.Now.Date;
            int dayID = ((int)now.DayOfWeek) + 2;
            dayID = (dayID == 8) ? 1 : dayID;

            var result =
                from emp in unitOfWork.HumanResource.EmployeeReportData
                    .Select(b => new
                    {
                        b.ID,
                        b.BasicSalary,
                        b.BasicSalaryCurrency,
                    })
                join a in unitOfWork.HumanResource.EmployeePersonal.Clean()
                    .Select(b => new
                    {
                        AllData = b,
                        b.EmployeeID,
                        EmpStatus = b.EmpStatus.OrderByDescending(o => o.ID).FirstOrDefault(x =>
                            (now >= x.DateFrom && (now <= x.DateTo || x.DateTo == null)) && !x.IsDelete),
                        EmpEmploymentType = b.EmpEmploymentType.OrderByDescending(o => o.ID).FirstOrDefault(x =>
                            !x.IsDelete && (now >= x.DateFrom && (now <= x.DateTo || x.DateTo == null))),
                        EmployeeAttendanceFormat = b.EmployeeAttendanceFormat.OrderByDescending(o => o.ID).FirstOrDefault(x => !x.IsDelete && (now >= x.ActiveFromDate && (now <= x.ActiveToDate || x.ActiveToDate == null))),
                        EmployeeQualification = b.EmployeeQualification.OrderByDescending(o => o.QualificationTypeOrderNum).FirstOrDefault(x => !x.IsDelete),
                    })
                    on emp.ID equals a.EmployeeID into empPersonals
                from empPersonal in empPersonals.DefaultIfEmpty()
                join employeePlacementDto in unitOfWork.HumanResource.EmployeePlacement
                        .Where(x => !x.IsDelete && (now >= x.DateFrom && (now <= x.DateTo || x.DateTo == null)))
                        .Select(x => new EmployeePlacementDto
                        {
                            EmployeeID = x.EmployeeID,
                            JobTitle = x.Job.JobTitle,
                            DManagerID = x.DManagerID,
                            ManagerName = x.EmployeePersonal1.ArFirstName + " " +
                                          x.EmployeePersonal1.ArSecoundName + " " +
                                          x.EmployeePersonal1.ArFamilyName,
                            CaderID = x.CaderID,
                            CaderName = x.Cader.Name,
                            PlacementStatusID = x.PlacementStatusID,
                            PlacementStatus = x.PlacementStatus.Name,
                            PlacementTypeID = x.PlacementTypeID,
                            PlacementType = x.PlacementType.Name,
                            Placement = x.Department,
                            PlacementFather = x.Department.Department2,
                            PlacementGrandFather = x.Department.Department2.Department2,
                            DepartmentTypeID = x.Department.DepartmentTypeID
                        })
                    on emp.ID equals employeePlacementDto.EmployeeID into empPlacements
                from employeePlacementDto in empPlacements.DefaultIfEmpty()
                select new
                {
                    emp,
                    empPersonal,
                    employeePlacementDto
                };


            var t = result.Select(r => new EmployeeDto
            {
                EmployeeID = r.emp.ID,
                EmployeeNo = (r.empPersonal == null) ? null : r.empPersonal.AllData.EmployeeNo,
                ArFirstName = (r.empPersonal == null) ? null : r.empPersonal.AllData.ArFirstName,
                ArSecoundName = (r.empPersonal == null) ? null : r.empPersonal.AllData.ArSecoundName,
                ArThirdName = (r.empPersonal == null) ? null : r.empPersonal.AllData.ArThirdName,
                ArFamilyName = (r.empPersonal == null) ? null : r.empPersonal.AllData.ArFamilyName,
                ArName = (r.empPersonal == null) ? null : r.empPersonal.AllData.ArFirstName + " " + r.empPersonal.AllData.ArSecoundName + " " + r.empPersonal.AllData.ArThirdName + " " + r.empPersonal.AllData.ArFamilyName,
                EnName = (r.empPersonal == null) ? null : r.empPersonal.AllData.EnFirstName + " " + r.empPersonal.AllData.EnSecoundName + " " + r.empPersonal.AllData.EnThirdName + " " + r.empPersonal.AllData.EnFamilyName,
                branch = (r.empPersonal == null) ? null : r.empPersonal.AllData.BranchID == 1 ? "الزهراء" : "يافا",
                CityID = (r.empPersonal == null) ? null : r.empPersonal.AllData.CityID,
                CountryID = (r.empPersonal == null) ? null : r.empPersonal.AllData.CountryID,
                NationalityID = (r.empPersonal == null) ? null : r.empPersonal.AllData.NationalityID,
                GovernorateID = (r.empPersonal == null) ? null : r.empPersonal.AllData.GovernorateID,
                GenderID = (r.empPersonal == null) ? null : r.empPersonal.AllData.GenderID,
                Gender = (r.empPersonal == null) ? null : r.empPersonal.AllData.Gender.ArName,
                SSN = (r.empPersonal == null) ? null : r.empPersonal.AllData.SSN,
                DateOfBirth = (r.empPersonal == null) ? null : r.empPersonal.AllData.DateOfBirth,
                MaritalStatusID = (r.empPersonal == null) ? null : r.empPersonal.AllData.MaritalStatusID,
                MaritalStatus = (r.empPersonal == null) ? null : r.empPersonal.AllData.MaritalStatus.ArName,
                ChildrensCount = (r.empPersonal == null) ? (int?)null : r.empPersonal.AllData.EmployeeFamily.Where(x => x.RelativeTypeID == 7).Count(),
                Mobile = (r.empPersonal == null) ? null : r.empPersonal.AllData.Mobile,
                Email = (r.empPersonal == null) ? null : r.empPersonal.AllData.Email,
                UniversityEmail = (r.empPersonal == null) ? null : r.empPersonal.AllData.UniversityEmail,
                Address = (r.empPersonal == null) ? null : r.empPersonal.AllData.Governorate.ArName + "_" + r.empPersonal.AllData.City.ArName + " _ " + r.empPersonal.AllData.Neighborhood + "_" + r.empPersonal.AllData.Street,
                EmployeeStatusID = (r.empPersonal == null) ? (int?)null : r.empPersonal.EmpStatus.EmployeeStatusID,
                EmployeeStatus = (r.empPersonal == null) ? null : r.empPersonal.EmpStatus.EmployeeStatus.ArName,
                StartDateEmpStatus = (r.empPersonal == null) ? (DateTime?)null : r.empPersonal.EmpStatus.DateFrom,
                EndDateEmpStatus = (r.empPersonal == null) ? null : r.empPersonal.EmpStatus.DateTo,
                EmploymentTypeID = (r.empPersonal == null) ? (int?)null : r.empPersonal.EmpEmploymentType.EmploymentTypeID,
                EmploymentType = (r.empPersonal == null) ? null : r.empPersonal.EmpEmploymentType.EmploymentType.ArName,
                StartDateEmpEmploymentType = (r.empPersonal == null) ? (DateTime?)null : r.empPersonal.EmpEmploymentType.DateFrom,
                EndDateEmpEmploymentType = (r.empPersonal == null) ? null : r.empPersonal.EmpEmploymentType.DateTo,
                AttendanceFormatID = (r.empPersonal == null) ? (int?)null : r.empPersonal.EmployeeAttendanceFormat.AttendanceFormatID,
                AttendanceDefault = (r.empPersonal == null) ? null : r.empPersonal.EmployeeAttendanceFormat.AttendanceFormat.AttendanceFormatDetails.FirstOrDefault(x => x.DayID == dayID).AttendanceFrom.ToString() + " __ " + r.empPersonal.EmployeeAttendanceFormat.AttendanceFormat.AttendanceFormatDetails.FirstOrDefault(x => x.DayID == dayID).AttendanceTo.ToString(),
                QualificationTypeID = (r.empPersonal == null) ? null : r.empPersonal.EmployeeQualification.QualificationTypeID,
                Qualification = (r.empPersonal == null) ? null : r.empPersonal.EmployeeQualification.QualificationType.ArName,
                Specialization = (r.empPersonal == null) ? null : r.empPersonal.EmployeeQualification.Department,
                QualificationYear = (r.empPersonal == null) ? null : r.empPersonal.EmployeeQualification.GraduateYear,
                QualificationUniversityName = (r.empPersonal == null) ? null : r.empPersonal.EmployeeQualification.UniversityName,
                QualificationCountryName = (r.empPersonal == null) ? null : r.empPersonal.EmployeeQualification.Country.ArName,
                BasicSalary = r.emp.BasicSalary,
                BasicSalaryCurrency = r.emp.BasicSalaryCurrency,
                employeePlacementDto = (r.employeePlacementDto == null) ? null : r.employeePlacementDto,
                //employeePlacementCollegeName = (r.employeePlacementDto == null) ? null : r.employeePlacementDto.CollegeName,
                //employeePlacementDepartmentName = (r.employeePlacementDto == null) ? null : r.employeePlacementDto.DepartmentName,
                //employeePlacementSectionName = (r.employeePlacementDto == null) ? null : r.employeePlacementDto.SectionName,
                //employeePlacementDManagerID = (r.employeePlacementDto == null) ? null : r.employeePlacementDto.DManagerID,
                //employeePlacementDepartmentId = (r.employeePlacementDto == null) ? (int?)null : r.employeePlacementDto.DepartmentId,
                //employeePlacementCaderID = (r.employeePlacementDto == null) ? (int?)null : r.employeePlacementDto.CaderID,
                //employeePlacementPlacementTypeID = (r.employeePlacementDto == null) ? (int?)null : r.employeePlacementDto.PlacementTypeID,
                //employeePlacementPlacementStatusID = (r.employeePlacementDto == null) ? (int?)null : r.employeePlacementDto.PlacementStatusID,
                //employeePlacementCollegeId = (r.employeePlacementDto == null) ? (int?)null : r.employeePlacementDto.CollegeId,
                IsFullTime = (r.employeePlacementDto == null) ? null : (r.empPersonal.AllData.IsFullTime.Value ? "متفرغ" : "غير متفرغ")
            });

            return t.ToList();
        }
    }

}


//.Select(b => new
//{
//    EmployeeID = b.EmployeeID,
//    EmployeeNo = b.EmployeeNo,
//    ArFirstName = b.ArFirstName,
//    ArSecoundName = b.ArSecoundName,
//    ArThirdName = b.ArThirdName,
//    ArFamilyName = b.ArFamilyName,
//    ArName = b.ArFirstName + " " + b.ArSecoundName + " " + b.ArThirdName + " " + b.ArFamilyName,
//    EnName = b.EnFirstName + " " + b.EnSecoundName + " " + b.EnThirdName + " " + b.EnFamilyName,
//    branch = b.BranchID == 1 ? "الزهراء" : "يافا",
//    CityID = b.CityID,
//    CountryID = b.CountryID,
//    NationalityID = b.NationalityID,
//    GovernorateID = b.GovernorateID,
//    SSN = b.SSN,
//    DateOfBirth = b.DateOfBirth,
//    MaritalStatusID = b.MaritalStatusID,
//    Mobile = b.Mobile,
//    Email = b.Email,
//    UniversityEmail = b.UniversityEmail,
//    GenderID = b.GenderID,
//    Governorate = b.Governorate,
//    City = b.City,
//    MaritalStatus = b.MaritalStatus.ArName,
//    Gender = b.Gender,
//    EmployeeFamily = b.EmployeeFamily,
//    EmpStatus = b.EmpStatus.OrderByDescending(o => o.ID).FirstOrDefault(x =>
//        (now >= x.DateFrom && (now <= x.DateTo || x.DateTo == null)) && !x.IsDelete),
//    EmpEmploymentType = b.EmpEmploymentType.OrderByDescending(o => o.ID).FirstOrDefault(x =>
//                   !x.IsDelete && (now >= x.DateFrom && (now <= x.DateTo || x.DateTo == null))),
//    EmployeeAttendanceFormat = b.EmployeeAttendanceFormat.OrderByDescending(o => o.ID).FirstOrDefault(x => !x.IsDelete && (now >= x.ActiveFromDate && (now <= x.ActiveToDate || x.ActiveToDate == null))),
//    EmployeeQualification = b.EmployeeQualification.OrderByDescending(o => o.QualificationTypeOrderNum).FirstOrDefault(x => !x.IsDelete),
//    IsFullTime = b.IsFullTime.Value ? "متفرغ" : "غير متفرغ",
//    ChildrensCount = b.EmployeeFamily.Where(x => x.RelativeTypeID == 7).Count()
//})


//select new EmployeeDto
//                {
//                    EmployeeID = emp.ID,
//                    EmployeeNo = empPersonal.AllData.EmployeeNo,
//                    ArFirstName = empPersonal.AllData.ArFirstName,
//                    ArSecoundName = empPersonal.AllData.ArSecoundName,
//                    ArThirdName = empPersonal.AllData.ArThirdName,
//                    ArFamilyName = empPersonal.AllData.ArFamilyName,
//                    ArName = empPersonal.AllData.ArFirstName + " " + empPersonal.AllData.ArSecoundName + " " + empPersonal.AllData.ArThirdName + " " + empPersonal.AllData.ArFamilyName,
//                    EnName = empPersonal.AllData.EnFirstName + " " + empPersonal.AllData.EnSecoundName + " " + empPersonal.AllData.EnThirdName + " " + empPersonal.AllData.EnFamilyName,
//                    branch = empPersonal.AllData.BranchID == 1 ? "الزهراء" : "يافا",
//                    CityID = empPersonal.AllData.CityID,
//                    CountryID = empPersonal.AllData.CountryID,
//                    NationalityID = empPersonal.AllData.NationalityID,
//                    GovernorateID = empPersonal.AllData.GovernorateID,
//                    GenderID = empPersonal.AllData.GenderID,
//                    Gender = empPersonal.AllData.Gender.ArName,
//                    SSN = empPersonal.AllData.SSN,
//                    DateOfBirth = empPersonal.AllData.DateOfBirth,
//                    MaritalStatusID = empPersonal.AllData.MaritalStatusID,
//                    MaritalStatus = empPersonal.AllData.MaritalStatus.ArName,
//                    ChildrensCount = empPersonal.AllData.EmployeeFamily.Where(x => x.RelativeTypeID == 7).Count(),
//                    Mobile = empPersonal.AllData.Mobile,
//                    Email = empPersonal.AllData.Email,
//                    UniversityEmail = empPersonal.AllData.UniversityEmail,
//                    Address = empPersonal.AllData.Governorate.ArName + "_" + empPersonal.AllData.City.ArName + " _ " + empPersonal.AllData.Neighborhood + "_" + empPersonal.AllData.Street,
//                    EmployeeStatusID = empPersonal.EmpStatus.EmployeeStatusID,
//                    EmployeeStatus = empPersonal.EmpStatus.EmployeeStatus.ArName,
//                    StartDateEmpStatus = empPersonal.EmpStatus.DateFrom,
//                    EndDateEmpStatus = empPersonal.EmpStatus.DateTo,
//                    EmploymentTypeID = empPersonal.EmpEmploymentType.EmploymentTypeID,
//                    EmploymentType = empPersonal.EmpEmploymentType.EmploymentType.ArName,
//                    StartDateEmpEmploymentType = empPersonal.EmpEmploymentType.DateFrom,
//                    EndDateEmpEmploymentType = empPersonal.EmpEmploymentType.DateTo,
//                    AttendanceFormatID = empPersonal.EmployeeAttendanceFormat.AttendanceFormatID,
//                    AttendanceDefault =
//                        empPersonal.EmployeeAttendanceFormat.AttendanceFormat.AttendanceFormatDetails
//                                           .FirstOrDefault(x => x.DayID == dayID).AttendanceFrom.ToString() + " __ " +
//                        empPersonal.EmployeeAttendanceFormat.AttendanceFormat.AttendanceFormatDetails
//                                           .FirstOrDefault(x => x.DayID == dayID).AttendanceTo.ToString(),
//                    QualificationTypeID = empPersonal.EmployeeQualification.QualificationTypeID,
//                    Qualification = empPersonal.EmployeeQualification.QualificationType.ArName,
//                    Specialization = empPersonal.EmployeeQualification.Department,
//                    QualificationYear = empPersonal.EmployeeQualification.GraduateYear,
//                    QualificationUniversityName = empPersonal.EmployeeQualification.UniversityName,
//                    QualificationCountryName = empPersonal.EmployeeQualification.Country.ArName,
//                    BasicSalary = emp.BasicSalary,
//                    BasicSalaryCurrency = emp.BasicSalaryCurrency,
//                    employeePlacementDto = employeePlacementDto,
//                    IsFullTime = empPersonal.AllData.IsFullTime.Value? "متفرغ" : "غير متفرغ"

//                };
