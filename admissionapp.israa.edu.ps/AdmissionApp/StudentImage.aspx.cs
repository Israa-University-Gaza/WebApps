using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdmissionApp_StudentImage : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable DT = DA.StudentImageGet(UserPage.StudentID);
            if (DT.Rows.Count > 0)
            {
                if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
                {
                    // Get the byte array from image file
                    byte[] imgBytes = (byte[])DT.Rows[0]["StudentImage"];
                    string imgString = Convert.ToBase64String(imgBytes);
                    //Set the source with data:image/bmp
                    image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                }
            }
        }
    }

    protected void Upload(object sender, EventArgs e)
    {
        string base64 = Request.Form["imgCropped"];
        byte[] bytes = Convert.FromBase64String(base64.Split(',')[1]);

        if (DA.StudentImageAddEdit(UserPage.StudentID, bytes) > 0)
        {
            string imgString = Convert.ToBase64String(bytes);
            image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);

            ShowToast(this, "تم الحفظ بنجاح.", "", "success");
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
        }
    }

}
