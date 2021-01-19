using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using IsraaSystem.Application.Common.Enums.Academic;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaRepository;
using log4net;

namespace IsraaSystem.Application.Helper
{

    public static class DropDownHelpper
    {
        private static IsraaAcademicEntities Academic = new IsraaAcademicEntities();
        private static IsraaRepositoryEntities Repository = new IsraaRepositoryEntities();
        private static IsraaHumanResourceEntities HumanResource = new IsraaHumanResourceEntities();

        public static List<SelectListItem> FinalExamDate(int semesterId = (int)SemestersEnum.ExamSemester)
        {

            List<SelectListItem> list = new List<SelectListItem>();
            list = Academic.OfferdCourse.Where(x => x.SemesterID == semesterId &&
                                                                       x.AcademicAccreditation &&
                                                                       x.IsFinalExam).Where(x => x.FinalExamDate != null).Select(x => new SelectListItem()
                                                                       {
                                                                           Value = x.FinalExamDate.ToString(),
                                                                           Text = x.FinalExamDate.ToString()
                                                                       }).Distinct().ToList();
            return list;
        }

        public static List<SelectListItem> MidExamDate(int semesterId = (int)SemestersEnum.ExamSemester)
        {

            List<SelectListItem> list = new List<SelectListItem>();
            list = Academic.OfferdCourse.Where(x => x.SemesterID == semesterId &&
                                                    x.AcademicAccreditation &&
                                                    x.IsMidtermExam.Value).Where(x => x.MidtermExamDate != null).Select(x => new SelectListItem()
                                                    {
                                                        Value = x.MidtermExamDate.ToString(),
                                                        Text = x.MidtermExamDate.ToString()
                                                    }).Distinct().ToList();
            return list;
        }

        public static List<SelectListItem> FinalExamPeriods(DateTime? date , int semesterId = (int)SemestersEnum.ExamSemester)
        {
            List<SelectListItem> list = new List<SelectListItem>();


            list = Academic.OfferdCourse
                .Where(x => x.SemesterID == semesterId  &&
                            x.AcademicAccreditation &&
                            x.IsFinalExam).Select(x => new SelectListItem()
                            {
                                Value = x.FinalExamTimeFrom1.ToString(),
                                Text = x.FinalExamTimeFrom1.ToString()
                            }).Distinct().ToList();
            return list;
        }

        public static List<SelectListItem> MidExamPeriods(DateTime? date)
        {
            List<SelectListItem> list = new List<SelectListItem>();
            if (date == null)
                return list;

            list = Academic.OfferdCourse.Where(x => x.MidtermExamDate == date &&
                                                    x.AcademicAccreditation &&
                                                    x.IsMidtermExam.Value).Select(x => new SelectListItem()
                                                    {
                                                        Value = x.MidtermExamTimeFrom1.ToString(),
                                                        Text = x.MidtermExamTimeFrom1.ToString() + " _ " + x.MidtermExamTimeTo1.ToString()
                                                    }).Distinct().ToList();
            return list;
        }

