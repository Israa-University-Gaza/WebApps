using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.ManualFingerprint;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class ManualFingerprintDA : DBConnection
    {
        #region ManualFingerprint

        public static DataTable ManualFingerprintAdd(ManualFingerprint model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ManualFingerprintAdd", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@FingerprintTypeID", model.FingerprintTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@BranchID", model.BranchID);
                DA.SelectCommand.Parameters.AddWithValue("@FingerprintDate", Convert.ToDateTime(model.FingerprintDate + " " + model.FingerprintTime));
                DA.SelectCommand.Parameters.AddWithValue("@Note", model.Note="");
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable ManualFingerprintDelete(int ID, int UserID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ManualFingerprintDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable ManualFingerprintApply(int ManualFingerprintID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ManualFingerprintApply", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ManualFingerprintID", ManualFingerprintID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable ManualFingerprintAccreditation(int ID, int AccreditationStatusID, int UserID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ManualFingerprintAccreditation", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@AccreditationStatusID", AccreditationStatusID);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static ManualFingerprintVM GetFilterdManualFingerprints(ManualFingerprintVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdManualFingerprints", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                if (!String.IsNullOrEmpty(model.filter.AccreditationStatusID))
                    DA.SelectCommand.Parameters.AddWithValue("@AccreditationStatusID", model.filter.AccreditationStatusID);
                if (!String.IsNullOrEmpty(model.filter.BranchID))
                    DA.SelectCommand.Parameters.AddWithValue("@BranchID", model.filter.BranchID);

                if (!String.IsNullOrEmpty(model.filter.FingerprintTypeID))
                    DA.SelectCommand.Parameters.AddWithValue("@FingerPrintTypeID", model.filter.FingerprintTypeID);
                if (!String.IsNullOrEmpty(model.filter.DateFrom))
                    DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.filter.DateFrom);
                if (!String.IsNullOrEmpty(model.filter.DateTo))
                    DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.filter.DateTo);
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }
        }

        public static DataTable ManualFingerprintGet(int ManualFingerprintID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ManualFingerprintGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ManualFingerprintID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }
        #endregion
    }
}
