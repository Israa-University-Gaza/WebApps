using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Globalization;
using System.IO;
using System.Text.RegularExpressions;
using HRModel;
using System.Drawing;

public class DataAccess
{
    private static SqlConnection GetConnection()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HumanResources"].ToString());
        conn.Open();
        return conn;
    }

    private static SqlConnection GetConnection3()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["isra3"].ToString());
        conn.Open();
        return conn;
    }

    private static SqlConnection GetConnection4()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["isra"].ToString());
        conn.Open();
        return conn;
    }

    public static DataTable CheckEmployee(string EmployeeNo)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CheckEmployee", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeNo", EmployeeNo);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    private static SqlConnection GetConnection5()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaHumanResource"].ToString());
        conn.Open();
        return conn;
    }
    //GetCountOfVacationDays

    public static DataTable GetCountOfVacationDays(string StartDate, string EndDate)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetCountOfVacationDays", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StartDate", StartDate);
            DA.SelectCommand.Parameters.AddWithValue("@EndDate", EndDate);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable UpdateLoadHoursContract(string EmployeeID, string SemesterID, string ActualHours)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("UpdateLoadHoursContract", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@ActualHours", ActualHours);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetEmployeeMidtermExamSections(string EmployeeID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeMidtermExamSections", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetEmployeeMidtermExamSections(string EmployeeID, string SemesterID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeMidtermExamSections", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable EmpChangePassword(string Emp_ID, string OldPassword, string NewPassword)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmpChangePassword", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@OldPassword", OldPassword);
            DA.SelectCommand.Parameters.AddWithValue("@NewPassword", NewPassword);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GenerateNewEmployeeNo(string ContractTypeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GenerateNewEmployeeNo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ContractTypeID", ContractTypeID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable NewEmployeeGetDate(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("NewEmployeeGetDate", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #region UserLogin

    public static DataTable IsValidEmployee(string Username, string Password)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsValidEmployee", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeNo", Username);
            DA.SelectCommand.Parameters.AddWithValue("@Password", Password);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



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



    #endregion
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
    public static DataTable NewEmployeeNoCreate()
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("NewEmployeeNoCreate", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    //salaryform for one
    #region SalaryForm
    public static DataTable EmployeeDetailsGet(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeDetailsGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable PlusSalaryForm(string Emp_ID, int Month, int Year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("PlusSalaryForm", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Month", Month);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Year", Year);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable DiscountSalaryForm(string Emp_ID, int Month, int Year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DiscountSalaryForm", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Month", Month);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Year", Year);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    //report for all Emp discount in month
    public static DataTable DiscountSalaryEmpGetAll(int Month, int Year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DiscountSalaryEmpGetAll", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Month", Month);
            DA.SelectCommand.Parameters.AddWithValue("@Year", Year);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable DifferencesSalaryForm(string Emp_ID, int Month, int Year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DifferencesSalaryForm", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Month", Month);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Year", Year);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable Salary(string Emp_ID, int Month, int Year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Salary", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Month", Month);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Year", Year);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    public static DataTable GetAllEmployeeDetails()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetAllEmployeeDetails", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable PlusSalaryFormGetAll(int Month, int Year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("PlusSalaryFormGetAll", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Month", Month);

            DA.SelectCommand.Parameters.AddWithValue("@Year", Year);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable EmpSalaryGetAll(int Month, int Year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmpSalaryGetAll", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Month", Month);

            DA.SelectCommand.Parameters.AddWithValue("@Year", Year);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AttendanceReportGetAll(int Month, int Year, int EmpCategoryID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AttendanceReportGetAll", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", Month);

            DA.SelectCommand.Parameters.AddWithValue("@year", Year);
            DA.SelectCommand.Parameters.AddWithValue("@EmpCategoryID", EmpCategoryID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable AttendanceSurvay(int Month, int Year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AttendanceSurvay", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Month", Month);

            DA.SelectCommand.Parameters.AddWithValue("@Year", Year);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable AttendanceSurvayYearly(int Year, int Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AttendanceSurvayYearly", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;


            DA.SelectCommand.Parameters.AddWithValue("@Year", Year);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable EmpAttendance(string Emp_ID, int Month, int Year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmpAttendance", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", Month);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@year", Year);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmpAttendanceBetweenTwoDates(string Emp_ID, string FromDate, string ToDate)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmpAttendanceBetweenTwoDates", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@FromDate", FromDate);
            DA.SelectCommand.Parameters.AddWithValue("@ToDate", ToDate);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable EmpAttendanceLate(string Emp_ID, string FromDate, string ToDate)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmpAttendanceLate", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@FromDate", FromDate);
            DA.SelectCommand.Parameters.AddWithValue("@ToDate", ToDate);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable calculateAttendanceGetAll(string Emp_ID, int Month, int Year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("calculateAttendanceGetAll", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", Month);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@year", Year);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable EmpAttendanceLateHours(string Emp_ID, string FromDate, string ToDate)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmpAttendanceLateHours", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@FromDate", FromDate);
            DA.SelectCommand.Parameters.AddWithValue("@ToDate", ToDate);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int AttImport(string Pathfile)
    {
        FileInfo file = new FileInfo(Pathfile);

        string script = file.OpenText().ReadToEnd();

        using (SqlConnection conn = DataAccess.GetConnection())
        {

            SqlCommand sqlComm = new SqlCommand(script, conn);
            return sqlComm.ExecuteNonQuery();
        }

    }

    public static int INOUTDATAToAttendance()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("INOUTDATAToAttendance", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            return cmd.ExecuteNonQuery();
        }
    }

    //for attendance absent employee report for specific date

    public static DataTable AttAbsentEmp(string date, string EmpCategoryID, string EmpStatusID, string EmpSubStatusID, string EmployeeCatID, string ContractTypeID, string SubContractTypeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AttAbsentEmpGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@date", date);
            DA.SelectCommand.Parameters.AddWithValue("@EmpCategoryID", EmpCategoryID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpStatusID", EmpStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpSubStatusID", EmpSubStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeCatID", EmployeeCatID);
            DA.SelectCommand.Parameters.AddWithValue("@ContractTypeID", ContractTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@SubContractTypeID", SubContractTypeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable AbsentEmpGet(string date, string EmpCategoryID, string EmpStatusID, string EmpSubStatusID, string EmployeeCatID, string ContractTypeID, string SubContractTypeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AbsentEmpGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@date", date);
            DA.SelectCommand.Parameters.AddWithValue("@EmpCategoryID", EmpCategoryID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpStatusID", EmpStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpSubStatusID", EmpSubStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeCatID", EmployeeCatID);
            DA.SelectCommand.Parameters.AddWithValue("@ContractTypeID", ContractTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@SubContractTypeID", SubContractTypeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetEmployeeAttendanceWithoutAttendanceTo(string date, string EmpCategoryID, string EmpStatusID, string EmpSubStatusID, string EmployeeCatID, string ContractTypeID, string SubContractTypeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeAttendanceWithoutAttendanceTo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@date", date);
            DA.SelectCommand.Parameters.AddWithValue("@EmpCategoryID", EmpCategoryID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpStatusID", EmpStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpSubStatusID", EmpSubStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeCatID", EmployeeCatID);
            DA.SelectCommand.Parameters.AddWithValue("@ContractTypeID", ContractTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@SubContractTypeID", SubContractTypeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetInstructorAttendance(string date, string EmpCategoryID, string EmpStatusID, string EmpSubStatusID, string EmployeeCatID, string ContractTypeID, string SubContractTypeID, string IsAbsent, string IsLate)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetInstructorAttendance", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@date", date);
            DA.SelectCommand.Parameters.AddWithValue("@EmpCategoryID", EmpCategoryID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpStatusID", EmpStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpSubStatusID", EmpSubStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeCatID", EmployeeCatID);
            DA.SelectCommand.Parameters.AddWithValue("@ContractTypeID", ContractTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@SubContractTypeID", SubContractTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@IsAbsent", IsAbsent);
            DA.SelectCommand.Parameters.AddWithValue("@IsLate", IsLate);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetInstructorAttendance3(string EmployeeID, string SemesterID, string DateFrom, string DateTo, string IsLate)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetInstructorAttendance3", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@DateFrom", DateFrom);
            DA.SelectCommand.Parameters.AddWithValue("@DateTo", DateTo);
            DA.SelectCommand.Parameters.AddWithValue("@IsLate", IsLate);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    //for vactions in this date
    public static DataTable VacationDailyGet(string date, string EmpCategoryID, string EmpStatusID, string EmpSubStatusID, string EmployeeCatID, string ContractTypeID, string SubContractTypeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("VacationDailyGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@date", date);
            DA.SelectCommand.Parameters.AddWithValue("@EmpCategoryID", EmpCategoryID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpStatusID", EmpStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpSubStatusID", EmpSubStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeCatID", EmployeeCatID);
            DA.SelectCommand.Parameters.AddWithValue("@ContractTypeID", ContractTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@SubContractTypeID", SubContractTypeID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable AttAbsentEmpCountGet(string date, string EmpCategoryID, string EmpStatusID, string EmpSubStatusID, string EmployeeCatID, string ContractTypeID, string SubContractTypeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AttAbsentEmpCountGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@date", date);
            DA.SelectCommand.Parameters.AddWithValue("@EmpCategoryID", EmpCategoryID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpStatusID", EmpStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpSubStatusID", EmpSubStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeCatID", EmployeeCatID);
            DA.SelectCommand.Parameters.AddWithValue("@ContractTypeID", ContractTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@SubContractTypeID", SubContractTypeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable AbsentEmployeesGet(string startDate, string EndDate, string EmpCategoryID, string EmpStatus, string EmpSubStatusID, string ContractTypeID, string SubContractTypeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AbsentEmployeesGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@startDate", startDate);
            DA.SelectCommand.Parameters.AddWithValue("@EndDate", EndDate);
            DA.SelectCommand.Parameters.AddWithValue("@EmpCategoryID", EmpCategoryID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpStatusID", EmpStatus);
            DA.SelectCommand.Parameters.AddWithValue("@EmpSubStatusID", EmpSubStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@ContractTypeID", ContractTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@SubContractTypeID", SubContractTypeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    //for attendance Late employee report for specific date
    public static DataTable AttLateEmp(string date, string EmpCategory)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AttLateEmpGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@date", date);
            DA.SelectCommand.Parameters.AddWithValue("@EmpCategory", EmpCategory);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetEmployeeVacationTransaction(string EmployeeID, string month, string year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeVacationTransaction", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetEmployeeVacationSurvay(string EmployeeID, string VacationBalanceID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeVacationSurvay", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@VacationBalanceID", VacationBalanceID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetEmployeePatiantVacationSurvay(string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeePatiantVacationSurvay", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetEmployeeUrgentVacationSurvay(string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeUrgentVacationSurvay", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmpVacationBalance(string EmployeeID, string VacationBalanceID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmpVacationBalance", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@VacationBalanceID", VacationBalanceID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetEmployeesVacationTransactionMonthly(string month, string year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeesVacationTransactionMonthly", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetSemesterEmployeesTotalHours(string SemesterID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSemesterEmployeesTotalHours", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #region NewEmployee

    public static DataTable AddNewEmployee(string ID, string EmployeeCatID, string EmpTypeID, string EmployeeNo, bool IsActive, string AppointmentDate,
        string ArFirstName, string ArSecondName, string ArThirdName, string ArFamilyName, string DepartmentID, string JobTitleID,
        string ContractType, string ContractSubType, string TestFrom, string TestTo, string ContractBeginDate, string ContractEndDate,
        string Salary, string CurrencyID, string CityID, string Region, string SSN, bool AcademicData, string EmpAttCategory, string Gender,string Mobile, string UserID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddNewEmployee", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeCatID", EmployeeCatID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpTypeID", EmpTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeNo", EmployeeNo);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            if (EmployeeCatID != "2")
                DA.SelectCommand.Parameters.AddWithValue("@AppointmentDate", AppointmentDate);
            DA.SelectCommand.Parameters.AddWithValue("@ArFirstName", ArFirstName);
            DA.SelectCommand.Parameters.AddWithValue("@ArSecondName", ArSecondName);
            DA.SelectCommand.Parameters.AddWithValue("@ArThirdName", ArThirdName);
            DA.SelectCommand.Parameters.AddWithValue("@ArFamilyName", ArFamilyName);
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@JobTitleID", JobTitleID);
            DA.SelectCommand.Parameters.AddWithValue("@ContractType", ContractType);
            DA.SelectCommand.Parameters.AddWithValue("@ContractSubType", ContractSubType);
            if (EmployeeCatID == "2")
            {
                if (ContractType != "5")
                {
                    DA.SelectCommand.Parameters.AddWithValue("@TestFrom", TestFrom);
                    DA.SelectCommand.Parameters.AddWithValue("@TestTo", TestTo);
                    DA.SelectCommand.Parameters.AddWithValue("@ContractBeginDate", ContractBeginDate);
                    DA.SelectCommand.Parameters.AddWithValue("@ContractEndDate", ContractEndDate);
                    DA.SelectCommand.Parameters.AddWithValue("@Salary", Salary);
                    DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", CurrencyID);
                }
            }
            DA.SelectCommand.Parameters.AddWithValue("@CityID", CityID);
            DA.SelectCommand.Parameters.AddWithValue("@Region", Region);
            DA.SelectCommand.Parameters.AddWithValue("@SSN", SSN);
            DA.SelectCommand.Parameters.AddWithValue("@AcademicData", AcademicData);
            DA.SelectCommand.Parameters.AddWithValue("@EmpAttCategory", EmpAttCategory);
            DA.SelectCommand.Parameters.AddWithValue("@Gender", Gender);
            DA.SelectCommand.Parameters.AddWithValue("@Mobile", Mobile);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);

            DataTable DT = new DataTable();

            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable NewEmployeeAddEdit(string ID, string EmpCategoryID, string EmpTypeID, string Username, bool IsActive,
         string Ar_F_Name, string Ar_S_Name, string Ar_Th_Name, string Ar_Family_Name, string Department_ID, string JobTitleID, string CityID, string Region, string SSN, string AcademicData, string UserID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("NewEmployeeAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpCategoryID", EmpCategoryID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpTypeID", EmpTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@Username", Username);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@Ar_F_Name", Ar_F_Name);
            DA.SelectCommand.Parameters.AddWithValue("@Ar_S_Name", Ar_S_Name);
            DA.SelectCommand.Parameters.AddWithValue("@Ar_Th_Name", Ar_Th_Name);
            DA.SelectCommand.Parameters.AddWithValue("@Ar_Family_Name", Ar_Family_Name);
            DA.SelectCommand.Parameters.AddWithValue("@CityID", CityID);
            DA.SelectCommand.Parameters.AddWithValue("@Region", Region);
            DA.SelectCommand.Parameters.AddWithValue("@Department_ID", Department_ID);
            DA.SelectCommand.Parameters.AddWithValue("@JobTitleID", JobTitleID);
            DA.SelectCommand.Parameters.AddWithValue("@SSN", SSN);
            DA.SelectCommand.Parameters.AddWithValue("@AcademicData", AcademicData);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);

            DataTable DT = new DataTable();

            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region EmployeePermissions
    public static DataTable EmployeesRolesGet(string EmployeeName,string RoleName)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeesRolesGet", conn);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeName", EmployeeName);
            DA.SelectCommand.Parameters.AddWithValue("@RoleName", RoleName);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable EmployeeRoleActivate(string ID, bool IsActive,string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeRoleActivate", conn);
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable EmployeeRoleDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeRoleDelete", conn);
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    
    public static DataTable EmployeeRoleAddEdit(string EmployeeID, string RoleID,bool IsActive,string UserID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeRoleAddEdit", conn);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@RoleID", RoleID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    #endregion

    #region College
    public static DataTable GetCollegeInfo(string ID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetCollegeInfo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    
    public static DataTable CollegeEmployeeEdit(string ID,string EmployeeID,string EmployeeID2,string UpdateEmployeeID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CollegeEmployeeEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID2", EmployeeID2);
            DA.SelectCommand.Parameters.AddWithValue("@UpdateEmployeeID", UpdateEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetDepartmentInfo(string ID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetDepartmentInfo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable DepartmentEmployeeEdit(string ID, string EmployeeID, string UpdateEmployeeID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DepartmentEmployeeEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@UpdateEmployeeID", UpdateEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    #endregion

    #region Contract_Type
    public static int Contract_Type_TB_AddEdit(string Contract_Type_ID, string Contract_Type, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Contract_Type_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Contract_Type_ID != "")
                cmd.Parameters.AddWithValue("@Contract_Type_ID", Contract_Type_ID);
            cmd.Parameters.AddWithValue("@Contract_Type", Contract_Type);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }


    public static void saveContract(string Emp_ID, Int16 Contract_Type_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("saveContract", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Emp_ID != "")
                cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Contract_Type_ID", Contract_Type_ID);

            //return cmd.ExecuteNonQuery();
        }

    }
    public static DataTable Contract_Type_TB_Get(string Contract_Type_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Contract_Type_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Contract_Type_ID", Contract_Type_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable Contract1_Emp_TB_Get(string Contract_Type_ID, Int16 Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Contract1_Emp_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Contract_Type_ID", Contract_Type_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();

            DA.Fill(DT);
            return DT;
        }
    }
    public static int Contract_Type_TB_Delete(string Contract_Type_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Contract_Type_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Contract_Type_ID", Contract_Type_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Allowance
    public static DataTable Allowance_TB_AddEdit(string Allowance_ID, string description, int EvaluateType, int Allowance_Type_ID, decimal Allowance_Rate, decimal Allowance_Value,
        DateTime Allowance_Start_Date, DateTime Allowance_End_Date, int Emp_ID, int Currancy_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {// if insert updateUserID null
            SqlDataAdapter DA = new SqlDataAdapter("Allowance_TB_AddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;


            if (Allowance_ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@Allowance_ID", Allowance_ID);

            DA.SelectCommand.Parameters.AddWithValue("@description", description);
            DA.SelectCommand.Parameters.AddWithValue("@EvaluateType", EvaluateType);
            DA.SelectCommand.Parameters.AddWithValue("@Allowance_Type_ID", Allowance_Type_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Allowance_Rate", Allowance_Rate);
            DA.SelectCommand.Parameters.AddWithValue("@Allowance_Value", Allowance_Value);
            DA.SelectCommand.Parameters.AddWithValue("@Allowance_Start_Date", Allowance_Start_Date);
            DA.SelectCommand.Parameters.AddWithValue("@Allowance_End_Date", Allowance_End_Date);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Currancy_ID", Currancy_ID);
            DA.SelectCommand.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            DA.SelectCommand.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            DataTable DT = new DataTable();

            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable Allowance_TB_Get(string Allowance_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Allowance_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Allowance_ID", Allowance_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



    public static int Allowance_TB_Delete(string Allowance_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Allowance_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Allowance_ID", Allowance_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Allowance_Type
    public static int Allowance_Type_TB_AddEdit(string Allowance_Type_ID, string Code, string Allowance_Type, string Allowance_Condition, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Allowance_Type_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            if (Allowance_Type_ID != "")

                cmd.Parameters.AddWithValue("@Allowance_Type_ID", Allowance_Type_ID);
            cmd.Parameters.AddWithValue("@Code", Code);
            cmd.Parameters.AddWithValue("@Allowance_Type", Allowance_Type);
            cmd.Parameters.AddWithValue("@Allowance_Condition", Allowance_Condition);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Allowance_Type_TB_Get(string Allowance_Type_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Allowance_Type_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Allowance_Type_ID", Allowance_Type_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Allowance_Type_TB_Delete(string Allowance_Type_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Allowance_Type_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Allowance_Type_ID", Allowance_Type_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Attendance_Constant_TB
    public static int Attendance_Constant_TB_AddEdit(string Constant_ID, string AttendanceFormat, DateTime Attendance_From, DateTime Attendance_To, int WeekEndDayID, int OptionalWeekEndDayID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Attendance_Constant_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Constant_ID != "")
                cmd.Parameters.AddWithValue("@Constant_ID", Constant_ID);
            cmd.Parameters.AddWithValue("@AttendanceFormat", AttendanceFormat);
            cmd.Parameters.AddWithValue("@Attendance_From", Attendance_From);
            cmd.Parameters.AddWithValue("@Attendance_To", Attendance_To);
            cmd.Parameters.AddWithValue("@WeekEndDayID ", WeekEndDayID);
            cmd.Parameters.AddWithValue("@OptionalWeekEndDayID", OptionalWeekEndDayID);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Attendance_Constant_TB_Get(string Constant_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Attendance_Constant_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Constant_ID", Constant_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Attendance_Constant_TB_Delete(string Constant_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Attendance_Constant_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Constant_ID", Constant_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Work_OverTime
    public static int Work_OverTime_TB_AddEdit(string ID, DateTime Date, int Month, int Year, int Emp_ID, DateTime Time_from,
        DateTime Time_to, DateTime Total_Hour, int Total_Seconds, string Notes,
        bool Manager_Adopt, DateTime Rest_Hour, DateTime Formal_Hour, DateTime Total_OverTime, DateTime Accepted_Hour, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Work_OverTime_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@Date", Date);
            cmd.Parameters.AddWithValue("@Month", Month);
            cmd.Parameters.AddWithValue("@Year ", Year);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);

            cmd.Parameters.AddWithValue("@Time_from", Time_from);
            cmd.Parameters.AddWithValue("@Time_to", Time_to);
            cmd.Parameters.AddWithValue("@Total_Hour", Total_Hour);
            cmd.Parameters.AddWithValue("@Total_Seconds ", Total_Seconds);


            cmd.Parameters.AddWithValue("@Notes", Notes);
            cmd.Parameters.AddWithValue("@Manager_Adopt ", Manager_Adopt);
            cmd.Parameters.AddWithValue("@Rest_Hour", Rest_Hour);

            cmd.Parameters.AddWithValue("@Formal_Hour", Formal_Hour);
            cmd.Parameters.AddWithValue("@Total_OverTime ", Total_OverTime);
            cmd.Parameters.AddWithValue("@Accepted_Hour", Accepted_Hour);


            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static int WorkOverTimeAddEdit(string ID, DateTime Date, int Emp_ID, DateTime Time_from,
       DateTime Time_to, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("WorkOverTimeAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@Date", Date);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Time_from", Time_from);
            cmd.Parameters.AddWithValue("@Time_to", Time_to);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Work_OverTime_TB_Get(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Work_OverTime_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Work_OverTime_TB_Delete(string ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Work_OverTime_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static int Work_OverTime_TB_Adopt(string ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Work_OverTime_Adopt", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Attendance_Month_TB
    public static int Attendance_Month_TB_AddEdit(string Att_Month_ID,
        DateTime Date_From, DateTime Date_To, DateTime Date, DateTime Time_From, DateTime Time_To, int Emp_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Attendance_Month_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Att_Month_ID != "")
                cmd.Parameters.AddWithValue("@Att_Month_ID", Att_Month_ID);
            cmd.Parameters.AddWithValue("@Date_From", Date_From);
            cmd.Parameters.AddWithValue("@Date_To", Date_To);
            cmd.Parameters.AddWithValue("@Time_From", Time_From);
            cmd.Parameters.AddWithValue("@Time_To", Time_To);
            cmd.Parameters.AddWithValue("@Date", Date);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }
    public static int UpdateAttenanceMonthly(string Att_Month_ID, int Emp_ID,
       DateTime Date_Actual_From, DateTime Date_Actual_to, DateTime Time_Actual_From, DateTime Time_Actual_To, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("UpdateAttenanceMonthly", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Att_Month_ID", Att_Month_ID);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Date_Actual_From", Date_Actual_From);
            cmd.Parameters.AddWithValue("@Date_Actual_to", Date_Actual_to);
            cmd.Parameters.AddWithValue("@Time_Actual_From", Time_Actual_From);
            cmd.Parameters.AddWithValue("@Time_Actual_To", Time_Actual_To);


            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Attendance_Month_TB_GetRow(string Emp_ID, DateTime Date)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Attendance_Month_TB_GetRow", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Date", Date);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable Attendance_Month_TB_Get(int Att_Month_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Attendance_Month_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Att_Month_ID", Att_Month_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Attendance_Month_TB_Delete(string Att_Month_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Attendance_Month_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Att_Month_ID", Att_Month_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region RegisterAttendance
    public static int AddAttenance(int Emp_ID, DateTime Attendance_Time, int Attendance_Type_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("AddAttenance", conn);
            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Attendance_Time", Attendance_Time);
            cmd.Parameters.AddWithValue("@Attendance_Type_ID", Attendance_Type_ID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region calculateAttendance
    public static int CalculateAttendance(string Emp_ID, int Month, int Year, int UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("CalculateAttendance", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Month", Month);
            cmd.Parameters.AddWithValue("@Year", Year);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int calculateAttendance_TB_AddEdit(string AttendanceCalculate_ID, int Emp_ID,

        int Year, int Month, int AttCountDay, int AbsCountDay, int VacCountDay, decimal AttCountHour, decimal AttCountWExitHour,
        decimal AttCountExitHour, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("calculateAttendance_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (AttendanceCalculate_ID != "")

                cmd.Parameters.AddWithValue("@AttendanceCalculate_ID", AttendanceCalculate_ID);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@AttCountDay", AttCountDay);
            cmd.Parameters.AddWithValue("@AbsCountDay", AbsCountDay);
            cmd.Parameters.AddWithValue("@VacCountDay", VacCountDay);
            cmd.Parameters.AddWithValue("@AttCountHour", AttCountHour);
            cmd.Parameters.AddWithValue("@AttCountWExitHour", AttCountWExitHour);
            cmd.Parameters.AddWithValue("@AttCountExitHour", AttCountExitHour);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable calculateAttendance_TB_Get(string AttendanceCalculate_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("calculateAttendance_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@AttendanceCalculate_ID", AttendanceCalculate_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable calculateAttendanceGetAll(string Emp_ID, string Year, string Month)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("calculateAttendanceGetAll", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Year", Year);
            DA.SelectCommand.Parameters.AddWithValue("@Month", Month);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int calculateAttendance_TB_Delete(string AttendanceCalculate_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("calculateAttendance_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@AttendanceCalculate_ID", AttendanceCalculate_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }


    public static int AttendanceHolidayCheck(string Month, string Year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("AttendanceHolidayCheck", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Month", Month);
            cmd.Parameters.AddWithValue("@Year", Year);
            return cmd.ExecuteNonQuery();
        }
    }



    #endregion

    #region AttendanceExit
    public static DataTable AttendanceExitAdd(AttendanceExit model)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AttendanceExitAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", model.EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AttendanceExitTypeID", model.AttendanceExitTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@ExitDate", model.ExitDate);
            DA.SelectCommand.Parameters.AddWithValue("@ExpectedTimeFrom", model.ExpectedTimeFrom);
            DA.SelectCommand.Parameters.AddWithValue("@ExpectedTimeTo", model.ExpectedTimeTo);
            DA.SelectCommand.Parameters.AddWithValue("@ActualTimeFrom", model.ActualTimeFrom);
            DA.SelectCommand.Parameters.AddWithValue("@ActualTimeTo", model.ActualTimeTo);
            DA.SelectCommand.Parameters.AddWithValue("@ExitReason", model.ExitReason);
            DA.SelectCommand.Parameters.AddWithValue("@Mobile", model.Mobile);
            DA.SelectCommand.Parameters.AddWithValue("@Notes", model.Notes);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", model.EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    
        public static DataTable AttendanceExitDMAccreditation(string ID, int DMAccreditation,string EmployeeID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AttendanceExitDMAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID",ID );
            DA.SelectCommand.Parameters.AddWithValue("@DMAccreditation", DMAccreditation);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    #endregion

    #region Attendance_TB
    public static int Attendance_TB_AddEdit(string Attendance_ID,
        DateTime Attendance_From, DateTime Attendance_To, DateTime Date,
        int Emp_ID, int Day_ID, DateTime Attendance_Default_To,
        DateTime Attendance_Default_From, float Attendance_Hours, DateTime Attendance_Over_Time, DateTime Attendance_Absent_Time, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Attendance_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Attendance_ID != "")
                cmd.Parameters.AddWithValue("@Attendance_ID", Attendance_ID);
            cmd.Parameters.AddWithValue("@Attendance_From", Attendance_From);
            cmd.Parameters.AddWithValue("@Attendance_To", Attendance_To);
            cmd.Parameters.AddWithValue("@Date", Date);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Day_ID", Day_ID);
            cmd.Parameters.AddWithValue("@Attendance_Default_To", Attendance_Default_To);
            cmd.Parameters.AddWithValue("@Attendance_Default_From", Attendance_Default_From);
            cmd.Parameters.AddWithValue("@Attendance_Hours", Attendance_Hours);
            cmd.Parameters.AddWithValue("@Attendance_Over_Time", Attendance_Over_Time);
            cmd.Parameters.AddWithValue("@Attendance_Absent_Time", Attendance_Absent_Time);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    // attendance  constant employees

    public static int AttendanceConstant_TB_AddEdit(string Attendance_ID,
       DateTime Attendance_From, string Attendance_To, DateTime Date,
       int Day_ID, int Emp_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("AttendanceConstant_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Attendance_ID != "")
                cmd.Parameters.AddWithValue("@Attendance_ID", Attendance_ID);
            cmd.Parameters.AddWithValue("@Attendance_From", Attendance_From);
            if (Attendance_To != "")
                cmd.Parameters.AddWithValue("@Attendance_To", Attendance_To);
            cmd.Parameters.AddWithValue("@Date", Date);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Day_ID", Day_ID);

            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Attendance_TB_Get(string Attendance_ID)
    {

        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Attendance_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Attendance_ID", Attendance_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Attendance_TB_Adopt(string Attendance_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Attendance_TB_Adopt", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Attendance_ID", Attendance_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);

            return cmd.ExecuteNonQuery();
        }
    }
    //Attendance_TB_EmpAdd
    public static int Attendance_TB_EmpAdd(string Emp_ID, DateTime Date)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Attendance_TB_EmpAdd", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Date", Date);

            return cmd.ExecuteNonQuery();
        }
    }



    public static DataTable Attendance_TB_GetRow(string Emp_ID, DateTime Date)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Attendance_TB_GetRow", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Date", Date);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Attendance_TB_Delete(string Attendance_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Attendance_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Attendance_ID", Attendance_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Attendance_Week_TB

    //[dbo].[DefaultAttendanceWeekFormatAdd]
    public static DataTable DefaultAttendanceWeekFormatAdd(string ID, string Name)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DefaultAttendanceWeekFormatAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@Name", Name);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Attendance_Week_TB_AddEdit(string Att_Week_ID,
        DateTime Attendance_From, DateTime Attendance_To, int DefaultAttendanceWeekFormatID, int Attendance_Day_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Attendance_Week_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Att_Week_ID != "")
                cmd.Parameters.AddWithValue("@Att_Week_ID", Att_Week_ID);
            cmd.Parameters.AddWithValue("@Attendance_From", Attendance_From);
            cmd.Parameters.AddWithValue("@Attendance_To", Attendance_To);
            cmd.Parameters.AddWithValue("@Attendance_Day_ID", Attendance_Day_ID);
            cmd.Parameters.AddWithValue("@DefaultAttendanceWeekFormatID", DefaultAttendanceWeekFormatID);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Attendance_Week_TB_Get(string Att_Week_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Attendance_Week_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Att_Week_ID", Att_Week_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Attendance_Week_TB_Delete(string Att_Week_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Attendance_Week_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Att_Week_ID", Att_Week_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Bouns_TB
    public static DataTable Bouns_TB_AddEdit(string Bouns_ID, int Bouns_Type_ID, int Child_No, string description, int EvaluateType,
        DateTime Bouns_Start_Date, DateTime Bouns_End_Date,
        int Emp_ID, decimal Bouns_Rate, decimal Bouns_Value, int Currancy_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {


            SqlDataAdapter DA = new SqlDataAdapter("Bouns_TB_AddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            if (Bouns_ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@Bouns_ID", Bouns_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Bouns_Type_ID", Bouns_Type_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Child_No", Child_No);

            DA.SelectCommand.Parameters.AddWithValue("@description", description);
            DA.SelectCommand.Parameters.AddWithValue("@EvaluateType", EvaluateType);
            DA.SelectCommand.Parameters.AddWithValue("@Bouns_Value", Bouns_Value);
            DA.SelectCommand.Parameters.AddWithValue("@Bouns_Start_Date", Bouns_Start_Date);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Bouns_Rate", Bouns_Rate);
            DA.SelectCommand.Parameters.AddWithValue("@Bouns_End_Date", Bouns_End_Date);
            DA.SelectCommand.Parameters.AddWithValue("@Currancy_ID", Currancy_ID);
            DA.SelectCommand.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            DA.SelectCommand.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable Bouns_TB_Get(string Bouns_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Bouns_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Bouns_ID", Bouns_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Bouns_TB_Delete(string Bouns_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Bouns_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Bouns_ID", Bouns_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Bouns_Type_TB
    public static int Bouns_Type_TB_AddEdit(string Bouns_Type_ID, string Code, string Bouns_Type,
        string Bouns_Condition, Decimal Bouns_Default_Value, int Currancy_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Bouns_Type_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Bouns_Type_ID != "")


                cmd.Parameters.AddWithValue("@Bouns_Type_ID", Bouns_Type_ID);
            cmd.Parameters.AddWithValue("@Code", Code);
            cmd.Parameters.AddWithValue("@Bouns_Type", Bouns_Type);
            cmd.Parameters.AddWithValue("@Bouns_Condition", Bouns_Condition);
            cmd.Parameters.AddWithValue("@Bouns_Default_Value", Bouns_Default_Value);
            cmd.Parameters.AddWithValue("@Currancy_ID", Currancy_ID);

            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Bouns_Type_TB_Get(string Bouns_Type_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Bouns_Type_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Bouns_Type_ID", Bouns_Type_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Bouns_Type_TB_Delete(string Bouns_Type_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Bouns_Type_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Bouns_Type_ID", Bouns_Type_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }


    #endregion

    #region Certificate_TB
    public static int Certificate_TB_AddEdit(string Certificate_ID, string Certificate_Name, int Emp_ID,
        string Scan_Pic, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Certificate_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            if (Certificate_ID != "")
                cmd.Parameters.AddWithValue("@Certificate_ID", Certificate_ID);
            cmd.Parameters.AddWithValue("@Certificate_Name", Certificate_Name);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Scan_Pic", Scan_Pic);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Certificate_TB_Get(string Certificate_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Certificate_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Certificate_ID", Certificate_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Certificate_TB_Delete(string Certificate_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Certificate_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Certificate_ID", Certificate_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Courses_TB
    public static int Courses_TB_AddEdit(string Course_ID, string Course_Name, string Course_Place, int Emp_ID,
         string Courses_Details, DateTime Course_From, DateTime Course_To, int CourseHours, string SpecializeIn, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Courses_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Course_ID != "")

                cmd.Parameters.AddWithValue("@Course_ID", Course_ID);
            cmd.Parameters.AddWithValue("@Course_Name", Course_Name);
            cmd.Parameters.AddWithValue("@CourseHours", CourseHours);
            cmd.Parameters.AddWithValue("@SpecializeIn ", SpecializeIn);
            cmd.Parameters.AddWithValue("@Course_Place", Course_Place);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Courses_Details", Courses_Details);

            cmd.Parameters.AddWithValue("@Course_From", Course_From);

            cmd.Parameters.AddWithValue("@Course_To", Course_To);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable CoursesEmp_TB_Get(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CoursesEmp_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable Courses_TB_Get(string Course_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Courses_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Course_ID", Course_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Courses_TB_Delete(string Course_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Courses_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Course_ID", Course_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Deduction_TB
    public static int Deduction_TB_AddEdit(string Deduction_ID, int Emp_ID,
        int Deduction_Type_ID, string description, int EvaluateType,
        decimal Deduction_Rate, decimal Deduction_Value, DateTime Deduction_Start_Date,
        DateTime Deduction_End_Date, int Currancy_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Deduction_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Deduction_ID != "")

                cmd.Parameters.AddWithValue("@Deduction_ID", Deduction_ID);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Deduction_Type_ID", Deduction_Type_ID);

            cmd.Parameters.AddWithValue("@description", description);
            cmd.Parameters.AddWithValue("@EvaluateType", EvaluateType);

            cmd.Parameters.AddWithValue("@Deduction_Rate", Deduction_Rate);
            cmd.Parameters.AddWithValue("@Deduction_Value", Deduction_Value);
            cmd.Parameters.AddWithValue("@Deduction_Start_Date", Deduction_Start_Date);
            cmd.Parameters.AddWithValue("@Deduction_End_Date", Deduction_End_Date);
            cmd.Parameters.AddWithValue("@Currancy_ID", Currancy_ID);

            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Deduction_TB_Get(string Deduction_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Deduction_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Deduction_ID", Deduction_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Deduction_TB_Delete(string Deduction_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Deduction_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Deduction_ID", Deduction_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Deduction_Type_TB  الجزاءات انواع
    public static int Deduction_Type_TB_AddEdit(string Deduction_Type_ID, string Code, string Deduction_Type, string Deduction_Condition)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Deduction_Type_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Deduction_Type_ID != "")

                cmd.Parameters.AddWithValue("@Deduction_Type_ID", Deduction_Type_ID);
            cmd.Parameters.AddWithValue("@Code", Code);
            cmd.Parameters.AddWithValue("@Deduction_Type", Deduction_Type);
            cmd.Parameters.AddWithValue("@Deduction_Condition", Deduction_Condition);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Deduction_Type_TB_Get(string Deduction_Type_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Deduction_Type_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Deduction_Type_ID", Deduction_Type_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Deduction_Type_TB_Delete(string Deduction_Type_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Deduction_Type_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Deduction_Type_ID", Deduction_Type_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Department_TB
    public static int Department_TB_AddEdit(string Department_ID, string Ar_Name, string En_Name,
        int managerID, bool IsActive, int PID, int DepType, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Department_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Department_ID != "")

                cmd.Parameters.AddWithValue("@Department_ID", Department_ID);
            cmd.Parameters.AddWithValue("@Ar_Name", Ar_Name);
            cmd.Parameters.AddWithValue("@En_Name", En_Name);
            cmd.Parameters.AddWithValue("@managerID", managerID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            cmd.Parameters.AddWithValue("@PID", PID);
            cmd.Parameters.AddWithValue("@DepType", DepType);
            return cmd.ExecuteNonQuery();
        }
    }
    //EmployeeDepartment
    public static int EmployeeDepartment(string Emp_ID, string Department_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("EmployeeDepartment", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Department_ID != "")
                cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@DepartmentID", Department_ID);


            return cmd.ExecuteNonQuery();
        }
    }
    public static DataTable Department_TB_Get(string Department_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Department_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Department_ID", Department_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Department_TB_Delete(string Department_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Department_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Department_ID", Department_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable IsManager(string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsManager", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", UserID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    //affairs
    #region Affairs_TB
    public static int Affairs_TB_AddEdit(string Affairs_ID, string Affairs_Name, string Affairs_Code,
        bool IsActive, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Affairs_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Affairs_ID != "")

                cmd.Parameters.AddWithValue("@Affairs_ID", Affairs_ID);
            cmd.Parameters.AddWithValue("@Affairs_Name", Affairs_Name);
            cmd.Parameters.AddWithValue("@Affairs_Code", Affairs_Code);

            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Affairs_TB_Get(string Affairs_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Affairs_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Affairs_ID", Affairs_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Affairs_TB_Delete(string Affairs_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Affairs_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Affairs_ID", Affairs_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion
    //sections
    #region Dep_Section_TB
    public static int Dep_Section_TB_AddEdit(string Section_ID, string Section_Name, string Section_Code, int Department_ID,
        bool IsActive, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Dep_Section_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Section_ID != "")

                cmd.Parameters.AddWithValue("@Section_ID", Section_ID);
            cmd.Parameters.AddWithValue("@Section_Name", Section_Name);
            cmd.Parameters.AddWithValue("@Section_Code", Section_Code);
            cmd.Parameters.AddWithValue("@Department_ID", Department_ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Dep_Section_TB_Get(string Section_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Dep_Section_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Section_ID", Section_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Dep_Section_TB_Delete(string Section_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Dep_Section_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Section_ID", Section_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Emergancy_TB
    public static int Emergancy_TB_AddEdit(string Emergancy_ID, string Ar_F_Name,
        string Ar_S_Name, string Ar_Th_Name, string Ar_Family_Name, string Emergancy_Email, string Emergancy_Phone,
        string Emergancy_Mobile, int Emergancy_Relative_ID, int Emergancy_City_ID, string Emergancy_Address, int Emp_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Emergancy_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Emergancy_ID != "")

                cmd.Parameters.AddWithValue("@Emergancy_ID", Emergancy_ID);
            cmd.Parameters.AddWithValue("@Ar_F_Name", Ar_F_Name);
            cmd.Parameters.AddWithValue("@Ar_S_Name", Ar_S_Name);
            cmd.Parameters.AddWithValue("@Ar_Th_Name", Ar_Th_Name);
            cmd.Parameters.AddWithValue("@Ar_Family_Name", Ar_Family_Name);

            cmd.Parameters.AddWithValue("@Emergancy_Email", Emergancy_Email);
            cmd.Parameters.AddWithValue("@Emergancy_Phone", Emergancy_Phone);
            cmd.Parameters.AddWithValue("@Emergancy_Mobile", Emergancy_Mobile);
            cmd.Parameters.AddWithValue("@Emergancy_Relative_ID", Emergancy_Relative_ID);
            cmd.Parameters.AddWithValue("@Emergancy_City_ID", Emergancy_City_ID);
            cmd.Parameters.AddWithValue("@Emergancy_Address", Emergancy_Address);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Emergancy_TB_Get(string Emergancy_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Emergancy_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emergancy_ID", Emergancy_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmergancyEmp_TB_Get(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmergancyEmp_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Emergancy_TB_Delete(string Emergancy_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Emergancy_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Emergancy_ID", Emergancy_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Emp_Constants
    public static int Emp_Constants_AddEdit(int Constant_ID, string Ar_Name, string En_Name)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Emp_Constants_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            // if (Allowance_ID != "")

            cmd.Parameters.AddWithValue("@Constant_ID", Constant_ID);
            cmd.Parameters.AddWithValue("@Ar_Name", Ar_Name);
            cmd.Parameters.AddWithValue("@En_Name", En_Name);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Emp_Constants_Get(int Constant_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Emp_Constants_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Constant_ID", Constant_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Emp_Constants_TB_Delete(string Constant_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Emp_Constants_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Constant_ID", Constant_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Emp_Family
    public static DataTable Emp_Family_AddEdit(string Emp_Family_ID, string F_Name, string S_Name,
     string Th_Name, string Family_Name, string Relative_Type_ID, DateTime Date_Of_Birth, string Birth_Place,
        string Job, int Emp_ID, bool IsActive, string NotActive_Reason, string NotActive_Date, string InsertUserID, string UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            //SqlCommand cmd = new SqlCommand("Emp_Family_AddEdit", conn);
            //cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter DA = new SqlDataAdapter("Emp_Family_AddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (Emp_Family_ID != "")

                DA.SelectCommand.Parameters.AddWithValue("@Emp_Family_ID", Emp_Family_ID);
            DA.SelectCommand.Parameters.AddWithValue("@F_Name", F_Name);
            DA.SelectCommand.Parameters.AddWithValue("@S_Name", S_Name);
            DA.SelectCommand.Parameters.AddWithValue("@Th_Name", Th_Name);
            DA.SelectCommand.Parameters.AddWithValue("@Family_Name", Family_Name);
            DA.SelectCommand.Parameters.AddWithValue("@Relative_Type_ID", Relative_Type_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Date_Of_Birth", Date_Of_Birth);
            DA.SelectCommand.Parameters.AddWithValue("@Birth_Place", Birth_Place);
            DA.SelectCommand.Parameters.AddWithValue("@Job", Job);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@NotActive_Reason", NotActive_Reason);
            if (NotActive_Date != "")
            {
                DateTime date = DateTime.ParseExact((NotActive_Date), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                DA.SelectCommand.Parameters.AddWithValue("@NotActive_Date", date);
            }
            DA.SelectCommand.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            DA.SelectCommand.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;

        }
    }

    public static DataTable Emp_Family_Get(string Emp_Family_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Emp_Family_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_Family_ID", Emp_Family_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable FamilyEmp_Get(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("FamilyEmp_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Emp_Family_TB_Delete(string Emp_Family_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Emp_Family_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Emp_Family_ID", Emp_Family_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Emp_Sub_Constants
    public static int Emp_Sub_Constants_AddEdit(int Sub_Constant_ID, string Ar_Name, string En_Name, int Constant_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Emp_Sub_Constants_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            // if (Allowance_ID != "")

            cmd.Parameters.AddWithValue("@Sub_Constant_ID", Sub_Constant_ID);
            cmd.Parameters.AddWithValue("@Ar_Name", Ar_Name);
            cmd.Parameters.AddWithValue("@En_Name", En_Name);
            cmd.Parameters.AddWithValue("@Constant_ID", Constant_ID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Emp_Sub_Constants_Get(int Sub_Constant_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Emp_Sub_Constants_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Sub_Constant_ID", Sub_Constant_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    #endregion

    //tommorow  employee
    #region Employee_TB
    // note : Gender :  True is male   false is female
    public static int Employee_TB_AddEdit(string Emp_ID, string Ar_F_Name, string Ar_S_Name, string Ar_Th_Name, string Ar_Family_Name, string En_F_Name,
        string En_S_Name, string En_Th_Name, string En_Family_Name, string Emp_Mother_Name, DateTime Emp_DOB,
        int C_Driver_Licence_Type_ID,
        string Emp_Driver_Licence_No, int C_Bank_ID,
        string Emp_Bank_Account_NO, DateTime Emp_Appointment_Date, int Emp_Children_No, int Emp_Wifes_No, int C_City_ID, int C_Region_ID,
        string Emp_Home_ID,
        int Emp_Dependent_No, string Emp_DOB_Place, bool Emp_Gender, string Emp_Email, string Emp_Fax, string Emp_Mobile,
        int Emp_Nationality_ID, string Emp_Passport_No,
        int Emp_Job_Title_ID, string Emp_SSN, int Emp_Status_ID, string Emp_Street, string Emp_Phone, int Contract_Type_ID,
        int Emp_Marital_Status_ID, string EmployeeNO, string Emp_Picture, int InsertUserID, int UpdateUserID, string Bank_Branch)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Employee_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Emp_ID != "")

                cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Ar_F_Name", Ar_F_Name);
            cmd.Parameters.AddWithValue("@Ar_S_Name", Ar_S_Name);
            cmd.Parameters.AddWithValue("@Ar_Th_Name", Ar_Th_Name);
            cmd.Parameters.AddWithValue("@Ar_Family_Name", Ar_Family_Name);
            cmd.Parameters.AddWithValue("@En_F_Name", En_F_Name);
            cmd.Parameters.AddWithValue("@En_S_Name", En_S_Name);
            cmd.Parameters.AddWithValue("@En_Th_Name", En_Th_Name);
            cmd.Parameters.AddWithValue("@En_Family_Name", En_Family_Name);
            cmd.Parameters.AddWithValue("@Emp_Mother_Name", Emp_Mother_Name);


            cmd.Parameters.AddWithValue("@Emp_DOB", Emp_DOB);
            cmd.Parameters.AddWithValue("@C_Driver_Licence_Type_ID", C_Driver_Licence_Type_ID);
            cmd.Parameters.AddWithValue("@Emp_Driver_Licence_No", Emp_Driver_Licence_No);

            cmd.Parameters.AddWithValue("@C_Bank_ID", C_Bank_ID);
            cmd.Parameters.AddWithValue("@Emp_Bank_Account_NO", Emp_Bank_Account_NO);

            cmd.Parameters.AddWithValue("@Emp_Appointment_Date", Emp_Appointment_Date);
            cmd.Parameters.AddWithValue("@Emp_Children_No", Emp_Children_No);
            cmd.Parameters.AddWithValue("@Emp_Wifes_No", Emp_Wifes_No);
            cmd.Parameters.AddWithValue("@C_City_ID", C_City_ID);
            cmd.Parameters.AddWithValue("@C_Region_ID", C_Region_ID);



            cmd.Parameters.AddWithValue("@Emp_Home_ID", Emp_Home_ID);
            cmd.Parameters.AddWithValue("@Emp_Dependent_No", Emp_Dependent_No);
            cmd.Parameters.AddWithValue("@Emp_DOB_Place", Emp_DOB_Place);
            cmd.Parameters.AddWithValue("@Emp_Gender", Emp_Gender);
            cmd.Parameters.AddWithValue("@Emp_Email", Emp_Email);
            cmd.Parameters.AddWithValue("@Emp_Fax", Emp_Fax);
            cmd.Parameters.AddWithValue("@Emp_Mobile", Emp_Mobile);
            cmd.Parameters.AddWithValue("@Emp_Nationality_ID", Emp_Nationality_ID);
            cmd.Parameters.AddWithValue("@Emp_Passport_No", Emp_Passport_No);
            cmd.Parameters.AddWithValue("@Emp_Job_Title_ID", Emp_Job_Title_ID);


            cmd.Parameters.AddWithValue("@Emp_SSN", Emp_SSN);
            cmd.Parameters.AddWithValue("@Emp_Status_ID", Emp_Status_ID);
            cmd.Parameters.AddWithValue("@Emp_Street", Emp_Street);
            cmd.Parameters.AddWithValue("@Emp_Phone", Emp_Phone);
            cmd.Parameters.AddWithValue("@Contract_Type_ID", Contract_Type_ID);
            cmd.Parameters.AddWithValue("@Emp_Marital_Status_ID", Emp_Marital_Status_ID);
            cmd.Parameters.AddWithValue("@EmployeeNO", EmployeeNO);
            cmd.Parameters.AddWithValue("@Emp_Picture", Emp_Picture);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            cmd.Parameters.AddWithValue("@Bank_Branch", Bank_Branch);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Employee_TB_Get(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Employee_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable Employee_TB_GetAll()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Employee_TB_GetAll", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable Employee_TB_GetAll2(string @EmpCategory)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Employee_TB_GetAll2", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmpCategory", @EmpCategory);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmployeeNO_Get(string EmployeeNO)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeNO_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeNO", EmployeeNO);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable EmployeeNOContract_Get(string EmployeeNO, Int16 Contract_Type_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeNOContract_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeNO", EmployeeNO);
            DA.SelectCommand.Parameters.AddWithValue("@Contract_Type_ID", Contract_Type_ID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Employee_TB_Delete(string Emp_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Employee_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    //isValidEmployee
    //public DataTable IsValidEmployee(string username, string password)
    //{
    //    using (SqlConnection conn = GetConnection())
    //    {
    //        SqlDataAdapter DA = new SqlDataAdapter("Employee_TB_Get", conn);
    //        DA.SelectCommand.CommandType = CommandType.StoredProcedure;
    //        DA.SelectCommand.Parameters.AddWithValue("@username", username);
    //        DA.SelectCommand.Parameters.AddWithValue("@password", password);
    //        DataTable DT = new DataTable();
    //        DA.Fill(DT);
    //        return DT;
    //    }
    //}

    #endregion


    #region Employee_TB close
    // note : Gender :  True is male   false is female
    public static int EmployeeInfo_TB_AddEdit(string Emp_ID, string Ar_F_Name, string Ar_S_Name, string Ar_Th_Name, string Ar_Family_Name,
        string En_F_Name, string En_S_Name, string En_Th_Name, string En_Family_Name,
        string Emp_Mother_Name, bool Emp_Gender, int Emp_Nationality_ID, DateTime Emp_DOB, string Emp_DOB_Place,
         string Emp_SSN, string Emp_Passport_No,
        int C_Driver_Licence_Type_ID, string Emp_Driver_Licence_No, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("EmployeeInfo_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Emp_ID != "")

                cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Ar_F_Name", Ar_F_Name);
            cmd.Parameters.AddWithValue("@Ar_S_Name", Ar_S_Name);
            cmd.Parameters.AddWithValue("@Ar_Th_Name", Ar_Th_Name);
            cmd.Parameters.AddWithValue("@Ar_Family_Name", Ar_Family_Name);
            cmd.Parameters.AddWithValue("@En_F_Name", En_F_Name);
            cmd.Parameters.AddWithValue("@En_S_Name", En_S_Name);
            cmd.Parameters.AddWithValue("@En_Th_Name", En_Th_Name);
            cmd.Parameters.AddWithValue("@En_Family_Name", En_Family_Name);
            cmd.Parameters.AddWithValue("@Emp_Mother_Name", Emp_Mother_Name);

            cmd.Parameters.AddWithValue("@Emp_Gender", Emp_Gender);
            cmd.Parameters.AddWithValue("@Emp_Nationality_ID", Emp_Nationality_ID);
            cmd.Parameters.AddWithValue("@Emp_DOB", Emp_DOB);
            cmd.Parameters.AddWithValue("@Emp_DOB_Place", Emp_DOB_Place);

            cmd.Parameters.AddWithValue("@Emp_SSN", Emp_SSN);

            cmd.Parameters.AddWithValue("@Emp_Passport_No", Emp_Passport_No);

            cmd.Parameters.AddWithValue("@C_Driver_Licence_Type_ID", C_Driver_Licence_Type_ID);
            cmd.Parameters.AddWithValue("@Emp_Driver_Licence_No", Emp_Driver_Licence_No);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }


    #endregion

    #region Employee_TB contact
    // note : Gender :  True is male   false is female
    public static int EmployeeInfoContact_TB_AddEdit(string Emp_ID, string Emp_Phone, string Emp_Mobile, string Emp_Email, string Emp_Fax,
        int C_City_ID, int C_Region_ID, string Emp_Street,
        string Emp_Home_ID, string UnivEmail,
         int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("EmployeeInfoContact_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Emp_ID != "")

                cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Emp_Phone", Emp_Phone);
            cmd.Parameters.AddWithValue("@Emp_Mobile", Emp_Mobile);
            cmd.Parameters.AddWithValue("@Emp_Email", Emp_Email);
            cmd.Parameters.AddWithValue("@Emp_Fax", Emp_Fax);
            cmd.Parameters.AddWithValue("@C_City_ID", C_City_ID);
            cmd.Parameters.AddWithValue("@C_Region_ID", C_Region_ID);
            cmd.Parameters.AddWithValue("@Emp_Street", Emp_Street);
            cmd.Parameters.AddWithValue("@Emp_Home_ID", Emp_Home_ID);
            cmd.Parameters.AddWithValue("@UnivEmail", UnivEmail);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }



    #endregion

    #region Employee_TB Status
    public static int EmployeeInfoStatus_TB_AddEdit(string Emp_ID, int Emp_Marital_Status_ID, int Emp_Wifes_No
       , int Emp_Children_No,
        int Emp_Dependent_No,

        int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("EmployeeInfoStatus_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Emp_ID != "")

                cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Emp_Marital_Status_ID", Emp_Marital_Status_ID);
            cmd.Parameters.AddWithValue("@Emp_Wifes_No", Emp_Wifes_No);
            cmd.Parameters.AddWithValue("@Emp_Children_No", Emp_Children_No);
            cmd.Parameters.AddWithValue("@Emp_Dependent_No", Emp_Dependent_No);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Employee_TB Job

    public static int ChangeEmployeeData(string Emp_ID, int EmpCategoryID, string AcademicData,
        string RetirementStatusID, string IsCaderEmployee, int InsertUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("ChangeEmployeeData", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Emp_ID != "")
                cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@EmpCategoryID", EmpCategoryID);
            cmd.Parameters.AddWithValue("@AcademicData", AcademicData);
            cmd.Parameters.AddWithValue("@RetirementStatusID", RetirementStatusID);
            cmd.Parameters.AddWithValue("@IsCaderEmployee", IsCaderEmployee);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);

            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Employee_TB Bank
    public static int EmployeeBank_TB_AddEdit(string Emp_ID, int C_Bank_ID, string Bank_Branch,
      string Emp_Bank_Account_NO, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("EmployeeBank_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Emp_ID != "")

                cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@C_Bank_ID", C_Bank_ID);

            cmd.Parameters.AddWithValue("@Bank_Branch", Bank_Branch);
            cmd.Parameters.AddWithValue("@Emp_Bank_Account_NO", Emp_Bank_Account_NO);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Employee_TB Photo
    public static int EmployeePhoto_TB_AddEdit(string Emp_ID, byte[] Emp_Picture, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("EmployeePhoto_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Emp_ID != "")

                cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Emp_Picture", Emp_Picture);


            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }
    public static DataTable EmployeePhoto_Get(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeePhoto_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    #endregion
    #region EmployeeSalary
    public static int EmployeeSalaryEdit(string Emp_ID, decimal Main_Salary, string CurrencyTypeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("EmployeeSalaryEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Main_Salary", Main_Salary);
            cmd.Parameters.AddWithValue("@CurrencyTypeID", CurrencyTypeID);


            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Exit_Permission_TB




    public static int Register_Exit_Permission_TB_AddEdit(string ID, DateTime Exit_Date, DateTime Exit_From,
         DateTime Exit_To, string Emp_ID, string Notes, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Register_Exit_Permission_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")

                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@Date", Exit_Date);

            cmd.Parameters.AddWithValue("@AttExit_From", Exit_From);
            cmd.Parameters.AddWithValue("@AttExit_To", Exit_To);

            cmd.Parameters.AddWithValue("@Notes", Notes);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);

            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int ExitRegisterDelete(string ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("ExitRegisterDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }



    public static int Exit_Permission_TB_AddEdit(string Exit_ID, DateTime Exit_Date, DateTime Exit_From,
         DateTime Exit_To, string Exit_Details, int Emp_ID, int Exit_Status, int managerID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Exit_Permission_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Exit_ID != "")

                cmd.Parameters.AddWithValue("@Exit_ID", Exit_ID);
            cmd.Parameters.AddWithValue("@Exit_Date", Exit_Date);

            cmd.Parameters.AddWithValue("@Exit_From", Exit_From);
            cmd.Parameters.AddWithValue("@Exit_To", Exit_To);
            cmd.Parameters.AddWithValue("@Exit_Details", Exit_Details);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Exit_Status", Exit_Status);
            cmd.Parameters.AddWithValue("@managerID", managerID);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }


    public static DataTable Exit_Permission_TB_GetRow(string Emp_ID, DateTime Exit_Date)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Exit_Permission_TB_GetRow", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Exit_Date", Exit_Date);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static int Exit_Cancel_Request(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Exit_Cancel_Request", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int WExit_Cancel_Request(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("WExit_Cancel_Request", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Exit_Permission_TB_Get(string Exit_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Exit_Permission_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Exit_ID", Exit_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable WExitEmpGetAB(string Emp_ID, string FromDate, string ToDate)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("WExitEmpGetAB", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@FromDate", FromDate);
            DA.SelectCommand.Parameters.AddWithValue("@ToDate", ToDate);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable ExitEmpGetAB(string Emp_ID, string DateFrom, string DateTo)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExitEmpGetAB", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@FromDate", DateFrom);
            DA.SelectCommand.Parameters.AddWithValue("@ToDate", DateTo);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Exit_Permission_TB_Delete(string Exit_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Exit_Permission_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Exit_ID", Exit_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int Exit_TB_Update(string Exit_ID, int Emp_ID, DateTime Actual_Out, DateTime Actual_In, Decimal Exit_Hour, int Exit_TotalSecond, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Exit_TB_Update", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Exit_ID", Exit_ID);

            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Actual_Out", Actual_Out);
            cmd.Parameters.AddWithValue("@Actual_In", Actual_In);

            cmd.Parameters.AddWithValue("@Exit_Hour", Exit_Hour);
            cmd.Parameters.AddWithValue("@Exit_TotalSecond", Exit_TotalSecond);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static int Exit_Follow_Request(string Exit_ID, bool AcceptStatus, string Refuse_Reason, string ManagerId)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Exit_Follow_Request", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Exit_ID != "")

                cmd.Parameters.AddWithValue("@Exit_ID", Exit_ID);

            cmd.Parameters.AddWithValue("@AcceptStatus", AcceptStatus);

            cmd.Parameters.AddWithValue("@Refuse_Reason", Refuse_Reason);
            cmd.Parameters.AddWithValue("@ManagerId", ManagerId);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int Exit_Adopt_Request(string Exit_ID, string AdoptUserID, bool AdoptHRM)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Exit_Adopt_Request", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Exit_ID != "")

                cmd.Parameters.AddWithValue("@Exit_ID", Exit_ID);
            cmd.Parameters.AddWithValue("@AdoptHRM", AdoptHRM);
            cmd.Parameters.AddWithValue("@AdoptUserID", AdoptUserID);
            return cmd.ExecuteNonQuery();
        }
    }



    public static DataTable AttExitRegister(int Month, int Year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AttExitRegister", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Month", Month);

            DA.SelectCommand.Parameters.AddWithValue("@Year", Year);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AttNotFingrPrint(int Month, int Year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AttNotFingrPrint", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Month", Month);

            DA.SelectCommand.Parameters.AddWithValue("@Year", Year);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    #endregion

    #region Experience_TB
    public static int Experience_TB_AddEdit(string Experince_ID, string Job_Name, string Company_Name,
        string Experince_From, string Experince_To, string Reason_Leave_Job, string Company_Work_Scope, string job_Details, int Emp_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Experience_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Experince_ID != "")

                cmd.Parameters.AddWithValue("@Experince_ID", Experince_ID);
            cmd.Parameters.AddWithValue("@Job_Name", Job_Name);
            cmd.Parameters.AddWithValue("@job_Details", job_Details);
            cmd.Parameters.AddWithValue("@Company_Name", Company_Name);
            cmd.Parameters.AddWithValue("@Company_Work_Scope", Company_Work_Scope);
            if (Experince_From != "")
                cmd.Parameters.AddWithValue("@Experince_From", Experince_From);
            if (Experince_To != "")
                cmd.Parameters.AddWithValue("@Experince_To", Experince_To);
            cmd.Parameters.AddWithValue("@Reason_Leave_Job", Reason_Leave_Job);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Experience_TB_Get(string Experince_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Experience_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Experince_ID", Experince_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable ExperienceEmp_TB_Get(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExperienceEmp_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Experience_TB_Delete(string Experince_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Experience_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Experince_ID", Experince_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Finanical_Follow_TB
    public static int Finanical_Follow_TB_AddEdit(int Finanical_Follow_ID, int Admin_ID, string Table_Name,
        DateTime Changed_Date, string Column_Name, string Old_Value, string New_Value, int Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Finanical_Follow_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            // if (Allowance_ID != "")

            cmd.Parameters.AddWithValue("@Finanical_Follow_ID", Finanical_Follow_ID);
            cmd.Parameters.AddWithValue("@Admin_ID", Admin_ID);
            cmd.Parameters.AddWithValue("@Table_Name", Table_Name);
            cmd.Parameters.AddWithValue("@Column_Name", Column_Name);
            cmd.Parameters.AddWithValue("@Old_Value", Old_Value);
            cmd.Parameters.AddWithValue("@New_Value", New_Value);
            cmd.Parameters.AddWithValue("@Changed_Date", Changed_Date);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Finanical_Follow_TB_Get(int Finanical_Follow_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Finanical_Follow_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Finanical_Follow_ID", Finanical_Follow_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    #endregion

    #region Follow_Emp_TB
    public static int Follow_Emp_TB_AddEdit(int Follow_ID, int Admin_ID, string Table_Name,
        DateTime Changed_Full_Date, string Column_Change_Name, string Old_Value, string New_Value, int Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Follow_Emp_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            // if (Allowance_ID != "")

            cmd.Parameters.AddWithValue("@Follow_ID", Follow_ID);
            cmd.Parameters.AddWithValue("@Admin_ID", Admin_ID);
            cmd.Parameters.AddWithValue("@Table_Name", Table_Name);
            cmd.Parameters.AddWithValue("@Column_Change_Name", Column_Change_Name);
            cmd.Parameters.AddWithValue("@Old_Value", Old_Value);
            cmd.Parameters.AddWithValue("@New_Value", New_Value);
            cmd.Parameters.AddWithValue("@Changed_Full_Date", Changed_Full_Date);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Follow_Emp_TB_Get(int Follow_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Follow_Emp_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Follow_ID", Follow_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    #endregion

    #region Holiday_Main
    public static int Holiday_Main_AddEdit(string Holiday_ID, string Holiday_Name,
        int NO_OF_Days, DateTime Holiday_Date, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Holiday_Main_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Holiday_ID != "")
                cmd.Parameters.AddWithValue("@Holiday_ID", Holiday_ID);
            cmd.Parameters.AddWithValue("@Holiday_Name", Holiday_Name);
            cmd.Parameters.AddWithValue("@NO_OF_Days", NO_OF_Days);
            cmd.Parameters.AddWithValue("@Holiday_Date", Holiday_Date);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Holiday_Main_Get(string Holiday_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Holiday_Main_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Holiday_ID", Holiday_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Holiday_Main_TB_Delete(string Holiday_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Holiday_Main_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Holiday_ID", Holiday_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Contract_Emp_TB
    public static DataTable Contract_Emp_TB_AddEdit(string Contract_ID, string Emp_ID,
        int Job_Title_ID, int Department_ID, int Contract_Type_ID, string SubContractTypeID, decimal Main_Salary, string CurrencyTypeID, int Attendance_Type_ID, int Attendance_Format,
        string Date_Begin_Job, string Date_End_Job, string TestFrom, string TestTo, string IsRenew, string PID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {

            SqlDataAdapter DA = new SqlDataAdapter("Contract_Emp_TB_AddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;


            if (Contract_ID != "")

                DA.SelectCommand.Parameters.AddWithValue("@Contract_ID", Contract_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Job_Title_ID ", Job_Title_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Department_ID", Department_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Contract_Type_ID", Contract_Type_ID);
            DA.SelectCommand.Parameters.AddWithValue("@SubContractTypeID", SubContractTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@Main_Salary", Main_Salary);
            DA.SelectCommand.Parameters.AddWithValue("@CurrencyTypeID", CurrencyTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@Attendance_Type_ID", Attendance_Type_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Attendance_Format", Attendance_Format);
            if (Date_Begin_Job != "")
            {
                DA.SelectCommand.Parameters.AddWithValue("@Date_Begin_Job", Date_Begin_Job);
            }
            if (Date_End_Job != "")
            {
                DA.SelectCommand.Parameters.AddWithValue("@Date_End_Job", Date_End_Job);
            }
            if (TestFrom != "" || TestTo != "")
            {
                DA.SelectCommand.Parameters.AddWithValue("@TestFrom", TestFrom);
                DA.SelectCommand.Parameters.AddWithValue("@TestTo", TestTo);
            }
            DA.SelectCommand.Parameters.AddWithValue("@IsRenew", IsRenew);
            DA.SelectCommand.Parameters.AddWithValue("@PID", PID);
            DA.SelectCommand.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            DA.SelectCommand.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable Contract_Emp_TB_Get(string Contract_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Contract_Emp_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Contract_ID", Contract_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AppointmentDecisionGet(string Contract_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AppointmentDecisionGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Contract_ID", Contract_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Contract_Emp_TB_Delete(string Contract_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Contract_Emp_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Contract_ID", Contract_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static DataTable ActivateDeActivateEmpContract(string Contract_ID, bool IsActive)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ActivateDeActivateEmpContract", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Contract_ID", Contract_ID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable IllusoryEmpContract(string Contract_ID, bool IsIllusory)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IllusoryEmpContract", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Contract_ID", Contract_ID);
            DA.SelectCommand.Parameters.AddWithValue("@IsIllusory", IsIllusory);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    #endregion

    #region JobTitle_TB
    public static DataTable JobTitle_TB_AddEdit(string Job_Title_ID, string Ar_Job_Name, string En_Job_Name, string Department_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("JobTitle_TB_AddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (Job_Title_ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@Job_Title_ID", Job_Title_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Ar_Job_Name", Ar_Job_Name);
            DA.SelectCommand.Parameters.AddWithValue("@En_Job_Name ", En_Job_Name);
            DA.SelectCommand.Parameters.AddWithValue("@Department_ID", Department_ID);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



    public static DataTable JobTitle_TB_Get(string Job_Title_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("JobTitle_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Job_Title_ID", Job_Title_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
 public static DataTable JobTitle_TB_Delete(string Job_Title_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("JobTitle_TB_Delete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Job_Title_ID", Job_Title_ID);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

 #endregion


    //Emp_JobTitle
    #region Emp_JobTitle_TB
    public static int Emp_JobTitle_TB_AddEdit(string Emp_JobTitle_ID, string Emp_ID, int JobTitle_ID, int Department_ID, bool IsActive, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Emp_JobTitle_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Emp_JobTitle_ID != "")
                cmd.Parameters.AddWithValue("@Emp_JobTitle_ID", Emp_JobTitle_ID);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@JobTitle_ID ", JobTitle_ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.Parameters.AddWithValue("@Department_ID", Department_ID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Emp_JobTitle_TB_Get(string Emp_JobTitle_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Emp_JobTitle_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_JobTitle_ID", Emp_JobTitle_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Emp_JobTitle_TB_Delete(string Emp_JobTitle_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Emp_JobTitle_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Emp_JobTitle_ID", Emp_JobTitle_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Degree
    public static int Degree_TB_AddEdit(string Job_Degree_ID, string Job_Degree_code,
      int Job_Category_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Degree_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Job_Degree_ID != "")

                cmd.Parameters.AddWithValue("@Job_Degree_ID ", Job_Degree_ID);
            cmd.Parameters.AddWithValue("@Job_Degree_code", Job_Degree_code);
            cmd.Parameters.AddWithValue("@Job_Category_ID ", Job_Category_ID);

            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Degree_TB_Get(string Job_Degree_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Degree_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Job_Degree_ID", Job_Degree_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Degree_TB_Delete(string Job_Degree_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Degree_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Job_Degree_ID", Job_Degree_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Language_Option_TB
    public static int Language_Option_TB_AddEdit(string ID, string Lang_ID, string Lang_Read,
        string Lang_Speak, string Lang_Write, int Emp_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Language_Option_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@Lang_ID", Lang_ID);
            cmd.Parameters.AddWithValue("@Lang_Read", Lang_Read);
            cmd.Parameters.AddWithValue("@Lang_Speak ", Lang_Speak);
            cmd.Parameters.AddWithValue("@Lang_Write", Lang_Write);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Language_Option_TB_Get(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Language_Option_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable LanguageEmp_Option_TB_Get(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("LanguageEmp_Option_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion


    #region ComputerSkills_TB
    public static int ComputerSkills_TB_AddEdit(string ID, string ProgramName, string ComputerLevel,
        int Emp_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("ComputerSkills_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@ProgramName", ProgramName);
            cmd.Parameters.AddWithValue("@ComputerLevel", ComputerLevel);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable ComputerSkills_TB_Get(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ComputerSkills_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int ComputerSkills_TB_Delete(string ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("ComputerSkills_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Motivation_TB
    public static int Motivation_TB_AddEdit(string Motivation_ID, int Motivation_Type_ID, string description,
         int EvaluateType,
        DateTime Motivation_S_Date, int Emp_ID, string Motivation_Details, decimal Motivation_Value, decimal Motivation_Rate,
        int Currancy_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Motivation_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Motivation_ID != "")
                cmd.Parameters.AddWithValue("@Motivation_ID", Motivation_ID);
            cmd.Parameters.AddWithValue("@Motivation_Type_ID", Motivation_Type_ID);

            cmd.Parameters.AddWithValue("@description", description);
            cmd.Parameters.AddWithValue("@EvaluateType", EvaluateType);
            cmd.Parameters.AddWithValue("@Motivation_Value", Motivation_Value);
            cmd.Parameters.AddWithValue("@Motivation_S_Date", Motivation_S_Date);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Motivation_Details", Motivation_Details);
            cmd.Parameters.AddWithValue("@Motivation_Rate", Motivation_Rate);
            cmd.Parameters.AddWithValue("@Currancy_ID", Currancy_ID);

            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Motivation_TB_Get(string Motivation_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Motivation_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Motivation_ID", Motivation_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Motivation_TB_Delete(string Motivation_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Motivation_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Motivation_ID", Motivation_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion


    #region Motivation_Type_TB
    public static int Motivation_Type_TB_AddEdit(string Motivation_Type_ID, string Code, string Motivation_Type,
        string Motivation_Condition)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Motivation_Type_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Motivation_Type_ID != "")

                cmd.Parameters.AddWithValue("@Motivation_Type_ID", Motivation_Type_ID);
            cmd.Parameters.AddWithValue("@Code", Code);

            cmd.Parameters.AddWithValue("@Motivation_Type", Motivation_Type);
            cmd.Parameters.AddWithValue("@Motivation_Condition", Motivation_Condition);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Motivation_Type_TB_Get(string Motivation_Type_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Motivation_Type_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Motivation_Type_ID", Motivation_Type_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Motivation_Type_TB_Delete(string Motivation_Type_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Motivation_Type_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Motivation_Type_ID", Motivation_Type_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Penalty_TB
    public static int Penalty_TB_AddEdit(string Penalty_ID, int Penalty_Type_ID, int EvaluateType,
        DateTime Penalty_Date, int Emp_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Panelty_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Penalty_ID != "")
                cmd.Parameters.AddWithValue("@Penalty_ID", Penalty_ID);
            cmd.Parameters.AddWithValue("@Penalty_Type_ID", Penalty_Type_ID);

            cmd.Parameters.AddWithValue("@EvaluateType", EvaluateType);

            cmd.Parameters.AddWithValue("@Penalty_Date", Penalty_Date);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);


            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Penetly_TB_Get(string Penalty_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Panelty_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Penalty_ID", Penalty_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Penalty_TB_Delete(string Penalty_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Panelty_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Penalty_ID", Penalty_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Penalty_Type_TB
    public static int Panelty_Type_TB_AddEdit(string Penalty_Type_ID, string Code, string Penalty_Type, string Penalty_Condition)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Panelty_Type_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Penalty_Type_ID != "")

                cmd.Parameters.AddWithValue("@Penalty_Type_ID ", Penalty_Type_ID);
            cmd.Parameters.AddWithValue("@Code", Code);

            cmd.Parameters.AddWithValue("@Penalty_Type", Penalty_Type);
            cmd.Parameters.AddWithValue("@Penalty_Condition", Penalty_Condition);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Panetly_Type_TB_Get(string Penalty_Type_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Panetly_Type_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Penalty_Type_ID", Penalty_Type_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Panelty_Type_TB_Delete(string Penalty_Type_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Panelty_Type_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Penalty_Type_ID", Penalty_Type_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Differences_TB
    public static int Differences_TB_AddEdit(string Diff_ID, int Diff_Month, int Diff_Year, string TableName, string Diff_Type_ID,
        decimal Diff_Value,
        int Emp_ID, int UserID, int Salary_Trans_ID, string Type,
        decimal Diff_Rate, string Diff_Desc, string Diff_Code, int Currancy_ID)
    {
        using (SqlConnection conn = GetConnection())
        {// if insert updateUserID null
            SqlCommand cmd = new SqlCommand("Differences_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Diff_ID != "")
                cmd.Parameters.AddWithValue("@Diff_ID", Diff_ID);
            cmd.Parameters.AddWithValue("@Diff_Month", Diff_Month);
            cmd.Parameters.AddWithValue("@Diff_Year", Diff_Year);
            cmd.Parameters.AddWithValue("@TableName", TableName);
            cmd.Parameters.AddWithValue("@Diff_Type_ID", Diff_Type_ID);
            cmd.Parameters.AddWithValue("@Diff_Value", Diff_Value);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.Parameters.AddWithValue("@Type", Type);
            cmd.Parameters.AddWithValue("@Salary_Trans_ID", Salary_Trans_ID);
            cmd.Parameters.AddWithValue("@Diff_Rate", Diff_Rate);
            cmd.Parameters.AddWithValue("@Diff_Desc", Diff_Desc);
            cmd.Parameters.AddWithValue("@Diff_Code", Diff_Code);
            cmd.Parameters.AddWithValue("@Currancy_ID", Currancy_ID);


            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Differences_TB_Get(string Diff_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Differences_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Diff_ID", Diff_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Differences_TB_Delete(string Diff_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Differences_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Diff_ID", Diff_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int Differences_TB_Adopt(string Diff_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Differences_TB_Adopt", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Diff_ID", Diff_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    //public static string Emp_Evaluate_Differences(int Emp_ID, int Month, int Year)
    //{
    //    using (SqlConnection conn = GetConnection())
    //    {
    //        SqlDataAdapter DA = new SqlDataAdapter("Emp_Evaluate_Differences", conn);
    //        DA.SelectCommand.CommandType = CommandType.StoredProcedure;
    //        DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
    //        DA.SelectCommand.Parameters.AddWithValue("@Month", Month);
    //        DA.SelectCommand.Parameters.AddWithValue("@Year", Year);
    //        DataTable DT = new DataTable();
    //        DA.Fill(DT);
    //        return DT.Rows[0][0].ToString();
    //    }
    //}




    #endregion
    #region Plus
    public static int Plus_TB_AddEdit(string Plus_ID, int Plus_Month, int Plus_Year, string TableName, string Plus_Type_ID, decimal Plus_Type_Value,
        int Emp_ID, int UserID, int Salary_Trans_ID, string Type, decimal Plus_Rate, string Plus_Desc, string Plus_Code, int Currancy_ID)
    {
        using (SqlConnection conn = GetConnection())
        {// if insert updateUserID null
            SqlCommand cmd = new SqlCommand("Plus_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Plus_ID != "")
                cmd.Parameters.AddWithValue("@Plus_ID", Plus_ID);
            cmd.Parameters.AddWithValue("@Plus_Month", Plus_Month);
            cmd.Parameters.AddWithValue("@Plus_Year", Plus_Year);
            cmd.Parameters.AddWithValue("@TableName", TableName);
            cmd.Parameters.AddWithValue("@Plus_Type_ID", Plus_Type_ID);
            cmd.Parameters.AddWithValue("@Plus_Type_Value", Plus_Type_Value);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.Parameters.AddWithValue("@Type", Type);
            cmd.Parameters.AddWithValue("@Salary_Trans_ID", Salary_Trans_ID);
            cmd.Parameters.AddWithValue("@Plus_Rate", Plus_Rate);
            cmd.Parameters.AddWithValue("@Plus_Desc", Plus_Desc);
            cmd.Parameters.AddWithValue("@Plus_Code", Plus_Code);
            cmd.Parameters.AddWithValue("@Currancy_ID", Currancy_ID);


            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Plus_TB_Get(string Plus_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Plus_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Plus_ID", Plus_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static string Emp_Evaluate_Plus(int Emp_ID, int Month, int Year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Emp_Evaluate_Plus", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Month", Month);
            DA.SelectCommand.Parameters.AddWithValue("@Year", Year);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT.Rows[0][0].ToString();
        }
    }

    public static int Plus_TB_Delete(string Plus_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Plus_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Plus_ID", Plus_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static int Plus_TB_Adopt(string Plus_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Plus_TB_Adopt", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Plus_ID", Plus_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion






    #region Discount
    public static int Discount_TB_AddEdit(string Discount_ID, int Discount_Month, int Discount_Year, string TableName,
        string Discount_Type_ID, decimal Discount_Value,
        int Emp_ID, int UserID, int Salary_Trans_ID, string Type, decimal Discount_Rate, string Discount_Desc, string Discount_Code, int Currancy_ID)
    {
        using (SqlConnection conn = GetConnection())
        {// if insert updateUserID null
            SqlCommand cmd = new SqlCommand("Discount_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Discount_ID != "")
                cmd.Parameters.AddWithValue("@Discount_ID", Discount_ID);
            cmd.Parameters.AddWithValue("@Discount_Month", Discount_Month);
            cmd.Parameters.AddWithValue("@Discount_Year", Discount_Year);
            cmd.Parameters.AddWithValue("@Discount_Type_ID", Discount_Type_ID);
            cmd.Parameters.AddWithValue("@TableName", TableName);
            cmd.Parameters.AddWithValue("@Discount_Value", Discount_Value);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.Parameters.AddWithValue("@Type", Type);
            cmd.Parameters.AddWithValue("@Salary_Trans_ID", Salary_Trans_ID);
            cmd.Parameters.AddWithValue("@Discount_Rate", Discount_Rate);
            cmd.Parameters.AddWithValue("@Discount_Desc", Discount_Desc);
            cmd.Parameters.AddWithValue("@Discount_Code", Discount_Code);
            cmd.Parameters.AddWithValue("@Currancy_ID", Currancy_ID);

            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Discount_TB_Get(string Discount_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Discount_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Discount_ID", Discount_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Discount_TB_Delete(string Discount_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Discount_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Discount_ID", Discount_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int Discount_TB_Adopt(string Discount_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Discount_TB_Adopt", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Discount_ID", Discount_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static string Emp_Evaluate_Discount(int Emp_ID, int Month, int Year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Emp_Evaluate_Discount", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Month", Month);
            DA.SelectCommand.Parameters.AddWithValue("@Year", Year);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT.Rows[0][0].ToString();
        }
    }




    #endregion

    #region Position_Transaction
    public static int Position_Transaction_AddEdit(string Trans_ID, int Change_Type_ID,
        string Date_Begin_Position, string Finanical_Changes, int New_Department_ID, int New_Job_Title_ID, int Emp_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Position_Transaction_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Trans_ID != "")

                cmd.Parameters.AddWithValue("@Trans_ID", Trans_ID);
            cmd.Parameters.AddWithValue("@Change_Type_ID", Change_Type_ID);
            cmd.Parameters.AddWithValue("@Date_Begin_Position ", Date_Begin_Position);
            cmd.Parameters.AddWithValue("@Finanical_Changes", Finanical_Changes);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@New_Department_ID", New_Department_ID);
            cmd.Parameters.AddWithValue("@New_Job_Title_ID", New_Job_Title_ID);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);


            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Position_Transaction_Get(string Trans_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Position_Transaction_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Trans_ID", Trans_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    #endregion

    #region Qualification_TB
    public static int Qualification_TB_AddEdit(string Qualifaction_ID, int C_Qual_Type_ID,
        int C_Country_ID, string C_University_ID, DateTime Graduate_Date,
        int Emp_ID, string Collage_Name, string Qual_Avarge_GPA, string Speclize, int InsertUserID, int UpdateUserID, string Certificate_Name, string Scan_Pic)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Qualification_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Qualifaction_ID != "")

                cmd.Parameters.AddWithValue("@Qualifaction_ID", Qualifaction_ID);
            cmd.Parameters.AddWithValue("@C_Qual_Type_ID", C_Qual_Type_ID);
            cmd.Parameters.AddWithValue("@C_Country_ID ", C_Country_ID);
            cmd.Parameters.AddWithValue("@C_University_ID", C_University_ID);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Graduate_Date", Graduate_Date);
            cmd.Parameters.AddWithValue("@Collage_Name", Collage_Name);
            cmd.Parameters.AddWithValue("@Qual_Avarge_GPA", Qual_Avarge_GPA);
            cmd.Parameters.AddWithValue("@Speclize", Speclize);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            cmd.Parameters.AddWithValue("@Certificate_Name", Certificate_Name);
            cmd.Parameters.AddWithValue("@Scan_Pic", Scan_Pic);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Qualification_TB_Get(string Qualifaction_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Qualification_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Qualifaction_ID", Qualifaction_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable QualificationEmp_TB_Get(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("QualificationEmp_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Qualification_TB_Delete(string Qualifaction_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Qualification_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Qualifaction_ID", Qualifaction_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region References
    public static int References_AddEdit(string Ref_ID, string Ar_F_Name,
        string Ar_S_Name, string Ar_Th_Name, string Ar_Family_Name,
        int Emp_ID, string Ref_Email, string Ref_Mobile, string Ref_Phone, string Ref_Job,
        string Ref_Address, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("References_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Ref_ID != "")

                cmd.Parameters.AddWithValue("@Ref_ID", Ref_ID);
            cmd.Parameters.AddWithValue("@Ar_F_Name", Ar_F_Name);
            cmd.Parameters.AddWithValue("@Ar_S_Name ", Ar_S_Name);
            cmd.Parameters.AddWithValue("@Ar_Th_Name", Ar_Th_Name);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Ar_Family_Name", Ar_Family_Name);

            cmd.Parameters.AddWithValue("@Ref_Email", Ref_Email);
            cmd.Parameters.AddWithValue("@Ref_Mobile", Ref_Mobile);
            cmd.Parameters.AddWithValue("@Ref_Phone", Ref_Phone);
            cmd.Parameters.AddWithValue("@Ref_Job", Ref_Job);
            cmd.Parameters.AddWithValue("@Ref_Address", Ref_Address);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable References_Get(string Ref_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("References_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Ref_ID", Ref_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ReferencesEmp_Get(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ReferencesEmp_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int References_TB_Delete(string Ref_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("References_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Ref_ID", Ref_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Research_TB
    public static int Research_TB_AddEdit(string Research_ID, string Research_Subject, string Submitted_To, string Research_Notes,
        DateTime Research_Date, int Emp_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Research_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Research_ID != "")
                cmd.Parameters.AddWithValue("@Research_ID", Research_ID);
            cmd.Parameters.AddWithValue("@Research_Subject", Research_Subject);
            cmd.Parameters.AddWithValue("@Submitted_To", Submitted_To);
            cmd.Parameters.AddWithValue("@Research_Notes", Research_Notes);
            cmd.Parameters.AddWithValue("@Research_Date", Research_Date);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Research_TB_Get(string Research_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Research_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Research_ID", Research_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable ResearchEmp_TB_Get(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ResearchEmp_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Research_TB_Delete(string Research_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Research_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Research_ID", Research_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Salary_Transaction_TB
    public static int Salary_Transaction_TB_AddEdit(string Salary_ID, int Year,
        int Salary_Month_ID, decimal Main_Salary, decimal Discount_Total,
        int Emp_ID, decimal Plus_Total, decimal Salary_Total, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Salary_Transaction_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Salary_ID != "")

                cmd.Parameters.AddWithValue("@Salary_ID", Salary_ID);
            cmd.Parameters.AddWithValue("@Salary_Month_ID", Salary_Month_ID);
            cmd.Parameters.AddWithValue("@Main_Salary ", Main_Salary);
            cmd.Parameters.AddWithValue("@Discount_Total", Discount_Total);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Year", Year);
            cmd.Parameters.AddWithValue("@Plus_Total", Plus_Total);
            cmd.Parameters.AddWithValue("@Salary_Total", Salary_Total);


            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);


            return cmd.ExecuteNonQuery();
        }
    }

    public static int Salary_Transaction_TB_Update(string Salary_ID,
      decimal Main_Salary, decimal Discount_Total, decimal Differences_Total,
        decimal Plus_Total, decimal Salary_Total, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Salary_Transaction_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Salary_ID != "")

                cmd.Parameters.AddWithValue("@Salary_ID", Salary_ID);
            cmd.Parameters.AddWithValue("@Main_Salary ", Main_Salary);
            cmd.Parameters.AddWithValue("@Discount_Total", Discount_Total);
            cmd.Parameters.AddWithValue("@Differences_Total", Differences_Total);
            cmd.Parameters.AddWithValue("@Plus_Total", Plus_Total);
            cmd.Parameters.AddWithValue("@Salary_Total", Salary_Total);

            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);


            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Salary_Transaction_TB_Get(string Salary_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Salary_Transaction_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Salary_ID", Salary_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable Salary_Transaction_TB_Emp_Get(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Salary_Transaction_TB_Emp_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Salary_Transaction_TB_Delete(string Salary_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Salary_Transaction_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Salary_ID", Salary_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static DataTable CalculateSalary(string Emp_ID, int Month, int Year, int UserID)
    {
        using (SqlConnection conn = GetConnection())
        {

            SqlDataAdapter DA = new SqlDataAdapter("CalculateSalary", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Month", Month);
            DA.SelectCommand.Parameters.AddWithValue("@Year", Year);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int CalculateSalaryUpdate(string Salary_ID, int UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("CalculateSalaryUpdate", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Salary_ID", Salary_ID);

            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static int Salary_Transaction_TB_Accredited(string Salary_ID, string Accredited_Copy, int UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Salary_Transaction_TB_Accredited", conn);
            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.AddWithValue("@Salary_ID", Salary_ID);
            cmd.Parameters.AddWithValue("@Accredited_Copy", Accredited_Copy);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Vacation_Balance
    public static int Vacation_Balance_AddEdit(string Vacation_Balance_ID, string Vacation_Type_ID,
        string Balance_Start_Date, string Balance_End_Date, int Consumer_Balance, int Total_Balance, int PostPoneBalance,
        int Emp_ID, int UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Vacation_Balance_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Vacation_Balance_ID != "")

                cmd.Parameters.AddWithValue("@Vacation_Balance_ID", Vacation_Balance_ID);
            cmd.Parameters.AddWithValue("@Vacation_Type_ID", Vacation_Type_ID);
            cmd.Parameters.AddWithValue("@Balance_Start_Date ", Balance_Start_Date);
            cmd.Parameters.AddWithValue("@Balance_End_Date", Balance_End_Date);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Consumer_Balance", Consumer_Balance);
            cmd.Parameters.AddWithValue("@Total_Balance", Total_Balance);
            cmd.Parameters.AddWithValue("@PostPoneBalance", PostPoneBalance);
            cmd.Parameters.AddWithValue("@UserID", UserID);

            return cmd.ExecuteNonQuery();
        }
    }

    public static int Vacation_Balance_Delete(string Vacation_Balance_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("VacationBalanceDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Vacation_Balance_ID != "")

                cmd.Parameters.AddWithValue("@Vacation_Balance_ID", Vacation_Balance_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);

            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Vacation_Balance_Get(string Vacation_Balance_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Vacation_Balance_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Vacation_Balance_ID", Vacation_Balance_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable PostPoneBalanceGet(string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("PostPoneBalanceGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetExcelEmpVacationBalance(string Name)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetExcelEmpVacationBalance", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Name", Name);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region Vacation_TB
    public static DataTable Vacation_TB_AddEdit(string Vacation_ID, int Vacation_Type_ID,
        DateTime Vacation_Start_Date, DateTime Vacation_End_Date, int Vacation_Day_Count,
        int Emp_ID, int Request_Status, string Vacation_Reason, string VacationPlace, int UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Vacation_TB_AddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (Vacation_ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@Vacation_ID", Vacation_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Vacation_Type_ID", Vacation_Type_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Vacation_Start_Date ", Vacation_Start_Date);
            DA.SelectCommand.Parameters.AddWithValue("@Vacation_End_Date", Vacation_End_Date);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Vacation_Day_Count", Vacation_Day_Count);
            DA.SelectCommand.Parameters.AddWithValue("@Request_Status", Request_Status);
            DA.SelectCommand.Parameters.AddWithValue("@Vacation_Reason", Vacation_Reason);
            DA.SelectCommand.Parameters.AddWithValue("@VacationPlace", VacationPlace);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable Vacation_TB_Get(string Vacation_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Vacation_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Vacation_ID", Vacation_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Vacation_Cancel_Request(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Vacation_Cancel_Request", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static int Vacation_TB_Delete(string Vacation_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Vacation_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Vacation_ID", Vacation_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }


    public static int Vacation_Follow_Request(string Vacation_ID, bool AcceptStatus, string OtherEmployee, string ManagerId)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Vacation_Follow_Request", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Vacation_ID != "")

                cmd.Parameters.AddWithValue("@Vacation_ID", Vacation_ID);

            cmd.Parameters.AddWithValue("@AcceptStatus", AcceptStatus);

            cmd.Parameters.AddWithValue("@OtherEmployee", OtherEmployee);
            cmd.Parameters.AddWithValue("@ManagerId", ManagerId);
            return cmd.ExecuteNonQuery();
        }
    }


    public static int Vacation_Adopt_Request(string Vacation_ID, string AdoptUserID, bool AdoptHRM)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Vacation_Adopt_Request", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Vacation_ID != "")

                cmd.Parameters.AddWithValue("@Vacation_ID", Vacation_ID);
            cmd.Parameters.AddWithValue("@AdoptHRM", AdoptHRM);
            cmd.Parameters.AddWithValue("@AdoptUserID", AdoptUserID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static int Vacation_AdoptHR_Request(string Vacation_ID, string AdoptUserID, bool AdoptHR)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Vacation_AdoptHR_Request", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Vacation_ID != "")

                cmd.Parameters.AddWithValue("@Vacation_ID", Vacation_ID);
            cmd.Parameters.AddWithValue("@AdoptHR", AdoptHR);
            cmd.Parameters.AddWithValue("@AdoptUserID", AdoptUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    // for report
    public static DataTable VacationRequestReport(string Vacation_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("VacationRequestReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Vacation_ID", Vacation_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable VacationRequestBalanceReport(string Vacation_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("VacationRequestBalanceReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Vacation_ID", Vacation_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    //ExitRequestReport
    public static DataTable ExitRequestReport(string Exit_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExitRequestReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ExitID", Exit_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    //WExitRequestReport
    public static DataTable WExitRequestReport(string Exit_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("WExitRequestReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@WExitID", Exit_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region Vacation_Type_TB
    public static int Vacation_Type_TB_AddEdit(string Vacation_Type_ID,
        string Vacation_Type, string Vacation_Symbol, int Vacation_Period, int Who, bool IsPaid)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Vacation_Type_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Vacation_Type_ID != "")
                cmd.Parameters.AddWithValue("@Vacation_Type_ID", Vacation_Type_ID);
            cmd.Parameters.AddWithValue("@Vacation_Type ", Vacation_Type);
            cmd.Parameters.AddWithValue("@Vacation_Symbol ", Vacation_Symbol);
            cmd.Parameters.AddWithValue("@Vacation_Period ", Vacation_Period);
            cmd.Parameters.AddWithValue("@Who", Who);
            cmd.Parameters.AddWithValue("@IsPaid", IsPaid);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Vacation_Type_TB_Get(string Vacation_Type_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Vacation_Type_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Vacation_Type_ID", Vacation_Type_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Vacation_Type_TB_Delete(string Vacation_Type_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Vacation_Type_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Vacation_Type_ID", Vacation_Type_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }


    #endregion

    #region Work_Exit_Permission_TB

    public static int Register_Work_Exit_Permission_TB_AddEdit(string Work_Exit_ID,
        DateTime Work_Exit_Date, DateTime Exit_From_Hour, DateTime Exit_To_Hour, int Emp_ID,
        int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Register_Work_Exit_Permission_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Work_Exit_ID != "")

                cmd.Parameters.AddWithValue("@Work_Exit_ID", Work_Exit_ID);
            cmd.Parameters.AddWithValue("@Work_Exit_Date ", Work_Exit_Date);

            cmd.Parameters.AddWithValue("@Exit_From_Hour ", Exit_From_Hour);
            cmd.Parameters.AddWithValue("@Exit_To_Hour ", Exit_To_Hour);

            cmd.Parameters.AddWithValue("@Emp_ID ", Emp_ID);


            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }



    public static int Work_Exit_Permission_TB_AddEdit(string Work_Exit_ID,
        DateTime Work_Exit_Date, int Work_Exit_Type_ID, DateTime Exit_From_Hour, DateTime Exit_To_Hour, DateTime Work_Exit_From,
        DateTime Work_Exit_To, string Work_Exit_Details, int Emp_ID, int Exit_Status, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Work_Exit_Permission_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Work_Exit_ID != "")

                cmd.Parameters.AddWithValue("@Work_Exit_ID", Work_Exit_ID);
            cmd.Parameters.AddWithValue("@Work_Exit_Date ", Work_Exit_Date);
            cmd.Parameters.AddWithValue("@Work_Exit_Type_ID ", Work_Exit_Type_ID);
            cmd.Parameters.AddWithValue("@Exit_From_Hour ", Exit_From_Hour);
            cmd.Parameters.AddWithValue("@Exit_To_Hour ", Exit_To_Hour);

            cmd.Parameters.AddWithValue("@Work_Exit_From ", Work_Exit_From);
            cmd.Parameters.AddWithValue("@Work_Exit_To ", Work_Exit_To);
            cmd.Parameters.AddWithValue("@Work_Exit_Details ", Work_Exit_Details);
            cmd.Parameters.AddWithValue("@Emp_ID ", Emp_ID);
            cmd.Parameters.AddWithValue("@Exit_Status", Exit_Status);

            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Work_Exit_Permission_TB_Get(string Work_Exit_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Work_Exit_Permission_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Work_Exit_ID", Work_Exit_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable Work_Exit_Permission_TB_GetRow(string Emp_ID, DateTime Work_Exit_Date)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Work_Exit_Permission_TB_GetRow", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Work_Exit_Date", Work_Exit_Date);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int Work_Exit_Permission_TB_Delete(string Work_Exit_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Work_Exit_Permission_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Work_Exit_ID", Work_Exit_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int WExit_TB_Update(string Exit_ID, int Emp_ID, DateTime Actual_Out, DateTime Actual_In, Decimal WExit_Hour, int WExit_TotalSecond, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("WExit_TB_Update", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Exit_ID", Exit_ID);

            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Actual_Out", Actual_Out);
            cmd.Parameters.AddWithValue("@Actual_In", Actual_In);

            cmd.Parameters.AddWithValue("@WExit_Hour", WExit_Hour);
            cmd.Parameters.AddWithValue("@WExit_TotalSecond", WExit_TotalSecond);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static int WExit_Follow_Request(string Work_Exit_ID, bool AcceptStatus, string Refuse_Reason, string ManagerId)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("WExit_Follow_Request", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Work_Exit_ID != "")

                cmd.Parameters.AddWithValue("@Work_Exit_ID", Work_Exit_ID);

            cmd.Parameters.AddWithValue("@AcceptStatus", AcceptStatus);

            cmd.Parameters.AddWithValue("@Refuse_Reason", Refuse_Reason);
            cmd.Parameters.AddWithValue("@ManagerId", ManagerId);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int WExit_Adopt_Request(string Work_Exit_ID, string AdoptUserID, bool AdoptHRM)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("WExit_Adopt_Request", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Work_Exit_ID != "")

                cmd.Parameters.AddWithValue("@Work_Exit_ID", Work_Exit_ID);
            cmd.Parameters.AddWithValue("@AdoptHRM", AdoptHRM);
            cmd.Parameters.AddWithValue("@AdoptUserID", AdoptUserID);
            return cmd.ExecuteNonQuery();
        }
    }


    #endregion

    #region empinfo
    public static DataTable SetEmpInfo(string Emp_ID, string Ar_F_Name, string Ar_S_Name, string Ar_Th_Name, string Ar_Family_Name, string En_F_Name,
        string En_S_Name, string En_Th_Name, string En_Family_Name, string Emp_Mother_Name, string Emp_DOB, int C_Driver_Licence_Type_ID,
        string Emp_Driver_Licence_No)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetEmpInfo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (Emp_ID != "")

                DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Ar_F_Name", Ar_F_Name);
            DA.SelectCommand.Parameters.AddWithValue("@Ar_S_Name", Ar_S_Name);
            DA.SelectCommand.Parameters.AddWithValue("@Ar_Th_Name", Ar_Th_Name);
            DA.SelectCommand.Parameters.AddWithValue("@Ar_Family_Name", Ar_Family_Name);
            DA.SelectCommand.Parameters.AddWithValue("@En_F_Name", En_F_Name);
            DA.SelectCommand.Parameters.AddWithValue("@En_S_Name", En_S_Name);
            DA.SelectCommand.Parameters.AddWithValue("@En_Th_Name", En_Th_Name);
            DA.SelectCommand.Parameters.AddWithValue("@En_Family_Name", En_Family_Name);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_Mother_Name", Emp_Mother_Name);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_DOB", Emp_DOB);
            DA.SelectCommand.Parameters.AddWithValue("@C_Driver_Licence_Type_ID", C_Driver_Licence_Type_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_Driver_Licence_No", Emp_Driver_Licence_No);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static int Language_Option_TB_Delete(string ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Language_Option_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }



    public static int AddRow(DateTime Date_From, DateTime Date_To, DateTime Date, DateTime Time_From, DateTime Time_To, int Emp_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Attendance_Month_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Date_From", Date_From);
            cmd.Parameters.AddWithValue("@Date_To", Date_To);
            cmd.Parameters.AddWithValue("@Time_From", Time_From);
            cmd.Parameters.AddWithValue("@Time_To", Time_To);
            cmd.Parameters.AddWithValue("@Date", Date);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }
    #endregion empinfo


    #region TaxBracket

    public static int Tax_Bracket_TB_AddEdit(string Tax_Bracket_ID,
      string Tax_Bracket_Name, decimal Tax_Bracket_Min_Yearly,
        decimal Tax_Bracket_Max_Yearly, decimal Tax_Bracket_Rate, int Currancy_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Tax_Bracket_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Tax_Bracket_ID != "")
                cmd.Parameters.AddWithValue("@Tax_Bracket_ID", Tax_Bracket_ID);
            cmd.Parameters.AddWithValue("@Tax_Bracket_Name ", Tax_Bracket_Name);
            cmd.Parameters.AddWithValue("@Tax_Bracket_Min_Yearly ", Tax_Bracket_Min_Yearly);
            cmd.Parameters.AddWithValue("@Tax_Bracket_Max_Yearly ", Tax_Bracket_Max_Yearly);
            cmd.Parameters.AddWithValue("@InsertUserID ", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID ", UpdateUserID);
            cmd.Parameters.AddWithValue("@Tax_Bracket_Rate ", Tax_Bracket_Rate);
            cmd.Parameters.AddWithValue("@Currancy_ID", Currancy_ID);

            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Tax_Bracket_TB_Get(string Tax_Bracket_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Tax_Bracket_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Tax_Bracket_ID", Tax_Bracket_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Tax_Bracket_TB_Delete(string Tax_Bracket_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Tax_Bracket_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Tax_Bracket_ID", Tax_Bracket_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Exemption_Type

    public static int Exemption_Type_TB_AddEdit(string Exemption_Type_ID,
      string Exemption_Type, decimal Exemption_Value_Yearly, int Currancy_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Exemption_Type_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Exemption_Type_ID != "")
                cmd.Parameters.AddWithValue("@Exemption_Type_ID", Exemption_Type_ID);
            cmd.Parameters.AddWithValue("@Exemption_Type ", Exemption_Type);
            cmd.Parameters.AddWithValue("@Exemption_Value_Yearly ", Exemption_Value_Yearly);
            cmd.Parameters.AddWithValue("@Currancy_ID", Currancy_ID);

            cmd.Parameters.AddWithValue("@InsertUserID ", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID ", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Exemption_Type_TB_Get(string Exemption_Type_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Exemption_Type_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Exemption_Type_ID", Exemption_Type_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Exemption_Type_TB_Delete(string Exemption_Type_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Exemption_Type_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Exemption_Type_ID", Exemption_Type_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Exemption

    public static int Exemption_TB_AddEdit(string Exemption_ID,
      string Exemption_Type_ID, int Emp_ID, int Exemption_Year, int Exemption_Month, int Currancy_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Exemption_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Exemption_ID != "")
                cmd.Parameters.AddWithValue("@Exemption_ID ", Exemption_ID);
            cmd.Parameters.AddWithValue("@Exemption_Type_ID", Exemption_Type_ID);
            cmd.Parameters.AddWithValue("@Emp_ID ", Emp_ID);
            cmd.Parameters.AddWithValue("@Exemption_Year ", Exemption_Year);
            cmd.Parameters.AddWithValue("@Exemption_Month ", Exemption_Month);
            cmd.Parameters.AddWithValue("@Currancy_ID", Currancy_ID);

            cmd.Parameters.AddWithValue("@InsertUserID ", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID ", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Exemption_TB_Get(string Exemption_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Exemption_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Exemption_ID", Exemption_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Exemption_TB_Delete(string Exemption_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Exemption_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Exemption_ID", Exemption_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static int CalculateEmpExemption(int Emp_ID,
    int Year, int Month, int UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("CalculateEmpExemptions", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Emp_ID ", Emp_ID);
            cmd.Parameters.AddWithValue("@Month", Month);
            cmd.Parameters.AddWithValue("@Year ", Year);
            cmd.Parameters.AddWithValue("@UserID ", UserID);


            return cmd.ExecuteNonQuery();
        }
    }

    #endregion


    #region Currancy
    public static int Currancey_TB_AddEdit(string Cur_ID,
    string Cur_Ar_Name, string Cur_En_Name, int FractionsNo, string FractionName, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Currancey_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Cur_ID != "")
                cmd.Parameters.AddWithValue("@Cur_ID", Cur_ID);
            cmd.Parameters.AddWithValue("@Cur_Ar_Name", Cur_Ar_Name);
            cmd.Parameters.AddWithValue("@Cur_En_Name ", Cur_En_Name);
            cmd.Parameters.AddWithValue("@FractionsNo ", FractionsNo);
            cmd.Parameters.AddWithValue("@FractionName ", FractionName);

            cmd.Parameters.AddWithValue("@InsertUserID ", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID ", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Currancy_TB_Get(string Cur_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Currancy_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Cur_ID", Cur_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Currency_TB_Delete(string Cur_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Currancy_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Cur_ID", Cur_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }


    #endregion

    #region CurranceyPrice
    public static int CurranceyPrice_TB_AddEdit(string ID, int Cur_ID,
   Decimal Price, string Date, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("CurranceyPrice_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@Cur_ID", Cur_ID);
            cmd.Parameters.AddWithValue("@Price", Price);
            cmd.Parameters.AddWithValue("@Date ", Date);


            cmd.Parameters.AddWithValue("@InsertUserID ", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID ", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }
    public static DataTable CurrancyPrice_TB_Get(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CurrancyPrice_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int CurrencyPrice_TB_Delete(string ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("CurrencyPrice_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Advance
    public static int Advance_TB_AddEdit(string Advance_ID,
         decimal Advance_Value, int Advance_EmpID,
        decimal Advance_first_installment, DateTime Advance_Date,
        DateTime Advance_Due_Date, int Advance_PaymentNo, string Advance_Notes, int Currancy_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Advance_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Advance_ID != "")
                cmd.Parameters.AddWithValue("@Advance_ID", Advance_ID);
            cmd.Parameters.AddWithValue("@Advance_Value", Advance_Value);
            cmd.Parameters.AddWithValue("@Advance_EmpID", Advance_EmpID);
            cmd.Parameters.AddWithValue("@Advance_first_installment", Advance_first_installment);
            cmd.Parameters.AddWithValue("@Advance_Date", Advance_Date);
            cmd.Parameters.AddWithValue("@Advance_Due_Date", Advance_Due_Date);
            cmd.Parameters.AddWithValue("@Advance_PaymentNo", Advance_PaymentNo);
            cmd.Parameters.AddWithValue("@Advance_Notes", Advance_Notes);
            cmd.Parameters.AddWithValue("@Currancy_ID", Currancy_ID);

            cmd.Parameters.AddWithValue("@InsertUserID ", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID ", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Advance_TB_Get(string Advance_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Advance_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Advance_ID", Advance_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Advance_TB_Delete(string Advance_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Advance_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Advance_ID", Advance_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion
    #region Load
    public static int Emp_Load_TB_AddEdit(string Load_ID,
        int Emp_ID, int Max_Load, decimal Hour_Price, int SemesterID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Emp_Load_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Load_ID != "")
                cmd.Parameters.AddWithValue("@Load_ID", Load_ID);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@Max_Load", Max_Load);
            cmd.Parameters.AddWithValue("@Hour_Price", Hour_Price);
            cmd.Parameters.AddWithValue("@SemesterID", SemesterID);

            cmd.Parameters.AddWithValue("@InsertUserID ", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID ", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable Emp_Load_TB_Get(string Load_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Emp_Load_TB_Get", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Load_ID", Load_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable Emp_Load_TB_EmpGet(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Emp_Load_TB_EmpGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int Emp_Load_TB_Delete(string Load_ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("Emp_Load_TB_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Load_ID", Load_ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion


    #region CVEmployee
    public static DataTable EmpPersonalInformationCV(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmpPersonalInformationCV", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    //EmpNamesGetAll
    public static DataTable EmpNamesGetAll()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmpNamesGetAll", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmpQualGetAll(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmpQualGetAll", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable EmpCourcesGetAll(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmpCourcesGetAll", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmpExperienceGetAll(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmpExperienceGetAll", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ComputerSkillsEmp_GetAll(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ComputerSkillsEmp_GetAll", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable LanguagesEmp_Option_GetAll(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("LanguagesEmp_Option_GetAll", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion


    #region EmpFiles
    public static int EmpFile_TB_AddEdit(string ID,
    string SSNPhoto, string BirthPhoto, string MarriedPhoto, string SonsPhoto, string OthersPhoto, int Emp_ID, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("EmpFile_TB_AddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@SSNPhoto", SSNPhoto);
            cmd.Parameters.AddWithValue("@BirthPhoto", BirthPhoto);
            cmd.Parameters.AddWithValue("@MarriedPhoto", MarriedPhoto);
            cmd.Parameters.AddWithValue("@SonsPhoto", SonsPhoto);
            cmd.Parameters.AddWithValue("@OthersPhoto", OthersPhoto);
            cmd.Parameters.AddWithValue("@InsertUserID ", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID ", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }
    public static int CVFileEmployeeUpload(string Emp_ID, string CVFile, int InsertUserID, int UpdateUserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("CVFileEmployeeUpload", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            cmd.Parameters.AddWithValue("@CVFile", CVFile);
            cmd.Parameters.AddWithValue("@InsertUserID ", InsertUserID);
            cmd.Parameters.AddWithValue("@UpdateUserID ", UpdateUserID);

            return cmd.ExecuteNonQuery();
        }
    }



    public static DataTable EmpFileGet(string Emp_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmpFileGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmpFileGetID(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmpFileGetID", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int EmpFileDelete(string ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("EmpFileDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion
    public static DataTable EmpContractGet(string Contract_ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmpContractGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            DA.SelectCommand.Parameters.AddWithValue("@Contract_ID", Contract_ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #region Volunteer


    public static DataTable VolunteerRequestAddEdit(string Emp_ID, string Emp_DOB, string Emp_Phone, string Emp_Mobile, string Emp_Email, string VolunteerJob, string CompanyName,
    string C_Qual_Type_ID, string University, string ReferanceID, string OtherQual, string ReferenceName, string OtherReferenceName, string ActivityID,
    string OtherActivityName, string scopeName, string VolunteerDayHours, string VolunteerPeriod, string StartDate, string EndDate, string ContactName,
    string ContactPhone, string InsertUserID, DataTable Skills)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("VolunteerRequestAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_ID);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_DOB", Emp_DOB);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_Phone", Emp_Phone);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_Mobile", Emp_Mobile);
            DA.SelectCommand.Parameters.AddWithValue("@Emp_Email", Emp_Email);
            DA.SelectCommand.Parameters.AddWithValue("@VolunteerJob", VolunteerJob);
            DA.SelectCommand.Parameters.AddWithValue("@CompanyName", CompanyName);
            DA.SelectCommand.Parameters.AddWithValue("@C_Qual_Type_ID", C_Qual_Type_ID);
            DA.SelectCommand.Parameters.AddWithValue("@OtherQual", OtherQual);
            DA.SelectCommand.Parameters.AddWithValue("@University", University);
            DA.SelectCommand.Parameters.AddWithValue("@ReferanceID", ReferanceID);
            DA.SelectCommand.Parameters.AddWithValue("@ReferenceName", ReferenceName);
            DA.SelectCommand.Parameters.AddWithValue("@OtherReferenceName", OtherReferenceName);
            DA.SelectCommand.Parameters.AddWithValue("@ActivityID", ActivityID);
            DA.SelectCommand.Parameters.AddWithValue("@scopeName", scopeName);
            DA.SelectCommand.Parameters.AddWithValue("@OtherActivityName", OtherActivityName);
            DA.SelectCommand.Parameters.AddWithValue("@VolunteerDayHours", VolunteerDayHours);
            DA.SelectCommand.Parameters.AddWithValue("@VolunteerPeriod", VolunteerPeriod);
            DA.SelectCommand.Parameters.AddWithValue("@StartDate", StartDate);
            DA.SelectCommand.Parameters.AddWithValue("@EndDate", EndDate);
            DA.SelectCommand.Parameters.AddWithValue("@ContactName", ContactName);
            DA.SelectCommand.Parameters.AddWithValue("@ContactPhone", ContactPhone);
            DA.SelectCommand.Parameters.AddWithValue("@InsertUserID", InsertUserID);
            DA.SelectCommand.Parameters.AddWithValue("@Skills", Skills);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



    #endregion

    public static DataTable GetVolunteerPersonalInformation(string Emp_Id)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetVolunteerPersonalInformation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_Id);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetVolunteerInformation(string Emp_Id)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetVolunteerInformation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_Id);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetVolunteerSkillsInformation(string Emp_Id)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetVolunteerSkillsInformation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Emp_ID", Emp_Id);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable DegreeBasicSalaryAddEdit(string ID, string DegreeID, string SalaryAmount, string CurrencyID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DegreeBasicSalaryAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@DegreeID", DegreeID);
            DA.SelectCommand.Parameters.AddWithValue("@SalaryAmount", SalaryAmount);
            DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", CurrencyID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable DegreeBasicSalaryGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DegreeBasicSalaryGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable EmployeeDegreeAddEdit(string EmployeeID, string DegreeID, string InsertEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeDegreeAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@DegreeID", DegreeID);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmployeeSeniorityAddEdit(string EmployeeID, string Seniority, string InsertEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeSeniorityAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@Seniority", Seniority);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static int EmployeeManagerAddEdit(string EmpID, string ManagerID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("EmployeeManagerAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@EmpID", EmpID);
            cmd.Parameters.AddWithValue("@ManagerID", ManagerID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static int EmployeeObserverUpdate(string EmpID, bool IsObserver, string Gender)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("EmployeeObserverUpdate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Emp_ID", EmpID);
            cmd.Parameters.AddWithValue("@IsObserver", IsObserver);
            cmd.Parameters.AddWithValue("@Gender", Gender);
            return cmd.ExecuteNonQuery();
        }
    }

    #region Bouns
    public static DataTable BounsTypeAddEdit(string ID, string Name, string Code, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BounsTypeAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@Name", Name);
            DA.SelectCommand.Parameters.AddWithValue("@Code", Code);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable BounsTypeGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BounsTypeGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable BounsTypeDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BounsTypeDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable BounsAddEdit(string ID, string Name, string Code, string BounsTypeID, string Value, string CurrencyID, string RVType, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BounsAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@Name", Name);
            DA.SelectCommand.Parameters.AddWithValue("@Code", Code);
            DA.SelectCommand.Parameters.AddWithValue("@BounsTypeID", BounsTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@RVType", RVType);
            DA.SelectCommand.Parameters.AddWithValue("@Value", Value);
            DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", CurrencyID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable BounsValueAdd(string ID, string BounsID, string Value, string CurrencyID, string RVType, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BounsValueAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@BounsID", BounsID);
            DA.SelectCommand.Parameters.AddWithValue("@RVType", RVType);
            DA.SelectCommand.Parameters.AddWithValue("@Value", Value);
            DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", CurrencyID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmployeeBounsAdd(string BounsID, string EmployeeID, string InsertEmployeeID, Boolean IsActive)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeBounsAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@BounsID", BounsID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertEmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable ExceptionEmployeeDegreeBounsAdd(string Value, string CurrencyID, string RVTypeID, string EmployeeID, string InsertEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExceptionEmployeeDegreeBounsAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@Value", Value);
            DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", CurrencyID);
            DA.SelectCommand.Parameters.AddWithValue("@RVTypeID", RVTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable ExceptionEmployeeDegreeBounsDelete(string EmployeeID, string DeleteEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExceptionEmployeeDegreeBounsDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@DeleteEmployeeID", DeleteEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmployeeBounsValueAdd(string EmployeeBounsID, string Value, string CurrencyID, string RVType, string EmployeeID, Boolean IsActive)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeBounsValueAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeBounsID", EmployeeBounsID);
            DA.SelectCommand.Parameters.AddWithValue("@Value", Value);
            DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", CurrencyID);
            DA.SelectCommand.Parameters.AddWithValue("@RVType", RVType);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmployeeBounsActive(string EmployeeBounsID, Boolean IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeBounsActive", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeBounsID", EmployeeBounsID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@ActivateEmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmployeeBounsDelete(string EmployeeBounsID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeBounsDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeBounsID", EmployeeBounsID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable BounsGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BounsGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable BounsDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BounsDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable DegreeBounsAdd(string ID, string DegreeID, string Value, string RVType, string CurrencyID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DegreeBounsAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@DegreeID", DegreeID);
            DA.SelectCommand.Parameters.AddWithValue("@Value", Value);
            DA.SelectCommand.Parameters.AddWithValue("@RVType", RVType);
            DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", CurrencyID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    #endregion

    #region LoadHoursContract
    public static DataTable LoadHoursContractAddEdit(string ID, string ContractTypeID, string SubContractTypeID, string EmployeeID, string SemesterID, string JobTitleID, string DepartmentID,
        string ActualHours, string HourPrice, string CurrencyID, string ContractDate, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("LoadHoursContractAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@ContractTypeID", ContractTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@SubContractTypeID", SubContractTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@JobTitleID", JobTitleID);
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@ActualHours", ActualHours);
            DA.SelectCommand.Parameters.AddWithValue("@HourPrice", HourPrice);
            DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", CurrencyID);
            DA.SelectCommand.Parameters.AddWithValue("@ContractDate", ContractDate);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable ExcelLoadHourContractGetAll(string SemesterID, string EmployeeID, string ContractTypeID, string DepartmentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExcelLoadHourContractGetAll", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@ContractTypeID", ContractTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }

    }
    public static DataTable AddSemesterLoadHourContract(string SemesterID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddSemesterLoadHourContract", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }

    }
    public static int LoadHoursContractDelete(string ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("LoadHoursContractDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }

    }
    public static DataTable LoadHoursContractGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("LoadHoursContractGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    //LoadHoursContractReportGet
    public static DataTable LoadHoursContractReportGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("LoadHoursContractReportGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable LoadHoursGet(string EmployeeID, string SemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("LoadHoursGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    #endregion 
    public static DataTable IsDirectManager(string ManagerID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsDirectManager", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ManagerID", ManagerID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetEmployeeWithoutActiveContract()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeWithoutActiveContract", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetEmployeesInfo(string EmployeeNo, string ArFirstName, string ArSecoundName, string ArFamilyName, string Department,
     string CaderID, string GradeID, string DegreeID, string JobTitle, string EmployeeTypeID, string EmployeeSubTypeID, string EmpCategoryID, string Contract_Type_ID, string SubContractTypeID, string EmpStatusID, string EmpSubStatusID, string AcademicData, string RetirementStatusID, DataTable EmployeeList, string Type1, string Type2, string Type3, string Type4, string EmployeeCatID, string CurrencyID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeesInfo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeNo", EmployeeNo);
            DA.SelectCommand.Parameters.AddWithValue("@ArFirstName", ArFirstName);
            DA.SelectCommand.Parameters.AddWithValue("@ArSecoundName", ArSecoundName);
            DA.SelectCommand.Parameters.AddWithValue("@ArFamilyName", ArFamilyName);
            DA.SelectCommand.Parameters.AddWithValue("@Department", Department);
            DA.SelectCommand.Parameters.AddWithValue("@CaderID", CaderID);
            DA.SelectCommand.Parameters.AddWithValue("@GradeID", GradeID);
            DA.SelectCommand.Parameters.AddWithValue("@DegreeID", DegreeID);
            DA.SelectCommand.Parameters.AddWithValue("@JobTitle", JobTitle);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeTypeID", EmployeeTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeSubTypeID", EmployeeSubTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpCategoryID", EmpCategoryID);
            DA.SelectCommand.Parameters.AddWithValue("@Contract_Type_ID", Contract_Type_ID);
            DA.SelectCommand.Parameters.AddWithValue("@SubContractTypeID", SubContractTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpStatusID", EmpStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpSubStatusID", EmpSubStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@AcademicData", AcademicData);
            DA.SelectCommand.Parameters.AddWithValue("@RetirementStatusID", RetirementStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeList", EmployeeList);
            DA.SelectCommand.Parameters.AddWithValue("@Type1", Type1);
            DA.SelectCommand.Parameters.AddWithValue("@Type2", Type2);
            DA.SelectCommand.Parameters.AddWithValue("@Type3", Type3);
            DA.SelectCommand.Parameters.AddWithValue("@Type4", Type4);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeCatID", EmployeeCatID);
            DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", CurrencyID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    #region EmployeeTypeCategory
    public static DataTable EmployeeTypeCategoryAdd(string EmployeeID, string TypeCategoryID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeTypeCategoryAdd", conn);

            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@TypeCategoryID", TypeCategoryID);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetEmployeeTypeCategories(string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeTypeCategories", conn);

            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion
    public static DataTable TerminateEmployeeServicesAdd(string EmployeeID, string TerminateDate, string CTerminateReasonID1, string CTerminateReasonID, string InsertEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("TerminateEmployeeServicesAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@TerminateDate", TerminateDate);
            DA.SelectCommand.Parameters.AddWithValue("@CTerminateReasonID1", CTerminateReasonID1);
            DA.SelectCommand.Parameters.AddWithValue("@CTerminateReasonID", CTerminateReasonID);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable LateEmployeesGet(string startDate, string EndDate, string EmpCategoryID, string EmpStatus, string EmpSubStatusID, string ContractTypeID, string SubContractTypeID, string LateType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("LateEmployeesGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@startDate", startDate);
            DA.SelectCommand.Parameters.AddWithValue("@EndDate", EndDate);
            DA.SelectCommand.Parameters.AddWithValue("@EmpCategoryID", EmpCategoryID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpStatusID", EmpStatus);
            DA.SelectCommand.Parameters.AddWithValue("@EmpSubStatusID", EmpSubStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@ContractTypeID", ContractTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@SubContractTypeID", SubContractTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@LateType", LateType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable AbsentEmployeesGet(string startDate, string EndDate, string EmpCategoryID, string EmpCategoryID2, string EmpStatus, string CTermenateReasonID, string ContractTypeID, string SubContractTypeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AbsentEmployeesGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@startDate", startDate);
            DA.SelectCommand.Parameters.AddWithValue("@EndDate", EndDate);
            DA.SelectCommand.Parameters.AddWithValue("@EmpCategoryID", EmpCategoryID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpCategoryID2", EmpCategoryID2);
            DA.SelectCommand.Parameters.AddWithValue("@EmpStatusID", EmpStatus);
            DA.SelectCommand.Parameters.AddWithValue("@CTermenateReasonID", CTermenateReasonID);
            DA.SelectCommand.Parameters.AddWithValue("@ContractTypeID", ContractTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@SubContractTypeID", SubContractTypeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetObservers()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetObservers", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #region Salary
    public static DataTable SalaryDetailsAdd(string EmployeeID, string SalarySourceTypeID, string SalaryValue, string CurrencyID, string InsertEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SalaryDetailsAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SalarySourceTypeID", SalarySourceTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@SalaryValue", SalaryValue);
            DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", CurrencyID);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SalaryDetailsDeactivate(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SalaryDetailsDeactivate", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SalaryDeductionAddEdit(string ID, string EmployeeID, string month, string year, string DeductionTypeID, string DeductionValue, string CurrencyID, string Details, string InsertEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SalaryDeductionAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DA.SelectCommand.Parameters.AddWithValue("@DeductionTypeID", DeductionTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@DeductionValue", DeductionValue);
            DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", CurrencyID);
            DA.SelectCommand.Parameters.AddWithValue("@Details", Details);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SalaryDeductionDelete(string ID, string DeleteEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SalaryDeductionDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@DeleteEmployeeID", DeleteEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SalaryDeductionGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SalaryDeductionGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable CalculatedSalaryAddEdit(string month, string year, string EmployeeID, string InsertEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CalculatedSalaryAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable ReCalculatedSalary(string month, string year, string UpdateEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ReCalculatedSalary", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DA.SelectCommand.Parameters.AddWithValue("@UpdateEmployeeID", UpdateEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable ReEmployeeCalculatedSalary(string month, string year, string EmployeeID, string UpdateEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ReEmployeeCalculatedSalary", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@UpdateEmployeeID", UpdateEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable CancelCalculateSalary(string EmployeeID, string month, string year, string DeleteEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CancelCalculateSalary", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DA.SelectCommand.Parameters.AddWithValue("@DeleteEmployeeID", DeleteEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetEmployessBankSalaryWithCurrency(string month, string year, string CurrencyID, string CBankID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployessBankSalaryWithCurrency", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", CurrencyID);
            DA.SelectCommand.Parameters.AddWithValue("@CBankID", CBankID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetExcelEmployessBankSalaryWithCurrency(string month, string year, string CurrencyID, string CBankID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetExcelEmployessBankSalaryWithCurrency", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DA.SelectCommand.Parameters.AddWithValue("@CurrencyID", CurrencyID);
            DA.SelectCommand.Parameters.AddWithValue("@CBankID", CBankID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetTotalEmployeesSalary(string month, string year, string CBankID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetTotalEmployeesSalary", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DA.SelectCommand.Parameters.AddWithValue("@CBankID", CBankID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    //GetEmployeeUnivSalary
    public static DataTable GetEmployeeUnivSalary(string month, string year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeUnivSalary", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    // GetSalayVolunteerMotivation
    public static DataTable GetSalayVolunteerMotivation(string month, string year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSalayVolunteerMotivation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    // TotalSalariesStatistics
    public static DataTable GetTotalSalariesStatistics(string month, string year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetTotalSalariesStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetTotalBankSalaryStatistics(string month, string year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetTotalBankSalaryStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetTotalUnivSalaryStatistics(string month, string year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetTotalUnivSalaryStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion
    public static DataTable EmployeeDefualtAttendanceAdd(string EmployeeID, string DefualtAttendanceID, string DefualtAttendanceTypeID, string InsertEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeDefualtAttendanceAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@DefualtAttendanceID", DefualtAttendanceID);
            DA.SelectCommand.Parameters.AddWithValue("@DefualtAttendanceTypeID", DefualtAttendanceTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmployeeDefualtAttendanceGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeDefualtAttendanceGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmployeeNumberAdd(string EmployeeID, string EmployeeNo, string InsertEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeNumberAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeNo", EmployeeNo);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #region CaderSalary
    public static DataTable EmployeeSalaryAdd(string month, string year, string EmployeeID, string InsertEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeSalaryAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmployeeSalaryUpdate(string month, string year, string EmployeeID, string UpdateEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeSalaryUpdate", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@UpdateEmployeeID", UpdateEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmployeeTaxValueAddEdit(string ID, string month, string year, string EmployeeID, string TaxValue, string InsertEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeTaxValueAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@TaxValue", TaxValue);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetExcelEmployeeSalary(string month, string year, string EmployeeID, string CBankID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetExcelEmployeeSalary", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@CBankID", CBankID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    //GetCalculatedEmployeeSalary
    public static DataTable GetCalculatedEmployeeSalary(string month, string year, string CBankID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetCalculatedEmployeeSalary", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DA.SelectCommand.Parameters.AddWithValue("@CBankID", CBankID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    //GetExcelCalculatedEmployeeSalary
    public static DataTable GetExcelCalculatedEmployeeSalary(string month, string year, string CBankID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetExcelCalculatedEmployeeSalary", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DA.SelectCommand.Parameters.AddWithValue("@CBankID", CBankID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    //GetEmployeeSalaryForm1
    public static DataTable GetEmployeeSalaryForm1(string EmployeeID, string month, string year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeSalaryForm1", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetTotalCaderEmployeeSalaryReport(string month, string year, string CBankID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetTotalCaderEmployeeSalaryReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);
            DA.SelectCommand.Parameters.AddWithValue("@CBankID", CBankID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetEmployeeSalary(string month, string year)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeSalary", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@month", month);
            DA.SelectCommand.Parameters.AddWithValue("@year", year);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    #endregion
    public static DataTable LectureIrregularAddEdit(string SectionID, string LectureDate, string LectureTimeFrom, string LectureTimeTo, string EmployeeID)
    {
        using (SqlConnection Connection = GetConnection4())
        {
            SqlDataAdapter Da = new SqlDataAdapter("LectureIrregularAddEdit", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            Da.SelectCommand.Parameters.AddWithValue("@LectureDate", LectureDate);
            Da.SelectCommand.Parameters.AddWithValue("@LectureTimeFrom", LectureTimeFrom);
            Da.SelectCommand.Parameters.AddWithValue("@LectureTimeTo", LectureTimeTo);
            Da.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }
    public static DataTable LectureIrregularAccreditation(string ID, string AccreditationType, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlDataAdapter DA = new SqlDataAdapter("LectureIrregularAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetEmployeeStatisticsData()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeStatisticsData", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetEmployeeTotalStatisticsData()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeTotalStatisticsData", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    //GetDepartments
    public static DataTable DepartmentGet(int ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DepartmentGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetDepartmentChildren(int ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetDepartmentChildren", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable ChangeEmployeeTypes(string EmployeeID, string EmpTypeID, string EmpSubTypeID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ChangeEmployeeTypes", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpTypeID", EmpTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpSubTypeID", EmpSubTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable ChangeEmployeeStatus(string EmployeeID, string EmpStatusID, string EmpCategoryID2, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ChangeEmployeeStatus", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpStatusID", EmpStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpCategoryID2", EmpCategoryID2);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SemesterGet(string ID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SemesterGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #region Punishment
    public static DataTable EmployeePunishmentAddEdit(string ID, string EmployeeID, string PunishmentID, string Details, string PunishmentDecisionFile, string PunishmentStartDate, string PunishmentFinishDate, string InsertEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeePunishmentAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@PunishmentID", PunishmentID);
            DA.SelectCommand.Parameters.AddWithValue("@Details", Details);
            DA.SelectCommand.Parameters.AddWithValue("@PunishmentDecisionFile", PunishmentDecisionFile);
            DA.SelectCommand.Parameters.AddWithValue("@PunishmentStartDate", PunishmentStartDate);
            if (PunishmentFinishDate != "")
                DA.SelectCommand.Parameters.AddWithValue("@PunishmentFinishDate", PunishmentFinishDate);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    #endregion
    #region Vacation
    public static DataTable EmployeeVacationAddEdit(string ID, string EmployeeID, string VacationTypeID, string VacationStartDate, string VacationEndDate, string VacationReason,
        string VacationPlaceID, string UserID)

    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeVacationAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@VacationTypeID ", VacationTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@VacationStartDate", VacationStartDate);
            DA.SelectCommand.Parameters.AddWithValue("@VacationEndDate", VacationEndDate);
            DA.SelectCommand.Parameters.AddWithValue("@VacationReason", VacationReason);
            DA.SelectCommand.Parameters.AddWithValue("@VacationPlaceID", VacationPlaceID);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable EmployeeVacationGet(string ID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeVacationGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable EmployeeVacationDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeVacationDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable EmployeeVacationAccreditation (string ID, int AccreditationStatusID,int AccreditationType)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeVacationAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationStatusID", AccreditationStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", "");
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable EmployeeVacationAccreditation(string ID, Boolean Accreditation, string ReplaceEmployeID, string AccreditationType, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeVacationAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@Accreditation", Accreditation);
            DA.SelectCommand.Parameters.AddWithValue("@ReplaceEmployeID", ReplaceEmployeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType ", AccreditationType);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetEmployeeVacationDay(string VacationStartDate, string VacationEndDate, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeVacationDay", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@VacationStartDate", VacationStartDate);
            DA.SelectCommand.Parameters.AddWithValue("@VacationEndDate", VacationEndDate);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    #endregion

    public static DataTable hrManualFingerprintAdd(string EmployeeID, string FingerprintTypeID, DateTime FingerprintDate,string BranchID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("hrManualFingerprintAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@FingerprintTypeID", FingerprintTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@FingerprintDate", FingerprintDate);
            DA.SelectCommand.Parameters.AddWithValue("@BranchID", BranchID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


}

