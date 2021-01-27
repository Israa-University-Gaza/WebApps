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
public class myDA
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


    public static  DataTable GetAllIssues(int startindex,int pagesize, string ProgramID, string CollegeID, string DepartmentID, string IssueStatusID, string ArFirstName, string ArSecoundName, string ArThirdName, string ArFamilyName, string IssueID, string StudentNO)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("IssuesSearchPaging", conn);
            DA.SelectCommand.CommandTimeout = 120;
            DA.SelectCommand.Parameters.AddWithValue("@startindex", startindex);
            DA.SelectCommand.Parameters.AddWithValue("@pagesize", pagesize);
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

    public static string GetAllIssuesCount( string ProgramID, string CollegeID, string DepartmentID, string IssueStatusID, string ArFirstName, string ArSecoundName, string ArThirdName, string ArFamilyName, string IssueID, string StudentNO)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("GetAllIssuesCount", conn);
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
            return DT.Rows[0][0].ToString();
        }
    }

}