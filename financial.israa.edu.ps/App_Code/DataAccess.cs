using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
//using System.Linq;
using System.Web;

public class DataAccess
{
    private static SqlConnection GetConnection()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["isra"].ToString());
        conn.Open();
        return conn;
    }

    private static SqlConnection GetConnection2()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["isra2"].ToString());
        conn.Open();
        return conn;
    }

    private static SqlConnection GetConnection3()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["isra3"].ToString());
        conn.Open();
        return conn;
    }

    #region UserLogin

    public static DataTable IsValidEmployee(string EmployeeNo, string Password)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsValidEmployee", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeNo", EmployeeNo);
            DA.SelectCommand.Parameters.AddWithValue("@Password", Password);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable IsEmployeeInSystem(int EmployeeID, int SystemID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsEmployeeInSystem", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SystemID", SystemID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static ArrayList GetEmployeeSystemActions(string EmployeeID, string SystemID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeSystemActions", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SystemID", SystemID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            ArrayList arrayList = new ArrayList();
            foreach (DataRow dr in DT.Rows)
            {
                arrayList.Add(dr["ActionName"]);
            }
            return arrayList;
        }
    }

    #endregion

    #region Action

    public static int ActionAddEdit(string ID, string ArName, string EnName, string Value, string CDType, string RVType, bool IsScholarship, bool IsActive, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("ActionAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@ArName", ArName);
            cmd.Parameters.AddWithValue("@EnName", EnName);
            cmd.Parameters.AddWithValue("@Value", Value);
            cmd.Parameters.AddWithValue("@CDType", CDType);
            cmd.Parameters.AddWithValue("@RVType", RVType);
            cmd.Parameters.AddWithValue("@IsScholarship", IsScholarship);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable ActionGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ActionGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int ActionActivate(string ID, bool IsActive, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("ActionActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int ActionDelete(string ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("ActionDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable GetActionValue(string ActionID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetActionValue", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ActionID", ActionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region Currency

    public static int CurrencyAddEdit(string ID, string ArName, string EnName, string FractionsNo, string FractionName, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("CurrencyAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@ArName", ArName);
            cmd.Parameters.AddWithValue("@EnName", EnName);
            cmd.Parameters.AddWithValue("@FractionsNo", FractionsNo);
            cmd.Parameters.AddWithValue("@FractionName", FractionName);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable CurrencyGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CurrencyGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int CurrencyActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("CurrencyActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int CurrencyDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("CurrencyDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region CurrencyPrice

    public static int CurrencyPriceAddEdit(string ID, string CurrencyID, string Price, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("CurrencyPriceAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@CurrencyID", CurrencyID);
            cmd.Parameters.AddWithValue("@Price", Price);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable CurrencyPriceGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CurrencyPriceGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int CurrencyPriceActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("CurrencyPriceActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int CurrencyPriceDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("CurrencyPriceDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Student

    public static DataTable CheckStudent(string StudentNo)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CheckStudent", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentNo", StudentNo);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region Transaction

    public static DataTable AddCashTransaction(string StudentID, string Amount1, string Amount2, string Amount3, string ActionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddCashTransaction", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@Amount1", Amount1);
            DA.SelectCommand.Parameters.AddWithValue("@Amount2", Amount2);
            DA.SelectCommand.Parameters.AddWithValue("@Amount3", Amount3);
            DA.SelectCommand.Parameters.AddWithValue("@ActionID", ActionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetLastTenStdTransaction(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetLastTenStdTransaction", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region StudentBook

    public static DataTable GetStudentBooks(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentBooks", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable BuyBook(string StudentID, string BookID, string REmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BuyBook", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@BookID", BookID);
            DA.SelectCommand.Parameters.AddWithValue("@REmployeeID", REmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable DeliveryStudentBook(string StudentBookID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DeliveryStudentBook", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentBookID", StudentBookID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable DeleteStudentBook(string StudentBookID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DeleteStudentBook", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentBookID", StudentBookID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion


    #region Account

    public static int AccountAddEdit(string ID, string AccountNo, string AccountName, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlCommand cmd = new SqlCommand("AccountAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@AccountNo", AccountNo);
            cmd.Parameters.AddWithValue("@AccountName", AccountName);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable AccountGet(string ID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AccountGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int AccountActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlCommand cmd = new SqlCommand("AccountActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int AccountDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlCommand cmd = new SqlCommand("AccountDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable getTransactionByAccountId(string accountId)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetAccountTransactions", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@accountId", accountId);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    public static DataTable GetStdStudyTableInfoReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdStudyTableInfoReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetFinancialStatistic1()
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetFinancialStatistic1", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetFinancialStatistic2()
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetFinancialStatistic2", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetEmployeeData(string EmployeeID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeData", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentImageGet(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentImageGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmployeeImageGet(string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeImageGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



    public static DataTable SetStudentInstallmentPaid(string ID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetStudentInstallmentPaid", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    #region Voucher

    public static DataTable DeleteVoucher(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DeleteVoucher", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable DeleteVoucherDetails(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DeleteVoucherDetails", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetReceiptVoucher(int VoucherID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetReceiptVoucher", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@VoucherID", VoucherID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetReceiptVoucherDetails(int VoucherID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetReceiptVoucherDetails", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@VoucherID", VoucherID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    #endregion


    public static DataTable ApplyScholarship(string SemesterID, string StudentID, string ActionID, string Value, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ApplyScholarship", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@ActionID", ActionID);
            DA.SelectCommand.Parameters.AddWithValue("@Value", Value);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetSemesterDateStudentBookStatistics(string SemesterID, string Date,string BranchID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSemesterDateStudentBookStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@Date", Date);
            DA.SelectCommand.Parameters.AddWithValue("@BranchID", BranchID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetSemesterDateStudentBookDeleteStatistics(string SemesterID, string Date,string BranchID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSemesterDateStudentBookDeleteStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@Date", Date);
            DA.SelectCommand.Parameters.AddWithValue("@BranchID", BranchID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetSemesterDateStudentBookDeleteTotalStatistics(string SemesterID, string Date, string BranchID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSemesterDateStudentBookDeleteTotalStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@Date", Date);
            DA.SelectCommand.Parameters.AddWithValue("@BranchID", BranchID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable DeleteTransaction(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DeleteTransaction", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable AddAccountToStudentTransaction(string AccountID, string StudentID, string Value, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddAccountToStudentTransaction", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@AccountID", AccountID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@Value", Value);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AddStudentFinancialReturn(string StudentID, string ActionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddStudentFinancialReturn", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@ActionID", ActionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AddStudentFinancialReturnAmount(string StudentID, string ActionID, string Amount, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddStudentFinancialReturnAmount", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@ActionID", ActionID);
            DA.SelectCommand.Parameters.AddWithValue("@Amount", Amount);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentScholarshipAccreditation(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentScholarshipAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable UpdateVoucherNote(string ID, string Note,string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("UpdateVoucherNote", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@Note", Note);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetSemesterCollegeTotalStatistics(string SemesterID, string CollegeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSemesterCollegeTotalStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@CollegeID", CollegeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetSemesterCollegeIncomeStatistics(string SemesterID, string CollegeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSemesterCollegeIncomeStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@CollegeID", CollegeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetSemesterCollegeReturnStatistics(string SemesterID, string CollegeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSemesterCollegeReturnStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@CollegeID", CollegeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

public static DataTable StudentFromAcountAPIsTransitionUpdate(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentFromAcountAPIsTransitionUpdate", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #region StudentBlockException
    public static DataTable StudentBlockExceptionAdd(string StudentID, string SemesterID, string Notes, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentBlockExceptionAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@Notes", @Notes);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable StudentBlockExceptionDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentBlockExceptionDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentBlockExceptionActive(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentBlockExceptionActivate", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    #endregion

    public static DataTable GetSemesterDateStudentBookTotalStatistics(string SemesterID,string Date, string BranchID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSemesterDateStudentBookTotalStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@Date", Date);
            DA.SelectCommand.Parameters.AddWithValue("@BranchID", BranchID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
}