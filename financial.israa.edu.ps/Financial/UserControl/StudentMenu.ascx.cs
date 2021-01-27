using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_UserControl_StudentMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                lblStudentID.Text = Request.QueryString["id"];
                try
                {
                    DataTable DT = DataAccess.StudentImageGet(lblStudentID.Text);
                    if (DT.Rows.Count > 0)
                    {
                        if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
                        {
                            byte[] imgBytes = (byte[])DT.Rows[0]["StudentImage"];
                            string imgString = Convert.ToBase64String(imgBytes);
                            image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                        }
                        else
                        {
                            image.Src = "../images/std.jpg";
                        }
                    }
                    else
                        Response.Redirect("~/Financial/Students.aspx");
                }
                catch (Exception ex)
                {
                    Response.Redirect("~/Financial/Students.aspx");
                }
            }
            else
                Response.Redirect("~/Financial/Students.aspx");
        }
        else if (lblStudentID.Text == "")
        {
            Response.Redirect("~/Financial/Students.aspx");
        }
    }

    protected void btnChechStudent_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.CheckStudent(txtStudentNo.Text);
        if (DT.Rows.Count > 0)
        {
            Response.Redirect("~/Financial/Student.aspx?id=" + DT.Rows[0]["StudentID"].ToString());
        }
    }
}