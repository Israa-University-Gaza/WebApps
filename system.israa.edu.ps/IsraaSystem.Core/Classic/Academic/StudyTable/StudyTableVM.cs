using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.Academic.StudyTable
{
    public class StudyTableVM
    {
        public StudyTableFilter filter { get; set; }

        public StudyTableVM()
        {
        }

        public StudyTableVM(StudyTableFilter filter)
        {
            this.filter = filter;
        }
    }

    public class StudyTableFilter
    {
        public string SemesterID { get; set; }
        public string DepartmentID { get; set; }
        public string StudyLevelID { get; set; }
        public string GenderID { get; set; }
        public string InstructorID { get; set; }
        public string CourseID { get; set; }

        public string SectionID { get; set; }
        public string RoomID { get; set; }

        public string CollegeID { get; set; }

        public string ProgramID { get; set; }

        public string BranchID { get; set; }



        public DataTable Data { get; set; }

        public List<SelectListItem> Semesters { get; set; }
        public List<SelectListItem> Departments { get; set; }
        public List<SelectListItem> StudyLevels { get; set; }
        public List<SelectListItem> Genders { get; set; }
        public List<SelectListItem> Instructors { get; set; }
        public List<SelectListItem> Courses { get; set; }
        public List<SelectListItem> Sections { get; set; }
        public List<SelectListItem> Rooms { get; set; }
        public List<SelectListItem> CollegesWithoutProgram { get; set; }
        public List<SelectListItem> Colleges { get; set; }

        public List<SelectListItem> Programs { get; set; }

        public List<SelectListItem> Branches { get; set; }


        public StudyTableFilter()
        {
        }

        public StudyTableFilter(List<SelectListItem> Semesters, List<SelectListItem> Departments, List<SelectListItem> StudyLevels, List<SelectListItem> Genders)
        {
            this.Departments = Departments;
            this.Semesters = Semesters;
            this.StudyLevels = StudyLevels;
            this.Genders = Genders;

        }

        public StudyTableFilter(List<SelectListItem> Semesters, List<SelectListItem> Departments, List<SelectListItem> StudyLevels, List<SelectListItem> Genders, List<SelectListItem> Instructors, List<SelectListItem> Courses, List<SelectListItem> Sections, List<SelectListItem> Rooms, List<SelectListItem> CollegesWithoutProgram, List<SelectListItem> Colleges, List<SelectListItem> Programs, List<SelectListItem> Branches)
        {
            this.Semesters = Semesters;
            this.Departments = Departments;
            this.StudyLevels = StudyLevels;
            this.Genders = Genders;
            this.Instructors = Instructors;
            this.Courses = Courses;
            this.Sections = Sections;
            this.Rooms = Rooms;
            this.CollegesWithoutProgram = CollegesWithoutProgram;
            this.Colleges = Colleges;
            this.Programs = Programs;
            this.Branches = Branches;

        }
    }
}
