using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_TawjihiSMS : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSend_OnClick(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtMessage.Text))
        {
            ShowToast(this, "نص الرسالة فارغ", "", "error");

            return;
        }

        if (txtMessage.Text.Length > 210 )
        {
            ShowToast(this, "تجاوزت عدد الحروف", "", "error");
            return;

        }

        int counter = 0;
        string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
        string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
        string FolderPath = "../uploads/";
        string FilePath = Server.MapPath(FolderPath + FileName + DateTime.Now.ToString("yyyy_M_d HH_mm_ss"));
        if (Extension == ".xls")
        {
            FileUpload1.SaveAs(FilePath);
            //تشمل فحص الفاضي
            DataTable exlDT = Import_To_Grid(FilePath, Extension, "");

            if (exlDT.Rows.Count > 0)
            {
                foreach (DataRow item in exlDT.Rows)
                {

                    bool sendStatus = SendSMS(item["F1"].ToString(), txtMessage.Text);

                    if (sendStatus)
                    {
                        counter++;
                    }
                    ShowToast(this, "تم ارسال الرسالة لـ " + counter + " رقم", "", "success");


                }
            }
            else
            {
                ShowToast(this, "لا يوجد أرقام", "", "error");

            }

        }
        else
        {
            ShowToast(this, "تأكد من الملف", "", "error");
        }

    }


    private DataTable Import_To_Grid(string FilePath, string Extension, string isHDR)
    {


        isHDR = "no";
        string conStr = "";

        switch (Extension)
        {

            case ".xls": //Excel 97-03




                conStr = @"Provider=Microsoft.ACE.OLEDB.12.0;" +

                         @"Data Source=" + FilePath + ";" +

                         @"Extended Properties=" + Convert.ToChar(34).ToString() +

                         @"Excel 12.0;HDR=NO" + Convert.ToChar(34).ToString();


                break;


        }


        OleDbConnection connExcel = new OleDbConnection(conStr);

        OleDbCommand cmdExcel = new OleDbCommand();

        OleDbDataAdapter oda = new OleDbDataAdapter();

        DataTable dt = new DataTable();

        cmdExcel.Connection = connExcel;



        //Get the name of First Sheet

        connExcel.Open();

        DataTable dtExcelSchema;

        dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);

        string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();

        connExcel.Close();

        //Read Data from First Sheet

        connExcel.Open();

        cmdExcel.CommandText = "SELECT * From [" + SheetName + "] Where (F1 <> NULL) ";

        oda.SelectCommand = cmdExcel;

        oda.Fill(dt);

        connExcel.Close();

        //Delete Uploaded Excel File
        // File.Delete(FilePath);
        return dt;


    }



}