using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;


public class TelephoneDataAccess
{
    private static SqlConnection GetConnection5()
    {
        SqlConnection Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Telephone"].ToString());
        Connection.Open();
        return Connection;

	}
    //This function For AddTelephone
    public static DataTable AddTelephone(string ID, string TelephoneNum, string EmployeeID, Boolean IsActive,string InsertEmployeeID)
    {
        using (SqlConnection Connection = GetConnection5())
        {
            SqlDataAdapter Da = new SqlDataAdapter("TelephoneAddEdit", Connection);//بعطيه اسم البروسيجير واللكونكشن الي عملته انا 
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (ID != "")
                Da.SelectCommand.Parameters.AddWithValue("@ID",ID);
            Da.SelectCommand.Parameters.AddWithValue("@TelephoneNum", TelephoneNum);
            Da.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
         
            Da.SelectCommand.Parameters.AddWithValue("@IsActive", IsActive);
            Da.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID",InsertEmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }
    //This function For DeleteTelephone
        public static DataTable DeleteTelephone(string ID, string DeleteEmployeeID)
    {
        using (SqlConnection Connection = GetConnection5())
        {
            SqlDataAdapter Da = new SqlDataAdapter("TelephoneDelete",Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@Id",ID);
            Da.SelectCommand.Parameters.AddWithValue("@DeleteEmployeeID",DeleteEmployeeID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }

    }

     public static DataTable GetTelephone(string ID)
    {
        using (SqlConnection Connection = GetConnection5())
        {
            SqlDataAdapter Da = new SqlDataAdapter("TelephoneGet", Connection);
            Da.SelectCommand.CommandType = CommandType.StoredProcedure;
            Da.SelectCommand.Parameters.AddWithValue("@Id",ID);
            DataTable DT = new DataTable();
            Da.Fill(DT);
            return DT;
        }
    }

     public static DataTable search(string EmployeeName,string TelephoneNum)
     {
         using (SqlConnection Connection = GetConnection5())
         {
             SqlDataAdapter Da = new SqlDataAdapter("TelephoneSearch", Connection);
             Da.SelectCommand.CommandType = CommandType.StoredProcedure;
             Da.SelectCommand.Parameters.AddWithValue("@EmployeeName", EmployeeName);
           
             Da.SelectCommand.Parameters.AddWithValue("@TelephoneNum",TelephoneNum);
             DataTable DT = new DataTable();
             Da.Fill(DT);
             return DT;

         }
     }

     public static DataTable search1()
     {
         using (SqlConnection Connection = GetConnection5())
         {
             SqlDataAdapter Da = new SqlDataAdapter("TelephoneSearch", Connection);
             Da.SelectCommand.CommandType = CommandType.StoredProcedure;
      
             DataTable DT = new DataTable();
             Da.Fill(DT);
             return DT;

         }
     }

     public static DataTable ActivateTelephone(string ID, Boolean IsActive)
     {
         using (SqlConnection Connection = GetConnection5())
         {
             SqlDataAdapter Da = new SqlDataAdapter("TelephoneActivate", Connection);
             Da.SelectCommand.CommandType = CommandType.StoredProcedure;
             Da.SelectCommand.Parameters.AddWithValue("@Id", ID);
             Da.SelectCommand.Parameters.AddWithValue("@IsActive",IsActive);
             DataTable DT = new DataTable();
             Da.Fill(DT);
             return DT;
         }
     }

  

}


   






