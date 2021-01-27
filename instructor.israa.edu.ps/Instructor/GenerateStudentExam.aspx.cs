using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_GenerateStudentExam : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (lblExamFormID.Text == "")
            {
                if (Session["ExamFormID"] != null)
                    lblExamFormID.Text = Session["ExamFormID"].ToString();
                else
                    Response.Redirect("ExamForm");
            }
        }
    }

    protected void lbGenerateStudentExam_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string StudentID = ((Label)item.FindControl("StudentID")).Text;
        DataTable DT = DataAccess.GenerateStudentExam(EmployeeID, StudentID, lblExamFormID.Text);
        ShowMsg(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() == "1") ? "success" : "danger");
        ListView1.DataBind();
    }

    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-dismissable alert-top alert-" + status);
        divMsg.Visible = (msg != "");
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        int count = 0;
        foreach (ListViewItem item in ListView1.Items)
        {
            string StudentID = ((Label)item.FindControl("StudentID")).Text;
            bool cbIsGenerateStudentExam = ((CheckBox)item.FindControl("cbIsGenerateStudentExam")).Checked;
            if (cbIsGenerateStudentExam)
            {
                DataTable DT = DataAccess.GenerateStudentExam(EmployeeID, StudentID, lblExamFormID.Text);
                count = (DT.Rows[0]["status"].ToString() == "1") ? count + 1 : count;
            }
        }
        ListView1.DataBind();
        ShowMsg("تم توليد " + count + " امتحان بنجاح.", "success");
    }

    protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSection.DataBind();
        ListView1.DataBind();
    }

    protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}