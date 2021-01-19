using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.Academic.OfferdCourse
{
    public class OfferdCourseVM
    {
        public OfferdCourseFilter filter { get; set; }
        public DataTable data { get; set; }

        public OfferdCourseVM(OfferdCourseFilter filter)
        {
            this.filter = filter;
        }
    }

    public class OfferdCourseFilter
    {

        public string SemesterID { get; set; }
        public string DepartmentID { get; set; }
        public string StudyLevelID { get; set; }
        public string CourseCategoryID { get; set; }
        public string OfferdCourseTypeID { get; set; }
        public string CourseCode { get; set; }
        public string CourseName { get; set; }

        public List<SelectListItem> Departments { get; set; }
        public List<SelectListItem> StudyLevels { get; set; }
        public List<SelectListItem> Semesters { get; set; }
        public List<SelectListItem> Categories { get; set; }
        public List<SelectListItem> OfferdCourseTypes { get; set; }
        public OfferdCourseFilter()
        {
        }

        public OfferdCourseFilter(string SemesterID, string DepartmentID, string StudyLevelID, string CourseCategoryID, string OfferdCourseTypeID, string CourseCode, string CourseName, List<SelectListItem> Semesters, List<SelectListItem> Departments, List<SelectListItem> StudyLevels, List<SelectListItem> Categories, List<SelectListItem> OfferdCourseTypes)
        {
            this.SemesterID = Semesters[0].Value;
            this.OfferdCourseTypeID = OfferdCourseTypes[0].Value;
            this.DepartmentID = DepartmentID;
            this.StudyLevelID = StudyLevelID;
            this.CourseCategoryID = CourseCategoryID;
            this.CourseCode = CourseCode;
            this.CourseName = CourseName;
            this.Departments = Departments;
            this.StudyLevels = StudyLevels;
            this.Semesters = Semesters;
            this.Categories = Categories;
            this.OfferdCourseTypes = OfferdCourseTypes;
        }
    }
}
