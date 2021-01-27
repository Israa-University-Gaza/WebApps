using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_StudentApplyScholarship : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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
    }
    protected void btnAddScholarship_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlSemesterScholarship, lblStudentID, ddlActionScholarship, txtScholarshipValue });
        if (Validate)
        {
            DataTable DT = DataAccess.ApplyScholarship(ddlSemesterScholarship.SelectedValue, lblStudentID.Text, ddlActionScholarship.SelectedValue, txtScholarshipValue.Text, EmployeeID);
            ShowMsg(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        }
        else
        {
            ShowMsg("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
        }
    }

    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg.Visible = (msg != "");
    }
}