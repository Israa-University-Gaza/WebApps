using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.EmpEmploymentType;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class EmpEmploymentTypeDA : DBConnection
    {
        #region EmpEmployement

        public static EmpEmploymentTypeVM GetFilterdEmpEmploymentTypes(EmpEmploymentTypeVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmpEmploymentTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                if (!String.IsNullOrEmpty(model.filter.EmploymentTypeID))
                    DA.SelectCommand.Parameters.AddWithValue("@EmploymentTypeID", model.filter.EmploymentTypeID);
                if (!String.IsNullOrEmpty(model.filter.EmployeeStatusID))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeStatusID", model.filter.EmployeeStatusID);
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }
        }

        public static DataTable EmpEmploymentTypeGet(int id)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmpEmploymentTypeGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", id);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmpEmploymentTypeAdd(EmpEmploymentType model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmpEmploymentTypeAdd", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeNo", model.EmployeeNo);
                DA.SelectCommand.Parameters.AddWithValue("@EmploymentTypeID", model.EmploymentTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.DateFrom);
                DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.DateTo);
                DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmpEmploymentTypeEdit(EmpEmploymentType model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmpEmploymentTypeEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeNo", model.EmployeeNo);
                DA.SelectCommand.Parameters.AddWithValue("@EmploymentTypeID", model.EmploymentTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.DateFrom);
                DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.DateTo);
                DA.SelectCommand.Parameters.AddWithValue("@UpdateEmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmpEmploymentTypeDelete(int ID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmpEmploymentTypeDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }


        public static DataTable EmpEmploymentTypeGetLast(int EmployeeID, int @EmploymentTypeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmpEmploymentTypeGetLast", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@EmploymentTypeID", @EmploymentTypeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        #endregion
    }
}
