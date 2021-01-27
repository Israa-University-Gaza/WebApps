using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_AttImportExcel : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {


            //Upload and save the file
            string excelPath = Server.MapPath("~/Files/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(excelPath);

            string conString = string.Empty;
            string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
            switch (extension)
            {
                case ".xls": //Excel 97-03
                    conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                    break;
                case ".xlsx": //Excel 07 or higher
                    conString = ConfigurationManager.ConnectionStrings["Excel07+ConString"].ConnectionString;
                    break;

            }
            conString = string.Format(conString, excelPath);
            using (OleDbConnection excel_con = new OleDbConnection(conString))
            {
                excel_con.Open();
                string sheet1 = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null).Rows[0]["Table_Name"].ToString();
                DataTable dtExcelData = new DataTable();

                //[OPTIONAL]: It is recommended as otherwise the data will be considered as String by default.
                dtExcelData.Columns.AddRange(new DataColumn[8] {
                new DataColumn("EmployeeNo", typeof(String)),
                new DataColumn("Date", typeof(String)),
                new DataColumn("Clock In", typeof(String)),
                    new DataColumn("Clock Out", typeof(String)),
                     new DataColumn("On duty", typeof(String)),
                     new DataColumn("Off duty", typeof(String)),
                      new DataColumn("Absent", typeof(String)),
                     new DataColumn("Work Time", typeof(String))});

                using (OleDbDataAdapter oda = new OleDbDataAdapter("SELECT * FROM [" + sheet1 + "]", excel_con))
                {
                    oda.Fill(dtExcelData);
                }
                excel_con.Close();

                string consString = ConfigurationManager.ConnectionStrings["HumanResources"].ConnectionString;
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                    {
                        //Set the database table name
                        sqlBulkCopy.DestinationTableName = "dbo.Fingerprint_Data";

                        //[OPTIONAL]: Map the Excel columns with that of the database table
                        sqlBulkCopy.ColumnMappings.Add("EmployeeNo", "EmployeeNo");
                        sqlBulkCopy.ColumnMappings.Add("Date", "Date");
                        sqlBulkCopy.ColumnMappings.Add("Clock In", "Attendance_From");
                        sqlBulkCopy.ColumnMappings.Add("Clock Out", "Attendance_To");
                        sqlBulkCopy.ColumnMappings.Add("On duty", "Default_From");
                        sqlBulkCopy.ColumnMappings.Add("Off duty", "Default_To");
                        sqlBulkCopy.ColumnMappings.Add("Work Time", "Attendance_Hours");
                        sqlBulkCopy.ColumnMappings.Add("Absent", "Absent");
                        con.Open();
                        sqlBulkCopy.WriteToServer(dtExcelData);
                        con.Close();
                    }
                }
            }
            ShowToast(this, "تم رفع ملف الاكسل  بنجاح.", "", "success");
        }

        ShowToast(this, "   عذرا لم يتم رفع الملف.", "", "error");
    }
}