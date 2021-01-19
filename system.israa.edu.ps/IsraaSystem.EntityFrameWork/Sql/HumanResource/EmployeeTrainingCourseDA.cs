using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.EmployeeTrainingCourse;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class EmployeeTrainingCourseDA:DBConnection
    {
        #region EmployeeTrainingCourse
        public static DataTable EmployeeTrainingCourseAddEdit(EmployeeTrainingCourse model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeTrainingCourseAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@CourseName", model.CourseName);
                DA.SelectCommand.Parameters.AddWithValue("@CourseOrganisers", model.CourseOrganisers);
                DA.SelectCommand.Parameters.AddWithValue("@CourseSpecialization", model.CourseSpecialization);
                DA.SelectCommand.Parameters.AddWithValue("@CourseHours", model.CourseHours);
                DA.SelectCommand.Parameters.AddWithValue("@CourseFromDate", model.CourseFromDate);
                DA.SelectCommand.Parameters.AddWithValue("@CourseToDate", model.CourseToDate);
                DA.SelectCommand.Parameters.AddWithValue("@CourseCertificateUrl", model.CourseCertificateUrl);
                DA.SelectCommand.Parameters.AddWithValue("@Note", model.Note);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable EmployeeTrainingCourseDelete(int ID, int DeleteEmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeTrainingCourseDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", DeleteEmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable EmployeeTrainingCourseGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeTrainingCourseGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static EmployeeTrainingCourseVM GetFilterdEmployeeTrainingCourses(EmployeeTrainingCourseVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeeTrainingCourses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.filter.EmployeeID);
                if (!String.IsNullOrEmpty(model.filter.CourseName))
                    DA.SelectCommand.Parameters.AddWithValue("@CourseName", model.filter.CourseName);
                DA.SelectCommand.Parameters.AddWithValue("@PageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@CurrentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }

        }
        #endregion
    }
}
