using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Text;
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

    #region Action

    public static int ActionAddEdit(string ID, string ArName, string EnName, string Value, string CDType, string RVType, bool IsScholarship, bool IsActive, string EmployeeID)
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
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
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

    public static int ActionActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("ActionActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int ActionDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("ActionDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
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
    //helpRequest
    public static DataTable GetStudentHelpRequest(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentHelpRequest", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable HelpRequestDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("HelpRequestDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable HelpRequestBenefit(string ID, bool IsBenefit, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("HelpRequestBenefit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@IsBenefit", IsBenefit);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    //GetStudentHelps
    public static DataTable GetStudentHelps(string HelpRequestID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentHelps", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@HelpRequestID", HelpRequestID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    //GetStudentData
    public static DataTable GetStudentData(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentData", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int StudentProblemsAddEdit(string ID, string StudentID, string SemsterID, string Problem, string SNotes, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlCommand cmd = new SqlCommand("StudentProblemsAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@StudentID", StudentID);
            cmd.Parameters.AddWithValue("@SemsterID", SemsterID);
            cmd.Parameters.AddWithValue("@Problem", Problem);
            cmd.Parameters.AddWithValue("@SNotes", SNotes);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static DataTable StudentMainDataGet(string StudentID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentMainDataGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable StudentContactDataGet(string StudentID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentContactDataGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable StudentSuperiorDataGet(string StudentID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentSuperiorDataGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable StudentImageGet(string StudentID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentImageGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable StudentTawjehyDataGet(string StudentID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentTawjehyDataGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable StudentDepDataGet(string StudentID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentDepDataGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetStudentMobile(string StudentID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentMobile", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable HelpRequestAdd(string ID, string StudentID, string HelpType,
 string FamilyCountNo, string UnivStudentNo, string FamilySchoolNo, string SpecialNeedsNo, string FatherWork, string MotherWork, string IsPerentDead,
  string FamilyIncome, string SocialCaseType, string HouseType, string RentValue, string FurnitureStatus, string BulidingType, string BulidingStatus,
     string BulidingArea, string HouseNature, string ResidencePlace, string Others, string UpdateEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("HelpRequestAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;


            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@HelpType", HelpType);
            DA.SelectCommand.Parameters.AddWithValue("@FamilyCountNo", FamilyCountNo);
            DA.SelectCommand.Parameters.AddWithValue("@UnivStudentNo", UnivStudentNo);
            DA.SelectCommand.Parameters.AddWithValue("@FamilySchoolNo", FamilySchoolNo);
            DA.SelectCommand.Parameters.AddWithValue("@SpecialNeedsNo", SpecialNeedsNo);
            DA.SelectCommand.Parameters.AddWithValue("@FatherWork", FatherWork);
            DA.SelectCommand.Parameters.AddWithValue("@MotherWork", MotherWork);
            DA.SelectCommand.Parameters.AddWithValue("@IsPerentDead", IsPerentDead);
            DA.SelectCommand.Parameters.AddWithValue("@FamilyIncome", FamilyIncome);
            DA.SelectCommand.Parameters.AddWithValue("@SocialCaseType", SocialCaseType);
            DA.SelectCommand.Parameters.AddWithValue("@HouseType", HouseType);
            if (RentValue != "")
                DA.SelectCommand.Parameters.AddWithValue("@RentValue", RentValue);
            DA.SelectCommand.Parameters.AddWithValue("@FurnitureStatus", FurnitureStatus);
            DA.SelectCommand.Parameters.AddWithValue("@BulidingType", BulidingType);
            DA.SelectCommand.Parameters.AddWithValue("@BulidingStatus", BulidingStatus);
            DA.SelectCommand.Parameters.AddWithValue("@BulidingArea", BulidingArea);
            DA.SelectCommand.Parameters.AddWithValue("@HouseNature", HouseNature);
            DA.SelectCommand.Parameters.AddWithValue("@ResidencePlace", ResidencePlace);
            DA.SelectCommand.Parameters.AddWithValue("@Others", Others);
            DA.SelectCommand.Parameters.AddWithValue("@UpdateEmployeeID", UpdateEmployeeID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable HelpRequestGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("HelpRequestGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #region EmployeeLogin

    public static DataTable IsValidEmployee(string EmployeeNo, string Password)
    {
        using (SqlConnection conn = GetConnection3())
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

    public static DataTable EmpChangePassword(string EmployeeID, string OldPassword, string NewPassword)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmpChangePassword", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@OldPassword", OldPassword);
            DA.SelectCommand.Parameters.AddWithValue("@NewPassword", NewPassword);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    //public static DataTable EmpChangePassword(string StudentID, string OldPassword, string NewPassword)
    //{
    //    using (SqlConnection conn = GetConnection3())
    //    {
    //        SqlDataAdapter DA = new SqlDataAdapter("EmpChangePassword", conn);
    //        DA.SelectCommand.CommandType = CommandType.StoredProcedure;
    //        DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
    //        DA.SelectCommand.Parameters.AddWithValue("@OldPassword", OldPassword);
    //        DA.SelectCommand.Parameters.AddWithValue("@NewPassword", NewPassword);
    //        DataTable DT = new DataTable();
    //        DA.Fill(DT);
    //        return DT;
    //    }
    //}

    public static DataTable IsEmployeeInSystem(int EmployeeID, int SystemID)
    {
        using (SqlConnection conn = GetConnection3())
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
        using (SqlConnection conn = GetConnection3())
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

    #region Student

    public static DataTable CheckStudent(string StudentNo)
    {
        using (SqlConnection conn = GetConnection3())
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

    #region Scholarship

    public static DataTable AddAffairsScholarship(string StudentID, string ActionID, string SemesterID, string Note, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddAffairsScholarship", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@ActionID", ActionID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@Note", Note);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int ActivateScholarship(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("ActivateScholarship", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int DeleteScholarship(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("DeleteScholarship", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Loan

    public static DataTable AddLoan(string SemesterID, string StudentID, string ActionID, string LoanValue, string Note, string RequestDate, string RepayDate, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddLoan", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@ActionID", ActionID);
            DA.SelectCommand.Parameters.AddWithValue("@LoanValue", LoanValue);
            DA.SelectCommand.Parameters.AddWithValue("@Note", Note);
            DA.SelectCommand.Parameters.AddWithValue("@RequestDate", RequestDate);
            DA.SelectCommand.Parameters.AddWithValue("@RepayDate", RepayDate);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int DeleteLoan(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("DeleteLoan", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }


    #endregion

    #region InstallmentOrder

    public static DataTable InstallmentOrderGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("InstallmentOrderGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    
    public static DataTable InstallmentOrderAddEdit(string ID, string StudentID, string NumOfHours, string PaidAmount, string RemainingAmount, string EmployeeID, string GrantPercentage, string LastFinancialPayment)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("InstallmentOrderAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@NumOfHours", NumOfHours);
            DA.SelectCommand.Parameters.AddWithValue("@PaidAmount", PaidAmount);
            DA.SelectCommand.Parameters.AddWithValue("@RemainingAmount", RemainingAmount);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@GrantPercentage", GrantPercentage);
            DA.SelectCommand.Parameters.AddWithValue("@LastFinancialPayment", LastFinancialPayment);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable InstallmentOrderDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("InstallmentOrderDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStudentInstallmentOrder(string StudentID, string SemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentInstallmentOrder", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    //جميع الطلبة الغير مقدمين للأقساط في الفصل الدراسي الأول 2020-2021  

    public static DataTable GetStdsSemesterBySemesterID()
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdsSemesterBySemesterID", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStudentCoursesStatistics(string ID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentCoursesStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetStudentBalance(string ID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentBalance", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable InstallmentOrderStudentAdd(string ID, string NumOfHours, string PaidAmount, string RemainingAmount, string LastFinancialPayment)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("InstallmentOrderStudentAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@NumOfHours", NumOfHours);
            DA.SelectCommand.Parameters.AddWithValue("@PaidAmount", PaidAmount);
            DA.SelectCommand.Parameters.AddWithValue("@RemainingAmount", RemainingAmount);
            DA.SelectCommand.Parameters.AddWithValue("@LastFinancialPayment", LastFinancialPayment);


            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable InstallmentOrderStudentCalc(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("InstallmentOrderStudentCalc", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStudentLastPaid(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentLastPaid", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    #endregion

    #region StudentInstallment

    public static DataTable StudentInstallmentGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentInstallmentGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentInstallmentAddEdit(String ID, string StudentID, string InstallmentName, string InstallmentValue, DateTime RepayDate, string InstallmentType, string Note, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentInstallmentAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@InstallmentName", InstallmentName);
            DA.SelectCommand.Parameters.AddWithValue("@InstallmentValue", InstallmentValue);
            DA.SelectCommand.Parameters.AddWithValue("@RepayDate", RepayDate);
            DA.SelectCommand.Parameters.AddWithValue("@InstallmentType", InstallmentType);
            DA.SelectCommand.Parameters.AddWithValue("@Note", Note);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable StudentInstallmentDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentInstallmentDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetInstallmentOrderClosed(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetInstallmentOrderClosed", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStudentInstallmentBySemesterID(string StudentID, string SemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentInstallmentBySemesterID", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ReportInstallmentInfo(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ReportInstallmentInfo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    #endregion

    #region SocialSolidarity

    public static DataTable AddSocialSolidarity(string StudentID, string SocialSolidarityValue, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddSocialSolidarity", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SocialSolidarityValue", SocialSolidarityValue);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    public static DataTable AddAccountToStudentTransaction(string AccountID, string StudentID, string Value, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
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

    public static DataTable GetStudentShowIssueReportInfo(string StudentID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentShowIssueReportInfo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StdMessageAdd(string EmployeeID, string StudentID, string Jawwal, string MessageBody, bool SendStatus)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StdMessageAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@Jawwal", Jawwal);
            DA.SelectCommand.Parameters.AddWithValue("@MessageBody", MessageBody);
            DA.SelectCommand.Parameters.AddWithValue("@SendStatus", SendStatus);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStudentBankInstallment(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentBankInstallment", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetSpecialStdTransaction(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSpecialStdTransaction", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetSpecialStdDedection(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSpecialStdDedection", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StdInfractionAddEdit(string ID, string SemesterID, string StudentID, string InfractionID, string InfractionDate, string InfractionDetails, string PenaltyDetails, string Nots, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StdInfractionAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@InfractionID", InfractionID);
            DA.SelectCommand.Parameters.AddWithValue("@InfractionDate", InfractionDate);
            DA.SelectCommand.Parameters.AddWithValue("@InfractionDetails", InfractionDetails);
            DA.SelectCommand.Parameters.AddWithValue("@PenaltyDetails", PenaltyDetails);
            DA.SelectCommand.Parameters.AddWithValue("@Nots", Nots);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StdInfractionGet(string ID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StdInfractionGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable StdInfractionDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StdInfractionDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID ", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #region StudentsFreeFromTwentyPercCondAPI
    public static DataTable StudentsFreeFromTwentyPercCondAPIAdd(string StudentID, string SemesterID, string Notes, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentsFreeFromTwentyPercCondAPIAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@Notes", Notes);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    #endregion

    #region StudentCourseHoursNum
    public static DataTable GetStdCoursesHourNum(string StudentID, string SemesterID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdCoursesHourNum", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    #endregion


    #region API

    public static StudentDto GetStudentInfo(string studentId)
    {
        if (!string.IsNullOrEmpty(studentId))
        {
            WebClient we = new WebClient();
            we.Encoding = Encoding.UTF8;

            var jason = we.DownloadString("https://system.israa.edu.ps/app/GetStudentInfo?studentId=" + studentId);
            var data = JsonConvert.DeserializeObject<StudentDto>(jason);
            return data;
        }
        return null;
    }

    #endregion

}

#region DTO

public class StudentDto
{
    public int studentNo { get; set; }
    public string studentName { get; set; }
    public string collegeName { get; set; }
    public string departmentName { get; set; }
    public string studentAddress { get; set; }
    public string studentMobile { get; set; }
    public DateTime reportDate { get; set; }
    public string yearName { get; set; }
    public string semesterName { get; set; }
}

#endregion