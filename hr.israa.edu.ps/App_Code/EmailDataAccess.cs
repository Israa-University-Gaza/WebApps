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

public class EmailDataAccess
{
    private static SqlConnection GetConnection3()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["isra3"].ToString());
        conn.Open();
        return conn;
    }


    public static DataTable EmployeeEmailAddEdit(string ID, string EmployeeID, string Nickname, string EmailID, string Email, string Password, string InsertUserID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeEmailAddEdit", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;

            if (ID != "")
                DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@Nickname", Nickname);
            DA.SelectCommand.Parameters.AddWithValue("@EmailID", EmailID);
            DA.SelectCommand.Parameters.AddWithValue("@Email", Email);
            DA.SelectCommand.Parameters.AddWithValue("@Password", Password);
            DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertUserID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }


    public static DataTable EmployeeEmailDelete(string ID, string EmployeeID)
    {
        using (SqlConnection conn = GetConnection3())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeEmailDelete", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@ID", ID);
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }

}

