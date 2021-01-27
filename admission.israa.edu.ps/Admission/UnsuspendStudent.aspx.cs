using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_UnsuspendStudent : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblEmployeeID.Text = EmployeeID;
            if (Request.QueryString["id"] != null)
            {
                lblStudentID.Text = Request.QueryString["id"].ToString();
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

                if (Session["ID"] != null)
                {
                    lblID.Text = Session["ID"].ToString();
                    Session["ID"] = null;
                    DataTable DA = DataAccess.SuspendedStudentDetailsGet(lblID.Text);
                    if (DA.Rows.Count > 0)
                    {
                        Department.Text = DA.Rows[0]["Department"].ToString();
                        Employee.Text = DA.Rows[0]["Employee"].ToString();
                        Reason.Text = DA.Rows[0]["OtherCondition"].ToString();
                        if (DA.Rows[0]["OtherCondition"].ToString() !=null)
                        {
                            Reason.Text = DA.Rows[0]["Condition"].ToString();
                        }
                    
                        SuspendDetails.Text = DA.Rows[0]["SuspendedDetails"].ToString();
                    }
                }

                else
                {
                    Response.Redirect("~/Admission/Student.aspx");
                }
            }
            else
                Response.Redirect("~/Admission/Students.aspx");
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

    protected void UnSuspend_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtUnSuspendDetails }))
        {
            if (DataAccess.UnSuspendedStudent(lblID.Text, txtUnSuspendDetails.Text, EmployeeID) > 0)
            {
                ShowToast(this, "تم الغاء حظر الطالب بنجاح.", "", "success");
                EmptyControls(new WebControl[] { txtUnSuspendDetails });
                UnSuspend.Enabled = false;
            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
}