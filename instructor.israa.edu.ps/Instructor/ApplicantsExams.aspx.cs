using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_ApplicantsExams : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (lblExamFormID.Text == "")
            {
                if (Session["ExamFormID"] != null)
                {
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
        Response.Redirect("ApplicantExam");
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

    protected void lbSelectedStudentsExamsCalculateMarks_Click(object sender, EventArgs e)
    {
        int count = 0;
        foreach (ListViewItem item in ListView1.Items)
        {
            string id = ((Label)item.FindControl("StudentExamID")).Text;
            bool IsChecked = ((CheckBox)item.FindControl("cbIsChecked")).Checked;
            if (IsChecked)
            {
                DataTable DT = DataAccess.CalculateStudentExamMarks(id);
                count = (DT.Rows[0]["status"].ToString() == "1") ? count + 1 : count;
            }
        }
        ListView1.DataBind();
        ShowMsg("تم إتمام جمع علامات  " + count + " امتحان بنجاح.", "success");
    }

    protected void lbSelectedStudentsExamsExcel_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.GetExamFormStudentsExams(lblExamFormID.Text);
        string[] cols = { "ID", "StudentExamStatus" };
        foreach (string col in cols)
        {
            DT.Columns.Remove(col);
        }
        ExportToExcel(DT);
    }

    public void ExportToExcel(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            string filename = "ExamStudentsMarks.xls";
            System.IO.StringWriter tw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
            DataGrid dgGrid = new DataGrid();

            dgGrid.DataSource = dt;
            dgGrid.DataBind();

            //Get the HTML for the control.
            dgGrid.RenderControl(hw);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename + "");
            this.EnableViewState = false;
            Response.Write(tw.ToString());
            Response.End();
        }
    }


    protected void lbSelectedStudentsExamsCorrect_Click(object sender, EventArgs e)
    {
        int count = 0;
        foreach (ListViewItem item in ListView1.Items)
        {
            string id = ((Label)item.FindControl("StudentExamID")).Text;
            bool IsChecked = ((CheckBox)item.FindControl("cbIsChecked")).Checked;
            if (IsChecked)
            {
                DataTable DT = DataAccess.CorrectStudentExam(id);
                count = (DT.Rows[0]["status"].ToString() == "1") ? count + 1 : count;
            }
        }
        ListView1.DataBind();
        ShowMsg("تم إتمام تصليح  " + count + " امتحان بنجاح.", "success");
    }
}