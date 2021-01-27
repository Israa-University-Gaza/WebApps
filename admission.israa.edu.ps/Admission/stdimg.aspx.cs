using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_stdimg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string StudentID = Request.QueryString["id"].ToString();
        DataTable DT = DataAccess.StudentImageGet(StudentID);
        if (DT.Rows.Count > 0)
        {
            if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
            {
                byte[] imgBytes = (byte[])DT.Rows[0]["StudentImage"];
                string imgString = Convert.ToBase64String(imgBytes);
                Response.ContentType = "images/jpeg";
                Response.BinaryWrite(imgBytes);
            }
            else
            {
                byte[] imgdata = File.ReadAllBytes(HttpContext.Current.Server.MapPath("../images/std.jpg"));
                string imgString = Convert.ToBase64String(imgdata);
                Response.BinaryWrite(imgdata);
            }
        }
    }
}


