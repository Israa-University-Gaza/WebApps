using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_MySectionsStudents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void lbSectionStudentPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsTeacherSectionStudents");
        a1.Add("dsSectionStatistics");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetSectionStudents(ddlSection.SelectedValue));
        a2.Add(DataAccess.GetSectionStatistics(ddlSection.SelectedValue));

        CreatePDF("StudyTable", "TeacherSectionStudentsReport.rdlc", a1, a2);
    }

    protected void lbSectionStudentsAttendancePDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsTeacherSectionStudents");
        a1.Add("dsSectionStatistics");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetSectionStudents(ddlSection.SelectedValue));
        a2.Add(DataAccess.GetSectionStatistics(ddlSection.SelectedValue));

        CreatePDF("StudyTable", "SectionStudentsAttendanceReport.rdlc", a1, a2);
    }

    private void CreatePDF(string fileName, string reportname, ArrayList dsNameArray, ArrayList DTArray)
    {
        string reportpath = Server.MapPath(".") + @"\Reports\" + reportname;
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

    public void ExportToExcel(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            string filename = "SectionStudents.xls";
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

    protected void lbSectionStudentExcel_Click(object sender, EventArgs e)
    {

        DataTable DT = DataAccess.GetSectionStudents(ddlSection.SelectedValue);
        string[] cols = { "ID", "Gender", "Mobile", "ProgramID", "DepartmentID", "Accreditation", "IsActive", "StudentTypeID", "StudentStatusID", "GPAUniversity", "FileNumber" };
        foreach (string col in cols)
        {
            DT.Columns.Remove(col);
        }
        ExportToExcel(DT);
    }

    protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSection.DataBind();
        ListView1.DataBind();
    }

    protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCourse.DataBind();
        ddlSection.DataBind();
        ListView1.DataBind();
    }
}