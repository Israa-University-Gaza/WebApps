using IsraaSystem.Entity.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace IsraaSystem.Entity.Exam
{
    public class ExamVM
    {

        public ExamVM(ExamFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
        public ExamFilter filter { get; set; }
        public DataTable data { get; set; }
        public Pagging pagging { get; set; }

    }

    public class ExamFilter
    {

        public string SemesterID { get; set; }
        public string BranchID { get; set; }
        public string Date { get; set; }
        public string Time { get; set; }
        public string CourseName { get; set; }
        public string CourseCode { get; set; }


        public List<SelectListItem> Semesters { get; set; }
        public List<SelectListItem> Branches { get; set; }
        public List<SelectListItem> Dates { get; set; }
        public List<SelectListItem> Times { get; set; }
        public ExamFilter()
        {

        }

    }

}
