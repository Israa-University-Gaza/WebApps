using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.Document
{
    public class EmployeeDocumentsVM
    {
        public EmployeeDocumentsFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeeDocumentsVM(EmployeeDocumentsFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeeDocumentsFilter
    {
        public int EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public string DocumentTypeID { get; set; }

        public List<SelectListItem> DocumentTypes { get; set; }

        public EmployeeDocumentsFilter()
        {
            EmployeeID = -1;
        }
        public EmployeeDocumentsFilter(int EmployeeID)
        {
            this.EmployeeID = EmployeeID;
        }
        public EmployeeDocumentsFilter(string EmployeeName, string DocumentTypeID, List<SelectListItem> DocumentTypes)
        {
            EmployeeID = -1;
            this.EmployeeName = EmployeeName;
            this.DocumentTypeID = DocumentTypeID;
            this.DocumentTypes = DocumentTypes;
        }
    }
}
