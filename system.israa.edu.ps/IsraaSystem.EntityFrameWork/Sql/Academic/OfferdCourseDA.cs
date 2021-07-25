using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.Academic.OfferdCourse;

namespace IsraaSystem.DataAccess.Sql.Academic
{
    public class OfferdCourseDA : DBConnection
    {

        #region OfferdCourse

        public static DataTable OfferdCourseAdd(OfferdCourse model)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("OfferdCourseAdd", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", model.SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@CourseID", model.CourseID);
                if (!String.IsNullOrEmpty(model.InstructorID))
                    DA.SelectCommand.Parameters.AddWithValue("@InstructorID", model.InstructorID);
                DA.SelectCommand.Parameters.AddWithValue("@OfferdCourseTypeID", model.OfferdCourseTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@MSectionCount", model.MSectionCount);
                DA.SelectCommand.Parameters.AddWithValue("@FSectionCount", model.FSectionCount);
                DA.SelectCommand.Parameters.AddWithValue("@MFSectionCount", model.MFSectionCount);
                DA.SelectCommand.Parameters.AddWithValue("@Capacity", model.Capacity);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.UserID);

                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }



        public static void OfferdCourseAdd(List<OfferdCourse> list)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                DataTable DT = new DataTable();
                foreach (var model in list)
                {

                    SqlDataAdapter DA = new SqlDataAdapter("OfferdCourseAdd", conn);
                    DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                    DA.SelectCommand.Parameters.AddWithValue("@SemesterID", model.SemesterID);
                    DA.SelectCommand.Parameters.AddWithValue("@CourseID", model.CourseID);
                    if (!String.IsNullOrEmpty(model.InstructorID))
                        DA.SelectCommand.Parameters.AddWithValue("@InstructorID", model.InstructorID);
                    if (model.OfferdCourseTypeID != null)
                        DA.SelectCommand.Parameters.AddWithValue("@OfferdCourseTypeID", model.OfferdCourseTypeID);
                    DA.SelectCommand.Parameters.AddWithValue("@MSectionCount", model.MSectionCount);
                    DA.SelectCommand.Parameters.AddWithValue("@FSectionCount", model.FSectionCount);
                    DA.SelectCommand.Parameters.AddWithValue("@MFSectionCount", model.MFSectionCount);
                    DA.SelectCommand.Parameters.AddWithValue("@Capacity", model.Capacity);
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.UserID);
                    DA.Fill(DT);

                }


            }
        }


        public static DataTable GetOfferdCourseDetails(int OfferdCourseID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetOfferdCourseDetails", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@OfferdCourseID", OfferdCourseID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static OfferdCourseVM GetFilterdOfferdCourses(OfferdCourseVM model)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdOfferdCourses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", model.filter.SemesterID);
                if (!String.IsNullOrEmpty(model.filter.DepartmentID))
                    DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", model.filter.DepartmentID);
                if (!String.IsNullOrEmpty(model.filter.StudyLevelID))
                    DA.SelectCommand.Parameters.AddWithValue("@StudyLevelID", model.filter.StudyLevelID);
                if (!String.IsNullOrEmpty(model.filter.CourseCategoryID))
                    DA.SelectCommand.Parameters.AddWithValue("@CourseCategoryID", model.filter.CourseCategoryID);
                //DA.SelectCommand.Parameters.AddWithValue("@OfferdCourseTypeID", model.filter.OfferdCourseTypeID);
                if (!String.IsNullOrEmpty(model.filter.CourseCode))
                    DA.SelectCommand.Parameters.AddWithValue("@CourseCode", model.filter.CourseCode);
                if (!String.IsNullOrEmpty(model.filter.CourseName))
                    DA.SelectCommand.Parameters.AddWithValue("@CourseName", model.filter.CourseName);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                model.data = DT;
                return model;
            }
        }

        public static DataTable OfferdCourseDelete(int ID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaAcademicConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("OfferdCourseDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }
        #endregion

    }
}
