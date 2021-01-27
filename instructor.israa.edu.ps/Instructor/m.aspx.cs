using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_m : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (lblExamFormID.Text == "")
            {
                if (Session["ExamFormID"] != null) { 
                    lblExamFormID.Text = Session["ExamFormID"].ToString();
                }
                else
                    Response.Redirect("ExamForm");
            }
        }
    }

    protected void lbOpenStudentExam_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["ExamFormID"] = lblExamFormID.Text;
        Session["StudentExamID"] = ((Label)item.FindControl("StudentExamID")).Text;
        Response.Redirect("StudentExam");
    }

    protected void lbStudentExamDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("StudentExamID")).Text;
        DataTable DT = DataAccess.DeleteStudentExam(id, EmployeeID);
        ShowMsg(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        ListView1.DataBind();
    }

    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-dismissable alert-top alert-" + status);
        divMsg.Visible = (msg != "");
    }

    protected void lbSelectedStudentsExamsDelete_Click(object sender, EventArgs e)
    {
        int count = 0;
        foreach (ListViewItem item in ListView1.Items)
        {
            string id = ((Label)item.FindControl("StudentExamID")).Text;
            bool IsChecked = ((CheckBox)item.FindControl("cbIsChecked")).Checked;
            if (IsChecked)
            {
                DataTable DT = DataAccess.DeleteStudentExam(id, EmployeeID);
                count = (DT.Rows[0]["status"].ToString() == "1") ? count + 1 : count;
            }
        }
        ListView1.DataBind();
        ShowMsg("تم حذف " + count + " امتحان بنجاح.", "success");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("StudentExamID")).Text;
        string time = ((TextBox)item.FindControl("txtTime")).Text;
        DataAccess.UpdateReminingTime(id, time);
    }
}