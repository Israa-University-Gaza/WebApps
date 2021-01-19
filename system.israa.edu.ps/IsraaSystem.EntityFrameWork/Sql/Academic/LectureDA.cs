using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.Academic.Lecture;

namespace IsraaSystem.DataAccess.Sql.Academic
{
    public class LectureDA : DBConnection
    {
        public static DataTable LectureAdd(Lecture model)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("LectureAdd", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SectionID", model.SectionID);
                DA.SelectCommand.Parameters.AddWithValue("@RoomID", model.RoomID);
                DA.SelectCommand.Parameters.AddWithValue("@CDayID", model.CDayID);
                DA.SelectCommand.Parameters.AddWithValue("@FromHour", model.FromHour);
                DA.SelectCommand.Parameters.AddWithValue("@ToHour", model.ToHour);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable LectureEdit(Lecture model)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("LectureEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@RoomID", model.RoomID);
                DA.SelectCommand.Parameters.AddWithValue("@CDayID", model.CDayID);
                DA.SelectCommand.Parameters.AddWithValue("@FromHour", model.FromHour);
                DA.SelectCommand.Parameters.AddWithValue("@ToHour", model.ToHour);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable LectureSetDayTime(Lecture model)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("LectureSetDayTime", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@CDayID", model.CDayID);
                DA.SelectCommand.Parameters.AddWithValue("@FromHour", model.FromHour);
                DA.SelectCommand.Parameters.AddWithValue("@ToHour", model.ToHour);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable LectureGet(int ID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("LectureGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable LectureDelete(Lecture model)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("LectureDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable LecturePined(Lecture model)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("LecturePined", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@IsPined", model.IsPined);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.PinEmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }


    }
}
