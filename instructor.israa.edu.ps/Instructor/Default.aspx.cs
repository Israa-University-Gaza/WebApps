using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_Default : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lbSignOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }

    protected void lbLock_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Session["LockedUser"] = Context.User.Identity.Name;
        Response.Redirect("~/Lock");
    }

    protected void lbOpenExamForm_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["ExamFormID"] = ((Label)item.FindControl("ExamFormID")).Text;
        string ExamFormType = ((Label)item.FindControl("ExamFormType")).Text;
        Response.Redirect((ExamFormType == "1") ? "ExamFormQuestions" : "ExamFormDetails");
    }

    protected void lbGenerateStudentExam_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["ExamFormID"] = ((Label)item.FindControl("ExamFormID")).Text;
        Response.Redirect("GenerateStudentExam");
    }


    protected void lbOpenSyllabus_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["SyllabusID"] = ((Label)item.FindControl("SyllabusID")).Text;
        Response.Redirect("Syllabus/SyllabusGeneralDescription");
    }

    protected void lbPrintSyllabus_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("SyllabusID")).Text;
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
        a2.Add(DataAccess.GetSyllabus(id));
        a2.Add(DataAccess.GetSyllabusActivity(id));
        a2.Add(DataAccess.GetSyllabusBook(id));
        a2.Add(DataAccess.GetSyllabusDetailedDescription(id));
        a2.Add(DataAccess.GetSyllabusEvaluation(id));
        a2.Add(DataAccess.GetSyllabusGoal(id));
        a2.Add(DataAccess.GetSyllabusOutcome(id));
        a2.Add(DataAccess.GetSyllabusReference(id));

        CreatePDF("SyllabusReport", @"Instructor\Reports\SyllabusReport.rdlc", a1, a2);
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