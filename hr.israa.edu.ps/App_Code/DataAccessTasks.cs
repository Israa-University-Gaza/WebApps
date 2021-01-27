using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

/// <summary>
/// Summary description for DataAccess
/// </summary>
public class DataAccessTasks
{
    private static SqlConnection GetConnection1()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HumanResources"].ToString());
        conn.Open();
        return conn;
    }
    private static SqlConnection GetConnection()
    {
        SqlConnection Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["EmployeeTasks"].ToString());
        Connection.Open();
        return Connection;

    }


    
    public static DataTable AddTasks(string ID,string TaskText, string EmployeeID, string TaskStatusID, DateTime Date, string InsertEmployeeID,string UpdateEmployeeID  )
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("TaskAddEdit", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
            Da.SelectCommand.Parameters.AddWithValue("@ID", ID);
            Da.SelectCommand.Parameters.AddWithValue("@TaskText",TaskText );
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            Da.SelectCommand.Parameters.AddWithValue("@TaskStatusID",TaskStatusID );
            Da.SelectCommand.Parameters.AddWithValue("@Date",Date);
            Da.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", InsertEmployeeID);
            Da.SelectCommand.Parameters.AddWithValue("@UpdateEmployeeID", UpdateEmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }
    
    public static DataTable DeleteTask(string ID, string DeleteEmployeeID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("DeleteTask", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@Id", ID);
            Da.SelectCommand.Parameters.AddWithValue("@DeleteEmployeeID", DeleteEmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable AccreditationTask(string ID, string AccreditationEmployeeID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("AccreditationTask", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@Id", ID);
            Da.SelectCommand.Parameters.AddWithValue("@AccreditationEmployeeID", AccreditationEmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT; }}





    public static DataTable RejectTask(string ID, string RejectEmployeeID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("RejectTask", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@Id", ID);
            Da.SelectCommand.Parameters.AddWithValue("@RejectEmployeeID", RejectEmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }


    }
    public static DataTable EmployeeTaskGet(string ID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("EmployeeTaskGet", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@Id", ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }



    }

    public static DataTable GetTasks(string EmployeeID)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("GetTasks", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

    public static DataTable PrintEmployeeCompleteTasks(string EmployeeID, string FromDate, string ToDate)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("EmployeeCompleteTasksView", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            Da.SelectCommand.Parameters.AddWithValue("@FromDate", FromDate);
            Da.SelectCommand.Parameters.AddWithValue("@ToDate", ToDate);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }

    public static DataTable PrintEmployeeInCompleteTasks(string EmployeeID, string FromDate, string ToDate)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("EmployeeInCompleteTasksView", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            Da.SelectCommand.Parameters.AddWithValue("@FromDate", FromDate);
            Da.SelectCommand.Parameters.AddWithValue("@ToDate", ToDate);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }

    public static DataTable PrintCompleteTasks(string EmployeeID, string MangerID1, string Type1, string Type2, string Type3, string Type4, string FromDate, string ToDate)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("DepartmentCompleteTasksView", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            Da.SelectCommand.Parameters.AddWithValue("@MangerID", MangerID1);
            Da.SelectCommand.Parameters.AddWithValue("@Type1", Type1);
            Da.SelectCommand.Parameters.AddWithValue("@Type2", Type2);
            Da.SelectCommand.Parameters.AddWithValue("@Type3", Type3);
            Da.SelectCommand.Parameters.AddWithValue("@Type4", Type4);
            Da.SelectCommand.Parameters.AddWithValue("@FromDate", FromDate);
            Da.SelectCommand.Parameters.AddWithValue("@ToDate", ToDate);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }


    public static DataTable PrintInCompleteTasks(string EmployeeID, string MangerID2, string Type1, string Type2, string Type3, string Type4, string FromDate, string ToDate)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("DepartmentInCompleteTasksView", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;

            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            Da.SelectCommand.Parameters.AddWithValue("@MangerID", MangerID2);
            Da.SelectCommand.Parameters.AddWithValue("@Type1", Type1);
            Da.SelectCommand.Parameters.AddWithValue("@Type2", Type2);
            Da.SelectCommand.Parameters.AddWithValue("@Type3", Type3);
            Da.SelectCommand.Parameters.AddWithValue("@Type4", Type4);
            Da.SelectCommand.Parameters.AddWithValue("@FromDate", FromDate);
            Da.SelectCommand.Parameters.AddWithValue("@ToDate", ToDate);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }
    public static DataTable GetDepartmentName( string MangerID,string DepID1, string DepID2, string DepID3, string DepID4)
        {
            using (SqlConnection Connection = GetConnection())
            {
                SqlDataAdapter Da = new SqlDataAdapter("GetDepartmentName", Connection);
                Da.SelectCommand.CommandType = CommandType.StoredProcedure;
                Da.SelectCommand.Parameters.AddWithValue("@ManagerID",MangerID);
                Da.SelectCommand.Parameters.AddWithValue("@DepID1", DepID1);
                Da.SelectCommand.Parameters.AddWithValue("@DepID2", DepID2);
                Da.SelectCommand.Parameters.AddWithValue("@DepID3", DepID3);
                Da.SelectCommand.Parameters.AddWithValue("@DepID4", DepID4);
                DataTable DT = new DataTable();
                Da.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetManger(string EmployeeID)
        {
            using (SqlConnection conn = GetConnection1())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetManger", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("EmployeeID",EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

    public static DataTable NoTasks(string FromDate, string ToDate)
    {
        using (SqlConnection Connection = GetConnection())
        {
            SqlDataAdapter Da = new SqlDataAdapter("NoTasks", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@FromDate", FromDate);
            Da.SelectCommand.Parameters.AddWithValue("@ToDate", ToDate);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }
}