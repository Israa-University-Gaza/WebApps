using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.Academic.StudyTable;

namespace IsraaSystem.DataAccess.Sql.Academic
{
    public class StudyTableDA : DBConnection
    {
        public static DataTable GetStudyTableReport(int SemesterID, int DepartmentID, int StudyLevelID, int GenderID, int BranchID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetStudyTableReport", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
                DA.SelectCommand.Parameters.AddWithValue("@StudyLevelID", StudyLevelID);
                DA.SelectCommand.Parameters.AddWithValue("@GenderID", GenderID);
                DA.SelectCommand.Parameters.AddWithValue("@BranchID", BranchID);

                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetStudyTableInfo(int SemesterID, int DepartmentID, int StudyLevelID, int GenderID, int BranchID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetStudyTableInfo", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
                DA.SelectCommand.Parameters.AddWithValue("@StudyLevelID", StudyLevelID);
                DA.SelectCommand.Parameters.AddWithValue("@GenderID", GenderID);
                DA.SelectCommand.Parameters.AddWithValue("@BranchID", BranchID);

                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetInstructorStudyTableReport(int SemesterID, int InstructorID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetInstructorStudyTableReport", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@InstructorID", InstructorID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetInstructorStudyTableInfo(int SemesterID, int InstructorID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetInstructorStudyTableInfo", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@InstructorID", InstructorID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetRoomStudyTableReport(int SemesterID, int RoomID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetRoomStudyTableReport", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@RoomID", RoomID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetRoomStudyTableInfo(int SemesterID, int RoomID)
        {

            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetRoomStudyTableInfo", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@RoomID", RoomID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetStudyTableLectures(StudyTableFilter filter)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetStudyTableLectures", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", filter.SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", filter.DepartmentID);
                DA.SelectCommand.Parameters.AddWithValue("@StudyLevelID", filter.StudyLevelID);
                DA.SelectCommand.Parameters.AddWithValue("@GenderID", filter.GenderID);
                DA.SelectCommand.Parameters.AddWithValue("@InstructorID", filter.InstructorID);
                DA.SelectCommand.Parameters.AddWithValue("@RoomID", filter.RoomID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetStudentLectures(StudyTableFilter filter)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetStudentLectures", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", filter.SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", filter.DepartmentID);
                DA.SelectCommand.Parameters.AddWithValue("@StudyLevelID", filter.StudyLevelID);
                DA.SelectCommand.Parameters.AddWithValue("@GenderID", filter.GenderID);
                DA.SelectCommand.Parameters.AddWithValue("@BranchID", filter.BranchID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetInstructorLectures(StudyTableFilter filter)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetInstructorLectures", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", filter.SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@InstructorID", filter.InstructorID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetCourseLectures(StudyTableFilter filter)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetCourseLectures", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", filter.SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@CourseID", filter.CourseID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetSectionLectures(StudyTableFilter filter)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetSectionLectures", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SectionID", filter.SectionID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetRoomLectures(StudyTableFilter filter)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetRoomLectures", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", filter.SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@RoomID", filter.RoomID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetSectionStudyTableLectures(StudyTableFilter filter)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetSectionStudyTableLectures", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SectionID", filter.SectionID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetDepartmentsStudyLevelsGenders()
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetDepartmentsStudyLevelsGenders", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }


        public static DataTable GetCollegeInstructorHours(string SemesterID, string CollegeID, string EmployeeID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetCollegeInstructorHours", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@CollegeID", CollegeID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetSectionsWithNoEmployee(string SemesterID, string ProgramID, string CollegeID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetSectionsWithNoEmployee", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@ProgramID", ProgramID);
                DA.SelectCommand.Parameters.AddWithValue("@CollegeID", CollegeID);

                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

    }
}
