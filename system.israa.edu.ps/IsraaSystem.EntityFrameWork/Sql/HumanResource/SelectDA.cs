using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mvc;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class SelectDA : DBConnection
    {




        public static List<SelectListItem> ddlDepartments()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlDepartments", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlDepartmentTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlDepartmentTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlDepartmentDepartmentTypes(int DepartmentID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlDepartmentDepartmentTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlDepartmentJobs(int DepartmentID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlDepartmentJobs", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlPlacementTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlPlacementTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlPlacementStatuses()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlPlacementStatuses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlJobs()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlJobs", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlEmployees(int EmployeeStatusID = -1)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlEmployees", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeStatusID", EmployeeStatusID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlJobTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlJobTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlDocumentTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlDocumentTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlAttendanceExitTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlAttendanceExitTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlGenders()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlGenders", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlMaritalStatuses()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlMaritalStatuses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlReligions()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlReligions", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlNationalities()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlNationalities", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlDays()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlDays", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlMonths()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlMonths", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlCountries()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlCountries", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlGovernorates(int CountryID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlGovernorates", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@CountryID", CountryID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlCities(int GovernorateID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlCities", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@GovernorateID", GovernorateID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlDeductionStatuses()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlDeductionStatuses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlFingerprintTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlFingerprintTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlBranch()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlBranch", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlVacationTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlVacationTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlAttendanceFormats()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlAttendanceFormats", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlHolidayTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlHolidayTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlEmploymentTypes(bool? IsLeaf)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlEmploymentTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (IsLeaf != null)
                    DA.SelectCommand.Parameters.AddWithValue("@IsLeaf", IsLeaf);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlEmployeeStatuses(bool? IsLeaf)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlEmployeeStatuses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (IsLeaf != null)
                    DA.SelectCommand.Parameters.AddWithValue("@IsLeaf", IsLeaf);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlLanguages()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlLanguages", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlCaders()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlCaders", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlCaderDegrees(int CaderID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlCaderDegrees", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@CaderID", CaderID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlLateTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlLateTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlDayStatuses()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlDayStatuses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlRelativeTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlRelativeTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlPersonStatues()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlPersonStatues", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlQualificationTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlQualificationTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlKnowLevels()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlKnowLevels", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlBanks()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlBanks", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlSkillTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlSkillTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlVacationBalanceYears()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlVacationBalanceYears", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlVacationStatuses()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlVacationStatuses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlVacationPlaces()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlVacationPlaces", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlSemesterInstructors(int SemesterID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetSemesterInstructors", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlInstructorOfferdCourses(int EmployeeID, int SemesterID)

        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetTeacherOfferdCourses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlOfferdCoursesSections(int EmployeeID, int OfferdCourseID)

        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetTeacherOfferdCoursesSections", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@OfferdCourseID", OfferdCourseID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlSectionLectures(int SectionID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("LectureGetBySectionID", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlCurrencies()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlCurrencies", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlSemesters()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlSemesters", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlEmploymentTypeEmployees(int EmploymentTypeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlEmploymentTypeEmployees", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmploymentTypeID ", EmploymentTypeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlInstructorTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlInstructorTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlAccreditationStatuses()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlAccreditationStatuses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlAttendanceInstructorStatuses()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlAttendanceInstructorStatuses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlInstructorLectures(int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlInstructorLectures", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }





        public static List<SelectListItem> ddlPrograms()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlPrograms", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }


        public static List<SelectListItem> DataTableToSelectedListItems(DataTable DT)
        {
            List<SelectListItem> list = new List<SelectListItem>();
            foreach (DataRow row in DT.Rows)
            {
                list.Add(new SelectListItem()
                {
                    Value = row["ID"].ToString(),
                    Text = row["Name"].ToString()
                });
            }
            return list;
        }





        #region Salary

        public static List<SelectListItem> ddlSalaryBoxTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlSalaryBoxTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlBonusTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlBonusTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlDeductionTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlDeductionTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlBonuses()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlBonuses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlDeductions()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlDeductions", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlSalaryBoxes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlSalaryBoxes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlBasicSalaries(int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlBasicSalaries", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        #endregion
















    }
}
