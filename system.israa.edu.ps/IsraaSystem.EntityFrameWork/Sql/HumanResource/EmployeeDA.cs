using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using IsraaSystem.Core.Classic.HumanResource.Employee;
using IsraaSystem.Core.Classic.HumanResource.EmployeeAddNew;

namespace IsraaSystem.DataAccess.Sql.HumanResource
{
    public class EmployeeDA : DBConnection
    {


        #region islam
        public static int GenerateEmpNumber(int EmploymentTypeID)
        {


            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                conn.Open();
                SqlCommand com = new SqlCommand("select dbo.GenerateEmployeeNo(" + EmploymentTypeID + ")", conn);
                string result = (string)com.ExecuteScalar();
                conn.Close();
                return Convert.ToInt32(result);
            }



        }

        public static DataTable EmployeeAddToIsraPermissions(EmployeeAddNewVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("AddNewEmployee", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeNo", model.EmpEmploymentType.EmployeeNo);
                DA.SelectCommand.Parameters.AddWithValue("@ArFirstName", model.EmployeeMainData.ArFirstName);
                DA.SelectCommand.Parameters.AddWithValue("@ArSecondName", model.EmployeeMainData.ArSecoundName);
                DA.SelectCommand.Parameters.AddWithValue("@ArThirdName", model.EmployeeMainData.ArThirdName);
                DA.SelectCommand.Parameters.AddWithValue("@ArFamilyName", model.EmployeeMainData.ArFamilyName);
                DA.SelectCommand.Parameters.AddWithValue("@SSN", model.EmployeeMainData.SSN);
                DA.SelectCommand.Parameters.AddWithValue("@IsActive", 1);
                DA.SelectCommand.Parameters.AddWithValue("@UserID", model.EmployeeMainData.UserID);
                DA.SelectCommand.Parameters.AddWithValue("@Gender", model.EmployeeMainData.GenderID);



                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }



        #endregion
        public static DataTable EmployeeAdd(EmployeeAdd model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeAdd", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@ArFirstName", model.ArFirstName);
                DA.SelectCommand.Parameters.AddWithValue("@ArSecoundName", model.ArSecoundName);
                DA.SelectCommand.Parameters.AddWithValue("@ArThirdName", model.ArThirdName);
                DA.SelectCommand.Parameters.AddWithValue("@ArFamilyName", model.ArFamilyName);
                DA.SelectCommand.Parameters.AddWithValue("@Mobil", model.Mobile);
                DA.SelectCommand.Parameters.AddWithValue("@SSN", model.SSN);
                DA.SelectCommand.Parameters.AddWithValue("@InsertEmployeeID", model.InsertEmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }



        public static DataTable GetEmploymentTypeEmployeeNo(int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetEmploymentTypeEmployeeNo", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static EmployeeVM GetFilterdEmployees(EmployeeVM model)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetFilterdEmployees", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (!String.IsNullOrEmpty(model.filter.EmployeeNo))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeNo", model.filter.EmployeeNo);
                if (!String.IsNullOrEmpty(model.filter.ArFirstName))
                    DA.SelectCommand.Parameters.AddWithValue("@ArFirstName", model.filter.ArFirstName);
                if (!String.IsNullOrEmpty(model.filter.ArSecoundName))
                    DA.SelectCommand.Parameters.AddWithValue("@ArSecoundName", model.filter.ArSecoundName);
                if (!String.IsNullOrEmpty(model.filter.ArThirdName))
                    DA.SelectCommand.Parameters.AddWithValue("@ArThirdName", model.filter.ArThirdName);
                if (!String.IsNullOrEmpty(model.filter.ArFamilyName))
                    DA.SelectCommand.Parameters.AddWithValue("@ArFamilyName", model.filter.ArFamilyName);
                if (!String.IsNullOrEmpty(model.filter.EmployeeStatusID))
                    DA.SelectCommand.Parameters.AddWithValue("@EmployeeStatusID", model.filter.EmployeeStatusID);
                if (!String.IsNullOrEmpty(model.filter.EmploymentTypeID))
                    DA.SelectCommand.Parameters.AddWithValue("@EmploymentTypeID", model.filter.EmploymentTypeID);
                DA.SelectCommand.Parameters.AddWithValue("@pageSize", model.pagging.pageSize);
                DA.SelectCommand.Parameters.AddWithValue("@currentPage", model.pagging.currentPage);
                DataTable DT = new DataTable();
                DA.Fill(DT);

                model.data = DT;
                model.pagging.TotalRecords = (DT.Rows.Count > 0) ? Convert.ToInt32(DT.Rows[0]["TotalRecords"].ToString()) : 0;
                return model;
            }
        }

        public static DataTable GetEmployeeByEmployeeID(int EmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeByEmployeeID", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable GetEmployeeByEmployeeNo(string EmployeeNo)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetEmployeeByEmployeeNo", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeNo", EmployeeNo);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

        public static DataTable EmployeePersonalImageUpdate(int EmployeeID, string ImageURL, int UpdateEmployeeID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeePersonalImageUpdate", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@ImageURL", ImageURL);
                DA.SelectCommand.Parameters.AddWithValue("@UpdateEmployeeID", UpdateEmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }



        public static bool SendSMS(string jawwal, string text)
        {
            //string url = "http://www.tweetsms.ps/api.php?comm=sendsms&user=admission&pass=10203050&&to=" + jawwal + "&message=" + text + " &sender=Israa-Univ";
            string url = "http://smsservice.hadara.ps/HandlerSMS.ashx/bulkservice/sessionvalue/sendMessage/" + "?aid=" + "IsraaUniv" + "&apd=" + "IsraaUniv30062019" + "&to=" + jawwal + "&msg=" + text;
            string response = GetHtmlPage(url);
            if (response.ToString().Contains("<Status>1</Status>"))
            {
                return true;
            }
            return false;
        }


        public static string GetHtmlPage(string strURL)
        {
            String strResult;
            WebResponse objResponse;
            WebRequest objRequest = HttpWebRequest.Create(strURL);
            objResponse = objRequest.GetResponse();
            using (StreamReader sr = new StreamReader(objResponse.GetResponseStream()))
            {
                strResult = sr.ReadToEnd();
                sr.Close();
            }
            return strResult;
        }



        public static DataTable UpdateEmployeePassword(int EmployeeID)
        {
            using (SqlConnection conn = GetIsraPermissionsElibApi())
            {
                SqlDataAdapter DA = new SqlDataAdapter("UpdateEmployeePassword", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }



        public static DataTable EmployeeObserverUpdate(int EmployeeID, bool? IsObserver, int? ObserverBranchID)
        {
            using (SqlConnection conn = GetIsraaHumanResourceConnection())
            {
                SqlDataAdapter DA = new SqlDataAdapter("EmployeeObserverUpdate", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                DA.SelectCommand.Parameters.AddWithValue("@IsObserver", IsObserver);
                DA.SelectCommand.Parameters.AddWithValue("@ObserverBranchID", ObserverBranchID);

                DataTable DT = new DataTable();
                DA.Fill(DT);
                return DT;
            }
        }

    }
}