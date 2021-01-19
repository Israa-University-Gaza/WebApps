using System;
using System.Collections.Generic;
using System.Web.Mvc;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;

namespace IsraaSystem.Web.Areas.HumanResource.Models.EmployeeReport
{
    public class EmployeeReportVm : EmployeeReportData
    {
        public List<EmployeeReportData> result { get; set; }

        public DateTime? DateOfBirthFrom { get; set; }
        public DateTime? DateOfBirthTo { get; set; }

        public DateTime? StartDateEmpStatusFrom { get; set; }
        public DateTime? StartDateEmpStatusTo { get; set; }

        public DateTime? EndDateEmpStatusFrom { get; set; }
        public DateTime? EndDateEmpStatusTo { get; set; }

        public DateTime? StartDateEmpEmploymentTypeFrom { get; set; }
        public DateTime? StartDateEmpEmploymentTypeTo { get; set; }

        public DateTime? EndDateEmpEmploymentTypeFrom { get; set; }
        public DateTime? EndDateEmpEmploymentTypeTo { get; set; }

        public double? BasicSalaryFrom { get; set; }
        public double? BasicSalaryTo { get; set; }

        public int? NationalityID { get; set; }

        public int? CountryID { get; set; }
        public int? GovernorateID { get; set; }
        public int? CityID { get; set; }

        public int? DepartmentID { get; set; }
        public int? JobID { get; set; }
        public int? DManagerID { get; set; }
        public int? EmployeeStatusID { get; set; }
        public int? AttendanceFormatID { get; set; }

        public string EnFirstName { get; set; }
        public string EnSecoundName { get; set; }
        public string EnThirdName { get; set; }
        public string EnFamilyName { get; set; }
        public string PlaceOfBirth { get; set; }
        public string Phone { get; set; }
        public string EmployeePlacement_DateFrom { get; set; }
        public string EmployeePlacement_DateTo { get; set; }
        public string EmpStatus_DateFrom { get; set; }
        public string EmpStatus_DateTo { get; set; }
        public string EmpEmploymentType_DateFrom { get; set; }
        public string EmpEmploymentType_DateTo { get; set; }
        public string EmployeeAttendanceFormat_ActiveFromDate { get; set; }
        public string EmployeeAttendanceFormat_ActiveToDate { get; set; }


        public List<int?> ddlEmployeeStatuses { get; set; }
        public List<int?> ddlEmploymentTypes { get; set; }
        public List<int?> ddlAttendanceFormats { get; set; }
        public List<int?> ddlDepartments { get; set; }

        public List<int?> ddlCader { get; set; }




        public List<SelectListItem> Countries { get; set; }
        public List<SelectListItem> Governorates { get; set; }
        public List<SelectListItem> Cities { get; set; }
        public List<SelectListItem> Departments { get; set; }
        public List<SelectListItem> Jobs { get; set; }
    }
}