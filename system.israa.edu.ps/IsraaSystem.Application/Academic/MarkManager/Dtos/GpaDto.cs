namespace IsraaSystem.Application.Academic.MarkManager.Dtos
{
    public class GpaDto
    {
        public int stdSectionID { get; set; }
        public int StdSemesterID { get; set; }
        public int? TransactionID { get; set; }
        public int? CourseStatusID { get; set; }
        public int CourseID { get; set; }
        public bool IsITransCourse { get; set; }
        public bool Accreditation { get; set; }
        public int TotalMark { get; set; }
        public bool AcademicAccreditation { get; set; }
        public int NumOfHours { get; set; }
        public int? SemesterTypeID { get; set; }
        public bool SemesterIsDelete { get; set; }
        public bool StdSemesterIsDelete { get; set; }
        public int SemesterID { get; set; }
        public int AcademicWarning { get; set; }
        public bool IsCancelAcademicWarning { get; set; }
        public int SemesterStatusID { get; set; }
        public double? SemesterGPA { get; set; }
        public double? SemesterCumulativeGPA { get; set; }
        public int? SemesterCumulativeHours { get; set; }
        public int PlaneSumOfHourse { get; set; }
        public int? ITransWithCourseID { get; set; }
        public int? FilterdCourseID { get; set; }
        public int MainNumOfHours { get; set; }

        public string ETransWithCourseName { get; set; }
        public int? ETransWithCourseHours { get; set; }
    }
}