        public static List<SelectListItem> MaterialType()
        {
            List<SelectListItem> list = new List<SelectListItem>();
            list = Repository.MaterialType.Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.Name.ToString()
            }).ToList();
            return list;

        }

        public static List<SelectListItem> MaterialUnit()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Repository.MaterialUnit.Where(x => x.IsDelete == false).Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.Name.ToString()
            }).ToList();

            return list;

        }

        //اضافة قائمة للأقسام الفرعية
        public static List<SelectListItem> Departments()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Repository.RepositoryDepartment.Where(x => x.IsDelete == false).Select(x => new SelectListItem()
            {
                Value = x.Id.ToString(),
                Text = x.Name.ToString()
            }).ToList();

            return list;

        }
        public static List<SelectListItem> DepartmentsSelected(int materialId)
        {
            List<SelectListItem> list = new List<SelectListItem>();


            //var d = Repository.RepositoryDepartment
            //       .SelectMany(x => x.RepositoryTransaction)
            //       .Where(c => c.MaterialId == materialId).Select(x => new
            //       {
            //            x.DepartmentId,
            //            importQuntity = x.ImportId != null ? x.Quantity : 0,
            //            exportQuntity = x.ExportId != null ? x.Quantity : 0,
            //            RepositoryDepartmentName = x.RepositoryDepartment.Name
            //       })
            //       .GroupJoin(x => x.DepartmentId)
            //       .Select(x => new SelectListItem()
            //       {
            //            Value = x.Key.ToString(),
            //            Text

            //       });


            //list = Repository.RepositoryTransaction.Where(x => x.IsDelete == false && x.MaterialId == materialId).Select(x => new SelectListItem()
            //{
            //    Value = x.DepartmentId.ToString(),
            //    Text = x.RepositoryDepartment.Name
            //}).ToList();

            return list;

        }

        public static List<SelectListItem> Materials()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Repository.Material.Where(x => x.IsDelete == false).Select(x => new SelectListItem()
            {
                Value = x.Id.ToString(),
                Text = x.Name.ToString()
            }).ToList();

            return list;

        }
        public static List<SelectListItem> MaterialsWithUnit()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Repository.Material.Clean().Select(x => new SelectListItem()
            {
                Value = x.Id.ToString(),
                Text = x.Name.ToString() + " _ " + x.MaterialUnit.Name.ToString()
            }).ToList();

            return list;

        }
        public static List<SelectListItem> GetMaterialsByDepartment(int DepartmentId)
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Repository.RepositoryBalance.Where(x => x.RepositoryDeparmentId == DepartmentId && x.IsDelete == false).Select(x => new SelectListItem()
            {
                Value = x.Material.Id.ToString(),
                Text = x.Material.Name.ToString() + " _ " + x.Quantity.ToString() + " " + x.MaterialUnit.Name.ToString()
            }).ToList();

            return list;

        }
        public static List<SelectListItem> GetDepartmentsByMaterial(int MaterialId)
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Repository.RepositoryBalance.Where(x => x.MaterialId == MaterialId && x.UnitId == x.Material.UnitId && x.IsDelete == false).Select(x => new SelectListItem()
            {
                Value = x.RepositoryDepartment.Id.ToString(),
                Text = x.RepositoryDepartment.Name.ToString()
            }).ToList();

            return list;

        }
        public static List<SelectListItem> GetMaterialUnConsumeByDepartment(int DepartmentId)
        {
            List<SelectListItem> list = new List<SelectListItem>();
            list = Repository.RepositoryBalance.Where(x => x.RepositoryDeparmentId == DepartmentId && x.Material.IsConsumed == false && x.IsDelete == false).Select(x => new SelectListItem()
            {
                Value = x.Material.Id.ToString(),
                Text = x.Material.Name.ToString() + " _ " + x.Quantity.ToString() + " " + x.MaterialUnit.Name.ToString()
            }).ToList();

            return list;

        }
        public static List<SelectListItem> GetMaterialByEmployee(int EmployeeId)
        {
            List<SelectListItem> list = new List<SelectListItem>();
            list = Repository.RepositoryCustody.Where(x => x.EmployeeId == EmployeeId && x.IsDelete == false).Select(x => new SelectListItem()
            {
                Value = x.Material.Id.ToString(),
                Text = x.Material.Name.ToString() + " _ " + x.Quantity.ToString()
            }).ToList();

            return list;

        }
        public static List<SelectListItem> Suppliers()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Repository.Supplier.Where(x => x.IsDelete == false).Select(x => new SelectListItem()
            {
                Value = x.Id.ToString(),
                Text = x.Name.ToString()
            }).ToList();

            return list;

        }

        public static List<SelectListItem> TransactionTypes()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Repository.TransactionType.Where(x => x.IsDelete == false).Select(x => new SelectListItem()
            {
                Value = x.Id.ToString(),
                Text = x.Name.ToString()
            }).ToList();

            return list;

        }


        public static List<SelectListItem> MaterialTypes()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Repository.MaterialType.Where(x => x.IsDelete == false).Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.Name.ToString()
            }).ToList();
            return list;
        }



        public static List<SelectListItem> CustodyType()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Repository.CustodyType.Where(x => x.IsDelete == false).Select(x => new SelectListItem()
            {
                Value = x.Id.ToString(),
                Text = x.Name.ToString()
            }).ToList();

            return list;

        }
        public static List<SelectListItem> RequestStatus()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Repository.RequestStatus.Where(x => x.IsDelete == false).Select(x => new SelectListItem()
            {
                Value = x.Id.ToString(),
                Text = x.Name.ToString()
            }).ToList();

            return list;

        }
        public static List<SelectListItem> Semesters()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Academic.Semester.Clean().Where(x => x.ID != 1).OrderByDescending(x => x.ID).Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.ArName
            }).ToList();

            return list;

        }


        public static List<SelectListItem> SemestersShortName()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Academic.Semester.Clean().Where(x => x.ID != 1).OrderByDescending(x => x.ID).Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.ArShortName
            }).ToList();

            return list;

        }



        public static List<SelectListItem> ddlFilterdOfferdCourses(int departmentId, int studyLevelId, int semesterId)
        {
            List<SelectListItem> list = new List<SelectListItem>();

            var sectiondepartmentcourse = Academic.SectionDepartment.Where(x => !x.IsDelete && (x.DepartmentID == departmentId || departmentId == -1) && (x.StudyLevelID == studyLevelId || studyLevelId == -1)).Select(x => x.OfferdCourse.Course);


            var departmentcourse = Academic.Course.Where(x => x.DepartmentID == departmentId && !x.IsDelete && x.IsActive);

            list = Academic.OfferdCourse.Where(
                x => (x.SemesterID == semesterId || semesterId == -1)
                && (sectiondepartmentcourse.Any(r => r.ID == x.CourseID) || (departmentcourse.Any(t => t.ID == x.CourseID)))
                && !x.IsDelete
                ).Select(x => new SelectListItem()
                {
                    Value = x.ID.ToString(),
                    Text = x.Course.CourseCode.ToString() + " _ " + x.Course.ArName.ToString()
                }).ToList();

            return list;


        }


        public static List<SelectListItem> SpecialOfferedCourseTypes()
        {
            List<SelectListItem> list = new List<SelectListItem>();
            list.Add(new SelectListItem() { Value = "2", Text = "مكتبي" });
            list.Add(new SelectListItem() { Value = "3", Text = "صيفي" });

            return list;

        }



        #region HumanResource

        public static List<SelectListItem> HumanResourceDepartments()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = HumanResource.Department.Where(x => x.IsDelete == false).Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.DisplayName.ToString()
            }).ToList();

            return list;

        }

        public static List<SelectListItem> HumanResourceDepartmentTypes()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = HumanResource.DepartmentType.Where(x => x.IsDelete == false).Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.Name.ToString()
            }).ToList();

            return list;

        }

        public static List<SelectListItem> Jops()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = HumanResource.Job.Where(x => x.IsDelete == false).Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.JobTitle.ToString()
            }).ToList();

            return list;

        }

        public static List<SelectListItem> Caders()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = HumanResource.Cader.Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.Name.ToString()
            }).ToList();

            return list;

        }

        public static List<SelectListItem> CaderDegrees(int caderId)
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = HumanResource.CaderDegree.Where(x => x.CaderID == caderId).Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.Name.ToString()
            }).ToList();

            return list;

        }
        #endregion

        #region Affairs

        public static List<SelectListItem> VolunteerTypes()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Academic.VolunteerType.Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.Name.ToString()
            }).ToList();
            return list;
        }

        public static List<SelectListItem> VolunteerCategores()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Academic.VolunteerCategory.Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.Name.ToString()
            }).ToList();
            return list;
        }

        #endregion


        #region Academic

        public static List<SelectListItem> AcademicDepartments()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Academic.Department.Where(x => !x.IsDelete).Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.ArName.ToString()
            }).ToList();

            return list;

        }

        public static List<SelectListItem> Rooms()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Academic.Room.Where(x => !x.IsDelete).Select(x => new SelectListItem()
            {
                Value = x.ID.ToString(),
                Text = x.Name.ToString()
            }).ToList();

            return list;

        }


        public static List<SelectListItem> FinalExamDates(int semesterID)
        {
            List<SelectListItem> list = new List<SelectListItem>();

            list = Academic.OfferdCourse
                .Where(x => !x.IsDelete)
                .Where(x => x.AcademicAccreditation)
                .Select(x => x.FinalExamDate)
                .Distinct()
                .OrderBy(x => x).Select(x => new SelectListItem()
                {
                    Value = x.ToString(),
                    Text = x.ToString()
                }).ToList();

            return list;

        }

        public static List<SelectListItem> FilterdOfferdCourses(int departmentId, int studyLevelId, int semesterId)
        {
           return Academic.SectionDepartment
                .Where(x => !x.IsDelete)
                .Where(x => x.StudyLevelID == studyLevelId)
                .Where(x => !x.OfferdCourse.IsDelete)
                .Where(x => x.OfferdCourse.SemesterID == semesterId)
                .Where(x => x.DepartmentID == departmentId)
                .Select(x => new SelectListItem()
                {
                    Value = x.OfferdCourse.ID.ToString(),
                    Text = "(" + x.OfferdCourse.Course.CourseCode + ") " + x.OfferdCourse.Course.ArName
                }).Distinct()
                .ToList();

        }



        #endregion

    }
}