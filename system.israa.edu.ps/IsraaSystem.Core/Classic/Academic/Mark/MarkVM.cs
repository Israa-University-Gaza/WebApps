using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.Academic.Mark
{
    public class MarkVM
    {

        public MarkVM()
        {

        }
        public MarkVM(MarkFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }

        public MarkFilter filter { get; set; }
        public DataTable data { get; set; }
        public IList<string> SelectedRows { get; set; }
        public DataTable SectionMarkDetails { get; set; }

        public Pagging pagging { get; set; }

    }

    public class MarkFilter
    {
        public string ProgramID { get; set; }
        public string SemesterID { get; set; }
        public string CollegeID { get; set; }
        public string DepartmentID { get; set; }
        public string OfferdCourseID { get; set; }
        public string SectionID { get; set; }


        public List<SelectListItem> Departments { get; set; }
        public List<SelectListItem> Programs { get; set; }
        public List<SelectListItem> Semesters { get; set; }
        public List<SelectListItem> Colleges { get; set; }
        public List<SelectListItem> OfferdCourses { get; set; }
        public List<SelectListItem> Sections { get; set; }
        public MarkFilter()
        {

        }

        public MarkFilter(string SectionID, List<SelectListItem> Sections)
        {
            this.SectionID = Sections[0].Value;
            this.Sections = Sections;

        }


    }
}
