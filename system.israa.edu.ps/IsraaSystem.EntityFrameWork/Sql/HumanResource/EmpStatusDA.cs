using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.EmpStatus;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class EmpStatusDA : DBConnection
    {
        public static DataTable EmpStatusAdd(EmpStatus model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmpStatusAdd", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeStatusID", model.EmployeeStatusID);
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.DateFrom);
                if (!String.IsNullOrEmpty(model.DateTo))
                    DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.DateTo);
                DA.SelectCommand.Parameters.AddWithValue("@Notes", model.Notes);
                DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmpStatusEdit(EmpStatus model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmpStatusEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeStatusID", model.EmployeeStatusID);
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.DateFrom);
                if (!String.IsNullOrEmpty(model.DateTo))
                    DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.DateTo);
                DA.SelectCommand.Parameters.AddWithValue("@Notes", model.Notes);
                DA.SelectCommand.Parameters.AddWithValue("@UpdateEmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmpStatusGet(int id)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmpStatusGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", id);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static EmpStatusVM GetFilterdEmpStatuses(EmpStatusVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmpStatuses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.filter.EmployeeID);
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                if (!String.IsNullOrEmpty(model.filter.EmployeeStatusID))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeStatusID", model.filter.EmployeeStatusID);
                if (!String.IsNullOrEmpty(model.filter.Date))
                    DA.SelectCommand.Parameters.AddWithValue("@Date", model.filter.Date);
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }
        }


        public static DataTable EmpStatusDelete(int ID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmpStatusDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }
    }
}
