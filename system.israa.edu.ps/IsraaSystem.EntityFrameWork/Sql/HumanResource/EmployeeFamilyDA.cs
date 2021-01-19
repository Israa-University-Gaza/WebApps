using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.EmployeeFamily;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class EmployeeFamilyDA : DBConnection
    {

        #region EmployeeFamily
        public static DataTable EmployeeFamilyAddEdit(EmployeeFamily model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeFamilyAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@RelativeTypeID", model.RelativeTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@ArFirstName", model.ArFirstName);
                DA.SelectCommand.Parameters.AddWithValue("@ArSecoundName", model.ArSecoundName);
                DA.SelectCommand.Parameters.AddWithValue("@ArThirdName", model.ArThirdName);
                DA.SelectCommand.Parameters.AddWithValue("@ArFamilyName", model.ArFamilyName);
                DA.SelectCommand.Parameters.AddWithValue("@GenderID", model.GenderID);
                DA.SelectCommand.Parameters.AddWithValue("@SSN", model.SSN);
                DA.SelectCommand.Parameters.AddWithValue("@PlaceOfBirth", model.PlaceOfBirth);
                DA.SelectCommand.Parameters.AddWithValue("@DateOfBirth", model.DateOfBirth);
                DA.SelectCommand.Parameters.AddWithValue("@MaritalStatusID", model.MaritalStatusID);
                DA.SelectCommand.Parameters.AddWithValue("@MarriageDate", model.MarriageDate);
                DA.SelectCommand.Parameters.AddWithValue("@PersonStatusID", model.PersonStatusID);
                DA.SelectCommand.Parameters.AddWithValue("@DeathDate", model.DeathDate);
                DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", model.InsertEmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable EmployeeFamilyDelete(int ID, int DeleteEmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeFamilyDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", DeleteEmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable EmployeeFamilyGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeFamilyGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static EmployeeFamilyVM GetFilterdEmployeeFamilies(EmployeeFamilyVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeeFamilies", conn);
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
                if (!String.IsNullOrEmpty(model.filter.MaritalStatusID))
                    DA.SelectCommand.Parameters.AddWithValue("@MaritalStatusID", model.filter.MaritalStatusID);
                if (!String.IsNullOrEmpty(model.filter.RelativeTypeID))
                    DA.SelectCommand.Parameters.AddWithValue("@RelativeTypeID", model.filter.RelativeTypeID);
                if (!String.IsNullOrEmpty(model.filter.PersonStatusID))
                    DA.SelectCommand.Parameters.AddWithValue("@PersonStatusID", model.filter.PersonStatusID);
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
