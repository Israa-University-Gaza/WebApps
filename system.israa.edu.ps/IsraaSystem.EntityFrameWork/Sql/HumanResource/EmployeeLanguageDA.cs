using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.EmployeeLanguage;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class EmployeeLanguageDA:DBConnection
    {
        #region EmployeeLanguage
        public static DataTable EmployeeLanguageAddEdit(EmployeeLanguage model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeLanguageAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@languageID", model.languageID);
                DA.SelectCommand.Parameters.AddWithValue("@ReadingKnowLevelID", model.ReadingKnowLevelID);
                DA.SelectCommand.Parameters.AddWithValue("@WritingKnowLevelID", model.WritingKnowLevelID);
                DA.SelectCommand.Parameters.AddWithValue("@SpeakingKnowLevelID", model.SpeakingKnowLevelID);
                DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable EmployeeLanguageDelete(int ID, int DeleteEmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeLanguageDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", DeleteEmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable EmployeeLanguageGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeLanguageGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static EmployeeLanguageVM GetFilterdEmployeeLanguages(EmployeeLanguageVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeeLanguages", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.filter.EmployeeID);
                if (!String.IsNullOrEmpty(model.filter.LanguageID))
                    DA.SelectCommand.Parameters.AddWithValue("@LanguageID", model.filter.LanguageID);
                if (!String.IsNullOrEmpty(model.filter.ReadingKnowLevelID))
                    DA.SelectCommand.Parameters.AddWithValue("@ReadingKnowLevelID", model.filter.ReadingKnowLevelID);
                if (!String.IsNullOrEmpty(model.filter.WritingKnowLevelID))
                    DA.SelectCommand.Parameters.AddWithValue("@WritingKnowLevelID", model.filter.WritingKnowLevelID);
                if (!String.IsNullOrEmpty(model.filter.SpeakingKnowLevelID))
                    DA.SelectCommand.Parameters.AddWithValue("@ConversationKnowLevelID", model.filter.SpeakingKnowLevelID);
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
