using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StdOfficeRegister2 : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //try
            //{
                lblEmployeeID.Text = EmployeeID;
                if (Request.QueryString["id"] != null)
                {
                    DataTable DT2 = DataAccess.GetStudentData(Request.QueryString["id"].ToString());
                    lblStdStatusID.Text = DT2.Rows[0]["StdStatusID"].ToString();
                    lblStudentID.Text = Request.QueryString["id"].ToString();
                    DataTable DT = DataAccess.StudentImageGet(lblStudentID.Text);
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
                        else
                        {
                            image.Src = "../images/std.jpg";
                        }
                    }
                }
                else
                    Response.Redirect("~/Admission/Students.aspx");
            //}
            //catch (Exception ex)
            //{
            //    Response.Redirect("~/Admission/Students.aspx");
            //}
        }
        else if (lblStudentID.Text == "")
        {
            Response.Redirect("~/Admission/Students.aspx");
        }
    }

    protected void btnChechStudent_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.CheckStudent(txtStudentNo.Text);
        if (DT.Rows.Count > 0)
        {
            Response.Redirect("~/Admission/Student.aspx?id=" + DT.Rows[0]["StudentID"].ToString());
        }
        else
        {
            ShowToast(this, "رقم الطالب غير صحيح", "", "error");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("CourseID")).Text;

        lblStdStatusID.Text = ID;
    }

 
}