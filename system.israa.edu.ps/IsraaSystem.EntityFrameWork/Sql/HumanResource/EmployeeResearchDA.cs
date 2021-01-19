using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.EmployeeResearch;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class EmployeeResearchDA:DBConnection
    {
        #region EmployeeResearch
        public static DataTable EmployeeResearchAddEdit(EmployeeResearch model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeResearchAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@ResearchTitle", model.ResearchTitle);
                DA.SelectCommand.Parameters.AddWithValue("@ResearchOrganization", model.ResearchOrganization);
                DA.SelectCommand.Parameters.AddWithValue("@ResearchDetails", model.ResearchDetails);
                DA.SelectCommand.Parameters.AddWithValue("@ResearchDate", model.ResearchDate);
                DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable EmployeeResearchDelete(int ID, int DeleteEmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeResearchDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", DeleteEmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable EmployeeResearchGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeResearchGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static EmployeeResearchVM GetFilterdEmployeeResearchs(EmployeeResearchVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeeResearchs", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.filter.EmployeeID);
                if (!String.IsNullOrEmpty(model.filter.ResearchTitle))
                    DA.SelectCommand.Parameters.AddWithValue("@ResearchTitle", model.filter.ResearchTitle);
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
