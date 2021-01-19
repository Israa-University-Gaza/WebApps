using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.Department;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class DepartmentDA : DBConnection
    {
        public static DataTable DepartmentAddEdit(Department model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("DepartmentAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@ArName", model.ArName);
                DA.SelectCommand.Parameters.AddWithValue("@ParentID", model.ParentID);
                DA.SelectCommand.Parameters.AddWithValue("@DepartmentTypeID", model.DepartmentTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@IsActive", model.IsActive);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable DepartmentActivate(int ID, bool IsActive)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("DepartmentActivate", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable DepartmentDelete(int ID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("DepartmentDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable DepartmentGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("DepartmentGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DepartmentsVM GetFilterdDepartments(DepartmentsVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdDepartments", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.DepartmentName))
                    DA.SelectCommand.Parameters.AddWithValue("@DepartmentName", model.filter.DepartmentName);
                if (!String.IsNullOrEmpty(model.filter.DepartmentID))
                    DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", model.filter.DepartmentID);
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
