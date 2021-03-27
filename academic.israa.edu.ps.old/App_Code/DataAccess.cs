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

public class DataAccess
{

    public static DataTable GetStudentHelpRequest(string id)
    {
        return null;
    }
    public static DataTable HelpRequestDelete(string id, string EmployeeID)
    {
        return null;
    }
    public static DataTable HelpRequestBenefit(string id,bool check, string EmployeeID)
    {
        return null;
    }

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
    public static SqlConnection GetConnection5()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaEvaluation"].ToString());
        conn.Open();
        return conn;
    }
    private static SqlConnection GetConnection6()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UniversityStudentIssues"].ToString());
        conn.Open();
        return conn;
    }
    private static SqlConnection GetConnection7()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HumanResources"].ToString());
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
    public static DataTable GetBlockLectures(string BlockID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetBlockLectures", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@BlockID", BlockID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetRoomLectures(string RoomID, string SemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetRoomLectures", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@RoomID", RoomID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetInstructorLectures(string InstructorID, string SemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetInstructorLectures", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@InstructorID", InstructorID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetCourseLectures(string CourseID, string SemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetCourseLectures", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable LectureNewUpdate(string ID, string InstructorID, string BlockID, string OfferdCourseID, string SectionID, string RoomID, string CDayID, string FromHour, string ToHour, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("LectureNewUpdate", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            if (InstructorID != "-1")
                DA.SelectCommand.Parameters.AddWithValue("@InstructorID", InstructorID);
            DA.SelectCommand.Parameters.AddWithValue("@BlockID", BlockID);
            DA.SelectCommand.Parameters.AddWithValue("@OfferdCourseID", OfferdCourseID);
            if (SectionID != "-1")
                DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@RoomID", RoomID);
            DA.SelectCommand.Parameters.AddWithValue("@CDayID", CDayID);
            DA.SelectCommand.Parameters.AddWithValue("@FromHour", FromHour);
            DA.SelectCommand.Parameters.AddWithValue("@ToHour", ToHour);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



    public static DataTable EvaluateFinalReport(string SemesterID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EvaluateFinalReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmployeeQAnswerAcadmicAccredit(string EmployeeID, string SemesterID, string AcademicEmployeeID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeQAnswerAcadmicAccredit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@AcademicEmployeeID", AcademicEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EmployeeQAnswerDeanAccredit(string EmployeeID, string SemesterID, string DeanEmployeeID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeQAnswerDeanAccredit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@DeanEmployeeID", DeanEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetEvaluationEmployeeQAnswer(string EmployeeID, string SemesterID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEvaluationEmployeeQAnswer", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetEvaluation(string SectionID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEvaluation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EvaluationLecturerResultBySection(string SectionID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EvaluationLecturerResultBySection", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable EvaluationLecturerResultInAllSections(string EmployeeID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EvaluationLecturerResultInAllSections", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    //EvaluationEmpResultPercentage
    public static DataTable EvaluationEmpResultPercentage(string EmployeeID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EvaluationEmpResultPercentage", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable AddEvaluationEmployeeQAnswer(string EmployeeID, DataTable EvaluationQuestionAnswer, string UserID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddEvaluationEmployeeQAnswer", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@EvaluationQuestionAnswer", EvaluationQuestionAnswer);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
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

    public static DataTable GetAdmissionStudents()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetAdmissionStudents", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetAcceptedStudentDepartmentStatistic()
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetAcceptedStudentDepartmentStatistic", conn);
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

    public static DataTable GetPlanReport(string PlanID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetPlanReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@PlanID", PlanID);
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

    #region Transformation

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

    public static DataTable ExternalTransformation(string TransID, string StudentID, string CourseID, string CourseName, string CourseHour, string TotalMark, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExternalTransformation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (TransID != "0")
                DA.SelectCommand.Parameters.AddWithValue("@TransID", TransID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseName", CourseName);
            DA.SelectCommand.Parameters.AddWithValue("@CourseHours", CourseHour);
            DA.SelectCommand.Parameters.AddWithValue("@TotalMark", TotalMark);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable TransformationAccreditation(string StudentID, string EmployeeID, string AccreditationType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("TransformationAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable TeacherStudyTableAccreditation(string EmployeeID, string EmpID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("TeacherStudyTableAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpID", EmpID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable TransformationUnaccreditation(string StudentID, string EmployeeID, string AccreditationType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("TransformationUnaccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static bool TransformationIsAccreditation(string StudentID, string AccreditationType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("TransformationIsAccreditation", conn);
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



    public static int DeleteExternalTransformation(string TransformationID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("DeleteExternalTransformation", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TransformationID", TransformationID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }


    public static DataTable InternalTransformation(string StudentID, string CourseID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("InternalTransformation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region OfferdCourse

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

    public static DataTable OfferdCourseGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("OfferdCourseGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable OfferdCourseAddEdit(string ID, string SemesterID, string CourseID, bool ForMale, bool ForFemale,
        bool IsMidtermExam, string MidtermExamDate, string MidtermExamTimeFrom1, string MidtermExamTimeTo1, string MidtermExamTimeFrom2, string MidtermExamTimeTo2,
        bool IsFinalExam, string FinalExamDate, string FinalExamTimeFrom1, string FinalExamTimeTo1, string FinalExamTimeFrom2, string FinalExamTimeTo2, bool HeadAccreditation, bool DeanAccreditation, string EmployeeID
        )
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("OfferdCourseAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DA.SelectCommand.Parameters.AddWithValue("@ForMale", ForMale);
            DA.SelectCommand.Parameters.AddWithValue("@ForFemale", ForFemale);
            DA.SelectCommand.Parameters.AddWithValue("@IsMidtermExam", IsMidtermExam);
            if (IsMidtermExam)
            {
                DA.SelectCommand.Parameters.AddWithValue("@MidtermExamDate", MidtermExamDate);
                DA.SelectCommand.Parameters.AddWithValue("@MidtermExamTimeFrom1", MidtermExamTimeFrom1);
                DA.SelectCommand.Parameters.AddWithValue("@MidtermExamTimeTo1", MidtermExamTimeTo1);
                DA.SelectCommand.Parameters.AddWithValue("@MidtermExamTimeFrom2", MidtermExamTimeFrom2);
                DA.SelectCommand.Parameters.AddWithValue("@MidtermExamTimeTo2", MidtermExamTimeTo2);
            }
            DA.SelectCommand.Parameters.AddWithValue("@IsFinalExam", IsFinalExam);
            if (IsFinalExam)
            {
                DA.SelectCommand.Parameters.AddWithValue("@FinalExamDate", FinalExamDate);
                DA.SelectCommand.Parameters.AddWithValue("@FinalExamTimeFrom1", FinalExamTimeFrom1);
                DA.SelectCommand.Parameters.AddWithValue("@FinalExamTimeTo1", FinalExamTimeTo1);
                DA.SelectCommand.Parameters.AddWithValue("@FinalExamTimeFrom2", FinalExamTimeFrom2);
                DA.SelectCommand.Parameters.AddWithValue("@FinalExamTimeTo2", FinalExamTimeTo2);
            }
            DA.SelectCommand.Parameters.AddWithValue("@HeadAccreditation", HeadAccreditation);
            DA.SelectCommand.Parameters.AddWithValue("@DeanAccreditation", DeanAccreditation);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable OfferdCourseAccreditation(string ID, string EmployeeID, string AccreditationType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("OfferdCourseAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int OfferdCourseDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("OfferdCourseDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Section

    public static DataTable SectionGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SectionGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SectionAddEdit(string ID, string OfferdCourseID, string SectionID, string SectionNum, string EmployeeID, string PTEmployeeID,
        string SectionType, int Gender, string Capacity, bool IsActive, string EmpID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SectionAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@OfferdCourseID", OfferdCourseID);
            if (SectionID != "")
                DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@SectionNum", SectionNum);
            if (EmployeeID != "")
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            if (PTEmployeeID != "")
                DA.SelectCommand.Parameters.AddWithValue("@PTEmployeeID", PTEmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SectionType", SectionType);
            DA.SelectCommand.Parameters.AddWithValue("@Gender", Gender);
            DA.SelectCommand.Parameters.AddWithValue("@Capacity", Capacity);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmpID", EmpID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int SectionActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("SectionActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int SectionDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("SectionDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Section
    public static DataTable PTEmployeeAddEdit(string ID, string Name, string DepartmentID, string Qualification, string Notes, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("PTEmployeeAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@Name", Name);
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@Qualification", Qualification);
            DA.SelectCommand.Parameters.AddWithValue("@Notes", Notes);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable PTEmployeeGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("PTEmployeeGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region Lecture

    public static DataTable LectureGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("LectureGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable LectureAddEdit(string ID, string SectionID, string RoomID, string CDayID, string FromHour, string ToHour, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("LectureAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@RoomID", RoomID);
            DA.SelectCommand.Parameters.AddWithValue("@CDayID", CDayID);
            DA.SelectCommand.Parameters.AddWithValue("@FromHour", FromHour);
            DA.SelectCommand.Parameters.AddWithValue("@ToHour", ToHour);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable LectureUpdate(string ID, string RoomID, string CDayID, string FromHour, string ToHour, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("LectureUpdate", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@RoomID", RoomID);
            DA.SelectCommand.Parameters.AddWithValue("@CDayID", CDayID);
            DA.SelectCommand.Parameters.AddWithValue("@FromHour", FromHour);
            DA.SelectCommand.Parameters.AddWithValue("@ToHour", ToHour);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int LectureActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("LectureActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable LectureDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("LectureDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region Program
    public static DataTable ProgramAddEdit(string ID, string ProgramNum, string ArName, string EnName, string Admissionkey, bool IsActive, string EmployeeID, string EmployeeID1, string EmployeeID2)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ProgramAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@ProgramNum", ProgramNum);
            DA.SelectCommand.Parameters.AddWithValue("@ArName", ArName);
            DA.SelectCommand.Parameters.AddWithValue("@EnName", EnName);
            DA.SelectCommand.Parameters.AddWithValue("@Admissionkey", Admissionkey);
            //if (ProgramFID != "")
            //    cmd.Parameters.AddWithValue("@ProgramFID", ProgramFID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID1", EmployeeID1);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID2", EmployeeID2);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;

        }
    }

    public static DataTable ProgramGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ProgramGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int ProgramActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("ProgramActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable ProgramDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ProgramDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region College

    public static int CollegeAddEdit(string ID, string CollegeNum, string ArName, string EnName, string EmployeeID, string EmployeeID2,
        string ProgramID, double AcceptanceRate1, double AcceptanceRate2, string CollegeFID, bool IsActive, string EmpID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("CollegeAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@CollegeNum", CollegeNum);
            cmd.Parameters.AddWithValue("@ArName", ArName);
            cmd.Parameters.AddWithValue("@EnName", EnName);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            cmd.Parameters.AddWithValue("@EmployeeID2", EmployeeID2);
            cmd.Parameters.AddWithValue("@ProgramID", ProgramID);
            cmd.Parameters.AddWithValue("@AcceptanceRate1", AcceptanceRate1);
            cmd.Parameters.AddWithValue("@AcceptanceRate2", AcceptanceRate2);
            if (CollegeFID != "")
                cmd.Parameters.AddWithValue("@CollegeFID", CollegeFID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmpID", EmpID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable CollegeDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {

            SqlDataAdapter DA = new SqlDataAdapter("CollegeDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int CollegeActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("CollegeActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable CollegeGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CollegeGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    #endregion

    #region Department

    public static int DepartmentAddEdit(string ID, string DepartmentNum, string ArName, string EnName, string CollegeID, string EmployeeID, double AcceptanceRate1, double AcceptanceRate2, string HourCost, string StdMCapacity, string StdFMCapacity,
        string UniversityHour, string CollegeHour, string DepartmentHour, string OptionalHour,
        string MarkOfSuccess, string DepartmentFID, bool IsActive, string EmpID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("DepartmentAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@DepartmentNum", DepartmentNum);
            cmd.Parameters.AddWithValue("@ArName", ArName);
            cmd.Parameters.AddWithValue("@EnName", EnName);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            cmd.Parameters.AddWithValue("@CollegeID", CollegeID);
            cmd.Parameters.AddWithValue("@AcceptanceRate1", AcceptanceRate1);
            cmd.Parameters.AddWithValue("@AcceptanceRate2", AcceptanceRate2);
            cmd.Parameters.AddWithValue("@HourCost", HourCost);
            cmd.Parameters.AddWithValue("@StdMCapacity", StdMCapacity);
            cmd.Parameters.AddWithValue("@StdFMCapacity", StdFMCapacity);
            cmd.Parameters.AddWithValue("@UniversityHour", UniversityHour);
            cmd.Parameters.AddWithValue("@CollegeHour", CollegeHour);
            cmd.Parameters.AddWithValue("@DepartmentHour", DepartmentHour);
            cmd.Parameters.AddWithValue("@OptionalHour", OptionalHour);
            cmd.Parameters.AddWithValue("@MarkOfSuccess", MarkOfSuccess);
            if (DepartmentFID != "")
                cmd.Parameters.AddWithValue("@DepartmentFID", DepartmentFID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmpID", EmpID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable DepartmentDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DepartmentDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int DepartmentActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("DepartmentActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable DepartmentGet(string ID)
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
    #endregion

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


    public static DataTable SemesterDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SemesterDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }

    }


    #endregion

    #region Building

    public static DataTable BuildingGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BuildingGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int BuildingActivate(string ID, bool IsActive, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("BuildingActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int BuildingAddEdit(string ID, string BuildingNum, string ArName, string NumOfFloors, bool IsActive, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("BuildingAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@BuildingNum", BuildingNum);
            cmd.Parameters.AddWithValue("@ArName", ArName);
            cmd.Parameters.AddWithValue("@NumOfFloors", NumOfFloors);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable BuildingDelete(string ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("BuildingDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region Rooms

    public static DataTable RoomGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("RoomGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int RoomAddEdit(string ID, string RoomNum, string Name, string BuildingID,
        string Floor, string Area, string LectureCapacity, string ExamCapacity, string RoomTypeID, string UseType, string Notes, bool IsActive, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("RoomAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@RoomNum", RoomNum);
            cmd.Parameters.AddWithValue("@Name", Name);
            cmd.Parameters.AddWithValue("@BuildingID", BuildingID);
            cmd.Parameters.AddWithValue("@Floor", Floor);
            cmd.Parameters.AddWithValue("@Area", Area);
            cmd.Parameters.AddWithValue("@LectureCapacity", LectureCapacity);
            cmd.Parameters.AddWithValue("@ExamCapacity", ExamCapacity);
            cmd.Parameters.AddWithValue("@RoomTypeID", RoomTypeID);
            cmd.Parameters.AddWithValue("@UseType", UseType);
            cmd.Parameters.AddWithValue("@Notes", Notes);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable RoomDelete(string ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("RoomDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int RoomActivate(string ID, bool IsActive, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("RoomActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable GetAvailableRooms(string CDayID, string FromHour, string ToHour)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetAvailableRooms", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@CDayID", CDayID);
            DA.SelectCommand.Parameters.AddWithValue("@FromHour", FromHour);
            DA.SelectCommand.Parameters.AddWithValue("@ToHour", ToHour);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region RoomType

    public static int RoomTypeAddEdit(string ID, string Name, bool IsActive, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("RoomTypeAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@Name", Name);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable RoomTypeDelete(string ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("RoomTypeDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int RoomTypeActivate(string ID, bool IsActive, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("RoomTypeActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable RoomTypeGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("RoomTypeGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region PreRequest

    public static int PreRequestAddEdit(string ID, string CourseID, string PreReqID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("PreRequestAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@CourseID", CourseID);
            cmd.Parameters.AddWithValue("@PreReqID", PreReqID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int PreRequestDelete(string ID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("PreRequestDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            return cmd.ExecuteNonQuery();
        }
    }
    #endregion

    #region Course
    public static DataTable CourseAddEdit(string ID, string CourseCode, string ArName, string EnName, string CourseFID, string DepartmentID, string LevelID, string SemesterID, string CCourseTypeID, string CourseType, string NumOfHours, string RequestedFHours, bool IsScholarship, bool IsHaveLab, bool IsHaveDiscussion, bool IsActive, string PreReqID, string EmployeeID)
    {

        int CourseCategoryID = 0;
        if (CCourseTypeID == "22" )
        {
            CourseCategoryID = 1;
        }
        if (CCourseTypeID == "23")
        {
            CourseCategoryID = 2;
        }
        if (CCourseTypeID == "24")
        {
            CourseCategoryID = 3;
        }
        if (CCourseTypeID == "33")
        {
            CourseCategoryID = 4;
        }

        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CourseAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseCode", CourseCode);
            DA.SelectCommand.Parameters.AddWithValue("@ArName", ArName);
            DA.SelectCommand.Parameters.AddWithValue("@EnName", EnName);
            if (CourseFID != "")
                DA.SelectCommand.Parameters.AddWithValue("@CourseFID", CourseFID);
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@LevelID", LevelID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@CCourseTypeID", CCourseTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseType", CourseType);
            DA.SelectCommand.Parameters.AddWithValue("@NumOfHours", NumOfHours);
            DA.SelectCommand.Parameters.AddWithValue("@RequestedFHours", RequestedFHours);
            DA.SelectCommand.Parameters.AddWithValue("@IsScholarship", IsScholarship);
            DA.SelectCommand.Parameters.AddWithValue("@IsHaveLab", IsHaveLab);
            DA.SelectCommand.Parameters.AddWithValue("@IsHaveDiscussion", IsHaveDiscussion);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            if (PreReqID != "")
                DA.SelectCommand.Parameters.AddWithValue("@PreReqID", PreReqID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseCategoryID", CourseCategoryID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable CourseDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CourseDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int CourseActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("CourseActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable CourseGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CourseGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GenerateCourseCode(string CourseID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GenerateCourseCode", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region Plan
    public static int PlanAddEdit(string ID, string PlanNum, string DepartmentID, string Year, bool HeadAccreditation, bool DeanAccreditation, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("PlanAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@PlanNum", PlanNum);
            cmd.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            cmd.Parameters.AddWithValue("@Year", Year);
            cmd.Parameters.AddWithValue("@HeadAccreditation", HeadAccreditation);
            cmd.Parameters.AddWithValue("@DeanAccreditation", DeanAccreditation);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static int PlanDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("PlanDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable PlanGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("PlanGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable PlanAccreditation(string ID, string EmployeeID, string AccreditationType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("PlanAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region PlanCourse

    public static DataTable PlanCourseAddEdit(string ID, string PlanID, string CSemesterID, string CourseID, string CourseCategoryID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("PlanCourseAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@PlanID", PlanID);
            DA.SelectCommand.Parameters.AddWithValue("@CSemesterID", CSemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseCategoryID", CourseCategoryID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable PlanCourseGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("PlanCourseGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int PlanCourseActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("PlanCourseActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static DataTable PlanCourseDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("PlanCourseDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

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

    public static int AdvertisementAddEdit(string ID, string Title, string Details, string CatID, bool IsActive, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("AdvertisementAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@Title", Title);
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

    #region Teacher

    public static DataTable GetTeacherStudyTable(string EmployeeID, string PTEmployeeID, string SemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetTeacherStudyTable", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            if (PTEmployeeID != "")
                DA.SelectCommand.Parameters.AddWithValue("@PTEmployeeID", PTEmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetTeacherStudyTableInfo(string EmployeeID, string PTEmployeeID, string SemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetTeacherStudyTableInfo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            if (PTEmployeeID != "")
                DA.SelectCommand.Parameters.AddWithValue("@PTEmployeeID", PTEmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetSectionEmployee(string SectionID, string EmployeeID, string PTEmployeeID, string EmpID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetSectionEmployee", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            if (PTEmployeeID != "")
                DA.SelectCommand.Parameters.AddWithValue("@PTEmployeeID", PTEmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpID", EmpID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    //public static int SetSectionEmployee(string SectionID, string EmployeeID, string PTEmployeeID, string EmpID)
    //{
    //    using (SqlConnection conn = GetConnection())
    //    {
    //        SqlCommand cmd = new SqlCommand("SetSectionEmployee", conn);
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.AddWithValue("@SectionID", SectionID);
    //        cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
    //        if (PTEmployeeID != "")
    //            cmd.Parameters.AddWithValue("@PTEmployeeID", PTEmployeeID);
    //        cmd.Parameters.AddWithValue("@EmpID", EmpID);
    //        return cmd.ExecuteNonQuery();
    //    }
    //}

    #endregion

    #region StudentProfile

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

    #endregion

    #region RefusalStudent

    public static DataTable RefusalStudent(string StudentID, string RefusalNotes, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("RefusalStudent", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@RefusalNotes", RefusalNotes);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetIsRemedialCourse(string SectionID, bool IsRemedialCourse, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetIsRemedialCourse", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@IsRemedialCourse", IsRemedialCourse);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ReturnStudent(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ReturnStudent", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
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

    #endregion

    #region SMSArchive

    public static DataTable AddSMSArchive(string EmployeeID, string Jawwal, string MessageBody, bool SendStatus)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddSMSArchive", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@Jawwal", Jawwal);
            DA.SelectCommand.Parameters.AddWithValue("@MessageBody", MessageBody);
            DA.SelectCommand.Parameters.AddWithValue("@SendStatus", SendStatus);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region Block

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

    public static DataTable DeleteSectionFromBlock(string BlockID, string SectionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DeleteSectionFromBlock", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@BlockID", BlockID);
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
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

    public static DataTable GiveAcadimecPermission(string EmployeeID, bool EmpIsAllTime, string EmpAvailableFrom, string EmpAvailableTo,
        bool EmpIsActive, string ActionID, bool IsAllTime, string AvailableFrom, string AvailableTo, bool IsActive, string InsertEmployeeID)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GiveAcadimecPermission", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmpIsAllTime", EmpIsAllTime);
            if (!EmpIsAllTime)
            {
                DA.SelectCommand.Parameters.AddWithValue("@EmpAvailableFrom", EmpAvailableFrom);
                DA.SelectCommand.Parameters.AddWithValue("@EmpAvailableTo", EmpAvailableTo);
            }
            DA.SelectCommand.Parameters.AddWithValue("@EmpIsActive", EmpIsActive);
            DA.SelectCommand.Parameters.AddWithValue("@ActionID", ActionID);
            DA.SelectCommand.Parameters.AddWithValue("@IsAllTime", IsAllTime);
            if (!IsAllTime)
            {
                DA.SelectCommand.Parameters.AddWithValue("@AvailableFrom", AvailableFrom);
                DA.SelectCommand.Parameters.AddWithValue("@AvailableTo", AvailableTo);
            }
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertEmployeeID);

            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetStdStudyTableReport(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdStudyTableReport", conn);
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

    public static DataTable AccrediteTransformation(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AccrediteTransformation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

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

    public static DataTable StudentInstallmentAccreditation(string InstallmentOrderID, string EmployeeID, int AccreditationType)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentInstallmentAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@InstallmentOrderID", InstallmentOrderID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);


            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable StudentLoanAccreditation(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentLoanAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
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

    public static DataTable GetRoomStudyTable(string RoomID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetRoomStudyTable", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@RoomID", RoomID);
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

    public static DataTable SetSectionMarkAccreditation(string SectionID, string EmployeeID, int AccreditationType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetSectionMarkAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SetWorkMarkAccreditation(string SectionID, string EmployeeID, int AccreditationTypeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetWorkMarkAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationTypeID", AccreditationTypeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SetWorkMarkUnaccreditation(string WorkMarkID, string AccreditationType, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetMarkUnaccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@WorkMarkID", WorkMarkID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetSectionWorkMarkUnaccreditation(string SectionID, string AccreditationTypeID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetSectionWorkMarkUnaccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationTypeID", AccreditationTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SetSectionMarkUnaccreditation(string SectionID, string EmployeeID, int AccreditationType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetSectionMarkUnaccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SetWorkMarkRevisionAccreditation(string ID, string EmployeeID, int AccreditationType, int IsAccept, int IsReject)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetWorkMarkRevisionAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DA.SelectCommand.Parameters.AddWithValue("@IsAccept", IsAccept);
            DA.SelectCommand.Parameters.AddWithValue("@IsReject", IsReject);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SetMarkUnaccreditation(string StdSectionID, int AccreditationType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetMarkUnaccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetMarkAccreditation(string StdSectionID, int AccreditationType, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetMarkAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
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

    public static DataTable MarkIsAccreditation(string SectionID, int AccreditationType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("MarkIsAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetSectionStudentsMarks(string SectionID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSectionStudentsMarks", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable AcceptRegictMarkRevisionRequest(string ID, string AcceptRegictType, bool AcceptRequest, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AcceptRegictMarkRevisionRequest", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@AcceptRegictType", AcceptRegictType);
            DA.SelectCommand.Parameters.AddWithValue("@AcceptRequest", AcceptRequest);
            DA.SelectCommand.Parameters.AddWithValue("@RegictRequest", !AcceptRequest);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable DepartmentSectionAddEdit(string ID, string DepartmentID, string SectionID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DepartmentSectionAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable DepartmentSectionActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DepartmentSectionActivate", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable DepartmentSectionDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DepartmentSectionDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable DepartmentSectionGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DepartmentSectionGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable CollegeRoomAddEdit(string ID, string CollegeID, string RoomID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CollegeRoomAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@CollegeID", CollegeID);
            DA.SelectCommand.Parameters.AddWithValue("@RoomID", RoomID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable CollegeRoomDelete(string ID, string DeleteEmployeeID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("CollegeRoomDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", DeleteEmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }
    public static DataTable CollegeRoomGet(string ID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("CollegeRoomGet", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }
    public static DataTable CollegeEmployeeAddEdit(string ID, string CollegeID, string EmployeeID, string QualificationID, string EmployeeType, string InsertEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CollegeEmployeeAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@CollegeID", CollegeID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@QualificationID", QualificationID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeType", EmployeeType);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable CollegeEmployeeGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {

            SqlDataAdapter DA = new SqlDataAdapter("CollegeEmployeeGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable CollegeEmployeeAccrediation(string ID, string AcademicAccreditationEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {

            SqlDataAdapter DA = new SqlDataAdapter("CollegeEmployeeAccrediation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@AcademicAccreditationEmployeeID", AcademicAccreditationEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    // haneen CollegePTHoursAdd
    public static DataTable CollegePTHoursAdd(string ID, string SemesterID, string CollegeID, string PTHours, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {

            SqlDataAdapter DA = new SqlDataAdapter("CollegePTHoursAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@CollegeID", CollegeID);
            DA.SelectCommand.Parameters.AddWithValue("@PTEHours", PTHours);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetMarkMidtermMark(string ID, string MidtermMark, bool IsMidtermNoMark, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetMarkMidtermMark", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@MidtermMark", MidtermMark);
            DA.SelectCommand.Parameters.AddWithValue("@IsMidtermNoMark", IsMidtermNoMark);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetMarkFinalMark(string ID, string FinalMark, bool IsFinalNoMark, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetMarkFinalMark", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@FinalMark", FinalMark);
            DA.SelectCommand.Parameters.AddWithValue("@IsFinalNoMark", IsFinalNoMark);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetMarkWorkMark(string ID, string WorkMark, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetMarkWorkMark", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@WorkMark", WorkMark);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable SyllabusAddEdit(string ID, string CourseID, string InstructorID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DA.SelectCommand.Parameters.AddWithValue("@InstructorID", InstructorID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SyllabusGet(string ID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusGet", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }
    public static DataTable SyllabusDelete(string ID, string EmployeeID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
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
    #region studentIssue
    public static DataTable GetIssue(string ID)
    {
        using (SqlConnection conn = GetConnection6())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetIssue", conn);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }


    public static DataTable AccredationIssue(string StudentIssueID, string IssueStatusID, string AccreditedAcademicOpinion, string AccerdationDepartmentID, string AccerdationEmployeeID)
    {
        using (SqlConnection conn = GetConnection6())
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
    public static DataTable UpdateAccreditationSeries(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection6())
        {
            SqlDataAdapter DA = new SqlDataAdapter("UpdateAccreditationSeries", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }

    }
    public static DataTable TransferStudentIssueCollege(string StudentIssueID, string NewCollege, string TransferResoan, string EmployeeID, string AccerdationDepartmentID)
    {
        using (SqlConnection conn = GetConnection6())
        {
            SqlDataAdapter DA = new SqlDataAdapter("TransferStudentIssueCollege", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentIssueID", StudentIssueID);
            DA.SelectCommand.Parameters.AddWithValue("@NewCollege", NewCollege);
            DA.SelectCommand.Parameters.AddWithValue("@TransferResoan", TransferResoan);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccerdationDepartmentID", AccerdationDepartmentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }

    }
    #endregion

    public static DataTable ExceptionStudentGeneralAdd(string ID, string SemesterID, string StudentID, string ExceptionTypeID, string HoursCount, DateTime DeadlineDate, string Note, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExceptionStudentGeneralAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@ExceptionTypeID", ExceptionTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@HoursCount", HoursCount);
            DA.SelectCommand.Parameters.AddWithValue("@DeadlineDate", DeadlineDate);
            DA.SelectCommand.Parameters.AddWithValue("@Note", Note);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID ", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
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
    public static DataTable ExceptionStudentGeneralActivate(string ID, bool IsActive, string ActivateEmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExceptionStudentGeneralActivate", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive ", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@ActivateEmployeeID", ActivateEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable ExceptionStudentCourseAdd(string ID, string StudentID, string SemesterID, string ExceptionTypeID, string CourseID, DateTime DeadlineDate, string Note, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExceptionStudentCourseAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@ExceptionTypeID", ExceptionTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DA.SelectCommand.Parameters.AddWithValue("@DeadlineDate", DeadlineDate);
            DA.SelectCommand.Parameters.AddWithValue("@Note", Note);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ExceptionStudentCourseGet(string ID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("ExceptionStudentCourseGet", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
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
    public static DataTable ExceptionStudentCourseActivate(string ID, Boolean IsActive, string EmployeeID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("ExceptionStudentCourseActivate", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            Da.SelectCommand.Parameters.AddWithValue("@ActivateEmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
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

    public static DataTable SyllabusAccredit(string SyllabusID, string AccreditationTypeID, string AccreditationDepartmentID, string EmployeeID, string PlaceID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusAccredit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationTypeID", AccreditationTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@AccerdationEmployeeID ", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@PlaceID ", PlaceID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable CourseBookAccredit(string ID, bool IsAccreditation, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CourseBookAccredit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@IsAccreditation", IsAccreditation);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable LectureIrregularAccreditation(string ID, string AccreditationType, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
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
    public static DataTable GetInstructorAttendance3(string EmployeeID, string SemesterID, string DateFrom, string DateTo, string IsLate)
    {
        using (SqlConnection conn = GetConnection7())
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
    public static DataTable GetAcademicInstructorAttendance(string EmployeeID, string SemesterID, string date, string IsAbsent, string IsLate)
    {
        using (SqlConnection conn = GetConnection7())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetAcademicInstructorAttendance", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@date", date);
            DA.SelectCommand.Parameters.AddWithValue("@IsAbsent", IsAbsent);
            DA.SelectCommand.Parameters.AddWithValue("@IsLate", IsLate);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable CourseBookRequestAddEdit(string ID, string EmployeeID, string SemesterID, string CourseID, string UserID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CourseBookRequestAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", UserID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable CourseBookRequestDelete(string ID, string EmployeeID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("CourseBookRequestDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }

    public static DataTable CourseBookDelete(string ID, string EmployeeID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("CourseBookDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }



    //newSyllabus

    public static DataTable SyllabusGeneralDescriptionUpdate(string ID, string ArGeneralDescription, string EnGeneralDescription, string EmployeeID, string AccreditationDepartmentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusGeneralDescriptionUpdate", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SyllabusID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@ArGeneralDescription", ArGeneralDescription);
            DA.SelectCommand.Parameters.AddWithValue("@EnGeneralDescription", EnGeneralDescription);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SyllabusGoalAddEdit(string ID, string SyllabusID, string ArGoal, string EnGoal, string EmployeeID, string AccreditationDepartmentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusGoalAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DA.SelectCommand.Parameters.AddWithValue("@ArGoal", ArGoal);
            DA.SelectCommand.Parameters.AddWithValue("@EnGoal", EnGoal);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SyllabusGoalGet(string ID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusGoalGet", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }
    public static DataTable SyllabusGoalDelete(string ID, string EmployeeID, string AccreditationDepartmentID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusGoalDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            Da.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable SyllabusBookAddEdit(string ID, string SyllabusID, string BookName, string EmployeeID, string AccreditationDepartmentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusBookAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DA.SelectCommand.Parameters.AddWithValue("@BookName", BookName);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SyllabusBookDelete(string ID, string EmployeeID, string AccreditationDepartmentID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusBookDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            Da.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable SyllabusReferenceAddEdit(string ID, string SyllabusID, string Reference, string EmployeeID, string AccreditationDepartmentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusReferenceAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DA.SelectCommand.Parameters.AddWithValue("@Reference", Reference);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SyllabusReferenceDelete(string ID, string EmployeeID, string AccreditationDepartmentID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusReferenceDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            Da.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable SyllabusDetailedDescriptionAddEdit(string ID, string SyllabusID, string WeekName, string ArUnitName, string EnUnitName, string EmployeeID, string AccreditationDepartmentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusDetailedDescriptionAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DA.SelectCommand.Parameters.AddWithValue("@WeekName", WeekName);
            DA.SelectCommand.Parameters.AddWithValue("@ArUnitName", ArUnitName);
            DA.SelectCommand.Parameters.AddWithValue("@EnUnitName", EnUnitName);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SyllabusDetailedDescriptionGet(string ID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusDetailedDescriptionGet", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }
    public static DataTable SyllabusDetailedDescriptionDelete(string ID, string EmployeeID, string AccreditationDepartmentID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusDetailedDescriptionDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            Da.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable SyllabusActivityAddEdit(string ID, string SyllabusID, string ArActivityName, string EnActivityName, string EmployeeID, string AccreditationDepartmentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusActivityAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DA.SelectCommand.Parameters.AddWithValue("@ArActivityName", ArActivityName);
            DA.SelectCommand.Parameters.AddWithValue("@EnActivityName", EnActivityName);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SyllabusActivityGet(string ID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusActivityGet", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }
    public static DataTable SyllabusActivityDelete(string ID, string EmployeeID, string AccreditationDepartmentID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusActivityDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            Da.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable SyllabusOutcomeAddEdit(string ID, string SyllabusID, string ArOutcome, string EnOutcome, string EmployeeID, string AccreditationDepartmentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusOutcomeAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DA.SelectCommand.Parameters.AddWithValue("@ArOutcome", ArOutcome);
            DA.SelectCommand.Parameters.AddWithValue("@EnOutcome", EnOutcome);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SyllabusOutcomeGet(string ID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusOutcomeGet", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }
    public static DataTable SyllabusOutcomeDelete(string ID, string EmployeeID, string AccreditationDepartmentID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusOutcomeDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            Da.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable SyllabusEvaluationAddEdit(string ID, string SyllabusID, string Name, string Degree, string EmployeeID, string AccreditationDepartmentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusEvaluationAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DA.SelectCommand.Parameters.AddWithValue("@Name", Name);
            DA.SelectCommand.Parameters.AddWithValue("@Degree", Degree);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SyllabusEvaluationGet(string ID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusEvaluationGet", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }
    public static DataTable SyllabusEvaluationDelete(string ID, string EmployeeID, string AccreditationDepartmentID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusEvaluationDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            Da.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }


    //Syllabusfound butUpdate1

    public static DataTable GetSyllabusActivity(string SyllabusID, string AccreditationDepartmentID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetSyllabusActivity", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            Da.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }
    public static DataTable GetSyllabusBook(string SyllabusID, string AccreditationDepartmentID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetSyllabusBook", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            Da.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable GetSyllabusEvaluation(string SyllabusID, string AccreditationDepartmentID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetSyllabusEvaluation", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            Da.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }
    public static DataTable GetSyllabusGoal(string SyllabusID, string AccreditationDepartmentID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetSyllabusGoal", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            Da.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetSyllabusOutcome(string SyllabusID, string AccreditationDepartmentID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetSyllabusOutcome", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            Da.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetSyllabusReference(string SyllabusID, string AccreditationDepartmentID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetSyllabusReference", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            Da.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetSyllabusDetailedDescription(string SyllabusID, string AccreditationDepartmentID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetSyllabusDetailedDescription", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            Da.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }

    public static DataTable LectureIrregularAddEdit(string SectionID, string LectureDate, string LectureTimeFrom, string LectureTimeTo, string EmployeeID)
    {
        using (SqlConnection Connection = GetConnection())
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

    public static DataTable SetFinalMarkIncomplete(string ID, string FinalMark, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetFinalMarkIncomplete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@FinalMark", FinalMark);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable OfficeHourAddEdit(string ID, string InstructorID, string RoomID, string DayID, string FromHour, string ToHour, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("OfficeHourAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@InstructorID", InstructorID);
            DA.SelectCommand.Parameters.AddWithValue("@RoomID", RoomID);
            DA.SelectCommand.Parameters.AddWithValue("@DayID", DayID);
            DA.SelectCommand.Parameters.AddWithValue("@FromHour", FromHour);
            DA.SelectCommand.Parameters.AddWithValue("@ToHour", ToHour);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable OfficeHourGet(string ID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("OfficeHourGet", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable OfficeHourDelete(string ID, string EmployeeID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("OfficeHourDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
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

    public static DataTable AcceptFinalMarkIncomplete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AcceptFinalMarkIncomplete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
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

    public static DataTable GetOfferdCourseMidtermExamDetails2(string DepartmentID, string StudyLevelID, string CourseTypeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetOfferdCourseMidtermExamDetails2", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@StudyLevelID", StudyLevelID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseTypeID", CourseTypeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetCourseHour(string CourseID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetCourseHour", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", CourseID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



    public static DataTable UpdateOfferdCourseMidtermExamDetails(string ID, bool IsMidtermExam, bool IsMidtermEExam, string MidtermExamDate, string MidtermExamTimeFrom1, string MidtermExamTimeTo1, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("UpdateOfferdCourseMidtermExamDetails", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@IsMidtermExam", IsMidtermExam);
            DA.SelectCommand.Parameters.AddWithValue("@IsMidtermEExam", IsMidtermEExam);
            DA.SelectCommand.Parameters.AddWithValue("@MidtermExamDate", MidtermExamDate);
            DA.SelectCommand.Parameters.AddWithValue("@MidtermExamTimeFrom1", MidtermExamTimeFrom1);
            DA.SelectCommand.Parameters.AddWithValue("@MidtermExamTimeTo1", MidtermExamTimeTo1);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID ", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetOfferdCourseMidtermExamDetails2(string SemesterID, string DepartmentID, string StudyLevelID, string CourseTypeID, string BranchID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetOfferdCourseMidtermExamDetails2", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@StudyLevelID", StudyLevelID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseTypeID", CourseTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@BranchID", BranchID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



    public static DataTable CancelOfferdCourseMidtermExamDetails(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CancelOfferdCourseMidtermExamDetails", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }





    #region Haneen_InternalTransformation
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
    //public static DataTable StdInternalTransformationAddEdit(string TransID, string StudentID, string CourseID, string EquivalentWithCourseID, string TransformationReasonID, string EmployeeID)
    //{
    //    using (SqlConnection conn = GetConnection())
    //    {
    //        SqlDataAdapter DA = new SqlDataAdapter("StdInternalTransformationAddEdit", conn);
    //        DA.SelectCommand.CommandType = CommandType.StoredProcedure;
    //        if (TransID != "")
    //            DA.SelectCommand.Parameters.AddWithValue("@ID", TransID);
    //        DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
    //        DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
    //        DA.SelectCommand.Parameters.AddWithValue("@EquivalentWithCourseID", EquivalentWithCourseID);
    //        DA.SelectCommand.Parameters.AddWithValue("@TransformationReasonID", TransformationReasonID);
    //        DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
    //        DataTable DT = new DataTable();
    //        DA.Fill(DT);

    //        return DT;
    //    }
    //}
    // StdInternalTransformationCancel
    public static DataTable StdInternalTransformationCancel(string TransID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StdInternalTransformationCancel", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (TransID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", TransID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);

            return DT;
        }
    }
    public static DataTable InternalTransformationCouresesAdd(string @DepartmentID, string CourseID, string DepartmentID2, string EquivalentWithCourseID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("InternalTransformationCouresesAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID", DepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DA.SelectCommand.Parameters.AddWithValue("@DepartmentID2", DepartmentID2);
            DA.SelectCommand.Parameters.AddWithValue("@EquivalentWithCourseID", EquivalentWithCourseID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



    public static DataTable InternalTransformationAccreditation(string StudentID, string EmployeeID, string AccreditationType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("InternalTransformationAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable InternalTransformationUnaccreditation(string StudentID, string EmployeeID, string AccreditationType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("InternalTransformationUnaccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetStdUnaccrediteInternalTransformation(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdUnaccrediteInternalTransformation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetStdAccrediteInternalTransformation(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdAccrediteInternalTransformation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetStdSemesterMarksReport2(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdSemesterMarksReport2", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable CalculateGPAInternalTransRequestCheck(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CalculateGPAInternalTransRequestCheck", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    #endregion
    public static DataTable GetSectionStudentsMidtermMarks(string SectionID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSectionStudentsMidtermMarks", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable OfficeOfferdCourseAdd(string ID, string SemesterID, string CourseID, string InstructorID, string ExamDate, string ExamTimeFrom, string ExamTimeTo, string EmployeeID)

    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("OfficeOfferdCourseAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DA.SelectCommand.Parameters.AddWithValue("@InstructorID", InstructorID);
            DA.SelectCommand.Parameters.AddWithValue("@ExamDate", ExamDate);
            DA.SelectCommand.Parameters.AddWithValue("@ExamTimeFrom", ExamTimeFrom);
            DA.SelectCommand.Parameters.AddWithValue("@ExamTimeTo", ExamTimeTo);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable OfficeLectureAdd(string SectionID, string CDayID, string FromHour, string ToHour, string EmployeeID)

    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("OfficeLectureAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@CDayID", CDayID);
            DA.SelectCommand.Parameters.AddWithValue("@FromHour", FromHour);
            DA.SelectCommand.Parameters.AddWithValue("@ToHour", ToHour);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetSyllabusIDs(string CollegeID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetSyllabus", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@CollegeID", CollegeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
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

    public static DataTable StdInternalTransformationAddEdit(string ID, string StdSectionID, string EquivalentWithCourseID, string EquivalentWithCourseID2, string TransformationReasonID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StdInternalTransformationAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EquivalentWithCourseID", EquivalentWithCourseID);
            if (EquivalentWithCourseID2 != "")
                DA.SelectCommand.Parameters.AddWithValue("@EquivalentWithCourseID2", EquivalentWithCourseID2);
            DA.SelectCommand.Parameters.AddWithValue("@TransformationReasonID", TransformationReasonID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);

            return DT;
        }
    }

    public static DataTable StdInternalTransformationDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StdInternalTransformationDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SetStdInternalTransformationAccreditation(string StdSectionID, string EmployeeID, string AccreditationType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetStdInternalTransformationAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SetStdInternalTransformationUnAccreditation(string StdSectionID, string EmployeeID, string AccreditationType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetStdInternalTransformationUnAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



    public static DataTable SetStudentInternalTransformationAccreditation(string StudentID, string EmployeeID, string AccreditationType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetStudentInternalTransformationAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SetStudentInternalTransformationUnAccreditation(string StudentID, string EmployeeID, string AccreditationType)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetStudentInternalTransformationUnAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable TransformationCancel(string StudentID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("TransformationCancel", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
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

    public static DataTable SetStdSectionSummerWorkFinalMark(string StdSectionID, string TotalMark, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetStdSectionSummerWorkFinalMark", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@TotalMark", TotalMark);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    #region Student Page

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

    public static DataTable GetStdExternalCSemesterPlanCourses(string PlanID, string StudentID, string CSemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStdExternalCSemesterPlanCourses", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@PlanID", PlanID);
            DA.SelectCommand.Parameters.AddWithValue("@CSemesterID", CSemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
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

    public static DataTable GetStudentCSemesterAcademicGuidence(string StudentID, string CSemesterID)
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

    public static DataTable GetGraduationStudents(string StudentNo, string StudentStatusID, string GraduationStatus, string CollegeID, string ArFirstName, string ArSecoundName, string ArThirdName, string ArFamilyName)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetGraduationStudents", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentNo", StudentNo);
            DA.SelectCommand.Parameters.AddWithValue("@StudentStatusID", StudentStatusID);
            DA.SelectCommand.Parameters.AddWithValue("@GraduationStatus", GraduationStatus);
            DA.SelectCommand.Parameters.AddWithValue("@CollegeID", CollegeID);
            DA.SelectCommand.Parameters.AddWithValue("@ArFirstName", ArFirstName);
            DA.SelectCommand.Parameters.AddWithValue("@ArSecoundName", ArSecoundName);
            DA.SelectCommand.Parameters.AddWithValue("@ArThirdName", ArThirdName);
            DA.SelectCommand.Parameters.AddWithValue("@ArFamilyName", ArFamilyName);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetAcademicGraduationReport(string StudentID, string CSemesterID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetAcademicGraduationReport", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@CSemesterID", CSemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    #endregion

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

    public static DataTable SetMarkUnAccreditationAll(List<string> StdSectionIDs, int AccreditationType)
    {
        using (SqlConnection conn = GetConnection())
        {
            DataTable DT = new DataTable();
            StdSectionIDs.ForEach(x =>
            {

                SqlDataAdapter DA = new SqlDataAdapter("SetMarkUnAccreditation", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", x);
                DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);

                DataTable resualt = new DataTable();
                DA.Fill(resualt);
                DT.Merge(resualt);

            });

            return DT;

        }
    }
    public static DataTable SetMarkAccreditationAll(List<string> StdSectionIDs, int AccreditationType, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection())
        {
            DataTable DT = new DataTable();
            StdSectionIDs.ForEach(x =>
            {

                SqlDataAdapter DA = new SqlDataAdapter("SetMarkAccreditation", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", x);
                DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", AccreditationType);
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);

                DataTable resualt = new DataTable();
                DA.Fill(resualt);
                DT.Merge(resualt);

            });

            return DT;

        }
    }




    public static GetStudentAcademicWarningOutPut GetStudentAcademicWarning(string StudentID)
    {
        WebClient we = new WebClient();
        we.Encoding = Encoding.UTF8;
        var jason = we.DownloadString("https://system.israa.edu.ps/app/GetStudentAcademicWarning?studentId=" + StudentID);
        var objs = JsonConvert.DeserializeObject<GetStudentAcademicWarningOutPut>(jason);
        return objs;

    }


    public static DataTable SetFinalExamSectionEmployees(string FinalExamSectionID, string EmployeeID1, string EmployeeID2)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetFinalExamSectionEmployees", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@FinalExamSectionID", FinalExamSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID1", EmployeeID1);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID2", EmployeeID2);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
}

public class GetStudentAcademicWarningOutPut
{
    public int status { get; set; }
    public string title { get; set; }
    public string AcademicTitle { get; set; }
    public string msg { get; set; }
}