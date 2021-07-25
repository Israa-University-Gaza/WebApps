using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.Academic.Mark;

namespace IsraaSystem.DataAccess.Sql.Academic
{
    public class MarkDA : DBConnection
    {

        #region  Mark


        public static MarkVM GetFilterdMarks(MarkVM model)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetSectionStudentsMarks", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SectionID", model.filter.SectionID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                model.data = DT;
                return model;


            }
        }
        public static MarkVM GetSectionMarkDetails(MarkVM model)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetSectionMarkDetails", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SectionID", model.filter.SectionID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                model.SectionMarkDetails = DT;
                return model;
            }
        }

        public static MarkVM GetAcademicSectionsMarks(MarkVM model)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetAcademicSectionsMarks", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", model.filter.SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@ProgramID", model.filter.ProgramID);
                DA.SelectCommand.Parameters.AddWithValue("@CollegeID", model.filter.CollegeID);
                DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", model.filter.DepartmentID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                model.data = DT;
                return model;


            }
        }
        public static DataTable SetSectionMarkAccreditation(int SectionID, int EmployeeID, int AccreditationType)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("SetSectionMarkAccreditation", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable SetAllSectionMarkAccreditation(IList<string> SectionIDList, int EmployeeID, int AccreditationType)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                DataTable DT = new DataTable();
                DataTable MergeDT = new DataTable();

                foreach (var s in SectionIDList)
                {
                    SqlDataAdapter DA = new SqlDataAdapter("SetSectionMarkAccreditation", conn);
                    DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                    DA.SelectCommand.Parameters.AddWithValue("@SectionID", s);
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                    DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
                    DA.Fill(DT);
                    MergeDT.Merge(DT);
                }

                return DT;

            }
        }

        public static DataTable SetSectionMarkUnaccreditation(int SectionID, int AccreditationTypeID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("SetSectionMarkUnaccreditation", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
                DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable SetMarkAccreditation(int StdSectionID, int AccreditationTypeID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("SetMarkAccreditation", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
                DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable SetMarkUnaccreditation(int StdSectionID, int AccreditationTypeID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("SetMarkUnaccreditation", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
                DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        #endregion

        #region Mark Reports

        public static DataTable GetSectionStudentsMarks(string SectionID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                // Added by RSR
               SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandTimeout = 180; //The time in seconds to wait for the command to execute.
                command.CommandText = "GetSectionStudentsMarks";
                command.Parameters.AddWithValue("@SectionID", SectionID);
                
                //End of RSR
                // by RSR SqlDataAdapter DA = new SqlDataAdapter("GetSectionStudentsMarks", conn);
                SqlDataAdapter DA = new SqlDataAdapter(command);

                //DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                //DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetSectionStatistics(string SectionID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetSectionStatistics", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetSectionStudentsMidtermMarks(string SectionID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetSectionStudentsMidtermMarks", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }
        #endregion
    }
}
