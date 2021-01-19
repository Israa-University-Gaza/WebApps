using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeSkill
{
    public class EmployeeSkillVM
    {
        public EmployeeSkillFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeeSkillVM(EmployeeSkillFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeeSkillFilter
    {
        public int EmployeeID { get; set; }
        public string SkillTypeID { get; set; }
        public string KnowLevelID { get; set; }

        public List<SelectListItem> SkillTypes { get; set; }
        public List<SelectListItem> KnowLevels { get; set; }

        public EmployeeSkillFilter()
        {
        }

        public EmployeeSkillFilter(int EmployeeID)
        {
            this.EmployeeID = EmployeeID;
        }
        public EmployeeSkillFilter(int EmployeeID, string SkillTypeID, string KnowLevelID, List<SelectListItem> SkillTypes, List<SelectListItem> KnowLevels)
        {
            this.EmployeeID = EmployeeID;
            this.SkillTypeID = SkillTypeID;
            this.KnowLevelID = KnowLevelID;
            this.SkillTypes = SkillTypes;
            this.KnowLevels = KnowLevels;
        }
    }
}
