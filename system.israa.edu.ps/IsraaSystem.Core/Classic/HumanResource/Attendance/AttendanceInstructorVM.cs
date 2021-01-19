using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Attendance
{
    public class AttendanceInstructorVM
    {
        public AttendanceInstructorFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }
        public DataTable contract { get; set; }
        public AttendanceInstructorVM()
        {

        }

        public AttendanceInstructorVM(AttendanceInstructorFilter filter)
        {
            this.filter = filter;
        }

        public AttendanceInstructorVM(AttendanceInstructorFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class AttendanceInstructorFilter
    {
        public string SemesterID { get; set; }
        public string EmploymentTypeID { get; set; }
        public string InstructorID { get; set; }
        public string InstructorName { get; set; }
        public string LectureDateFrom { get; set; }
        public string LectureDateTo { get; set; }
        public string AttendanceInstructorStatusID { get; set; }

        public List<SelectListItem> Employees { get; set; }
        public List<SelectListItem> Semesters { get; set; }
        public List<SelectListItem> EmploymentTypes { get; set; }
        public List<SelectListItem> AttendanceInstructorStatuses { get; set; }

        public AttendanceInstructorFilter()
        {
            LectureDateFrom = DateTime.Now.ToString("yyyy/MM/dd");
            LectureDateTo = DateTime.Now.ToString("yyyy/MM/dd");
        }

        public AttendanceInstructorFilter(List<SelectListItem> Employees)
        {
            this.Employees = Employees;
            LectureDateFrom = DateTime.Now.ToString("yyyy/MM/dd");
            LectureDateTo = DateTime.Now.ToString("yyyy/MM/dd");
        }

        public AttendanceInstructorFilter(string EmploymentTypeID, string InstructorName, List<SelectListItem> EmploymentTypes, List<SelectListItem> Semesters, List<SelectListItem> AttendanceInstructorStatuses)
        {
            this.SemesterID = Semesters[0].Value;
            this.EmploymentTypeID = EmploymentTypeID;
            this.InstructorName = InstructorName;
            LectureDateFrom = DateTime.Now.ToString("yyyy/MM/dd");
            LectureDateTo = DateTime.Now.ToString("yyyy/MM/dd");
            this.Semesters = Semesters;
            this.EmploymentTypes = EmploymentTypes;
            this.AttendanceInstructorStatuses = AttendanceInstructorStatuses;
        }

        public AttendanceInstructorFilter(string InstructorID, string EmploymentTypeID, string SemesterID, List<SelectListItem> Employees, List<SelectListItem> Semesters, List<SelectListItem> EmploymentTypes, List<SelectListItem> AttendanceInstructorStatuses)
        {
            this.SemesterID = SemesterID;
            this.InstructorID = InstructorID;
            this.LectureDateFrom = DateTime.Now.ToString("yyyy/MM/dd");
            this.LectureDateTo = DateTime.Now.ToString("yyyy/MM/dd");
            this.Employees = Employees;
            this.Semesters = Semesters;
            this.EmploymentTypes = EmploymentTypes;
            this.AttendanceInstructorStatuses = AttendanceInstructorStatuses;
        }

        public AttendanceInstructorFilter(string SemesterID, string InstructorID, string InstructorName, string LectureDateFrom, string LectureDateTo, List<SelectListItem> Employees, List<SelectListItem> Semesters, List<SelectListItem> AttendanceInstructorStatuses)
        {
            this.SemesterID = SemesterID;
            this.InstructorID = InstructorID;
            this.InstructorName = InstructorName;
            this.LectureDateFrom = DateTime.Now.ToString("yyyy/MM/dd");
            this.LectureDateTo = DateTime.Now.ToString("yyyy/MM/dd");
            this.Employees = Employees;
            this.Semesters = Semesters;
            this.AttendanceInstructorStatuses = AttendanceInstructorStatuses;
        }
    }
}
