using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Holiday
{
    public class HolidayVM
    {
        public HolidayFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public HolidayVM(HolidayFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class HolidayFilter
    {
        public string HolidayTypeID { get; set; }
        public string DateFrom { get; set; }
        public string DateTo { get; set; }
        public List<SelectListItem> HolidayTypes { get; set; }

        public HolidayFilter()
        {
        }

        public HolidayFilter(string HolidayTypeID, string DateFrom, string DateTo, List<SelectListItem> HolidayTypes)
        {
            this.HolidayTypeID = HolidayTypeID;
            this.DateFrom = DateFrom;
            this.DateTo = DateTo;
            this.HolidayTypes = HolidayTypes;
        }
    }
}
