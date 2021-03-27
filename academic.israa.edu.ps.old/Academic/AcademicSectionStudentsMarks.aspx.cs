using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_AcademicSectionStudentsMarks : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPermissionsContains("AcademicSectionStudentsMarks"))
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
        Repeater1.DataBind();
    }

    protected void btnMarkUnaccreditation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.SetMarkUnaccreditation(StdSectionID, 4);
        ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
            Repeater1.DataBind();
        }
    }
    protected void btnMarkAccreditation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.SetMarkAccreditation(StdSectionID, 4, EmployeeID);
        ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            //SendSMS(DT.Rows[0]["jawwal"].ToString(), DT.Rows[0]["smstext"].ToString());
            ListView1.DataBind();
            Repeater1.DataBind();
        }
    }

    protected void btnMarkAllAccreditation_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string SectionID = ((Label)item.FindControl("SectionID")).Text;
        DataTable DT = DataAccess.SetSectionMarkAccreditation(SectionID, EmployeeID, 4);
        ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
            Repeater1.DataBind();
        }

        //int count = 0;
        //foreach (DataRow row in DT.Rows)
        //{
        //    count += ((SendSMS(row["jawwal"].ToString(), row["smstext"].ToString())) ? 1 : 0);
        //}

        //ShowMsg1("تم إعتماد علامات الشعبة بنجاح وإرسال " + count + " رسالة بنجاح", "success");
        //ListView1.DataBind();
        //Repeater1.DataBind();
    }


    protected void btnMarkAllUnaccreditation_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string SectionID = ((Label)item.FindControl("SectionID")).Text;
        DataTable DT = DataAccess.SetSectionMarkUnaccreditation(SectionID, EmployeeID, 4);
        ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
            Repeater1.DataBind();
        }
    }


    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg1.Visible = (msg != "");
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

    protected void lbSectionStudentsMidtermMarkPDF_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string SectionID = ((Label)item.FindControl("SectionID")).Text;

        ArrayList a1 = new ArrayList();
        a1.Add("dsSectionStudentsMidtermMark");
        a1.Add("dsSectionStatistics");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetSectionStudentsMarks(SectionID));
        a2.Add(DataAccess.GetSectionStatistics(SectionID));

        CreatePDF("SectionStudentsMidtermMark_" + SectionID, @"Academic\Reports\SectionStudentsMidtermMark.rdlc", a1, a2);
    }
    protected void lbSectionStudentsMidtermMarkExcel_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string SectionID = ((Label)item.FindControl("SectionID")).Text;

        DataTable DT = DataAccess.GetSectionStudentsMarks(SectionID);
        string[] cols = { "ID", "StdSectionID", "WorkMark", "IsInsertMidtermMark", "IsMidtermNoMark", "IsMidtermIncomplete", "TeacherAccreditation", "HeadAccreditation", "DeanAccreditation", "AcademicAccreditation", "IsMidtermMarkEnable", "FinalMark", "TotalMark" };
        foreach (string col in cols)
        {
            DT.Columns.Remove(col);
        }
        ExportToExcel(DT, "SectionStudentsMidtermMarks_" + SectionID + ".xls");
    }

    public void ExportToExcel(DataTable dt, string filename)
    {
        if (dt.Rows.Count > 0)
        {
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
    protected void lbSectionStudentsMarksPDF_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string SectionID = ((Label)item.FindControl("SectionID")).Text;

        ArrayList a1 = new ArrayList();
        a1.Add("dsSectionStudentsMarks");
        a1.Add("dsSectionStatistics");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetSectionStudentsMarks(SectionID));
        a2.Add(DataAccess.GetSectionStatistics(SectionID));

        CreatePDF("SectionStudentsMarks_" + SectionID, @"Academic\Reports\SectionStudentsMarks.rdlc", a1, a2);
    }


    protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCollege.DataBind();
        ddlDepartment.DataBind();
        ListView1.DataBind();
    }

    protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
    {

        ddlDepartment.DataBind();
        ListView1.DataBind();
    }

    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void lbSectionStudentsMidtermMarksPDF_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string SectionID = ((Label)item.FindControl("SectionID")).Text;
        ArrayList a1 = new ArrayList();
        a1.Add("dsSectionStudentsMarks");
        a1.Add("dsSectionStatistics");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetSectionStudentsMidtermMarks(SectionID));
        a2.Add(DataAccess.GetSectionStatistics(SectionID));

        CreatePDF("SectionStudentsMidtermMarks_" + SectionID, @"Academic\Reports\SectionStudentsMidtermMarks.rdlc", a1, a2);
    }
}