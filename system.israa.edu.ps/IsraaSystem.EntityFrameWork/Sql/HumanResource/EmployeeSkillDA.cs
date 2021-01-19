using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.EmployeeSkill;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class EmployeeSkillDA:DBConnection
    {
        #region EmployeeSkill
        public static DataTable EmployeeSkillAddEdit(EmployeeSkill model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeSkillAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@SkillTypeID", model.SkillTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@Name", model.Name);
                DA.SelectCommand.Parameters.AddWithValue("@KnowLevelID", model.KnowLevelID);
                DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable EmployeeSkillDelete(int ID, int DeleteEmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeSkillDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", DeleteEmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static DataTable EmployeeSkillGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeSkillGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }

        }

        public static EmployeeSkillVM GetFilterdEmployeeSkills(EmployeeSkillVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeeSkills", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.filter.EmployeeID);
                if (!String.IsNullOrEmpty(model.filter.SkillTypeID))
                    DA.SelectCommand.Parameters.AddWithValue("@SkillTypeID", model.filter.SkillTypeID);
                if (!String.IsNullOrEmpty(model.filter.KnowLevelID))
                    DA.SelectCommand.Parameters.AddWithValue("@KnowLevelID", model.filter.KnowLevelID);
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
