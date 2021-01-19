using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.FacebookShare;

namespace IsraaSystem.DataAccess.Sql.FacebookShare
{
    public class EmployeeFacebookDA : DBConnection
    {
        public static DataTable GetEmployeeFacebooks()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeFacebooks", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmployeeFacebookPostAdd(EmployeeFacebookPost model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeFacebookPostAdd", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID); 
                DA.SelectCommand.Parameters.AddWithValue("@Permalink", model.Permalink); 
                DA.SelectCommand.Parameters.AddWithValue("@PostID", model.PostID);
                DA.SelectCommand.Parameters.AddWithValue("@ShareID", model.ShareID);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }
    }
}
