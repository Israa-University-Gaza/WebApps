using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeLanguage
{
    public class EmployeeLanguageVM
    {
        public EmployeeLanguageFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeeLanguageVM(EmployeeLanguageFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeeLanguageFilter
    {
        public int EmployeeID { get; set; }
        public string LanguageID { get; set; }
        public string ReadingKnowLevelID { get; set; }
        public string WritingKnowLevelID { get; set; }
        public string SpeakingKnowLevelID { get; set; }

        public List<SelectListItem> Languages { get; set; }
        public List<SelectListItem> ReadingKnowLevels { get; set; }
        public List<SelectListItem> WritingKnowLevels { get; set; }
        public List<SelectListItem> SpeakingKnowLevels { get; set; }

        public EmployeeLanguageFilter()
        {
        }

        public EmployeeLanguageFilter(int EmployeeID)
        {
            this.EmployeeID = EmployeeID;
        }

        public EmployeeLanguageFilter(int EmployeeID, string LanguageID, string ReadingKnowLevelID, string WritingKnowLevelID, string SpeakingKnowLevelID, List<SelectListItem> Languages, List<SelectListItem> ReadingKnowLevels, List<SelectListItem> WritingKnowLevels, List<SelectListItem> SpeakingKnowLevels)
        {
            this.EmployeeID = EmployeeID;
            this.LanguageID = LanguageID;
            this.ReadingKnowLevelID = ReadingKnowLevelID;
            this.WritingKnowLevelID = WritingKnowLevelID;
            this.SpeakingKnowLevelID = SpeakingKnowLevelID;
            this.Languages = Languages;
            this.ReadingKnowLevels = ReadingKnowLevels;
            this.WritingKnowLevels = WritingKnowLevels;
            this.SpeakingKnowLevels = SpeakingKnowLevels;
        }
    }
}
