using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.Academic.Section;

namespace IsraaSystem.DataAccess.Sql.Academic
{
    public class SectionDA : DBConnection
    {
        public static DataTable GetOfferdCourseSections(int OfferdCourseID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetOfferdCourseSections", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@OfferdCourseID", OfferdCourseID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable SectionAdd(Section model)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("SectionAdd", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;

                DA.SelectCommand.Parameters.AddWithValue("@OfferdCourseID", model.OfferdCourseID);
                DA.SelectCommand.Parameters.AddWithValue("@SectionNum", model.SectionNum);
                DA.SelectCommand.Parameters.AddWithValue("@InstructorID", model.InstructorID);
                DA.SelectCommand.Parameters.AddWithValue("@Gender", model.Gender);
                DA.SelectCommand.Parameters.AddWithValue("@Capacity", model.Capacity);
                DA.SelectCommand.Parameters.AddWithValue("@SectionType", model.SectionType);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable SectionEdit(SectionEdit model)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("SectionEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@SectionNum", model.SectionNum);
                DA.SelectCommand.Parameters.AddWithValue("@Gender", model.Gender);
                DA.SelectCommand.Parameters.AddWithValue("@Capacity", model.Capacity);
                DA.SelectCommand.Parameters.AddWithValue("@SectionType", model.SectionType);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable SectionInstructorEdit(SectionInstructorEdit model)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("SectionInstructorEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@InstructorID", model.InstructorID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable SectionDelete(int ID, int DeleteEmployeeID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("SectionDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", DeleteEmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable SectionGet(int ID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("SectionGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static SectionVM GetOfferdCourseSections(SectionVM model)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA1 = new SqlDataAdapter("GetOfferdCourseSections", conn);
                DA1.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA1.SelectCommand.Parameters.AddWithValue("@OfferdCourseID", model.OfferdCourseID);
                DataTable DT1 = new DataTable();
                DA1.Fill(DT1);

                SqlDataAdapter DA2 = new SqlDataAdapter("GetOfferdCourseDetails", conn);
                DA2.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA2.SelectCommand.Parameters.AddWithValue("@OfferdCourseID", model.OfferdCourseID);

                DataTable DT2 = new DataTable();
                DA2.Fill(DT2);
                model.Data = DT1;
                model.Data2 = DT2;
                return model;
            }
        }
    }
}
