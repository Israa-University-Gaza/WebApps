using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.AttendanceExit;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class AttendanceExitDA : DBConnection
    {
        #region AttendanceExit

        public static DataTable AttendanceExitGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceExitGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static AttendanceExitsVM GetFilterdAttendanceExits(AttendanceExitsVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdAttendanceExits", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.filter.EmployeeID);
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                if (!String.IsNullOrEmpty(model.filter.AttendanceExitTypeID))
                    DA.SelectCommand.Parameters.AddWithValue("@AttendanceExitTypeID", model.filter.AttendanceExitTypeID);
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

        public static DataTable AttendanceExitAdd(AttendanceExit model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceExitAdd", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@AttendanceExitTypeID", model.AttendanceExitTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@ExitDate", model.ExitDate);
                DA.SelectCommand.Parameters.AddWithValue("@ExpectedTimeFrom", model.ExpectedTimeFrom);
                DA.SelectCommand.Parameters.AddWithValue("@ExpectedTimeTo", model.ExpectedTimeTo);
                DA.SelectCommand.Parameters.AddWithValue("@ActualTimeFrom", model.ActualTimeFrom);
                DA.SelectCommand.Parameters.AddWithValue("@ActualTimeTo", model.ActualTimeTo);
                DA.SelectCommand.Parameters.AddWithValue("@ExitReason", model.ExitReason);
                DA.SelectCommand.Parameters.AddWithValue("@Mobile", model.Mobile);
                DA.SelectCommand.Parameters.AddWithValue("@Notes", model.Notes);
                DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable AttendanceExitDelete(AttendanceExitDelete model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceExitDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@DeleteReason", model.DeleteReason);
                DA.SelectCommand.Parameters.AddWithValue("@DeleteEmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable AttendanceExitEdit(AttendanceExit model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceExitEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@AttendanceExitTypeID", model.AttendanceExitTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@ExitDate", model.ExitDate);
                DA.SelectCommand.Parameters.AddWithValue("@ExpectedTimeFrom", model.ExpectedTimeFrom);
                DA.SelectCommand.Parameters.AddWithValue("@ExpectedTimeTo", model.ExpectedTimeTo);
                if (model.ActualTimeTo != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ActualTimeFrom", model.ActualTimeFrom);
                if (model.ActualTimeTo != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ActualTimeTo", model.ActualTimeTo);
                DA.SelectCommand.Parameters.AddWithValue("@ExitReason", model.ExitReason);
                DA.SelectCommand.Parameters.AddWithValue("@EditReason", model.EditReason);
                DA.SelectCommand.Parameters.AddWithValue("@Mobile", model.Mobile);
                DA.SelectCommand.Parameters.AddWithValue("@Notes", model.Notes);
                DA.SelectCommand.Parameters.AddWithValue("@UpdateEmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable AttendanceExitTimeUpdate(AttendanceExitEdit model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AttendanceExitTimeUpdate", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@ActualTimeFrom", model.ActualTimeFrom);
                DA.SelectCommand.Parameters.AddWithValue("@ActualTimeTo", model.ActualTimeTo);
                DA.SelectCommand.Parameters.AddWithValue("@UpdateEmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        #endregion
    }
}