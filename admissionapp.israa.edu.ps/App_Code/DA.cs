using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class DA
{
    private static SqlConnection GetConnection()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["isra"].ToString());
        conn.Open();
        return conn;
    }

    #region Student

    public static DataTable IsValidAdmissionStudent(string StudentNo, string TawjehyNo)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsValidAdmissionStudent", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentNo", StudentNo);
            DA.SelectCommand.Parameters.AddWithValue("@TawjehyNo", TawjehyNo);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

    public static DataTable StudentGet(string ID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentGet", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
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
    public static DataTable StudentAppAccreditate(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StudentAppAccreditate", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
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

    public static int StudentPlacesOfStudyAddEdit(string StudentID, string PlaceOfStudyID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlCommand cmd = new SqlCommand("StudentPlacesOfStudyAddEdit", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StudentID", StudentID);
            cmd.Parameters.AddWithValue("@PlaceOfStudyID", PlaceOfStudyID);
            return cmd.ExecuteNonQuery();
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
    #endregion

    #region Finished

    public static bool IsStudentImageFinished(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsStudentImageFinished", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return (DT.Rows[0]["result"].ToString() == "1");
        }
    }

    public static bool IsStudentWishesFinished(string StudentID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IsStudentWishesFinished", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return (DT.Rows[0]["result"].ToString() == "1");
        }
    }

    #endregion


    public static DataTable StdHowKnowAddEdit(string StudentID, string HowKnowID)
    {
        using (SqlConnection conn = GetConnection())
        {
            SqlDataAdapter DA = new SqlDataAdapter("StdHowKnowAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", StudentID);
            DA.SelectCommand.Parameters.AddWithValue("@HowKnowID", HowKnowID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


}