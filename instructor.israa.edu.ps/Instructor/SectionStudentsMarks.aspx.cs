using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_SectionStudentsMarks : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
            Response.Redirect("SectionStudentsWorkFinalMarks");
            }

    protected void btnView_Click(object sender, EventArgs e)
    {
        Repeater1.DataBind();
        ListView1.DataBind();
    }

    protected void btnSaveMark_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        TextBox txtWorkMark = (TextBox)item.FindControl("txtWorkMark");
        TextBox txtMidtermMark = (TextBox)item.FindControl("txtMidtermMark");
        TextBox txtFinalMark = (TextBox)item.FindControl("txtFinalMark");

        if (IntValidateControls(new WebControl[] { txtWorkMark, txtMidtermMark, txtFinalMark }))
        {
            DataTable DT = DataAccess.SetStdSectionMark(StdSectionID, txtWorkMark.Text, txtMidtermMark.Text, txtFinalMark.Text, EmployeeID);
            ShowMsg(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
            if (DT.Rows[0]["status"].ToString() != "0")
            {
                ListView1.DataBind();
                Repeater1.DataBind();
            }
        }
        else
        {
            ShowMsg("الرجاء إدخال العلامة بالشكل الصحيح", "danger");
        }
    }

    protected void btnSaveMarks_Click(object sender, EventArgs e)
    {
        int s = 0, f = 0;
        foreach (ListViewItem item in ListView1.Items)
        {
            string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
            TextBox txtWorkMark = (TextBox)item.FindControl("txtWorkMark");
            TextBox txtMidtermMark = (TextBox)item.FindControl("txtMidtermMark");
            TextBox txtFinalMark = (TextBox)item.FindControl("txtFinalMark");

            if (IntValidateControls(new WebControl[] { txtWorkMark, txtMidtermMark, txtFinalMark }))
            {
                DataTable DT = DataAccess.SetStdSectionMark(StdSectionID, txtWorkMark.Text, txtMidtermMark.Text, txtFinalMark.Text, EmployeeID);
                ShowMsg(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
                if (DT.Rows[0]["status"].ToString() != "0") { s++; } else { f++; }
            }
            else
            {
                f++;
            }
        }

        ShowMsg("تم حفظ " + s + " درجة بنجاح ,,, " + "لم يتم حفظ " + f + " درجة ", (f == 0) ? "success" : "danger");
        if (s > 0)
        {
            Repeater1.DataBind();
            ListView1.DataBind();
        }
    }

    protected void btnMarkAccreditation_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.SetSectionMarkAccreditation(ddlSection.SelectedValue, EmployeeID);
        ShowMsg(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
            Repeater1.DataBind();
        }
    }

    protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSection.DataBind();
        Repeater1.DataBind();
        ListView1.DataBind();
    }

    protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repeater1.DataBind();
        ListView1.DataBind();
    }

    private void CreatePDF(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray)
    {
        ReportViewer viwer = new ReportViewer();
        Warning[] warnings = null;
        string[] streamIds = null;
        string mimeType = string.Empty;
        string encoding = string.Empty;
        string extension = string.Empty;
        string filetype = string.Empty;

        viwer.SizeToReportContent = true;
        viwer.LocalReport.ReportPath = reportpath;
        viwer.ProcessingMode = ProcessingMode.Local;

        for (int i = 0; i < dsNameArray.Count; i++)
        {
            ReportDataSource rds1 = new ReportDataSource((string)dsNameArray[i], (DataTable)DTArray[i]);
            viwer.LocalReport.DataSources.Add(rds1);
        }

        viwer.LocalReport.Refresh();

        byte[] bytes = viwer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

        // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
        Response.Buffer = true;
        Response.Clear();
        Response.ContentType = mimeType;
        Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
        Response.BinaryWrite(bytes); // create the file
        Response.Flush(); // send it to the client to download
    }

    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-" + status + " alert-top");
        divMsg.Visible = (msg != "");
    }

    protected void lbSectionStudentsEmptyMarksPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsSectionStudentsMarks");
        a1.Add("dsSectionStatistics");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetSectionStudentsMarks(ddlSection.SelectedValue));
        a2.Add(DataAccess.GetSectionStatistics(ddlSection.SelectedValue));

        CreatePDF("SectionStudentsEmptyMarks_" + ddlSection.SelectedValue, @"Instructor\Reports\SectionStudentsEmptyMarks.rdlc", a1, a2);
    }

    protected void lbSectionStudentsMarksPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsSectionStudentsMarks");
        a1.Add("dsSectionStatistics");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetSectionStudentsMarks(ddlSection.SelectedValue));
        a2.Add(DataAccess.GetSectionStatistics(ddlSection.SelectedValue));

        CreatePDF("SectionStudentsMarks_" + ddlSection.SelectedValue, @"Instructor\Reports\SectionStudentsMarks.rdlc", a1, a2);
    }

    protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCourse.DataBind();
        ddlSection.DataBind();
        ListView1.DataBind();
    }
}