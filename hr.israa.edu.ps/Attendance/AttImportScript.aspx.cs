using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_AttImportScript : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {


            //Upload and save the file
            string Path1 = Server.MapPath("~/Files/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Path1);


            try
            {

                if (DataAccess.AttImport(Path1) > 0)
                {
                     if (DataAccess.INOUTDATAToAttendance() > 0)
                     {
                    ShowToast(this, "تم  رفع الملف   بنجاح.", "", "success");
                     }
                }
                else
                {
                    ShowToast(this, "   عذرا لم يتم رفع الملف.", "", "error");
                }
            }
            catch { ShowToast(this, "   عذرا البيانات موجودة مسبقا.", "", "error"); }



        }
        else
        {
            ShowToast(this, "   يرجى رفع الملف.", "", "error");
        }


    }
}
