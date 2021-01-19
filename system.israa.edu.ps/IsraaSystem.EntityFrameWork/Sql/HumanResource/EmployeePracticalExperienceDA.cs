using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.EmployeePracticalExperience;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class EmployeePracticalExperienceDA : DBConnection
    {
        #region EmployeePracticalExperience
        public static DataTable EmployeePracticalExperienceAddEdit(EmployeePracticalExperience model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeePracticalExperienceAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@Job", model.Job);
                DA.SelectCommand.Parameters.AddWithValue("@WorkPlace", model.WorkPlace);
                DA.SelectCommand.Parameters.AddWithValue("@WorkField", model.WorkField);
                DA.SelectCommand.Parameters.AddWithValue("@WorkFromDate", model.WorkFromDate);
                DA.SelectCommand.Parameters.AddWithValue("@WorkToDate", model.WorkToDate);
                DA.SelectCommand.Parameters.AddWithValue("@WorkDetails", model.WorkDetails);
                DA.SelectCommand.Parameters.AddWithValue("@WorkLeavingReason", model.WorkLeavingReason);
                DA.SelectCommand.Parameters.AddWithValue("@IdentifiersName", model.IdentifiersName);
                DA.SelectCommand.Parameters.AddWithValue("@IdentifiersMobile", model.IdentifiersMobile);
                DA.SelectCommand.Parameters.AddWithValue("@WorkCertificateUrl", model.WorkCertificateUrl);
                DA.SelectCommand.Parameters.AddWithValue("@IsAccredit", model.IsAccredit);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmployeePracticalExperienceDelete(int ID, int DeleteEmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeePracticalExperienceDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", DeleteEmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmployeePracticalExperienceGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeePracticalExperienceGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable HRAccreditation(int ID, int DeleteEmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeePracticalExperienceAccredit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", DeleteEmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static EmployeePracticalExperienceVM GetFilterdEmployeePracticalExperiences(EmployeePracticalExperienceVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeePracticalExperiences", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.filter.EmployeeID);
                if (!String.IsNullOrEmpty(model.filter.Job))
                    DA.SelectCommand.Parameters.AddWithValue("@Job", model.filter.Job);
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
