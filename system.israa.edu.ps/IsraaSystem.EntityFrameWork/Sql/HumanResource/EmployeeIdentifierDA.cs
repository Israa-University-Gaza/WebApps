using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.EmployeeIdentifier;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class EmployeeIdentifierDA:DBConnection
    {
        #region EmployeeIdentifier
        public static DataTable EmployeeIdentifierAddEdit(EmployeeIdentifier model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeIdentifierAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@ArFirstName", model.ArFirstName);
                DA.SelectCommand.Parameters.AddWithValue("@ArSecoundName", model.ArSecoundName);
                DA.SelectCommand.Parameters.AddWithValue("@ArThirdName", model.ArThirdName);
                DA.SelectCommand.Parameters.AddWithValue("@ArFamilyName", model.ArFamilyName);
                DA.SelectCommand.Parameters.AddWithValue("@IdentifierJob", model.IdentifierJob);
                DA.SelectCommand.Parameters.AddWithValue("@Phone", model.Phone);
                DA.SelectCommand.Parameters.AddWithValue("@Mobile", model.Mobile);
                DA.SelectCommand.Parameters.AddWithValue("@Email", model.Email);
                DA.SelectCommand.Parameters.AddWithValue("@AddressDetails", model.AddressDetails);
                DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable EmployeeIdentifierDelete(int ID, int DeleteEmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeIdentifierDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", DeleteEmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable EmployeeIdentifierGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeIdentifierGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static EmployeeIdentifierVM GetFilterdEmployeeIdentifiers(EmployeeIdentifierVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeeIdentifiers", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.filter.EmployeeID);
                if (!String.IsNullOrEmpty(model.filter.ArFirstName))
                    DA.SelectCommand.Parameters.AddWithValue("@ArFirstName", model.filter.ArFirstName);
                if (!String.IsNullOrEmpty(model.filter.ArSecoundName))
                    DA.SelectCommand.Parameters.AddWithValue("@ArSecoundName", model.filter.ArSecoundName);
                if (!String.IsNullOrEmpty(model.filter.ArThirdName))
                    DA.SelectCommand.Parameters.AddWithValue("@ArThirdName", model.filter.ArThirdName);
                if (!String.IsNullOrEmpty(model.filter.ArFamilyName))
                    DA.SelectCommand.Parameters.AddWithValue("@ArFamilyName", model.filter.ArFamilyName);
                DA.SelectCommand.Parameters.AddWithValue("@PageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@CurrentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }

        }
        #endregion
    }
}
