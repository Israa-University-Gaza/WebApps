using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Instructor_Syllabus_SyllabusGeneralDescription : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["SyllabusID"] != null)
            {
                lblSyllabusID.Text = Session["SyllabusID"].ToString();
                DataTable DT = DataAccess.SyllabusGet(lblSyllabusID.Text);
                if (DT.Rows.Count > 0)
                {
                    Session["CourseName"] = DT.Rows[0]["CourseName"].ToString();
                    lblCourseName.Text = DT.Rows[0]["CourseName"].ToString();
                    txtArGeneralDescription.Text = DT.Rows[0]["ArGeneralDescription"].ToString();
                    txtEnGeneralDescription.Text = DT.Rows[0]["EnGeneralDescription"].ToString();
                }
            }
            else
                Response.Redirect("/Instructor/Default");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtArGeneralDescription, txtEnGeneralDescription }))
        {
            DataTable DT = DataAccess.SyllabusGeneralDescriptionUpdate(lblSyllabusID.Text, txtArGeneralDescription.Text, txtEnGeneralDescription.Text, EmployeeID);
            ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() == "1") ? "success" : "danger");
        }
        else
        {
            ShowMsg1("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
        }
    }
    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-" + status + " alert-top");
        divMsg1.Visible = (msg != "");
    }

    protected void lbNext_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Response.Redirect("SyllabusGoals");
    }
}