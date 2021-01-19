using System.Data;
using System.Data.SqlClient;

namespace IsraaSystem.DataAccess.Sql.Financial
{
    public class TransactionDA : DBConnection
    {

        #region  Transaction



        public static DataTable CalculateStudentInstallmentPaid(int StudentID)
        {
            using (SqlConnection conn = GetIsraDataConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("CalculateStudentInstallmentPaid", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }



        #endregion


    }
}
