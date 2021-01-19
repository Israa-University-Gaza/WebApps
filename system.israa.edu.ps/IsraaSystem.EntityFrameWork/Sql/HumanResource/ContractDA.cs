using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.Contract;

namespace IsraaSystem.DataAccess.Sql.HumanResource
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
                DA.SelectCommand.Parameters.AddWithValue("@InstructorTypeID", model.InstructorTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@EmploymentTypeID", model.EmploymentTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@ProgramID", model.ProgramID);
                DA.SelectCommand.Parameters.AddWithValue("@HourPrice", model.HourPrice);
                DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", model.CurrencyID);
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
                SqlDataAdapter DA1 = new SqlDataAdapter("GetFilterdContractInstructors", conn);
                DA1.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.InstructorName))
                    DA1.SelectCommand.Parameters.AddWithValue("@InstructorName", model.filter.InstructorName);
                DA1.SelectCommand.Parameters.AddWithValue("@SemesterID", model.filter.SemesterID);
                if (!String.IsNullOrEmpty(model.filter.EmploymentTypeID))
                    DA1.SelectCommand.Parameters.AddWithValue("@EmploymentTypeID", model.filter.EmploymentTypeID);
                DA1.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA1.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT1 = new DataTable();
                DA1.Fill(DT1);


                SqlDataAdapter DA2 = new SqlDataAdapter("GetFilterdContractInstructorStatistics", conn);
                DA2.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.InstructorName))
                    DA2.SelectCommand.Parameters.AddWithValue("@InstructorName", model.filter.InstructorName);
                DA2.SelectCommand.Parameters.AddWithValue("@SemesterID", model.filter.SemesterID);
                if (!String.IsNullOrEmpty(model.filter.EmploymentTypeID))
                    DA2.SelectCommand.Parameters.AddWithValue("@EmploymentTypeID", model.filter.EmploymentTypeID);
                DataTable DT2 = new DataTable();
                DA2.Fill(DT2);

                model.data = DT1;
                model.statistics = DT2;
                model.pagging.TotalRecords = (DT1.Rows.Count > 0) ? Convert.ToInt32(DT1.Rows[0]["TotalRecords"].ToString()) : 0;
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
