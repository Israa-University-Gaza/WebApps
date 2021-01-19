using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.Academic.SectionDepartment;

namespace IsraaSystem.DataAccess.Sql.Academic
{
    public class SectionDepartmantDA : DBConnection
    {
        public static DataTable SectionDepartmentAdd(SectionDepartment model)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("SectionDepartmentAdd", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SectionID", model.SectionID);
                DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", model.DepartmentID);
                DA.SelectCommand.Parameters.AddWithValue("@StudyLeveLID", model.StudyLevelID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetSectionDepartments(int SectionID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetSectionDepartments", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable SectionDepartmentActivate(int SectionID, int DepartmentID, int StudyLeveLID, int GenderID, int UserID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("SectionDepartmentActivate", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
                DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
                DA.SelectCommand.Parameters.AddWithValue("@StudyLeveLID", StudyLeveLID);
                DA.SelectCommand.Parameters.AddWithValue("@GenderID", GenderID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }


        public static DataTable SectionDepartmentSpecialAdd(int SectionDepartmentID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("SectionDepartmentSpecialAdd", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SectionDepartmentID", SectionDepartmentID);

                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

    }
}
