using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mvc;

namespace IsraaSystem.DataAccess.Sql.Academic
{
    public class SelectDA : DBConnection
    {
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

        public static List<SelectListItem> ddlOfferdCourseSemester()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlOfferdCourseSemester", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlDepartments()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlDepartments", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlEmployeeDepartments(int EmployeeID, int CollegeID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlEmployeeDepartments", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@CollegeID", CollegeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }



        public static List<SelectListItem> ddlCourses(int DepartmentID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlCourses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }


        public static List<SelectListItem> ddlFilterdOfferdCourses(int DepartmentID, int StudyLevelID, int SemesterID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlFilterdOfferdCourses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
                DA.SelectCommand.Parameters.AddWithValue("@StudyLevelID", StudyLevelID);
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }





        public static List<SelectListItem> ddlInstructors()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlInstructors", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlEmployees()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlEmployees", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlSectionTypes()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlSectionTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlSections(int OfferdCourseID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlSections", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@OfferdCourseID", OfferdCourseID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlSectionGenders()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlSectionGenders", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlStudyLevels()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlStudyLevels", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> GetCDays()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetCDays", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }


        public static List<SelectListItem> ddlOfferdCoursesSections()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlOfferdCoursesSections", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlCDays()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlCDays", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlRooms()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlRooms", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlCollegesWithoutProgram()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlCollegesWithoutProgram", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }


        public static List<SelectListItem> ddlCollege()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlColleges", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }
        public static List<SelectListItem> ddlEmployeeCollages(int EmployeeID, int ProgramID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlEmployeeCollages", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@ProgramID", ProgramID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }


        public static List<SelectListItem> ddlBranches()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlBranches", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
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
        public static List<SelectListItem> ddlEmployeePrograms(int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlEmployeePrograms", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }




        public static List<SelectListItem> ddlAvailableRooms(int CDayID, string FromHour, string ToHour, int SemesterID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlAvailableRooms", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@CDayID", CDayID);
                DA.SelectCommand.Parameters.AddWithValue("@FromHour", FromHour);
                DA.SelectCommand.Parameters.AddWithValue("@ToHour", ToHour);
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);


                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlCourseCategories()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlCourseCategories", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DataTableToSelectedListItems(DT);
            }
        }

        public static List<SelectListItem> ddlOfferdCourseTypes()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ddlOfferdCourseTypes", conn);
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
                    Text = row["Name"].ToString(),
                });
            }
            return list;
        }
    }
}
