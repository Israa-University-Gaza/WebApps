using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

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
    private static SqlConnection GetConnectionData()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["isra2"].ToString());
        conn.Open();
        return conn;
    }

    private static SqlConnection GetConnection2()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["isra3"].ToString());
        conn.Open();
        return conn;
    }
    private static SqlConnection GetConnection4()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["isra4"].ToString());
        conn.Open();
        return conn;
    }

    private static SqlConnection GetConnection5()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaStudentAttendance"].ToString());
        conn.Open();
        return conn;
    }

    private static SqlConnection GetConnection6()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaEvaluation"].ToString());
        conn.Open();
        return conn;
    }

    private static SqlConnection GetConnection7()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaStudentIssue"].ToString());
        conn.Open();
        return conn;
    }

    public static DataTable HelpRequestAdd(string ID, string StudentID, string HelpType,
    string FamilyCountNo, string UnivStudentNo, string FamilySchoolNo, string SpecialNeedsNo, string FatherWork, string MotherWork, string IsPerentDead,
     string FamilyIncome, string SocialCaseType, string HouseType, string RentValue, string FurnitureStatus, string BulidingType, string BulidingStatus,
        string BulidingArea, string HouseNature, string ResidencePlace, string Others)
    {
        using (SqlConnection conn = GetConnectionData())
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


            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable LoanRequestAdd(string ID, string StudentID,
   string FamilyCountNo, string UnivStudentNo, string FamilySchoolNo, string SpecialNeedsNo, string FatherWork, string MotherWork, string IsPerentDead,
    string FamilyIncome, string SocialCaseType, string Others, string HouseDescription, string HelpType, string HelpOrganization, string HelpValue)
    {
        using (SqlConnection conn = GetConnectionData())
        {
            SqlDataAdapter DA = new SqlDataAdapter("LoanRequestAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;


            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@FamilyCountNo", FamilyCountNo);
            DA.SelectCommand.Parameters.AddWithValue("@UnivStudentNo", UnivStudentNo);
            DA.SelectCommand.Parameters.AddWithValue("@FamilySchoolNo", FamilySchoolNo);
            DA.SelectCommand.Parameters.AddWithValue("@SpecialNeedsNo", SpecialNeedsNo);
            DA.SelectCommand.Parameters.AddWithValue("@FatherWork", FatherWork);
            DA.SelectCommand.Parameters.AddWithValue("@MotherWork", MotherWork);
            DA.SelectCommand.Parameters.AddWithValue("@IsPerentDead", IsPerentDead);
            DA.SelectCommand.Parameters.AddWithValue("@FamilyIncome", FamilyIncome);
            DA.SelectCommand.Parameters.AddWithValue("@SocialCaseType", SocialCaseType);
            DA.SelectCommand.Parameters.AddWithValue("@Others", Others);
            DA.SelectCommand.Parameters.AddWithValue("@HouseDescription", HouseDescription);
            if (HelpType != "")
            {
                DA.SelectCommand.Parameters.AddWithValue("@HelpType", HelpType);
                DA.SelectCommand.Parameters.AddWithValue("@HelpOrganization", HelpOrganization);
                DA.SelectCommand.Parameters.AddWithValue("@HelpValue", HelpValue);
            }
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    #region bookLibrary
    public static DataTable StudentNotify(string StudentID)
    {
        using (SqlConnection conn = GetConnection4())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentNotify", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ClientID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
    #endregion


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

    public static DataTable IsValidStudent(string StudentNo, string Password)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsValidStudent", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentNo", StudentNo);
            DA.SelectCommand.Parameters.AddWithValue("@Password", Password);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentMessengerAccountLinking(string StudentNo, string Password)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentMessengerAccountLinking", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentNo", StudentNo);
            DA.SelectCommand.Parameters.AddWithValue("@Password", Password);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StdChangePassword(string StudentID, string OldPassword, string NewPassword)
    {
        using (SqlConnection conn = GetConnection2())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StdChangePassword", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@OldPassword", OldPassword);
            DA.SelectCommand.Parameters.AddWithValue("@NewPassword", NewPassword);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

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

    public static bool TransformationIsAccreditation(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("TransformationIsAccreditation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@AccreditationType", 4);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return (DT.Rows[0]["status"].ToString()).Equals("1");
        }
    }

    public static DataTable RegisterCourse1(string StudentID, string SemesterID, string SectionID, string SectionID2, string SectionID3, string RStudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("RegisterCourse1", conn);
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

    public static DataTable RemoveCourse(string StdSectionID, string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("RemoveCourse", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #region Student

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
        string SSN, string Passport, string PlaceOfBirth, DateTime DateOfBirth, string CNationalityID, string CReligionID, string MotherName, string FatherSSN, string CStatusID, string NextSSN, string Gender)
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

    public static int CompleteStudentData(string StudentID,string houseTypeId,bool isDeadFather,string StdCitizenOrRef,string StdOriginalTown,
        bool HaveOtherNationality,string OtherNationalityName,string FamilyNo,string univStdsNo,string FamilySerialNo,string FIncome,
        string FurStatusId,bool HavePrisoner,string PrisonerName,bool HaveMartyr,string MartyrName)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("CompleteStudentData", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StudentID", StudentID);
            cmd.Parameters.AddWithValue("@HouseTypeId", Convert.ToInt32(houseTypeId));
            cmd.Parameters.AddWithValue("@isDeadFather", Convert.ToBoolean(isDeadFather));
            cmd.Parameters.AddWithValue("@StdCitizenOrRefId", Convert.ToInt32(StdCitizenOrRef));
            cmd.Parameters.AddWithValue("@StdOriginalTown", StdOriginalTown);
            cmd.Parameters.AddWithValue("@HaveOtherNationality", Convert.ToBoolean(HaveOtherNationality));
            cmd.Parameters.AddWithValue("@OtherNationalityName", OtherNationalityName);
            cmd.Parameters.AddWithValue("@FamilyNo", Convert.ToInt32(FamilyNo));
            cmd.Parameters.AddWithValue("@univStdsNo", Convert.ToInt32(univStdsNo));
            cmd.Parameters.AddWithValue("@FamilySerialNo", Convert.ToInt32(FamilySerialNo));
            cmd.Parameters.AddWithValue("@FIncome", Convert.ToDouble(FIncome));
            cmd.Parameters.AddWithValue("@FurStatusId", Convert.ToInt32(FurStatusId));
            cmd.Parameters.AddWithValue("@HavePrisoner", Convert.ToBoolean(HavePrisoner));
            cmd.Parameters.AddWithValue("@PrisonerName", PrisonerName);
            cmd.Parameters.AddWithValue("@HaveMartyr", Convert.ToBoolean(HaveMartyr));
            cmd.Parameters.AddWithValue("@MartyrName", MartyrName);

            return cmd.ExecuteNonQuery();
        }
    }


    public static int IsStudentDataFinished(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsStudentDataFinished", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return Convert.ToInt32(DT.Rows[0][0].ToString());
        }
    }
    public static DataTable GetAttendanceWarning(string ID)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetAttendanceWarning", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable AddEvaluationQuestionAnswer(string StdSectionID, DataTable EvaluationQuestionAnswer, string StudentID)
    {
        using (SqlConnection conn = GetConnection6())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddEvaluationQuestionAnswer", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StdSectionID", StdSectionID);
            DA.SelectCommand.Parameters.AddWithValue("@EvaluationQuestionAnswer", EvaluationQuestionAnswer);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static bool IsStudentFinishEvaluation(string StudentID)
    {
        using (SqlConnection conn = GetConnection6())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsStudentFinishEvaluation", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT.Rows[0]["status"].ToString() == "1";
        }
    }

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


    public static DataTable StudentIssueAddEdit(string ID, string IssueID, string StudentID, string Describtion, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection7())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentIssueAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@IssueID", IssueID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@Describtion", Describtion);
            DA.SelectCommand.Parameters.AddWithValue("@UserID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable GetIssue(string ID)
    {
        using (SqlConnection conn = GetConnection7())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetIssue", conn);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }

    public static DataTable DeleteIssue(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection7())
        {
            SqlDataAdapter Da = new SqlDataAdapter("DeleteIssue", conn);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }

    // haneen
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

    public static DataTable AddStdPollAnswer(string StudentID, string OfferdPollID, string PollAnswerID)
    {
        using (SqlConnection conn = GetConnection6())
        {
            SqlDataAdapter DA = new SqlDataAdapter("AddStdPollAnswer", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@OfferdPollID", OfferdPollID);
            DA.SelectCommand.Parameters.AddWithValue("@PollAnswerID", PollAnswerID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static bool IsStudentHavePoll(string StudentID)
    {
        using (SqlConnection conn = GetConnection6())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsStudentHavePoll", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT.Rows[0]["status"].ToString() == "1";
        }
    }

    public static DataTable StudentCourseAdd(string SemesterID, string StudentID, string OfferdCourseID, string CourseID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentCourseAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@OfferdCourseID", OfferdCourseID);
            DA.SelectCommand.Parameters.AddWithValue("@CourseID", CourseID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentCourseDelete(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentCourseDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentBankInstallmentAdd(string StudentID, string SemesterID, string BankBranchID)
    {
        using (SqlConnection conn = GetConnectionData())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentBankInstallmentAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DA.SelectCommand.Parameters.AddWithValue("@BankBranchID", BankBranchID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable IsHaveStudentBankInstallment(string StudentID, string SemesterID)
    {
        using (SqlConnection conn = GetConnectionData())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsHaveStudentBankInstallment", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@SemesterID", SemesterID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentBankInstallmentGet(string ID)
    {
        using (SqlConnection conn = GetConnectionData())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentBankInstallmentGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    #region Installment
    public static DataTable GetStudentCoursesStatistics(string ID)
    {
        using (SqlConnection conn = GetConnection())
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
        using (SqlConnection conn = GetConnectionData())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentLoans", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable InstallmentOrderStudentAdd(string ID,string NumOfHours,string PaidAmount,string RemainingAmount,string LastFinancialPayment)
        {
            using (SqlConnection conn = GetConnectionData())
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
        using (SqlConnection conn = GetConnectionData())
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
        using (SqlConnection conn = GetConnectionData())
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
    public static DataTable SetIsReadUnRole(bool IsReadUnRole, string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("SetIsReadUnRole", conn);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@IsReadUnRole", IsReadUnRole);
            Da.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }

    public static DataTable IsStudentReadUnRole(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsStudentReadUnRole", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

 public static GetStudentAcademicWarningOutPut GetStudentAcademicWarning(string StudentID)
    {


        WebClient we = new WebClient();
        we.Encoding = Encoding.UTF8;
        var jason = we.DownloadString("https://system.israa.edu.ps/app/GetStudentAcademicWarning?studentId=" + StudentID);
        var objs = JsonConvert.DeserializeObject<GetStudentAcademicWarningOutPut>(jason);

        if (objs.IsRegestedCurrentSemester)
            objs.status = 0;
        return objs;

    }

 public static DataTable GetStudentInfo(string StudentID)
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


 public static DataTable AddGraduationCost(string StudentID)
 {
     using (SqlConnection conn = GetConnectionData())
     {
         SqlDataAdapter DA = new SqlDataAdapter("AddGraduationCost", conn);
         DA.SelectCommand.CommandType = CommandType.StoredProcedure;
         DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
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

    public bool IsRegestedCurrentSemester { get; set; }

}

