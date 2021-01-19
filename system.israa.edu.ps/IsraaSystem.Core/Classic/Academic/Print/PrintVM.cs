using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;

namespace IsraaSystem.Core.Classic.Academic.Print
{
    public class PrintVM
    {
        public PrintVM(DataTable data, PrintFilter filter)
        {
            Data = data;
            Filter = filter;
        }

        public DataTable Data { get; set; }

        public PrintFilter Filter { get; set; }



    }

    public class PrintFilter
    {
        public PrintFilter(List<SelectListItem> branches)
        {
            Branches = branches;
        }



        public string BranchID { get; set; }
        public List<SelectListItem> Branches { get; set; }

    }
}
