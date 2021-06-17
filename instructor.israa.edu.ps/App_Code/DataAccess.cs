using Newtonsoft.Json;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Text;

public class DataAccess
{
    private static SqlConnection GetConnectionIsraaAcademic()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaAcademic"].ToString());
        conn.Open();
        return conn;
    }
    private static SqlConnection GetConnectionIsraPermissions()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraPermissions"].ToString());
        conn.Open();
        return conn;
    }
    private static SqlConnection GetConnectionIsraaEExam()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaEExam"].ToString());
        conn.Open();
        return conn;
    }

    private static SqlConnection GetConnectionIsraaStudentAttendance()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaStudentAttendance"].ToString());
        conn.Open();
        return conn;
    }

    private static SqlConnection GetConnectionIsraaEvaluation()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaEvaluation"].ToString());
        conn.Open();
        return conn;
    }

    private static SqlConnection GetConnectionIsraaEmploymentExam()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaEmploymentExam"].ToString());
        conn.Open();
        return conn;
    }


    private static SqlConnection GetConnectionIsraaHumanResource()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaHumanResource"].ToString());
        conn.Open();
        return conn;
    }


    #region UserLogin

    public static DataTable IsValidEmployee(string EmployeeNo, string Password)
    {
        using (SqlConnection conn = GetConnectionIsraPermissions())
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

    public static DataTable IsInstructorEmployee(string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsInstructorEmployee", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetEmployeeData(string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraPermissions())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeData", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable EmployeeImageGet(string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeImageGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable EmpChangePassword(string EmployeeID, string OldPassword, string NewPassword)
    {
        using (SqlConnection conn = GetConnectionIsraPermissions())
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

    #endregion

    #region CoursePart

    public static DataTable CoursePartGet(string ID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CoursePartGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int CoursePartAddEdit(string ID, string CourseID, string PartName, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlCommand cmd = new SqlCommand("CoursePartAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@CourseID", CourseID);
            cmd.Parameters.AddWithValue("@PartName", PartName);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static int CoursePartActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlCommand cmd = new SqlCommand("CoursePartActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static int CoursePartDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlCommand cmd = new SqlCommand("CoursePartDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region Question

    public static DataTable QuestionGet(string ID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("QuestionGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable QuestionAddEdit(string ID, string QuestionText, string CourseID, string CoursePartID, string QuestionTypeID, string QuestionHardnessID, string LanguageID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("QuestionAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@QuestionText", QuestionText);
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DA.SelectCommand.Parameters.AddWithValue("@CoursePartID", CoursePartID);
            DA.SelectCommand.Parameters.AddWithValue("@QuestionTypeID", QuestionTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@QuestionHardnessID", QuestionHardnessID);
            DA.SelectCommand.Parameters.AddWithValue("@LanguageID", LanguageID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int QuestionActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlCommand cmd = new SqlCommand("QuestionActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static int QuestionDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlCommand cmd = new SqlCommand("QuestionDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable GetQuestionAnswers(string QuestionID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetQuestionAnswers", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@QuestionID", QuestionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region QuestionAnswer

    public static DataTable QuestionAnswerGet(string ID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("QuestionAnswerGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable QuestionAnswerAddEdit(string ID, string QuestionID, string AnswerText, bool IsCourrectAnswer, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("QuestionAnswerAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@QuestionID", QuestionID);
            DA.SelectCommand.Parameters.AddWithValue("@AnswerText", AnswerText);
            DA.SelectCommand.Parameters.AddWithValue("@IsCourrectAnswer", IsCourrectAnswer);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int QuestionAnswerActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlCommand cmd = new SqlCommand("QuestionAnswerActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static int QuestionAnswerDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlCommand cmd = new SqlCommand("QuestionAnswerDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region ExamForm
    public static DataTable ExamFormGet(string ID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExamFormGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable ExamFormAddEdit(string ID, string CourseID, string ExamCategoryID, string Name, string ExamFormType, string ExamLanguage, string TotalMark, string TimePeriod, string AllowFinish, string CountOfQuestions, string ExamDateBeginning, string ExamDateEnd, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExamFormAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DA.SelectCommand.Parameters.AddWithValue("@ExamCategoryID", ExamCategoryID);
            DA.SelectCommand.Parameters.AddWithValue("@Name", Name);
            DA.SelectCommand.Parameters.AddWithValue("@ExamFormType", ExamFormType);
            DA.SelectCommand.Parameters.AddWithValue("@ExamLanguage", ExamLanguage);
            DA.SelectCommand.Parameters.AddWithValue("@TotalMark", TotalMark);
            DA.SelectCommand.Parameters.AddWithValue("@TimePeriod", TimePeriod);
            DA.SelectCommand.Parameters.AddWithValue("@AllowFinish", AllowFinish);
            DA.SelectCommand.Parameters.AddWithValue("@CountOfQuestions", CountOfQuestions);
            DA.SelectCommand.Parameters.AddWithValue("@ExamBeginning", ExamDateBeginning);
            DA.SelectCommand.Parameters.AddWithValue("@ExamEnd", ExamDateEnd);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int ExamFormActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlCommand cmd = new SqlCommand("ExamFormActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static int ExamFormDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlCommand cmd = new SqlCommand("ExamFormDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region ExamFormDetails
    public static DataTable ExamFormDetailsGet(string ID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExamFormDetailsGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable ExamFormDetailsAddEdit(string ID, string ExamFormID, string CoursePartID, string QuestionTypeID, string QuestionHardnessID, string CountOfQuestions, string Weight, string TimePeriod, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExamFormDetailsAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@ExamFormID", ExamFormID);
            DA.SelectCommand.Parameters.AddWithValue("@CoursePartID", CoursePartID);
            DA.SelectCommand.Parameters.AddWithValue("@QuestionTypeID", QuestionTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@QuestionHardnessID", QuestionHardnessID);
            DA.SelectCommand.Parameters.AddWithValue("@CountOfQuestions", CountOfQuestions);
            DA.SelectCommand.Parameters.AddWithValue("@Weight", Weight);
            DA.SelectCommand.Parameters.AddWithValue("@TimePeriod", TimePeriod);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static int ExamFormDetailsActivate(string ID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlCommand cmd = new SqlCommand("ExamFormDetailsActivate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }
    public static int ExamFormDetailsDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlCommand cmd = new SqlCommand("ExamFormDetailsDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region ExamFormQuestions

    public static DataTable ExamFormQuestionsAddEdit(string ID, string ExamFormID, string QuestionID, string Mark, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("ExamFormQuestionsAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@ExamFormID", ExamFormID);
            DA.SelectCommand.Parameters.AddWithValue("@QuestionID", QuestionID);
            DA.SelectCommand.Parameters.AddWithValue("@Mark", Mark);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int ExamFormQuestionsDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlCommand cmd = new SqlCommand("ExamFormQuestionsDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion

    #region StudentExam
    public static DataTable GenerateStudentExam(string EmployeeID, string StudentID, string ExamFormID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GenerateStudentExam", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@ExamFormID", ExamFormID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable CorrectStudentExamQuestion(string ID, string ResultMark)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CorrectStudentExamQuestion", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@ResultMark", ResultMark);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable CorrectApplicantExamQuestion(string ID, string ResultMark)
    {
        using (SqlConnection conn = GetConnectionIsraaEmploymentExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CorrectApplicantExamQuestion", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@ResultMark", ResultMark);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }



    public static DataTable CalculateStudentExamMarks(string StudentExamID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CalculateStudentExamMarks", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentExamID", StudentExamID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable CalculateApplicantExamMarks(string StudentExamID)
    {
        using (SqlConnection conn = GetConnectionIsraaEmploymentExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CalculateApplicantExamMarks", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ApplicantExamID", StudentExamID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable CorrectStudentExam(string StudentExamID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CorrectStudentExam", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentExamID", StudentExamID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetExamFormStudentsExams(string ExamFormID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetExamFormStudentsExams", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ExamFormID", ExamFormID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable DeleteStudentExam(string StudentExamID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("DeleteStudentExam", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentExamID", StudentExamID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region TeacherStudyTable

    public static DataTable GetTeacherStudyTable(string EmployeeID, string PTEmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetTeacherStudyTable", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            if (PTEmployeeID != "")
                DA.SelectCommand.Parameters.AddWithValue("@PTEmployeeID", PTEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetTeacherStudyTableInfo(string EmployeeID, string PTEmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetTeacherStudyTableInfo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            if (PTEmployeeID != "")
                DA.SelectCommand.Parameters.AddWithValue("@PTEmployeeID", PTEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region SectionStudents

    public static DataTable GetSectionStudents(string SectionID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
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
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSectionStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region SectionAttendanceStudent

    public static DataTable AttendanceStudentAddEdit(string AttendanceStudentID, string AttendanceLectrueID, string StudentID, bool IsExist, bool IsNoProblem, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaStudentAttendance())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AttendanceStudentAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (AttendanceStudentID != "0")
                DA.SelectCommand.Parameters.AddWithValue("@AttendanceStudentID", AttendanceStudentID);
            DA.SelectCommand.Parameters.AddWithValue("@AttendanceLectrueID", AttendanceLectrueID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@IsExist", IsExist);
            DA.SelectCommand.Parameters.AddWithValue("@IsNoProblem", IsNoProblem);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetSectionAttendanceStudentStatistics(string SectionID)
    {
        using (SqlConnection conn = GetConnectionIsraaStudentAttendance())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSectionAttendanceStudentStatistics", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region StudentsMarks

    public static DataTable SetStdSectionMidtermMark(string StdSectionID, string MidtermMark, bool IsMidtermNoMark, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetStdSectionMidtermMark", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@MidtermMark", MidtermMark);
            DA.SelectCommand.Parameters.AddWithValue("@IsMidtermNoMark", IsMidtermNoMark);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable SetMarkAccreditation(string StdSectionID, string AccreditationType, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
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



    public static DataTable SetStdSectionMark(string StdSectionID, string WorkMark, string MidtermMark, string FinalMark, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetStdSectionMark", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@WorkMark", WorkMark);
            DA.SelectCommand.Parameters.AddWithValue("@MidtermMark", MidtermMark);
            DA.SelectCommand.Parameters.AddWithValue("@FinalMark", FinalMark);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetStdSectionFinalMark(string StdSectionID, string FinalMark, bool IsFinalNoMark, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetStdSectionFinalMark", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@FinalMark", FinalMark);
            DA.SelectCommand.Parameters.AddWithValue("@IsFinalNoMark", IsFinalNoMark);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetStdSectionWorkFinalMark(string StdSectionID, string WorkMark, string FinalMark, bool IsFinalNoMark, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetStdSectionWorkFinalMark", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@WorkMark", WorkMark);
            DA.SelectCommand.Parameters.AddWithValue("@FinalMark", FinalMark);
            DA.SelectCommand.Parameters.AddWithValue("@IsFinalNoMark", IsFinalNoMark);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SetSectionMarkAccreditation(string SectionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic()) /* by RSR */
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetSectionMarkAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", 1);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetSectionStudentsMarks(string SectionID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSectionStudentsMarks", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetSectionStudentsMidtermMarks(string SectionID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSectionStudentsMidtermMarks", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetSectionMarkTitle(string SectionID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetSectionMarkTitle", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AcceptRegictMarkRevisionRequest(string ID, bool AcceptRequest, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AcceptRegictMarkRevisionRequest", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@AcceptRequest", AcceptRequest);
            DA.SelectCommand.Parameters.AddWithValue("@RegictRequest", !AcceptRequest);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AcceptMarkRevisionRequest(string ID, string WorkMark, string FinalMark, string UpdateReason, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AcceptMarkRevisionRequest", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@WorkMark", WorkMark);
            DA.SelectCommand.Parameters.AddWithValue("@FinalMark", FinalMark);
            DA.SelectCommand.Parameters.AddWithValue("@UpdateReason", UpdateReason);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AcceptMidtermMarkRevisionRequest(string ID, string MidtermMark, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AcceptMidtermMarkRevisionRequest", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@MidtermMark", MidtermMark);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region WorkMarks

    public static DataTable WorkMarkAddEdit(string StdSectionID, string Mark1, string Mark2, string Mark3, string Mark4, string Mark5, string Mark6, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("WorkMarkAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            if (Mark1 != "")
                DA.SelectCommand.Parameters.AddWithValue("@Mark1", Mark1);
            if (Mark2 != "")
                DA.SelectCommand.Parameters.AddWithValue("@Mark2", Mark2);
            if (Mark3 != "")
                DA.SelectCommand.Parameters.AddWithValue("@Mark3", Mark3);
            if (Mark4 != "")
                DA.SelectCommand.Parameters.AddWithValue("@Mark4", Mark4);
            if (Mark5 != "")
                DA.SelectCommand.Parameters.AddWithValue("@Mark5", Mark5);
            if (Mark6 != "")
                DA.SelectCommand.Parameters.AddWithValue("@Mark6", Mark6);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable SetWorkMarkAccreditation(string SectionID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SetWorkMarkAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationTypeID", 1);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    #endregion

    public static DataTable StudentImageGet(string StudentID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentImageGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable UpdateReminingTime(string StudentExamID, string ReminingTime)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("UpdateReminingTime", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentExamID", StudentExamID);
            DA.SelectCommand.Parameters.AddWithValue("@ReminingTime", ReminingTime);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #region Evaluation
    public static DataTable EvaluationLecturerResultInAllSections(string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEvaluation())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EvaluationLecturerResultInAllSections", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #endregion

    #region Syllabus
    public static DataTable SyllabusGet(string ID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SyllabusGeneralDescriptionUpdate(string ID, string ArGeneralDescription, string EnGeneralDescription, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusGeneralDescriptionUpdate", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SyllabusID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@ArGeneralDescription", ArGeneralDescription);
            DA.SelectCommand.Parameters.AddWithValue("@EnGeneralDescription", EnGeneralDescription);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable SyllabusGoalAddEdit(string ID, string SyllabusID, string ArGoal, string EnGoal, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusGoalAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DA.SelectCommand.Parameters.AddWithValue("@ArGoal", ArGoal);
            DA.SelectCommand.Parameters.AddWithValue("@EnGoal", EnGoal);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SyllabusGoalGet(string ID)
    {
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusGoalGet", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }
    public static DataTable SyllabusGoalDelete(string ID, string EmployeeID)
    {
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusGoalDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable SyllabusBookAddEdit(string ID, string SyllabusID, string BookName, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusBookAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DA.SelectCommand.Parameters.AddWithValue("@BookName", BookName);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SyllabusBookDelete(string ID, string EmployeeID)
    {
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusBookDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable SyllabusReferenceAddEdit(string ID, string SyllabusID, string Reference, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusReferenceAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DA.SelectCommand.Parameters.AddWithValue("@Reference", Reference);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SyllabusReferenceDelete(string ID, string EmployeeID)
    {
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusReferenceDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable SyllabusDetailedDescriptionAddEdit(string ID, string SyllabusID, string WeekName, string ArUnitName, string EnUnitName, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
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
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SyllabusDetailedDescriptionGet(string ID)
    {
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusDetailedDescriptionGet", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }
    public static DataTable SyllabusDetailedDescriptionDelete(string ID, string EmployeeID)
    {
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusDetailedDescriptionDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable SyllabusActivityAddEdit(string ID, string SyllabusID, string ArActivityName, string EnActivityName, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusActivityAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DA.SelectCommand.Parameters.AddWithValue("@ArActivityName", ArActivityName);
            DA.SelectCommand.Parameters.AddWithValue("@EnActivityName", EnActivityName);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SyllabusActivityGet(string ID)
    {
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusActivityGet", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }
    public static DataTable SyllabusActivityDelete(string ID, string EmployeeID)
    {
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusActivityDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable SyllabusOutcomeAddEdit(string ID, string SyllabusID, string ArOutcome, string EnOutcome, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusOutcomeAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DA.SelectCommand.Parameters.AddWithValue("@ArOutcome", ArOutcome);
            DA.SelectCommand.Parameters.AddWithValue("@EnOutcome", EnOutcome);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SyllabusOutcomeGet(string ID)
    {
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusOutcomeGet", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }
    public static DataTable SyllabusOutcomeDelete(string ID, string EmployeeID)
    {
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusOutcomeDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable SyllabusEvaluationAddEdit(string ID, string SyllabusID, string Name, string Degree, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusEvaluationAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DA.SelectCommand.Parameters.AddWithValue("@Name", Name);
            DA.SelectCommand.Parameters.AddWithValue("@Degree", Degree);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable SyllabusEvaluationGet(string ID)
    {
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusEvaluationGet", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }
    public static DataTable SyllabusEvaluationDelete(string ID, string EmployeeID)
    {
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SyllabusEvaluationDelete", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }

    public static DataTable SyllabusAccredit(string SyllabusID, string AccreditationDepartmentID, string AccreditationTypeID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("SyllabusAccredit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationDepartmentID", AccreditationDepartmentID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationTypeID", AccreditationTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@AccerdationEmployeeID ", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@PlaceID ", "1");
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    //Report

    public static DataTable GetSyllabus(string ID)
    {
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
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
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
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
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
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
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
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
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
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
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
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
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
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
        using (SqlConnection Connection = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetSyllabusDetailedDescription", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@SyllabusID", SyllabusID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }

    #endregion


    public static DataTable JobQuestionAddEdit(string ID, string QuestionText, string JobID, string QuestionTypeID, string QuestionHardnessID, string LanguageID, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEmploymentExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("QuestionAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@QuestionText", QuestionText);
            DA.SelectCommand.Parameters.AddWithValue("@JobID", JobID);
            DA.SelectCommand.Parameters.AddWithValue("@QuestionTypeID", QuestionTypeID);
            DA.SelectCommand.Parameters.AddWithValue("@QuestionHardnessID", QuestionHardnessID);
            DA.SelectCommand.Parameters.AddWithValue("@LanguageID", LanguageID);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    public static DataTable JobQuestionAnswerAddEdit(string ID, string QuestionID, string AnswerText, bool IsCourrectAnswer, bool IsActive, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("QuestionAnswerAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@QuestionID", QuestionID);
            DA.SelectCommand.Parameters.AddWithValue("@AnswerText", AnswerText);
            DA.SelectCommand.Parameters.AddWithValue("@IsCourrectAnswer", IsCourrectAnswer);
            DA.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable GetJobQuestionAnswers(string QuestionID)
    {
        using (SqlConnection conn = GetConnectionIsraaEExam())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetQuestionAnswers", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@QuestionID", QuestionID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable CourseBookAdd(string EmployeeID, string SemesterID, string CourseID, string BookName, string FileName)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("CourseBookAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("CourseID", CourseID);
            DA.SelectCommand.Parameters.AddWithValue("BookName", BookName);
            DA.SelectCommand.Parameters.AddWithValue("FileName", FileName);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #region LectureIrregular

    public static DataTable LectureIrregularGet(string ID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("LectureIrregularGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable LectureIrregularAddEdit(string ID, string SemesterID, string EmployeeID, string SectionID, string LectureID, string RoomID, string LectureDate, string LectureTimeFrom, string LectureTimeTo, string InsertEmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlDataAdapter DA = new SqlDataAdapter("LectureIrregularAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@SectionID", SectionID);
            DA.SelectCommand.Parameters.AddWithValue("@LectureID", LectureID);
            DA.SelectCommand.Parameters.AddWithValue("@RoomID", RoomID);
            DA.SelectCommand.Parameters.AddWithValue("@LectureDate", LectureDate);
            DA.SelectCommand.Parameters.AddWithValue("@LectureTimeFrom", LectureTimeFrom);
            DA.SelectCommand.Parameters.AddWithValue("@LectureTimeTo", LectureTimeTo);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertEmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static int LectureIrregularDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnectionIsraaAcademic())
        {
            SqlCommand cmd = new SqlCommand("LectureIrregularDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            return cmd.ExecuteNonQuery();
        }
    }

    #endregion


    #region API

    public static IOrderedEnumerable<StudentMarkDto> ListviewResult(string sectionID)
    {
        if (!string.IsNullOrEmpty(sectionID))
        {
            WebClient we = new WebClient();
            we.Encoding = Encoding.UTF8;
            //try
            //{
                //var jason = we.DownloadString("https://system.israa.edu.ps/app/GetSectionStudentsMarks?sectionID=" + sectionID);
                var jason = we.DownloadString("https://api.israa.edu.ps/students/GetSectionStudentsMarks.php?sectionID=" + sectionID);
                var objs = JsonConvert.DeserializeObject<IEnumerable<StudentMarkDto>>(jason);
                var data = from s in objs
                           orderby s.StudentName
                           select s;
                return data;
            //}
            //catch
            //{

            //}
        }
        return null;
    }

    #endregion
}