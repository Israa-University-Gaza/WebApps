    public class StudentMarkDto
    {
        public int StdSectionId { get; set; }

        public int MarkId { get; set; }
        public int WorkMark { get; set; }
        public int MidtermMark { get; set; }
        public int FinalMark { get; set; }
        public int TotalMark { get; set; }
        public bool finalTeacherAccreditation { get; set; }
        public bool midTeacherAccreditation { get; set; }
        public bool finalHeadAccreditation { get; set; }
        public bool midHeadAccreditation { get; set; }
        public bool finalDeanAccreditation { get; set; }
        public bool midDeanAccreditation { get; set; }
        public bool finalAcademicAccreditation { get; set; }
        public bool midAcademicAccreditation { get; set; }
        public int StudentID { get; set; }
        public string StudentName { get; set; }
        public string StudentNo { get; set; }
        public bool IsMidtermNoMark { get; set; }
        public bool IsFinalNoMark { get; set; }
        public int OfferdCourseTypeID { get; set; }
        public int CourseID { get; set; }
        public int? CourseTypeID { get; set; }
        public bool IsRemedialCourse { get; set; }
        public bool IsInsertMidtermMark { get; set; }
        public bool IsSuccess { get; set; }
        public bool IsMidtermIncomplete { get; set; }
        public bool? IsMidtermNoMarkAccept { get; set; }
        public bool? IsMidtermZero { get; set; }
        public bool? IsFinalNoMarkAccept { get; set; }
        public bool IsFinalZero { get; set; }
        public bool IsFinalIncomplete { get; set; }
    }