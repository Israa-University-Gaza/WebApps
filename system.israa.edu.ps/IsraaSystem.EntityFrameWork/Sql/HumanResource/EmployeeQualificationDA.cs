using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.EmployeeQualification;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class EmployeeQualificationDA : DBConnection
    {
        #region All Employee Qualification
        public static EmployeeQualificationVM GetFilterEmployeeQualifications(EmployeeQualificationVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeeQualifications", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.filter.EmployeeID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.filter.EmployeeID);
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                if (!String.IsNullOrEmpty(model.filter.QualificationTypeID))
                    DA.SelectCommand.Parameters.AddWithValue("@QualificationTypeID", model.filter.QualificationTypeID);
                if (!String.IsNullOrEmpty(model.filter.UniversityName))
                    DA.SelectCommand.Parameters.AddWithValue("@UniversityName", model.filter.UniversityName);
                if (!String.IsNullOrEmpty(model.filter.Department))
                    DA.SelectCommand.Parameters.AddWithValue("@Department", model.filter.Department);
                if (!String.IsNullOrEmpty(model.filter.College))
                    DA.SelectCommand.Parameters.AddWithValue("@College", model.filter.College);
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }
        }
        #endregion

        #region Employee Qualification
        public static DataTable EmployeeQualificationAddEdit(EmployeeQualification model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeQualificationAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@QualificationTypeID", model.QualificationTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@CountryID", model.CountryID);
                DA.SelectCommand.Parameters.AddWithValue("@UniversityName", model.UniversityName);
                DA.SelectCommand.Parameters.AddWithValue("@GPAGraduate", model.GPAGraduate);
                DA.SelectCommand.Parameters.AddWithValue("@GraduateYear", model.GraduateYear);
                DA.SelectCommand.Parameters.AddWithValue("@GraduateMonthID", model.GraduateMonthID);
                DA.SelectCommand.Parameters.AddWithValue("@College", model.College);
                DA.SelectCommand.Parameters.AddWithValue("@Department", model.Department);
                DA.SelectCommand.Parameters.AddWithValue("@GraduateCertificateUrl", model.GraduateCertificateUrl);
                DA.SelectCommand.Parameters.AddWithValue("@IsAccredit", model.IsAccredit);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmployeeQualificationGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeQualificationGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable EmployeeQualificationDelete(int ID, int UserID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeQualificationDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable EmployeeQualificationAccredit(int ID, int UserID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeQualificationAccredit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }
        #endregion
    }
}
