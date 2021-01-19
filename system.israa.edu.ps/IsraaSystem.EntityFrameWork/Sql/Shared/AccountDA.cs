using System.Data;
using System.Data.SqlClient;

namespace IsraaSystem.DataAccess.Sql.Shared
{
    public class AccountDA : DBConnection
    {
        public static DataTable IsValidEmployee(string EmployeeNo, string Password)
        {
            using (SqlConnection conn = GetIsraPermissions())
            {
                SqlDataAdapter DA = new SqlDataAdapter("IsValidEmployee", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeNo", EmployeeNo);
                DA.SelectCommand.Parameters.AddWithValue("@Password", Password);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable IsValidUser(string UserNo, string Password)
        {
            using (SqlConnection conn = GetIsraPermissionsElibApi())
            {
                SqlDataAdapter DA = new SqlDataAdapter("IsValidUser", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@UserNo", UserNo);
                DA.SelectCommand.Parameters.AddWithValue("@Password", Password);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }
        
        public static DataTable EmpChangePassword(string EmployeeID, string OldPassword, string NewPassword)
        {
            using (SqlConnection conn = GetIsraPermissions())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmpChangePassword", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@OldPassword", OldPassword);
                DA.SelectCommand.Parameters.AddWithValue("@NewPassword", NewPassword);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }
    }
}
