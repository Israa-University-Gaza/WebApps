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

public class EmployeeFacebookDA
{
    private static SqlConnection GetConnection5()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaHumanResource"].ToString());
        conn.Open();
        return conn;
    }
    
    public static DataTable EmployeeFacebookAdd(string EmployeeID, string FacebookID, string FacebookName)
    {
        using (SqlConnection conn = GetConnection5())
        {
            SqlDataAdapter DA = new SqlDataAdapter("EmployeeFacebookAdd", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DA.SelectCommand.Parameters.AddWithValue("@FacebookID", FacebookID);
            DA.SelectCommand.Parameters.AddWithValue("@FacebookName", FacebookName);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            return DT;
        }
    }
}

