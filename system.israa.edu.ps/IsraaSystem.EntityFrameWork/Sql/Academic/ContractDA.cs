using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Entity.Shared;
using IsraaSystem.Entity.HumanResource.Contract;
using IsraaSystem.Entity.HumanResource.Employee;

namespace IsraaSystem.Data.HumanResource
{
    public class ContractDA : DBConnection
    {

        #region contractInstructor
        public static DataTable ContractInstructorGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ContractInstructorGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }


        public static DataTable ContractInstructorEdit(ContractInstructorEdit model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ContractInstructorEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@HourPrice", model.HourPrice);
                DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", model.CurrencyID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }


        public static DataTable ContractInstructorDateEdit(ContractInstructorDateEdit model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("ContractInstructorDateEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.DateFrom);
                DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.DateTo);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static ContractInstructorVM GetFilterdContractInstructors(ContractInstructorVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdContractInstructors", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.InstructorName))
                    DA.SelectCommand.Parameters.AddWithValue("@InstructorName", model.filter.InstructorName);
                if (!String.IsNullOrEmpty(model.filter.SemesterID))
                    DA.SelectCommand.Parameters.AddWithValue("@SemesterID", model.filter.SemesterID);
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }
        }
        #endregion


        public static ContractInstructorVM GetFilterdContractInstructorStatistics(ContractInstructorVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdContractInstructorStatistics", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.SemesterID))
                    DA.SelectCommand.Parameters.AddWithValue("@SemesterID", model.filter.SemesterID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                model.data = DT;
                return model;
            }
        }
    }
}
