using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.Holiday;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class HolidayDA : DBConnection
    {
        #region Holiday

        public static HolidayVM GetFilterdHolidays(HolidayVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdHolidays", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.HolidayTypeID))
                    DA.SelectCommand.Parameters.AddWithValue("@HolidayTypeID", model.filter.HolidayTypeID);
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

        public static DataTable HolidayAddEdit(Holiday model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("HolidayAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@Title", model.Title);
                DA.SelectCommand.Parameters.AddWithValue("@HolidayTypeID", model.HolidayTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.DateFrom);
                DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.DateTo);
                DA.SelectCommand.Parameters.AddWithValue("@Notes", model.Notes);
                DA.SelectCommand.Parameters.AddWithValue("@IsActive", model.IsActive);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable HolidayDelete(int ID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("HolidayDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable HolidayGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("HolidayGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        #endregion

        #region HolidayType

        public static DataTable HolidayTypeAddEdit(HolidayType model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("HolidayTypeAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@ArName", model.ArName);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetHolidayTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetHolidayTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable HolidayTypeDelete(int ID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("HolidayTypeDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable HolidayTypeGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("HolidayTypeGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        #endregion
    }
}
