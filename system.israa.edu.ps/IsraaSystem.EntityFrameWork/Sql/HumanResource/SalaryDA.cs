using System;
using System.Data;
using System.Data.SqlClient;
using IsraaSystem.Core.Classic.HumanResource.Salary;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class SalaryDA : DBConnection
    {
        #region SalaryBoxType

        public static DataTable SalaryBoxTypeAdd(SalaryBoxType model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("SalaryBoxTypeAdd", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@Name", model.Name);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }
        public static DataTable SalaryBoxTypeDelete(int ID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("SalaryBoxTypeDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetSalaryBoxTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetSalaryBoxTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        #endregion

        #region SalaryBox

        public static DataTable SalaryBoxAddEdit(SalaryBox model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("SalaryBoxAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@SalaryBoxTypeID", model.SalaryBoxTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@Name", model.Name);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable SalaryBoxGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("SalaryBoxGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }
        public static DataTable SalaryBoxDelete(int ID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("SalaryBoxDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetSalaryBoxes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetSalaryBoxes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        #endregion

        #region BonusType

        public static DataTable BonusTypeAddEdit(BonusType model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("BonusTypeAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@Name", model.Name);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable BonusTypeGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("BonusTypeGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }
        public static DataTable BonusTypeDelete(int ID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("BonusTypeDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetBonusTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetBonusTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        #endregion

        #region Bonus

        public static DataTable BonusAddEdit(Bonus model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("BonusAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@Name", model.Name);
                DA.SelectCommand.Parameters.AddWithValue("@BonusTypeID", model.BonusTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@RVTypeID", model.RVTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@Amount", model.Amount);
                DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", model.CurrencyID);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable BonusGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("BonusGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }
        public static DataTable BonusDelete(int ID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("BonusDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetBonuses()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetBonuses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        #endregion

        #region EmployeeBonus

        public static DataTable EmployeeBonusAddEdit(EmployeeBonus model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeBonusAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@BasicSalaryID", model.BasicSalaryID);
                DA.SelectCommand.Parameters.AddWithValue("@BonusID", model.BonusID);
                DA.SelectCommand.Parameters.AddWithValue("@Amount", model.Amount);
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.DateFrom);
                if (!String.IsNullOrEmpty(model.DateTo))
                    DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.DateTo);
                DA.SelectCommand.Parameters.AddWithValue("@Note", model.Note);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmployeeBonusGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeBonusGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }
        public static DataTable EmployeeBonusDelete(int ID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeBonusDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static EmployeeBonusVM GetFilterdEmployeeBonuses(EmployeeBonusVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeeBonuses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                if (!String.IsNullOrEmpty(model.filter.BonusID))
                    DA.SelectCommand.Parameters.AddWithValue("@BonusID", model.filter.BonusID);
                if (!String.IsNullOrEmpty(model.filter.DateFrom))
                    DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.filter.DateFrom);
                if (!String.IsNullOrEmpty(model.filter.DateTo))
                    DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.filter.DateTo);
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

        #region DeductionType

        public static DataTable DeductionTypeAddEdit(DeductionType model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("DeductionTypeAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@Name", model.Name);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable DeductionTypeGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("DeductionTypeGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }
        public static DataTable DeductionTypeDelete(int ID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("DeductionTypeDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetDeductionTypes()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetDeductionTypes", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        #endregion

        #region Deduction

        public static DataTable DeductionAddEdit(Deduction model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("DeductionAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@Name", model.Name);
                DA.SelectCommand.Parameters.AddWithValue("@DeductionTypeID", model.DeductionTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@RVTypeID", model.RVTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@Amount", model.Amount);
                DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", model.CurrencyID);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable DeductionGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("DeductionGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }
        public static DataTable DeductionDelete(int ID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("DeductionDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetDeductions()
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetDeductions", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        #endregion

        #region EmployeeDeduction

        public static DataTable EmployeeDeductionAddEdit(EmployeeDeduction model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeDeductionAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@BasicSalaryID", model.BasicSalaryID);
                DA.SelectCommand.Parameters.AddWithValue("@DeductionID", model.DeductionID);
                DA.SelectCommand.Parameters.AddWithValue("@Amount", model.Amount);
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.DateFrom);
                if (!String.IsNullOrEmpty(model.DateTo))
                    DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.DateTo);
                DA.SelectCommand.Parameters.AddWithValue("@Note", model.Note);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable MultiEmployeeDeductionAddEdit(EmployeesDeduction model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeDeductionAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", -1);
                DA.SelectCommand.Parameters.AddWithValue("@BasicSalaryID", null);
                DA.SelectCommand.Parameters.AddWithValue("@DeductionID", model.DeductionID);
                DA.SelectCommand.Parameters.AddWithValue("@Amount", 0);
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.DateFrom);
                if (!String.IsNullOrEmpty(model.DateTo))
                    DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.DateTo);
                DA.SelectCommand.Parameters.AddWithValue("@Note", model.Note);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }


        public static DataTable EmployeeDeductionGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeDeductionGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }
        public static DataTable EmployeeDeductionDelete(int ID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeDeductionDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable DeductionPostponeDays(EmployeeDeduction model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("DeductionPostponeDays", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@NewDeductionDays", model.PostponeDays);
                DA.SelectCommand.Parameters.AddWithValue("@Note", model.Note);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static EmployeeDeductionVM GetFilterdEmployeeDeductions(EmployeeDeductionVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeeDeductions", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                if (!String.IsNullOrEmpty(model.filter.DeductionID))
                    DA.SelectCommand.Parameters.AddWithValue("@BonusID", model.filter.DeductionID);
                if (!String.IsNullOrEmpty(model.filter.DateFrom))
                    DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.filter.DateFrom);
                if (!String.IsNullOrEmpty(model.filter.DateTo))
                    DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.filter.DateTo);
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

        #region BasicSalary

        public static DataTable BasicSalaryAddEdit(BasicSalary model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("BasicSalaryAddEdit", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (model.ID != null)
                    DA.SelectCommand.Parameters.AddWithValue("@ID", model.ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@SalaryBoxID", model.SalaryBoxID);
                DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", model.CurrencyID);
                DA.SelectCommand.Parameters.AddWithValue("@Amount", model.Amount);
                DA.SelectCommand.Parameters.AddWithValue("@DateFrom", model.DateFrom);
                if (!String.IsNullOrEmpty(model.DateTo))
                    DA.SelectCommand.Parameters.AddWithValue("@DateTo", model.DateTo);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable BasicSalaryGet(int ID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("BasicSalaryGet", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }
        public static DataTable BasicSalaryDelete(int ID, int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("BasicSalaryDelete", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static BasicSalaryVM GetFilterdBasicSalaries(BasicSalaryVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdBasicSalaries", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.EmployeeName))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", model.filter.EmployeeName);
                if (!String.IsNullOrEmpty(model.filter.CurrencyID))
                    DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", model.filter.CurrencyID);
                if (!String.IsNullOrEmpty(model.filter.SalaryBoxID))
                    DA.SelectCommand.Parameters.AddWithValue("@SalaryBoxID", model.filter.SalaryBoxID);
                if (!String.IsNullOrEmpty(model.filter.SalaryBoxTypeID))
                    DA.SelectCommand.Parameters.AddWithValue("@SalaryBoxTypeID", model.filter.SalaryBoxTypeID);
                if (!String.IsNullOrEmpty(model.filter.EmployeeStatusID))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeStatusID", model.filter.EmployeeStatusID);
                if (!String.IsNullOrEmpty(model.filter.EmploymentTypeID))
                    DA.SelectCommand.Parameters.AddWithValue("@EmploymentTypeID", model.filter.EmploymentTypeID);
                if (!String.IsNullOrEmpty(model.filter.SalaryDate))
                    DA.SelectCommand.Parameters.AddWithValue("@SalaryDate", model.filter.SalaryDate);
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

        #region EmployeeSalary

        public static DataTable CalculateEmployeeSalary(EmployeeSalary model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("CalculateEmployeeSalary", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@Year", model.Year);
                DA.SelectCommand.Parameters.AddWithValue("@MonthID", model.MonthID);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.UserID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static EmployeeSalaryVM GetFilterdEmployeeSalaries(EmployeeSalaryVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployeeSalaries", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.filter.EmployeeID);
                if (!String.IsNullOrEmpty(model.filter.Year))
                    DA.SelectCommand.Parameters.AddWithValue("@Year", model.filter.Year);
                if (!String.IsNullOrEmpty(model.filter.MonthID))
                    DA.SelectCommand.Parameters.AddWithValue("@MonthID", model.filter.MonthID);
                if (!String.IsNullOrEmpty(model.filter.CurrencyID))
                    DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", model.filter.CurrencyID);
                if (!String.IsNullOrEmpty(model.filter.SalaryBoxID))
                    DA.SelectCommand.Parameters.AddWithValue("@SalaryBoxID", model.filter.SalaryBoxID);
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }
        }

        public static DataTable GetEmployeeSalaryReport(int Year, int MonthID, int employeeId)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeSalaryReport", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", employeeId);
                DA.SelectCommand.Parameters.AddWithValue("@Year", Year);
                DA.SelectCommand.Parameters.AddWithValue("@MonthID", MonthID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetEmployeeBonuses(int Year, int MonthID, int employeeId)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeBonuses", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", employeeId);
                DA.SelectCommand.Parameters.AddWithValue("@Year", Year);
                DA.SelectCommand.Parameters.AddWithValue("@MonthID", MonthID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetEmployeeDeductions(int Year, int MonthID, int employeeId)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeDeductions", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", employeeId);
                DA.SelectCommand.Parameters.AddWithValue("@Year", Year);
                DA.SelectCommand.Parameters.AddWithValue("@MonthID", MonthID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetEmployeesSalaryBankReport(int? Year, int? MonthID, int? CurrencyID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetEmployeesSalaryBankReport", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@Year", Year);
                DA.SelectCommand.Parameters.AddWithValue("@MonthID", MonthID);
                DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", CurrencyID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetSumSalaryBankReport(int? SalaryBoxID, int? Year, int? MonthID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetSumSalaryBankReport", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SalaryBoxID", SalaryBoxID);
                DA.SelectCommand.Parameters.AddWithValue("@Year", Year);
                DA.SelectCommand.Parameters.AddWithValue("@MonthID", MonthID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        #endregion
    }
}
