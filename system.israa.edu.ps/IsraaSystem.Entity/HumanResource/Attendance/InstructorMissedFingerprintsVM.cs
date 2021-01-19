using IsraaSystem.Entity.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace IsraaSystem.Entity.HumanResource.Attendance
{
    public class InstructorMissedFingerprintsVM
    {
        public InstructorMissedFingerprintsFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public InstructorMissedFingerprintsVM(InstructorMissedFingerprintsFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class InstructorMissedFingerprintsFilter
    {

        public string SemesterID { get; set; }
        public string InstructorID { get; set; }
        public string LectureDateFrom { get; set; }
        public string LectureDateTo { get; set; }

        public List<SelectListItem> Employees { get; set; }
        public List<SelectListItem> Semesters { get; set; }

        public InstructorMissedFingerprintsFilter()
        {
            LectureDateFrom = DateTime.Now.ToString("yyyy/MM/dd");
            LectureDateTo = DateTime.Now.ToString("yyyy/MM/dd");
        }

        public InstructorMissedFingerprintsFilter(string SemesterID, string InstructorID, string LectureDateFrom, string LectureDateTo, List<SelectListItem> Employees, List<SelectListItem> Semesters)
        {
            this.SemesterID = SemesterID;
            this.InstructorID = InstructorID;
            this.LectureDateFrom = DateTime.Now.ToString("yyyy/MM/dd");
            this.LectureDateTo = DateTime.Now.ToString("yyyy/MM/dd");
            this.Employees = Employees;
            this.Semesters = Semesters;
        }
    }
}
