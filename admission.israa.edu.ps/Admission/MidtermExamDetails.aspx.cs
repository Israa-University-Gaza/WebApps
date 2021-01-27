using System;
using Microsoft.Reporting.WebForms;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class Admission_MidtermExamDetails : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlProgram.DataBind();
            ddlProgram.Items.Insert(0, new ListItem("الكل", "-1"));
            ddlBranch.DataBind();
            ddlBranch.Items.Insert(0, new ListItem("الكل", "-1"));
            ddlExamDate.DataBind();
            ddlExamDate.Items.Insert(0, new ListItem("الكل", "-1"));
            ddlExamTime.DataBind();
            ddlExamTime.Items.Insert(0, new ListItem("الكل", "-1"));
            ddlOfferdCourseType.DataBind();
            ddlOfferdCourseType.Items.Insert(0, new ListItem("الكل", "-1"));
        }
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

    protected void btnPdf_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsMidtermExamDateTime");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetOfferdCourseMidtermExamDetails2(ddlSemester.SelectedValue, ddlDepartment.SelectedValue, ddlStudyLevel.SelectedValue, ddlCourseType.SelectedValue, ddlProgram.SelectedValue, ddlBranch.SelectedValue));
        CreatePDF("MidtermExamDateTime", @"Admission/Reports/MidtermExamDateTime.rdlc", a1, a2);
    }

    protected void ddlExamDate_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlExamTime.DataBind();
        ListView1.DataBind();

    }

    protected void ddlExamTime_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

 
    protected void lbExcel_Click(object sender, EventArgs e)
    {

        DataTable DT = DataAccess.GetOfferdCourseMidtermExamDetails2(ddlSemester.SelectedValue, ddlDepartment.SelectedValue, ddlStudyLevel.SelectedValue, ddlCourseType.SelectedValue, ddlProgram.SelectedValue, ddlBranch.SelectedValue);
        string[] cols = { "RowNo", "ID", "CourseID", "IsMidtermExam",  "MidtermExamTimeFrom1", "MidtermExamTimeTo1", "ExamTime1", "ReportDate", "ExamDate" };
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
            string filename = "MidtermExamDate.xls";
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


    protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDepartment.DataBind();
    }
    protected void ddlOfferdCourseType_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}
