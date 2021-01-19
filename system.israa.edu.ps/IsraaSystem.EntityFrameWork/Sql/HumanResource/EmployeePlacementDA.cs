using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.EmployeePlacement;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class EmployeePlacementDA : DBConnection
    {
        public static DataTable EmployeePlacementAdd(EmployeePlacement model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeePlacementAdd", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", model.DepartmentID);
                DA.SelectCommand.Parameters.AddWithValue("@JobID", model.JobID);
                DA.SelectCommand.Parameters.AddWithValue("@CaderID", model.CaderID);
                DA.SelectCommand.Parameters.AddWithValue("@DManagerID", null);
                DA.SelectCommand.Parameters.AddWithValue("@PlacementStatusID", model.PlacementStatusID);
                DA.SelectCommand.Parameters.AddWithValue("@PlacementTypeID", model.PlacementTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.DateFrom);
                DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.DateTo);
                DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmployeePlacementGet(int id)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeePlacementGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", id);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmployeePlacementEdit(EmployeePlacement model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeePlacementEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                //DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", model.DepartmentID);
                DA.SelectCommand.Parameters.AddWithValue("@JobID", model.JobID);
                DA.SelectCommand.Parameters.AddWithValue("@DManagerID", null);
                DA.SelectCommand.Parameters.AddWithValue("@CaderID", model.CaderID);
                DA.SelectCommand.Parameters.AddWithValue("@PlacementStatusID", model.PlacementStatusID);
                DA.SelectCommand.Parameters.AddWithValue("@PlacementTypeID", model.PlacementTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.DateFrom);
                DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.DateTo);
                DA.SelectCommand.Parameters.AddWithValue("@UpdateEmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static EmployeePlacementVM GetFilterdEmployeePlacements(EmployeePlacementVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeePlacements", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.filter.EmployeeID);
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                if (!String.IsNullOrEmpty(model.filter.EmployeeDMName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeDMName", model.filter.EmployeeDMName);
                if (!String.IsNullOrEmpty(model.filter.DepartmentID))
                    DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", model.filter.DepartmentID);
                if (!String.IsNullOrEmpty(model.filter.JobID))
                    DA.SelectCommand.Parameters.AddWithValue("@JobID", model.filter.JobID);
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }
        }
    }
}