using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.Vacation;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class VacationDA : DBConnection
    {
        #region VacationBalances

        public static VacationBalanceVM GetFilterdEmployeeVacationBalances(VacationBalanceVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeeVacationBalances", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                if (!String.IsNullOrEmpty(model.filter.VacationBalanceYearID))
                    DA.SelectCommand.Parameters.AddWithValue("@VacationBalanceYearID ", model.filter.VacationBalanceYearID);
                if (!String.IsNullOrEmpty(model.filter.VacationTypeID))
                    DA.SelectCommand.Parameters.AddWithValue("@VacationTypeID", model.filter.VacationTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }
        }

        public static DataTable EmployeeVacationBalanceGet(int EmployeeVacationBalanceID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeVacationBalanceGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", EmployeeVacationBalanceID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmployeeVacationBalanceAdd(VacationBalance model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeVacationBalanceAdd", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@VacationBalanceYearID", model.VacationBalanceYearID);
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.DateFrom);
                DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.DateTo);
                DA.SelectCommand.Parameters.AddWithValue("@PostponeDays", model.PostponeDays);
                DA.SelectCommand.Parameters.AddWithValue("@DefualtDays", model.DefualtDays);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmployeeVacationBalanceEdit(VacationBalanceEdit model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeVacationBalanceEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.DateFrom);
                DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.DateTo);
                DA.SelectCommand.Parameters.AddWithValue("@PostponeDays", model.PostponeDays);
                DA.SelectCommand.Parameters.AddWithValue("@DefualtDays", model.DefualtDays);
                DA.SelectCommand.Parameters.AddWithValue("@Note", model.Note);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }


        public static VacationBalanceVM GetFilterdEmployeeNotInVacationBalance(VacationBalanceVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeeNotInVacationBalance", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName ", model.filter.EmployeeName);

                DA.SelectCommand.Parameters.AddWithValue("@VacationBalanceYearID ", model.filter.VacationBalanceYearID);
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

        #region EmployeeVacation

        public static EmployeeVacationVM GetFilterdEmployeeVacations(EmployeeVacationVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeeVacations", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                if (!String.IsNullOrEmpty(model.filter.VacationTypeID))
                    DA.SelectCommand.Parameters.AddWithValue("@VacationTypeID", model.filter.VacationTypeID);
                if (!String.IsNullOrEmpty(model.filter.AccreditationStatusID))
                    DA.SelectCommand.Parameters.AddWithValue("@AccreditationStatusID", model.filter.AccreditationStatusID);
                if (!String.IsNullOrEmpty(model.filter.VacationBalanceYearID))
                    DA.SelectCommand.Parameters.AddWithValue("@VacationBalanceYearID ", model.filter.VacationBalanceYearID);
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

        public static DataTable EmployeeVacationAccreditation(int AccreditationStatusID, int AccreditationType, EmployeeVacation model, int UserID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeVacationAccreditation", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
                DA.SelectCommand.Parameters.AddWithValue("@AccreditationStatusID", AccreditationStatusID);
                DA.SelectCommand.Parameters.AddWithValue("@HumanResourceNote", model.HumanResourceNote);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmployeeVacationDeAccreditation(EmployeeVacation model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeVacationDeAccreditation", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetEmployeeVacationDetails(int EmployeeVacationID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeeVacations", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", EmployeeVacationID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmployeeVacationTypeEdit(EmployeeVacationTypeEdit model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeVacationTypeEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@VacationTypeID", model.VacationTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@HumanResourceNote", model.HumanResourceNote);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmployeeVacationGet(int EmployeeVacationID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeVacationGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", EmployeeVacationID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmployeeVacationAddEdit(EmployeeVacation model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeVacationAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@VacationTypeID", model.VacationTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@VacationStartDate", model.VacationStartDate);
                DA.SelectCommand.Parameters.AddWithValue("@VacationEndDate", model.VacationEndDate);
                DA.SelectCommand.Parameters.AddWithValue("@VacationReason", model.VacationReason);
                DA.SelectCommand.Parameters.AddWithValue("@VacationPlaceID", model.VacationPlaceID);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmployeeVacationDelete(EmployeeVacation model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeVacationDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }
        #endregion


    }
}
