using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Text;
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

    private static SqlConnection GetConnection4()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaStudentAttendance"].ToString());
        conn.Open();
        return conn;
    }

    private static SqlConnection GetConnection5()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaStudentIssue"].ToString());
        conn.Open();
        return conn;
    }
    private static SqlConnection GetConnection7()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["israhaneen"].ToString());
        conn.Open();
        return conn;
    }

    private static SqlConnection GetConnection8()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaHumanResource"].ToString());
        conn.Open();
        return conn;
    }

    // ReportData
    public static DataTable GetReportData(string ProgramID, string CollegeID, string DepartmentID, string CourseID,
          string SemesterID, string StudentTypeID, string StudentStatusID, string Gender, string TawjehyGPAFrom,
          string TawjehyGPATo, string IsPaid, string AppAccreditation, string Accreditation, string FirstRegisterSemesterID,
          string TawjehyTypeID, string FirstWishID, string PlaceOfStudyID, string SemesterGPA, string GraduationStatusID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetReportData1", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.CommandTimeout = 150;
            DA.SelectCommand.Parameters.AddWithValue("@ProgramID", ProgramID);
            DA.SelectCommand.Parameters.AddWithValue("@CollegeID", CollegeID);
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentTypeID", StudentTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentStatusID", StudentStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@Gender", Gender);
            if (SemesterGPA != "")
                DA.SelectCommand.Parameters.AddWithValue("@SemesterGPA", SemesterGPA);
            if (TawjehyGPAFrom != "")
                DA.SelectCommand.Parameters.AddWithValue("@TawjehyGPAFrom", TawjehyGPAFrom);
            if (TawjehyGPATo != "")
                DA.SelectCommand.Parameters.AddWithValue("@TawjehyGPATo", TawjehyGPATo);
            DA.SelectCommand.Parameters.AddWithValue("@IsPaid", IsPaid);
            DA.SelectCommand.Parameters.AddWithValue("@AppAccreditation", AppAccreditation);
            DA.SelectCommand.Parameters.AddWithValue("@Accreditation", Accreditation);
            DA.SelectCommand.Parameters.AddWithValue("@FirstRegisterSemesterID", FirstRegisterSemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@TawjehyTypeID", TawjehyTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@FirstWishID", FirstWishID);
            DA.SelectCommand.Parameters.AddWithValue("@PlaceOfStudyID", PlaceOfStudyID);
            DA.SelectCommand.Parameters.AddWithValue("@GraduationStatusID", GraduationStatusID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable UpdateOfferdCourseMidtermExamDetails(string iD, bool isMidtermExam, bool isMidtermEExam, string midtermExamDate, string midtermExamTimeFrom1, string midtermExamTimeTo1, string employeeID)
    {
        throw new NotImplementedException();
    }

    //end
    public static DataTable GetAllData()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetAllData", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ForStudentCardDeleteAll()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ForStudentCardDeleteAll", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GenerateStudentFileNumber(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GenerateStudentFileNumber", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ForStudentCardAdd(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ForStudentCardAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentCardDelete(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentCardDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static int StudentImageAddEdit(string StudentID, byte[] StudentImage)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("StudentImageAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (StudentID != "")
                cmd.Parameters.AddWithValue("@StudentID", StudentID);
            cmd.Parameters.AddWithValue("@StudentImage", StudentImage);

            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable GetSectionStudents(string SectionID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSectionStudents", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetSectionStatistics(string SectionID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSectionStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GETGET(string columns)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GETGET", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@columns", columns);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetPlanSemester11Report(string PlanID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetPlanSemester11Report", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@PlanID", PlanID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetPlanSemester12Report(string PlanID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetPlanSemester12Report", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@PlanID", PlanID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetPlanSemester21Report(string PlanID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetPlanSemester21Report", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@PlanID", PlanID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetPlanSemester22Report(string PlanID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetPlanSemester22Report", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@PlanID", PlanID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetPlanSemester31Report(string PlanID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetPlanSemester31Report", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@PlanID", PlanID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetPlanSemester32Report(string PlanID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetPlanSemester32Report", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@PlanID", PlanID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetPlanSemester41Report(string PlanID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetPlanSemester41Report", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@PlanID", PlanID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetPlanSemester42Report(string PlanID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetPlanSemester42Report", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@PlanID", PlanID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetPlanSemester51Report(string PlanID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetPlanSemester51Report", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@PlanID", PlanID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetPlanSemester52Report(string PlanID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetPlanSemester52Report", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@PlanID", PlanID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetCourseReport(string CourseID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetCourseReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetPreRequestReport(string CourseID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetPreRequestReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetPlansAndDepartments()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetPlansAndDepartments", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetStdPayFullReport()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdPayFullReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static int StudentDepDataAddEdit(string StudentID, string DepartID1, string DepartID2, string DepartID3)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("StudentDepDataAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StudentID", StudentID);
            cmd.Parameters.AddWithValue("@DepartID1", DepartID1);
            cmd.Parameters.AddWithValue("@DepartID2", DepartID2);
            cmd.Parameters.AddWithValue("@DepartID3", DepartID3);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int StudentTawjehyDataAddEdit(string StudentID, string OldUniversity, string OldDepartment, string OldUniversityHours, string OldUniversityGPA, string ShamelRate, string ExpertYears)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("StudentTawjehyDataAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StudentID", StudentID);
            cmd.Parameters.AddWithValue("@OldUniversity", OldUniversity);
            cmd.Parameters.AddWithValue("@OldDepartment", OldDepartment);
            cmd.Parameters.AddWithValue("@OldUniversityHours", OldUniversityHours);
            cmd.Parameters.AddWithValue("@OldUniversityGPA", OldUniversityGPA);
            if (ShamelRate != "")
                cmd.Parameters.AddWithValue("@ShamelRate", ShamelRate);
            if (ExpertYears != "")
                cmd.Parameters.AddWithValue("@ExpertYears", ExpertYears);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable StudentTawjehyDataGet(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
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
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentDepDataGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #region Semester

    public static DataTable SemesterGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SemesterGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int SemesterActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("SemesterActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable SemesterAddEdit(
        string ID, string Code, string ArName, string EnName, int ProgramID, DateTime StudentRegisterBeginning, DateTime StudentRegisterEnd, DateTime SemesterRegisterBeginning, DateTime SemesterRegisterEnd,
        DateTime StudyBeginning, DateTime StudyEnd, DateTime AddBeginning, DateTime AddEnd, DateTime DelayEnd, DateTime withdrawEnd,
        DateTime StartMidtermExams, DateTime EndMidtermExams, DateTime MidtermExamResults, DateTime MidtermExamRevisionBeginning, DateTime MidtermExamRevisionEnd,
        DateTime StartFinalExams, DateTime EndFinalExams, DateTime MarkResults, DateTime MarkRevisionBeginning, DateTime MarkRevisionEnd,
        DateTime DeadlinePayment, bool IsActive, string EmployeeID)
    {

        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SemesterAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@Code", Code);
            DA.SelectCommand.Parameters.AddWithValue("@ArName", ArName);
            DA.SelectCommand.Parameters.AddWithValue("@EnName", EnName);
            DA.SelectCommand.Parameters.AddWithValue("@ProgramID", ProgramID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentRegisterBeginning", StudentRegisterBeginning);
            DA.SelectCommand.Parameters.AddWithValue("@StudentRegisterEnd", StudentRegisterEnd);
            DA.SelectCommand.Parameters.AddWithValue("@RegisterBeginning", SemesterRegisterBeginning);
            DA.SelectCommand.Parameters.AddWithValue("@RegisterEnd", SemesterRegisterEnd);
            DA.SelectCommand.Parameters.AddWithValue("@StudyBeginning", StudyBeginning);
            DA.SelectCommand.Parameters.AddWithValue("@StudyEnd", StudyEnd);
            DA.SelectCommand.Parameters.AddWithValue("@AddBeginning", AddBeginning);
            DA.SelectCommand.Parameters.AddWithValue("@AddEnd", AddEnd);
            DA.SelectCommand.Parameters.AddWithValue("@DelayEnd", DelayEnd);
            DA.SelectCommand.Parameters.AddWithValue("@withdrawEnd", withdrawEnd);
            DA.SelectCommand.Parameters.AddWithValue("@StartMidtermExams", StartMidtermExams);
            DA.SelectCommand.Parameters.AddWithValue("@EndMidtermExams", EndMidtermExams);
            DA.SelectCommand.Parameters.AddWithValue("@MidtermExamResults", MidtermExamResults);
            DA.SelectCommand.Parameters.AddWithValue("@MidtermExamRevisionBeginning", MidtermExamRevisionBeginning);
            DA.SelectCommand.Parameters.AddWithValue("@MidtermExamRevisionEnd", MidtermExamRevisionEnd);
            DA.SelectCommand.Parameters.AddWithValue("@StartFinalExams", StartFinalExams);
            DA.SelectCommand.Parameters.AddWithValue("@EndFinalExams", EndFinalExams);
            DA.SelectCommand.Parameters.AddWithValue("@MarkResults", MarkResults);
            DA.SelectCommand.Parameters.AddWithValue("@MarkRevisionBeginning", MarkRevisionBeginning);
            DA.SelectCommand.Parameters.AddWithValue("@MarkRevisionEnd", MarkRevisionEnd);
            DA.SelectCommand.Parameters.AddWithValue("@DeadlinePayment", DeadlinePayment);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int SemesterDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("SemesterDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

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

    public static DataTable GetStdMobiles(string ProgramID, string CollegeID, string DepartmentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdMobiles", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ProgramID", ProgramID);
            if (CollegeID != "")
                DA.SelectCommand.Parameters.AddWithValue("@CollegeID", CollegeID);
            if (DepartmentID != "")
                DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetSectionStudentsMobiles(string SectionID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSectionStudentsMobiles", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStudentWirelessData()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentWirelessData", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int StdResetPassword(string StudentID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlCommand cmd = new SqlCommand("StdResetPassword", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StudentID", StudentID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable GetStudentMobile(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentMobile", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetEmailStudent(string StudentID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmailStudent", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #region Advertisement

    public static DataTable AdvertisementGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AdvertisementGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int AdvertisementActivate(string ID, bool IsActive, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("AdvertisementActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int AdvertisementAddEdit(string ID, string Title, string CollageID, string DepartmentID, string StudentType,
        string Details, string CatID, bool IsActive, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("AdvertisementAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@Title", Title);
            cmd.Parameters.AddWithValue("@CollageID", CollageID);
            cmd.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            cmd.Parameters.AddWithValue("@StudentType", StudentType);
            cmd.Parameters.AddWithValue("@Details", Details);
            cmd.Parameters.AddWithValue("@CatID", CatID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int AdvertisementDelete(string ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("AdvertisementDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

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

    public static DataTable EmpChangePassword(string EmployeeID, string OldPassword, string NewPassword)
    {
        using (SqlConnection conn = GetConnection2())
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

    #region AccreditStudent
    public static DataTable AccreditStudent(string StudentID, string DepartmentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AccreditStudent", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable AdmissionAccreditStudent(string StudentID, string DepartmentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AdmissionAccreditStudent", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@AdmissionDepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AccreditTransferStudent(string StudentID, string DepartmentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AccreditTransferStudent", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AccreditProgramStudent(string StudentID, string ProgramID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AccreditProgramStudent", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@ProgramID", ProgramID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable DelaySemester(string StdSemesterID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DelaySemester", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSemesterID", StdSemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region Student
    public static int stdCardRecivedEdit(string ID, bool StdCardRecieved)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlCommand cmd = new SqlCommand("stdCardRecivedEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@StdCardRecieved", StdCardRecieved);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int stdBagRecivedEdit(string ID, bool StdBagRecieved)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlCommand cmd = new SqlCommand("stdBagRecivedEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@StdBagRecieved", StdBagRecieved);
            return cmd.ExecuteNonQuery();
        }
    }


    public static DataTable GetStudentBalance(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentBalance", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    
        public static DataTable GetStudentLoans(string ID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentLoans", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



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

    public static DataTable GetFCStudentData(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetFCStudentData", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable MarkRevision(string StdSectionID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("MarkRevision", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetStdSemesterWithoutTrans(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdSemesterWithoutTrans", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentWishesGet(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentWishesGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    //public static int StudentDepDataAddEdit(string StudentID, string DepartID1, string DepartID2, string DepartID3)
    //{
    //    using (SqlConnection conn = GetConnection())
    //    {
    //        SqlCommand cmd = new SqlCommand("StudentDepDataAddEdit", conn);
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        if (StudentID != "")
    //            cmd.Parameters.AddWithValue("@StudentID", StudentID);
    //        cmd.Parameters.AddWithValue("@DepartID1", DepartID1);
    //        cmd.Parameters.AddWithValue("@DepartID2", DepartID2);
    //        cmd.Parameters.AddWithValue("@DepartID3", DepartID3);

    //        return cmd.ExecuteNonQuery();
    //    }
    //}
    public static DataTable StudentMainDataGet(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentMainDataGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentOtherDataGet(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentOtherDataGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int StudentMainDataAddEdit(string StudentID, string ArFirstName, string ArSecoundName, string ArThirdName, string ArFamilyName, string EnFirstName, string EnSecoundName, string EnThirdName, string EnFamilyName,
        string SSN, string Passport, string PlaceOfBirth, DateTime DateOfBirth, string CNationalityID, string CReligionID, string MotherName, string FatherSSN, string CStatusID, string NextSSN, string Gender,
        string CHealthStatusID, string DiseaseType, bool Disability, string DisabilityStatus)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("StudentMainDataAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (StudentID != "")
                cmd.Parameters.AddWithValue("@StudentID", StudentID);

            cmd.Parameters.AddWithValue("@ArFirstName", ArFirstName);
            cmd.Parameters.AddWithValue("@ArSecoundName", ArSecoundName);
            cmd.Parameters.AddWithValue("@ArThirdName", ArThirdName);
            cmd.Parameters.AddWithValue("@ArFamilyName", ArFamilyName);

            cmd.Parameters.AddWithValue("@EnFirstName", EnFirstName);
            cmd.Parameters.AddWithValue("@EnSecoundName", EnSecoundName);
            cmd.Parameters.AddWithValue("@EnThirdName", EnThirdName);
            cmd.Parameters.AddWithValue("@EnFamilyName", EnFamilyName);

            if (SSN != "")
                cmd.Parameters.AddWithValue("@SSN", SSN);
            if (Passport != "")
                cmd.Parameters.AddWithValue("@Passport", Passport);
            cmd.Parameters.AddWithValue("@PlaceOfBirth", PlaceOfBirth);
            cmd.Parameters.AddWithValue("@DateOfBirth", DateOfBirth);
            cmd.Parameters.AddWithValue("@CNationalityID", CNationalityID);
            cmd.Parameters.AddWithValue("@CReligionID", CReligionID);
            cmd.Parameters.AddWithValue("@MotherName", MotherName);
            cmd.Parameters.AddWithValue("@FatherSSN", FatherSSN);
            cmd.Parameters.AddWithValue("@CStatusID", CStatusID);
            if (CStatusID == "10")
                cmd.Parameters.AddWithValue("@NextSSN", NextSSN);
            cmd.Parameters.AddWithValue("@Gender", Gender);

            cmd.Parameters.AddWithValue("@CHealthStatusID", CHealthStatusID);
            if (CHealthStatusID == "60")
                cmd.Parameters.AddWithValue("@DiseaseType", DiseaseType);

            cmd.Parameters.AddWithValue("@Disability", Disability);
            if (DisabilityStatus != "")
                cmd.Parameters.AddWithValue("@DisabilityStatus", DisabilityStatus);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int CompleteStudentData(string StudentID, string houseTypeId, bool isDeadFather, string StdCitizenOrRef, string StdOriginalTown,
       bool HaveOtherNationality, string OtherNationalityName, string FamilyNo, string univStdsNo, string FamilySerialNo, string FIncome,
       string FurStatusId, bool HavePrisoner, string PrisonerName, bool HaveMartyr, string MartyrName)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("CompleteStudentData", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StudentID", StudentID);
            cmd.Parameters.AddWithValue("@HouseTypeId", houseTypeId);
            cmd.Parameters.AddWithValue("@isDeadFather", isDeadFather);
            cmd.Parameters.AddWithValue("@StdCitizenOrRefId", StdCitizenOrRef);
            cmd.Parameters.AddWithValue("@StdOriginalTown", StdOriginalTown);
            cmd.Parameters.AddWithValue("@HaveOtherNationality", HaveOtherNationality);
            cmd.Parameters.AddWithValue("@OtherNationalityName", OtherNationalityName);
            cmd.Parameters.AddWithValue("@FamilyNo", FamilyNo);
            cmd.Parameters.AddWithValue("@univStdsNo", univStdsNo);
            cmd.Parameters.AddWithValue("@FamilySerialNo", FamilySerialNo);
            cmd.Parameters.AddWithValue("@FIncome", FIncome);
            cmd.Parameters.AddWithValue("@FurStatusId", FurStatusId);
            cmd.Parameters.AddWithValue("@HavePrisoner", HavePrisoner);
            cmd.Parameters.AddWithValue("@PrisonerName", PrisonerName);
            cmd.Parameters.AddWithValue("@HaveMartyr", HaveMartyr);
            cmd.Parameters.AddWithValue("@MartyrName", MartyrName);

            return cmd.ExecuteNonQuery();
        }
    }


    public static DataTable StudentSuperiorDataGet(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentSuperiorDataGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int StudentSuperiorDataAddEdit(string StudentID, string SuperiorSSN, string CSuperiorLink, string SuperiorLink,
        string SuperiorName, string SuperiorAddress, string CSuperiorJopID, string SuperiorJop, string SuperiorPlaceJop, string SuperiorMobile, string SuperiorPhone)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("StudentSuperiorDataAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (StudentID != "")
                cmd.Parameters.AddWithValue("@StudentID", StudentID);
            cmd.Parameters.AddWithValue("@SuperiorSSN", SuperiorSSN);
            cmd.Parameters.AddWithValue("@CSuperiorLink", CSuperiorLink);
            cmd.Parameters.AddWithValue("@SuperiorLink", SuperiorLink);
            cmd.Parameters.AddWithValue("@SuperiorName", SuperiorName);
            cmd.Parameters.AddWithValue("@SuperiorAddress", SuperiorAddress);
            cmd.Parameters.AddWithValue("@CSuperiorJopID", CSuperiorJopID);
            cmd.Parameters.AddWithValue("@SuperiorJop", SuperiorJop);
            cmd.Parameters.AddWithValue("@SuperiorPlaceJop", SuperiorPlaceJop);
            cmd.Parameters.AddWithValue("@SuperiorMobile", SuperiorMobile);
            cmd.Parameters.AddWithValue("@SuperiorPhone", SuperiorPhone);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable StudentContactDataGet(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentContactDataGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int StudentContactDataAddEdit(string StudentID, string CountryID, string GovernoratesID, string CityID, string Neighborhood, string Street, string HomeNo, string AddressDetails, string Phone, string Mobile, string Email)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("StudentContactDataAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (StudentID != "")
                cmd.Parameters.AddWithValue("@StudentID", StudentID);
            cmd.Parameters.AddWithValue("@CountryID", CountryID);
            cmd.Parameters.AddWithValue("@GovernoratesID", GovernoratesID);
            cmd.Parameters.AddWithValue("@CityID", CityID);
            cmd.Parameters.AddWithValue("@Neighborhood", Neighborhood);
            cmd.Parameters.AddWithValue("@Street", Street);
            cmd.Parameters.AddWithValue("@HomeNo", HomeNo);
            cmd.Parameters.AddWithValue("@AddressDetails", AddressDetails);
            cmd.Parameters.AddWithValue("@Phone", Phone);
            cmd.Parameters.AddWithValue("@Mobile", Mobile);
            cmd.Parameters.AddWithValue("@Email", Email);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region CoursesRegistration

    public static DataTable RegisterCourse(string StudentID, string SemesterID, string SectionID, string REmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("RegisterCourse", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@REmployeeID", REmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable RegisterCourse2(string StudentID, string SemesterID, string SectionID, string SectionID2, string SectionID3, string RStudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("RegisterCourse2", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            if (SectionID2 != "")
                DA.SelectCommand.Parameters.AddWithValue("@SectionID2", SectionID2);
            if (SectionID3 != "")
                DA.SelectCommand.Parameters.AddWithValue("@SectionID3", SectionID3);
            DA.SelectCommand.Parameters.AddWithValue("@RStudentID", RStudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion
    public static DataTable GetStdOfferdCourse(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdOfferdCourse", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetCountOfRegisterHours(string StudentID, string SemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetCountOfRegisterHours", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static bool IsAvailableRegistration(string SemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsAvailableRegistration", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT.Rows.Count > 0;
        }
    }
    public static DataTable GetStdStudyTable(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdStudyTable", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdPlanReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdPlanReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetStdStudyTableReport(string StudentID, bool IsAddCopyNo)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdStudyTableReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@IsAddCopyNo", IsAddCopyNo);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStudentCard(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentCard", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStudentsCards(string CardType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentsCards", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@CardType", CardType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetBlockStudyTableReport(string BlockID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetBlockStudyTableReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@BlockID", BlockID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetBlockStudyTableInfoReport(string BlockID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetBlockStudyTableInfoReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@BlockID", BlockID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetSemesterCoursesSections(string DepartmentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSemesterCoursesSections", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetSemesterCoursesSectionsInfo(string DepartmentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSemesterCoursesSectionsInfo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetAvailableDepartmentCount()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetAvailableDepartmentCount", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetDepartmentWishesCount()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetDepartmentWishesCount", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetUnacceptedStudents()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetUnacceptedStudents", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetAllPlanReport()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetAllPlanReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetAccrediteETransformation(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetAccrediteETransformation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetUnaccrediteETransformation(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetUnaccrediteETransformation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdTransformationCourses(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdTransformationCourses", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetacceptedStudents()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetacceptedStudents", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetUNRWAModelReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetUNRWAModelReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetStdAdmissionAppDataReport(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdAdmissionAppDataReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdFinancialBenefit1(string StudentID, string SumOfHours)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdFinancialBenefit1", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SumOfHours", SumOfHours);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdFinancialBenefit2(string StudentID, string SumOfHours)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdFinancialBenefit2", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SumOfHours", SumOfHours);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdFinancialBenefit3(string StudentID, string SumOfHours, string TotalCost)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdFinancialBenefit3", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SumOfHours", SumOfHours);
            DA.SelectCommand.Parameters.AddWithValue("@TotalCost", TotalCost);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdFinancialBenefit4(string StudentID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdFinancialBenefit4", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetModelReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetModelReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
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

    public static DataTable GetStdSemesterMarksInfo(string StudentID)
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

    public static DataTable GetStdTranscriptReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdTranscriptReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdSemesterMarksReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdSemesterMarksReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
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

    public static DataTable GetStdSemester(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdSemester", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdProgramSemester(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdProgramSemester", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdSemesterPlan(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdSemesterPlan", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetOfferdCourseDetails(string OfferdCourseID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetOfferdCourseDetails", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@OfferdCourseID", OfferdCourseID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdOfferdCourseSections(string OfferdCourseID, string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdOfferdCourseSections", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@OfferdCourseID", OfferdCourseID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable RemoveCourse(string StdSectionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("RemoveCourse", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable WithdrawCourse(string StdSectionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("WithdrawCourse", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable DelayCourse(string StdSectionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DelayCourse", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable CancelCourse(string StdSectionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CancelCourse", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable UnCalculatedCourse(string StdSectionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("UnCalculatedCourse", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable RegisterBlockCourses(string StudentID, string REmployeeID, string BranchID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("RegisterBlockCourses", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@REmployeeID", REmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@BranchID", BranchID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable RegisterBlockCourses1(string StudentID, string REmployeeID, string BranchID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("RegisterBlockCourses1", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@REmployeeID", REmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@BranchID", BranchID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetStdSearchOfferdCourse(string StudentID, string CourseCode, string CourseName)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdSearchOfferdCourse", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseCode", CourseCode);
            DA.SelectCommand.Parameters.AddWithValue("@CourseName", CourseName);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    //public static DataTable SemesterGet(string ID)
    //{
    //    using (SqlConnection conn = GetConnection())
    //    {
    //        SqlDataAdapter DA = new SqlDataAdapter("SemesterGet", conn);
    //        DA.SelectCommand.CommandType = CommandType.StoredProcedure;
    //        DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
    //        DataTable DT = new DataTable();
    //        DA.Fill(DT);
    //        return DT;
    //    }
    //}


    #region Block

    public static DataTable BlockGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BlockGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int BlockActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("BlockActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int BlockLock(string ID, bool IsLock, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("BlockLock", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsLock", IsLock);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int BlockAddEdit(string ID, string Name, string DepartmentID, string SemesterID, string Gender, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("BlockAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@Name", Name);
            cmd.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            cmd.Parameters.AddWithValue("@SemesterID", SemesterID);
            cmd.Parameters.AddWithValue("@Gender", Gender);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int BlockDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("BlockDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion
    #region BlockSection
    public static DataTable BlockSectionGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BlockSectionGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int BlockSectionActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("BlockSectionActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static DataTable BlockSectionAddEdit(string ID, string BlockID, string SectionID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BlockSectionAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@BlockID", BlockID);
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int BlockSectionDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("BlockSectionDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region EvaluationQuestion

    public static DataTable EvaluationQuestionGet(string ID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EvaluationQuestionGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int EvaluationQuestionActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlCommand cmd = new SqlCommand("EvaluationQuestionActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int EvaluationQuestionAddEdit(string ID, string QuestionName, string EvaluationQuestionTypeID, string EvaluationQuestionGroupID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlCommand cmd = new SqlCommand("EvaluationQuestionAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@QuestionName", QuestionName);
            cmd.Parameters.AddWithValue("@EvaluationQuestionTypeID", EvaluationQuestionTypeID);
            cmd.Parameters.AddWithValue("@EvaluationQuestionGroupID", EvaluationQuestionGroupID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int EvaluationQuestionDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlCommand cmd = new SqlCommand("EvaluationQuestionDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Conditions

    public static DataTable ConditionsGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ConditionsGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int ConditionsActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("ConditionsActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int ConditionsAddEdit(string ID, string Name, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("ConditionsAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@Name", Name);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int ConditionsDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("ConditionsDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion
    #region AdmissionConditions

    public static DataTable AdmissionConditionsGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AdmissionConditionsGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int AdmissionConditionsActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("AdmissionConditionsActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int AdmissionConditionsIsTransformation(string ID, bool IsTransformation, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("AdmissionConditionsIsTransformation", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsTransformation", IsTransformation);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }


    public static int AdmissionConditionsAddEdit(string ID, string ProgramID, string StudentTypeID, string ConditionID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("AdmissionConditionsAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@ProgramID", ProgramID);
            cmd.Parameters.AddWithValue("@StudentTypeID", StudentTypeID);
            cmd.Parameters.AddWithValue("@ConditionID", ConditionID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int AdmissionConditionsDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("AdmissionConditionsDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion
    public static int SetStudentCondition(string StudentID, string AdmissionConditionID, bool IsValidate, string Notes, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("SetStudentCondition", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StudentID", StudentID);
            cmd.Parameters.AddWithValue("@AdmissionConditionID ", AdmissionConditionID);

            cmd.Parameters.AddWithValue("@IsValidate", IsValidate);
            if (Notes != "")
                cmd.Parameters.AddWithValue("@Notes", Notes);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #region StdDocument
    public static DataTable StdDocumentAddEdit(string ID, string StdDocumentTypeID, string DocumentLink, string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StdDocumentAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@StdDocumentTypeID", StdDocumentTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@DocumentLink", DocumentLink);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int StdDocumentDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("StdDocumentDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@DeleteEmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable StdDocumentGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StdDocumentGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region RefusalStudent

    public static DataTable ReturnAdmissionStudent(string StudentID, string AdmissionReturnNotes, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ReturnAdmissionStudent", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@AdmissionReturnNotes", AdmissionReturnNotes);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable DeleteStudent(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DeleteStudent", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable DeleteStudentImage(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DeleteStudentImage", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ActivateStudentImage(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ActivateStudentImage", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    public static DataTable GetIsraStudentDepartmentStatistic()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetIsraStudentDepartmentStatistic", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStudentDepartmentStatistic()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentDepartmentStatistic", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ChangeStudentType(string StudentID, string StudentTypeID, string ChangeTypeNote, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ChangeStudentType", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentTypeID", StudentTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@ChangeTypeNote", ChangeTypeNote);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ChangeStudentStatus(string StudentID, string SemesterID, string StudentStatusID, string ChangeStatusNote, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ChangeStudentStatus", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentStatusID", StudentStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@ChangeStatusNote", ChangeStatusNote);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AddCertificateRegistrationCost(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddCertificateRegistrationCost", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@REmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AddCardOneDayCost(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddCardOneDayCost", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@REmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable AddReplacementStudentCardCost(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddReplacementStudentCardCost", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@REmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AddStudentMarkTableCostCost(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddStudentMarkTableCostCost", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@REmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AddUNRWAModeCost(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddUNRWAModeCost", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@REmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AddExamTableCost(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddExamTableCost", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@REmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AddStudentReportCost(string StudentID, string ActionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddStudentReportCost", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@ActionID", ActionID);
            DA.SelectCommand.Parameters.AddWithValue("@REmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AddTransactionCost(string StudentID, string ActionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddTransactionCost", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@ActionID", ActionID);
            DA.SelectCommand.Parameters.AddWithValue("@REmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



    public static DataTable GetAttendanceWarning(string ID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetAttendanceWarning", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetStdSectionMidtermMarkRevision(string StdSectionID, string REmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetStdSectionMidtermMarkRevision", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@REmployeeID", REmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetStdSectionMarkRevision(string StdSectionID, string REmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetStdSectionMarkRevision", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@REmployeeID", REmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    #region

    #endregion


    public static DataTable GetCertificateRegistrationReport(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetCertificateRegistrationReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ECertificateRegistrationReport(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ECertificateRegistrationReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdTransaction(string StudentID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdTransaction", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    // Coding by  Mariam

    public static DataTable CaseStudy_PersonalInformationReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetCaseStudy_PersonalInformation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable CaseStudy_AcademicInformationReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetCaseStudy_AcademicInformation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable CaseStudy_FinancialInformationReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetCaseStudy_FinancialInformation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable CaseStudy_StudentAttendanceWarningReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentAttendanceWarningReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ClearanceReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetClearanceReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable MidtermExamsScheduleReport(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetMidtermExamsSchedule", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable FinalExamsScheduleReport(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetFinalExamsSchedule", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetTestimonyReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetTestimonyReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetStudentPlan(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentPlan", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdAcademicAdvisingInfoReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdAcademicAdvisingInfoReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetComprehensiveCertificate(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetComprehensiveCertificate", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable UpdateStudentFileNumber(string StudentID, string FileNumber)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("UpdateStudentFileNumber", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@FileNumber", FileNumber);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ObservationMark(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ObservationMark", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable MGetStdSemesterMarksReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("MGetStdSemesterMarksReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable MGetStdSemesterMarksEReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("MGetStdSemesterMarksEReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdSemesterMarksEInfo(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdSemesterMarksEInfo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetSampleAuditInformation(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSampleAuditInformation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    //coding by Mariam for IsraaStudentIssue//

    public static DataTable StudentIssueAddEdit(string ID, string UniversityIssuesID, string StudentID, string Describtion, string RequestUserID, string UpdateUserID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentIssueAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@UniversityIssuesID", UniversityIssuesID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@Describtion", Describtion);
            DA.SelectCommand.Parameters.AddWithValue("@RequestUserID", RequestUserID);
            DA.SelectCommand.Parameters.AddWithValue("@UpdateUserID", UpdateUserID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable IssuesSearchByStudentName(string ArFirstName, string ArSecoundName, string ArThirdName, string ArFamilyName, string MangerID, string IssueID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IssuesSearchByStudentName", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            DA.SelectCommand.Parameters.AddWithValue("@@ArFirstName", ArFirstName);
            DA.SelectCommand.Parameters.AddWithValue("@ArSecoundName", ArSecoundName);
            DA.SelectCommand.Parameters.AddWithValue("@ArThirdName", ArThirdName);
            DA.SelectCommand.Parameters.AddWithValue("@ArFamilyName", ArFamilyName);
            DA.SelectCommand.Parameters.AddWithValue("@MangerID", MangerID);
            DA.SelectCommand.Parameters.AddWithValue("@IssueID ", IssueID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable IssuesSearch(string MangerID, string IssueID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IssuesSearch", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@MangerID", MangerID);
            DA.SelectCommand.Parameters.AddWithValue("@IssueID ", IssueID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

	
    public static DataTable AdmissionIssuesSearch(string ProgramID, string CollegeID, string DepartmentID, string IssueStatusID, string ArFirstName, string ArSecoundName, string ArThirdName, string ArFamilyName, string IssueID, string StudentNO)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IssuesSearch", conn);
            DA.SelectCommand.CommandTimeout = 120;

            DA.SelectCommand.Parameters.AddWithValue("@ProgramID", ProgramID);
            DA.SelectCommand.Parameters.AddWithValue("@CollegeID ", CollegeID);
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@IssueStatusID ", IssueStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@ArFirstName", ArFirstName);
            DA.SelectCommand.Parameters.AddWithValue("@ArSecoundName ", ArSecoundName);
            DA.SelectCommand.Parameters.AddWithValue("@ArThirdName", ArThirdName);
            DA.SelectCommand.Parameters.AddWithValue("@ArFamilyName ", ArFamilyName);
            DA.SelectCommand.Parameters.AddWithValue("@IssueID", IssueID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentNO", StudentNO);


            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
	
    public static DataTable GetUniversityIssue(string DocumentCategoryID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetUniversityIssue", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@DocumentCategoryID ", DocumentCategoryID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStudentIssue(string StudentID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentIssue", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetIssueInfoReport(string StudentIssueID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetIssueInfoReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentIssueID ", StudentIssueID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetIssue(string ID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetIssue", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable DleteIssue(string ID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DleteIssue", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AddEditeGetInfo(string StudentID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddEditeGetInfo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable IssueEdit(string ID, bool IsActive, string ActiveFrom, string ActiveTo, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IssueEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@ActiveFrom", ActiveFrom);
            DA.SelectCommand.Parameters.AddWithValue("@ActiveTo", ActiveTo);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID ", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AccredationIssue(string ID, Boolean IsFirstAccredation, string FirstAccredationEmployeeID, Boolean IsSecondAccredation, string SecondAccredationEmployeeID, Boolean IsThirdAccredation, string ThirdAccredationEmployeeID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AccredationIssue", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@IsFirstAccredation", IsFirstAccredation);
            DA.SelectCommand.Parameters.AddWithValue("@FirstAccredationEmployeeID", FirstAccredationEmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@IsSecondAccredation", IsSecondAccredation);
            DA.SelectCommand.Parameters.AddWithValue("@SecondAccredationEmployeeID", SecondAccredationEmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@IsThirdAccredation", IsThirdAccredation);
            DA.SelectCommand.Parameters.AddWithValue("@ThirdAccredationEmployeeID", ThirdAccredationEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



    // haneen code   suspendStudent
    public static int StudentSuspendedConditionAddEdit(string ID, string Name, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("StudentSuspendedConditionAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@Name", Name);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable StudentSuspendedConditionGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentSuspendedConditionGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentSuspendedConditionDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentSuspendedConditionDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int StudentSuspendedConditionActivate(string ID, bool isActive)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("StudentSuspendedConditionActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@isActive", isActive);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int SuspendedStudent(string ID, string StudentID, string SSConditionID, string OtherCondition, string SuspendedDetails, string DepartmentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("SuspendedStudent", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@StudentID", StudentID);
            cmd.Parameters.AddWithValue("@SSConditionID", SSConditionID);
            cmd.Parameters.AddWithValue("@OtherCondition", OtherCondition);
            cmd.Parameters.AddWithValue("@SuspendedDetails", SuspendedDetails);
            cmd.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static int UnSuspendedStudent(string ID, string UnSuspendedDetails, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("UnSuspendedStudent", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@UnSuspendedDetails", UnSuspendedDetails);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static DataTable SuspendedStudentGet(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SuspendedStudentGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    //end haneencode

    public static DataTable IsBlockedStudent(string StudentID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsBlockedStudent", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetMarkMidtermIncomplete(string StdSectionID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetMarkMidtermIncomplete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable FinalMarkIncompleteAdd(string StdSectionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("FinalMarkIncompleteAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@REmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable SetMarkFinalZero(string StdSectionID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetMarkFinalZero", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetMarkNoFinalZero(string StdSectionID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetMarkNoFinalZero", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable UpdateOfferdCourseFinalExamDetails(string ID, bool IsFinalExam, bool IsFinalEExam, string FinalExamDate, string FinalExamTimeFrom1, string FinalExamTimeTo1, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("UpdateOfferdCourseFinalExamDetails", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@IsFinalExam", IsFinalExam);
            DA.SelectCommand.Parameters.AddWithValue("@IsFinalEExam", IsFinalEExam);
            DA.SelectCommand.Parameters.AddWithValue("@FinalExamDate", FinalExamDate);
            DA.SelectCommand.Parameters.AddWithValue("@FinalExamTimeFrom1", FinalExamTimeFrom1);
            DA.SelectCommand.Parameters.AddWithValue("@FinalExamTimeTo1", FinalExamTimeTo1);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID ", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable AccredationIssue(string StudentIssueID, string IssueStatusID, string AccreditedAcademicOpinion, string AccerdationDepartmentID, string AccerdationEmployeeID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AccredationIssue", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentIssueID", StudentIssueID);
            DA.SelectCommand.Parameters.AddWithValue("@IssueStatusID", IssueStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditedAcademicOpinion", AccreditedAcademicOpinion);
            DA.SelectCommand.Parameters.AddWithValue("@AccerdationDepartmentID", AccerdationDepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@AccerdationEmployeeID", AccerdationEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable ExceptionSemesterRegisterationAddEdit(string ID, string SemesterID, string StudentID, string Type, string AllowedHoursCount, string DeadlineDate, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection7())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExceptionSemesterRegisterationAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@Type", Type);
            DA.SelectCommand.Parameters.AddWithValue("@AllowedHoursCount", AllowedHoursCount);
            DA.SelectCommand.Parameters.AddWithValue("@DeadlineDate", DeadlineDate);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID ", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable ExceptionSemesterRegisterationDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection7())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExceptionSemesterRegisterationDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID ", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable ExceptionSemesterRegisterationActivate(string ID, bool IsActive)
    {
        using (SqlConnection conn = GetConnection7())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExceptionSemesterRegisterationActivate", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive ", IsActive);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SuspendedStudentDetailsGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SuspendedStudentDetailsGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StdMessageAdd(string EmployeeID, string StudentID, string Jawwal, string MessageBody, bool SendStatus)
    {
        using (SqlConnection conn = GetConnection())
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

    public static DataTable ProofOFStudentAttendanceReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ProofOFStudentAttendanceReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable MarkDeductionAddEdit(string ID, string StudentID, string TypeID, string StdSectionID, string DRVType, string DeductionRate, string DeductionValue, string Notes, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("MarkDeductionAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@TypeID", TypeID);
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@DRVType", DRVType);
            DA.SelectCommand.Parameters.AddWithValue("@DeductionRate", DeductionRate);
            DA.SelectCommand.Parameters.AddWithValue("@DeductionValue", DeductionValue);
            DA.SelectCommand.Parameters.AddWithValue("@Notes", Notes);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable MarkDeductionDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("MarkDeductionDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID ", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable MarkDeductionGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("MarkDeductionGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetOfferdCourseSections(string OfferdCourseID, string SectionType = "1")
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetOfferdCourseSections", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@OfferdCourseID", OfferdCourseID);
            DA.SelectCommand.Parameters.AddWithValue("@SectionType", SectionType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int BlockAddEdit(string ID, string Name, string DepartmentID, string SemesterID, string Gender, string StudyLevelID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("BlockAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@Name", Name);
            cmd.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            cmd.Parameters.AddWithValue("@SemesterID", SemesterID);
            cmd.Parameters.AddWithValue("@Gender", Gender);
            cmd.Parameters.AddWithValue("@StudyLevelID", StudyLevelID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable GetStdFinancialBenefitReport(string StudentID, string SumOfHours, string TotalCost)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdFinancialBenefitReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SumOfHours", SumOfHours);
            DA.SelectCommand.Parameters.AddWithValue("@TotalCost", TotalCost);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StdInfractionAddEdit(string ID, string SemesterID, string StudentID, string InfractionID, string InfractionDetails, string PenaltyDetails, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StdInfractionAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@InfractionID", InfractionID);
            DA.SelectCommand.Parameters.AddWithValue("@InfractionDetails", InfractionDetails);
            DA.SelectCommand.Parameters.AddWithValue("@PenaltyDetails", PenaltyDetails);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StdInfractionGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
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
        using (SqlConnection conn = GetConnection())
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


    #region InfractionType

    public static DataTable InfractionTypeAddEdit(string ID, string Name, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("InfractionTypeAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@Name", Name);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable InfractionTypeDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("InfractionTypeDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID ", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable InfractionTypeGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("InfractionTypeGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    #endregion

    #region Infraction

    public static DataTable InfractionAddEdit(string ID, string Title, string InfractionTypeID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("InfractionAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@Title", Title);
            DA.SelectCommand.Parameters.AddWithValue("@InfractionTypeID", InfractionTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



    public static DataTable InfractionDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("InfractionDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID ", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable InfractionGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("InfractionGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    #endregion
    public static DataTable GetStdFinancialReport(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdFinancialReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentCourseAccredit(string ID, bool IsAccredit, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentCourseAccredit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@IsAccredit ", IsAccredit);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID ", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStudyTableReport(string DepartmentID, string StudyLevelID, string GenderID, string BranchID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudyTableReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@StudyLevelID ", StudyLevelID);
            DA.SelectCommand.Parameters.AddWithValue("@GenderID ", GenderID);
            DA.SelectCommand.Parameters.AddWithValue("@BranchID ", BranchID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStudyTableInfo(string DepartmentID, string StudyLevelID, string GenderID, string BranchID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudyTableInfo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@StudyLevelID ", StudyLevelID);
            DA.SelectCommand.Parameters.AddWithValue("@GenderID ", GenderID);
            DA.SelectCommand.Parameters.AddWithValue("@BranchID ", BranchID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStudyTableExamTableReport(string DepartmentID, string StudyLevelID, string GenderID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudyTableExamTableReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@StudyLevelID ", StudyLevelID);
            DA.SelectCommand.Parameters.AddWithValue("@GenderID ", GenderID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdStudyTableExamTableReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdStudyTableExamTableReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable ExceptionStudentCourseDelete(string ID, string EmployeeID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("ExceptionStudentCourseDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }
    public static DataTable ExceptionStudentGeneralDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExceptionStudentGeneralDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID ", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

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

    public static DataTable ReAccredationIssue(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ReAccredationIssue", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID ", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetSyllabus(string ID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetSyllabus", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetSyllabusActivity(string SyllabusID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetSyllabusActivity", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }
    public static DataTable GetSyllabusBook(string SyllabusID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetSyllabusBook", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable GetSyllabusEvaluation(string SyllabusID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetSyllabusEvaluation", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }
    public static DataTable GetSyllabusGoal(string SyllabusID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetSyllabusGoal", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetSyllabusOutcome(string SyllabusID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetSyllabusOutcome", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetSyllabusReference(string SyllabusID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetSyllabusReference", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetSyllabusDetailedDescription(string SyllabusID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetSyllabusDetailedDescription", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetOfferdCourseMidtermExamDetails2(string SemesterID, string DepartmentID, string StudyLevelID, string CourseTypeID, string ProgramID, string BranchID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetOfferdCourseMidtermExamDetails2", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@StudyLevelID", StudyLevelID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseTypeID", CourseTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@ProgramID", ProgramID);
            DA.SelectCommand.Parameters.AddWithValue("@BranchID", BranchID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetOfferdCourseFinalExamDetails2(string DepartmentID, string StudyLevelID, string CourseTypeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetOfferdCourseFinalExamDetails2", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@StudyLevelID", StudyLevelID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseTypeID", CourseTypeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetDepartmentCourseNotInPlan(string DepartmentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetDepartmentCourseNotInPlan", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetStudentCourseNotInPlan(string DepartmentID, string CourseID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentCourseNotInPlan", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetStdTranscriptReport(string StudentID, string Flag)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdTranscriptReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@Flag", Flag);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetUnAccreditStdTranscriptReport(string StudentID, string Offset)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetUnAccreditStdTranscriptReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@Offset", Offset);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetUnAccreditStdTranscriptReport(string StudentID, string Offset, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetUnAccreditStdTranscriptReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@Offset", Offset);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetAccreditStdTranscriptReport(string StudentID, string Offset)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetAccreditStdTranscriptReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@Offset", Offset);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetAccreditStdTranscriptReport(string StudentID, string Offset, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetAccreditStdTranscriptReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetAcademicAdvisingReport(string StudentID, string PlanSemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetAcademicAdvisingReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@PlanSemesterID", PlanSemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable OfficeSectionRegister(string StudentID, string SectionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("OfficeSectionRegister", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable RemoveOfficeCourse(string StudentID, string StdSectionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("RemoveOfficeCourse", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SetMarkMidtermZero(string StdSectionID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetMarkMidtermZero", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetMarkNoMidtermZero(string StdSectionID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetMarkNoMidtermZero", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable StudentAcademicCalendarGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentAcademicCalendarGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentAcademicCalendarAddEdit(
        string ID, string SemesterID, DateTime StudentRegisterBeginning, DateTime StudentRegisterEnd, DateTime SemesterRegisterBeginning, DateTime SemesterRegisterEnd,
        DateTime StudyBeginning, DateTime StudyEnd, DateTime AddBeginning, DateTime AddEnd, DateTime DelayEnd, DateTime withdrawEnd,
        DateTime StartMidtermExams, DateTime EndMidtermExams, DateTime MidtermExamResults, DateTime MidtermExamRevisionBeginning, DateTime MidtermExamRevisionEnd,
        DateTime StartFinalExams, DateTime EndFinalExams, DateTime MarkResults, DateTime MarkRevisionBeginning, DateTime MarkRevisionEnd,
        DateTime DeadlinePayment, string EmployeeID)
    {

        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentAcademicCalendarAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentRegisterBeginning", StudentRegisterBeginning);
            DA.SelectCommand.Parameters.AddWithValue("@StudentRegisterEnd", StudentRegisterEnd);
            DA.SelectCommand.Parameters.AddWithValue("@RegisterBeginning", SemesterRegisterBeginning);
            DA.SelectCommand.Parameters.AddWithValue("@RegisterEnd", SemesterRegisterEnd);
            DA.SelectCommand.Parameters.AddWithValue("@StudyBeginning", StudyBeginning);
            DA.SelectCommand.Parameters.AddWithValue("@StudyEnd", StudyEnd);
            DA.SelectCommand.Parameters.AddWithValue("@AddBeginning", AddBeginning);
            DA.SelectCommand.Parameters.AddWithValue("@AddEnd", AddEnd);
            DA.SelectCommand.Parameters.AddWithValue("@DelayEnd", DelayEnd);
            DA.SelectCommand.Parameters.AddWithValue("@withdrawEnd", withdrawEnd);
            DA.SelectCommand.Parameters.AddWithValue("@StartMidtermExams", StartMidtermExams);
            DA.SelectCommand.Parameters.AddWithValue("@EndMidtermExams", EndMidtermExams);
            DA.SelectCommand.Parameters.AddWithValue("@MidtermExamResults", MidtermExamResults);
            DA.SelectCommand.Parameters.AddWithValue("@MidtermExamRevisionBeginning", MidtermExamRevisionBeginning);
            DA.SelectCommand.Parameters.AddWithValue("@MidtermExamRevisionEnd", MidtermExamRevisionEnd);
            DA.SelectCommand.Parameters.AddWithValue("@StartFinalExams", StartFinalExams);
            DA.SelectCommand.Parameters.AddWithValue("@EndFinalExams", EndFinalExams);
            DA.SelectCommand.Parameters.AddWithValue("@MarkResults", MarkResults);
            DA.SelectCommand.Parameters.AddWithValue("@MarkRevisionBeginning", MarkRevisionBeginning);
            DA.SelectCommand.Parameters.AddWithValue("@MarkRevisionEnd", MarkRevisionEnd);
            DA.SelectCommand.Parameters.AddWithValue("@DeadlinePayment", DeadlinePayment);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    //InternalTransformationIsAccreditation
    public static bool InternalTransformationIsAccreditation(string StudentID, string AccreditationType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("InternalTransformationIsAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            if (DT.Rows.Count > 0)
                return (DT.Rows[0]["status"].ToString() == "0");
            else
                return true;

        }
    }

    public static DataTable StdGraduateAvowalAddEdit(string ID, string StudentID, string Mobile, string EMobile, string Address, string Problem, string Suggestion, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StdGraduateAvowalAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@Mobile", Mobile);
            DA.SelectCommand.Parameters.AddWithValue("@EMobile", EMobile);
            DA.SelectCommand.Parameters.AddWithValue("@Address", Address);
            DA.SelectCommand.Parameters.AddWithValue("@Problem", Problem);
            DA.SelectCommand.Parameters.AddWithValue("@Suggestion", Suggestion);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }

    }


    public static DataTable SetMarkTotalMarkZero(string StdSectionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetMarkTotalMarkZero", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetMarkTotalMarkNoZero(string StdSectionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetMarkTotalMarkNoZero", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);

            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable StdGraduateAvowalDelete(string ID, string EmployeeID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("StdGraduateAvowalDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable GetStdGraduateAvowalReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetStdGraduateAvowalReport", conn);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }

    #region student page
    public static DataTable GetStudentInfo(int StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentInfo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdExamsTable(int StdSemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdExamsTable", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSemesterID", StdSemesterID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetCSemesterPlanCourses(int PlanID, int CSemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetCSemesterPlanCourses", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@PlanID", PlanID);
            DA.SelectCommand.Parameters.AddWithValue("@CSemesterID", CSemesterID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetStdSemesterName(int StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdSemesterName", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdSemesterRemedialCourse(int StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdSemesterRemedialCourse", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetStdSemesterMarks(int StdSemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdSemesterMarks", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSemesterID", StdSemesterID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdSemesterMarksBItrans(int StdSemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdSemesterMarksBItrans", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSemesterID", StdSemesterID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable CalculateSemesterGPABITrans(int StdSemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CalculateSemesterGPABITrans", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSemesterID", StdSemesterID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdSemesterStatistic_New(int StdSemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdSemesterStatistic", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSemesterID", StdSemesterID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdSemesters(int StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdSemesters", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdGPAs(int StdSemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdGPAs", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSemesterID", StdSemesterID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



    public static DataTable CalculateSemesterGPA(int StdSemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CalculateSemesterGPA", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSemesterID", StdSemesterID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdSemesterMarksBITrans(int StdSemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdSemesterMarksBITrans", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSemesterID", StdSemesterID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetStdDocument(int StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("Select *,(Select Name From StdDocumentType Where ID=StdDocumentTypeID) as StdDocumentType From StdDocument Where StudentID=@StudentID and IsDelete=0 order by ID DESC", conn);
            DA.SelectCommand.CommandType = CommandType.Text;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetStudentStdMessage(int StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentStdMessage", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentWishesGet(int StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentWishesGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStudentCondition(int StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentCondition", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStudentAttendanceWarning(int StudentID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentAttendanceWarning", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetStudentSectionsAttendanceStatistics(int StudentID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentSectionsAttendanceStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



    public static DataTable GetStdSemesterWithoutTrans(int StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdSemesterWithoutTrans", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetStudentCSemesterAcademicGuidence(int StudentID, int CSemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentCSemesterAcademicGuidence", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@CSemesterID", CSemesterID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    #endregion
    public static int StdCertificateRecieved(string ID, bool StdBagRecieved)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlCommand cmd = new SqlCommand("StdCertificateRecieved", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@StdBagRecieved", StdBagRecieved);
            return cmd.ExecuteNonQuery();
        }
    }
    public static DataTable CancelRegisterSemester(string StdSemesterID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CancelRegisterSemester", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSemesterID", StdSemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable PlaceOfStudyEdit(string StudentID, string PlaceOfStudyID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("PlaceOfStudyEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@PlaceOfStudyID", PlaceOfStudyID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ddlPlaceOfStudies()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ddlPlaceOfStudies", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ddlBranches()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ddlBranches", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetSpecialStdTransaction(string StudentID)
    {
        using (SqlConnection conn = GetConnection3())
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
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSpecialStdDedection", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetMarkMidtermNoMarkAccept(string StdSectionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetMarkMidtermNoMarkAccept", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable UpdateStudentPassword(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("UpdateStudentPassword", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetOfferdCourseFinalExamDetails2(string SemesterID, string DepartmentID, string StudyLevelID, string CourseTypeID, string ProgramID, string ExamTime, string ExamDate, string OfferdCourseTypeID, string IsShow, string BranchID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetOfferdCourseFinalExamDetails2", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@StudyLevelID", StudyLevelID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseTypeID", CourseTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@ProgramID", ProgramID);
            DA.SelectCommand.Parameters.AddWithValue("@ExamTime", ExamTime);
            DA.SelectCommand.Parameters.AddWithValue("@ExamDate", ExamDate);
            DA.SelectCommand.Parameters.AddWithValue("@OfferdCourseTypeID", OfferdCourseTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@IsShow", IsShow);
            DA.SelectCommand.Parameters.AddWithValue("@BranchID", BranchID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetFinalExamStudentStatistics(string SemesterID, string ExamDate, string ExamTime, string BranchID, string GovernoratesID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetFinalExamStudentStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@ExamDate", ExamDate);
            DA.SelectCommand.Parameters.AddWithValue("@ExamTime", ExamTime);
            DA.SelectCommand.Parameters.AddWithValue("@BranchID", BranchID);
            DA.SelectCommand.Parameters.AddWithValue("@GovernoratesID", GovernoratesID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetFinalExamStudentStatistics1(string SemesterID, string ExamDate, string ExamTime, string BranchID, string GovernoratesID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetFinalExamStudentStatistics1", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@ExamDate", ExamDate);
            DA.SelectCommand.Parameters.AddWithValue("@ExamTime", ExamTime);
            DA.SelectCommand.Parameters.AddWithValue("@BranchID", BranchID);
            DA.SelectCommand.Parameters.AddWithValue("@GovernoratesID", GovernoratesID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentBranchAddEdit(string StudentID, int SemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentBranchAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetMidtermExamStudentStatistics(string SemesterID, string ExamDate, string ExamTime, string BranchID, string GovernoratesID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetMidtermExamStudentStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@ExamDate", ExamDate);
            DA.SelectCommand.Parameters.AddWithValue("@ExamTime", ExamTime);
            DA.SelectCommand.Parameters.AddWithValue("@BranchID", BranchID);
            DA.SelectCommand.Parameters.AddWithValue("@GovernoratesID", GovernoratesID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetMidtermExamStudentStatistics1(string SemesterID, string ExamDate, string ExamTime, string BranchID, string GovernoratesID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetMidtermExamStudentStatistics1", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@ExamDate", ExamDate);
            DA.SelectCommand.Parameters.AddWithValue("@ExamTime", ExamTime);
            DA.SelectCommand.Parameters.AddWithValue("@BranchID", BranchID);
            DA.SelectCommand.Parameters.AddWithValue("@GovernoratesID", GovernoratesID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetMarkMidtermUnIncomplete(string StdSectionID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetMarkMidtermUnIncomplete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetMarkFinalUnIncomplete(string StdSectionID,string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetMarkFinalUnIncomplete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetCourseStudentCourse(string CourseID, string SemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetCourseStudentCourse", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #region API


    public static GetStudentAcademicWarningOutPut GetStudentAcademicWarning(string StudentID)
    {
        WebClient we = new WebClient();
        we.Encoding = Encoding.UTF8;
        var jason = we.DownloadString("https://system.israa.edu.ps/app/GetStudentAcademicWarning?studentId=" + StudentID);
        var objs = JsonConvert.DeserializeObject<GetStudentAcademicWarningOutPut>(jason);
        return objs;

    }


    public static IEnumerable<StudentInternalTransformationDto> ListviewResult(string studentId, bool Istrans, string stdSemesterId)
    {
        if (!string.IsNullOrEmpty(studentId))
        {
            WebClient we = new WebClient();
            we.Encoding = Encoding.UTF8;

            var jason = we.DownloadString("https://system.israa.edu.ps/app/GetStudentInternalTransformation?studentId=" + studentId + "&Istrans=" + Istrans + "&stdSemesterId=" + stdSemesterId);
            var settings = new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Ignore,
                MissingMemberHandling = MissingMemberHandling.Ignore
            };
            var objs = JsonConvert.DeserializeObject<IEnumerable<StudentInternalTransformationDto>>(jason, settings);
            //var data = from s in objs
            //           orderby s.courseId
            //           select s;
            return objs;
        }
        return null;
    }
    #endregion
}

#region Dtos
public class GetStudentAcademicWarningOutPut
{
    public int status { get; set; }
    public string title { get; set; }
    public string AcademicTitle { get; set; }
    public string msg { get; set; }
}


public class StudentInternalTransformationDto
{
    public int Id { get; set; }
    public int courseId { get; set; }
    public string studentLevel { get; set; }
    public string courseName { get; set; }
    public int courseHour { get; set; }
    public string courseCode { get; set; }
    public int? transcourseId { get; set; }
    public string transcourseName { get; set; }
    public int transCourseHour { get; set; }
    public string transcourseCode { get; set; }
    public int? studentId { get; set; }
    public int studentNo { get; set; }
    public string studentname { get; set; }
    public string studentProgram { get; set; }
    public string studentCollege { get; set; }
    public string studentDepartment { get; set; }
}
#endregion