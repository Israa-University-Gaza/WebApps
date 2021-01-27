using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_SyllabusAccreditation : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Session["SyllabusID"] != null)
            {
                lblSyllabusID.Text = Session["SyllabusID"].ToString();

            }
            else
                Response.Redirect("Default.aspx");

            if (Session["AccreditationDepartmentID"] != null)
                lblAccreditationDepartmentID.Text = Session["AccreditationDepartmentID"].ToString();
            else
                Response.Redirect("Default.aspx");

            if (Session["CourseName"] != null)
            {
                lblCourseName.Text = Session["CourseName"].ToString();
            }
            else
                Response.Redirect("Default.aspx");

            DataTable DT = DataAccess.GetSyllabus(lblSyllabusID.Text);
            string SyllabusPlace = DT.Rows[0]["SyllabusPlace"].ToString();
            if (SyllabusPlace == lblAccreditationDepartmentID.Text)
            {
                btnSyllabusAccredit.Enabled = true;
            }
        }
    }

    protected void btnSyllabusAccredit_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.SyllabusAccredit(lblSyllabusID.Text, "1", lblAccreditationDepartmentID.Text, EmployeeID, lblAccreditationDepartmentID.Text);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() == "1") ? "success" : "Error");
        btnSyllabusAccredit.Enabled = false;
    }


    protected void lbPrev_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Session["AccreditationDepartmentID"] = lblAccreditationDepartmentID.Text;
        Response.Redirect("SyllabusEvaluation.aspx");
    }

    protected void btnSyllabusPrint_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsCourseInfo");
        a1.Add("dsGetSyllabusActivity");
        a1.Add("dsGetSyllabusBook");
        a1.Add("dsGetSyllabusDetailedDescription");
        a1.Add("dsGetSyllabusEvaluation");
        a1.Add("dsGetSyllabusGoal");
        a1.Add("dsGetSyllabusOutcome");
        a1.Add("dsGetSyllabusReference");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetSyllabus(lblSyllabusID.Text));
        a2.Add(DataAccess.GetSyllabusActivity(lblSyllabusID.Text, lblAccreditationDepartmentID.Text));
        a2.Add(DataAccess.GetSyllabusBook(lblSyllabusID.Text, lblAccreditationDepartmentID.Text));
        a2.Add(DataAccess.GetSyllabusDetailedDescription(lblSyllabusID.Text, lblAccreditationDepartmentID.Text));
        a2.Add(DataAccess.GetSyllabusEvaluation(lblSyllabusID.Text, lblAccreditationDepartmentID.Text));
        a2.Add(DataAccess.GetSyllabusGoal(lblSyllabusID.Text, lblAccreditationDepartmentID.Text));
        a2.Add(DataAccess.GetSyllabusOutcome(lblSyllabusID.Text, lblAccreditationDepartmentID.Text));
        a2.Add(DataAccess.GetSyllabusReference(lblSyllabusID.Text, lblAccreditationDepartmentID.Text));

        CreatePDF("SyllabusReport", @"Academic\Reports\SyllabusReport.rdlc", a1, a2);
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
}