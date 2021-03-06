﻿using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Core.Classic.HumanResource.EmployeeEmergencyInfo
{
    public class EmployeeEmergencyInfoVM
    {
        public EmployeeEmergencyInfoFilter filter { get; set; }
        public Pagging pagging { get; set; }
        public DataTable data { get; set; }

        public EmployeeEmergencyInfoVM(EmployeeEmergencyInfoFilter filter, Pagging pagging)
        {
            this.filter = filter;
            this.pagging = pagging;
        }
    }

    public class EmployeeEmergencyInfoFilter
    {
        public int EmployeeID { get; set; }
        public string ArFirstName { get; set; }
        public string ArSecoundName { get; set; }
        public string ArThirdName { get; set; }
        public string ArFamilyName { get; set; }
        public string RelativeTypeID { get; set; }

        public List<SelectListItem> RelativeTypes { get; set; }

        public EmployeeEmergencyInfoFilter()
        {
        }

        public EmployeeEmergencyInfoFilter(int EmployeeID)
        {
            this.EmployeeID = EmployeeID;
        }

        public EmployeeEmergencyInfoFilter(int EmployeeID, string ArFirstName, string ArSecoundName, string ArThirdName, string ArFamilyName, string RelativeTypeID, List<SelectListItem> RelativeTypes)
        {
            this.EmployeeID = EmployeeID;
            this.ArFirstName = ArFirstName;
            this.ArSecoundName = ArSecoundName;
            this.ArThirdName = ArThirdName;
            this.ArFamilyName = ArFamilyName;
            this.RelativeTypeID = RelativeTypeID;
            this.RelativeTypes = RelativeTypes;
        }
    }
}