using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_GraduationStudents : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblEmployeeID.Text = EmployeeID;
        if (!Permissions.Contains("StudentSearch"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnFilter_OnClick(object sender, EventArgs e)
    {
        string StudentStatusID= (ckbStudentStatusID.Checked == true ? "12" : "-1");
        string GraduationStatus= (ckbGraduationStatus.Checked == true ? "2" : "-1");

        DataTable dt = DataAccess.GetGraduationStudents(txtStudentNo.Text, StudentStatusID, GraduationStatus,ddlCollege.SelectedValue, txtArFirstName.Text, txtSecoundName.Text, txtArThirdName.Text, txtArFamilyName.Text);
        ListView1.DataSource = dt;
        ListView1.DataBind();
    }

    protected void GraduationPDF_OnClick(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string StudentID = ((Label)item.FindControl("StudentID")).Text;
        
        DataTable dd = DataAccess.GetStdSemesterPlan(StudentID);

        string CSemesterID1 = dd.Rows[0]["CSemesterID"].ToString();
        string CSemesterID2 = dd.Rows[1]["CSemesterID"].ToString();
        string CSemesterID3 = dd.Rows[2]["CSemesterID"].ToString();
        string CSemesterID4 = dd.Rows[3]["CSemesterID"].ToString();
        string CSemesterID5 = (dd.Rows.Count > 4 ? dd.Rows[4]["CSemesterID"].ToString() : "");
        string CSemesterID6 = (dd.Rows.Count > 5 ? dd.Rows[5]["CSemesterID"].ToString() : "");
        string CSemesterID7 = (dd.Rows.Count > 6 ? dd.Rows[6]["CSemesterID"].ToString() : "");
        string CSemesterID8 = (dd.Rows.Count > 7 ? dd.Rows[7]["CSemesterID"].ToString() : "");
        string CSemesterID9 = (dd.Rows.Count > 8 ? dd.Rows[8]["CSemesterID"].ToString() : "");
        string CSemesterID10 = (dd.Rows.Count > 9 ? dd.Rows[9]["CSemesterID"].ToString() : "");

        ArrayList a1 = new ArrayList();
        a1.Add("dsGetModelReport");
        a1.Add("dsGetAcademicAdvisingReport1");
        a1.Add("dsGetAcademicAdvisingReport2");
        a1.Add("dsGetAcademicAdvisingReport3");
        a1.Add("dsGetAcademicAdvisingReport4");
        a1.Add("dsGetAcademicAdvisingReport5");
        a1.Add("dsGetAcademicAdvisingReport6");
        a1.Add("dsGetAcademicAdvisingReport7");
        a1.Add("dsGetAcademicAdvisingReport8");
        a1.Add("dsGetAcademicAdvisingReport9");
        a1.Add("dsGetAcademicAdvisingReport10");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetModelReport(StudentID));
        a2.Add(DataAccess.GetAcademicGraduationReport(StudentID, CSemesterID1));
        a2.Add(DataAccess.GetAcademicGraduationReport(StudentID, CSemesterID2));
        a2.Add(DataAccess.GetAcademicGraduationReport(StudentID, CSemesterID3));
        a2.Add(DataAccess.GetAcademicGraduationReport(StudentID, CSemesterID4));
        a2.Add(DataAccess.GetAcademicGraduationReport(StudentID, CSemesterID5));
        a2.Add(DataAccess.GetAcademicGraduationReport(StudentID, CSemesterID6));
        a2.Add(DataAccess.GetAcademicGraduationReport(StudentID, CSemesterID7));
        a2.Add(DataAccess.GetAcademicGraduationReport(StudentID, CSemesterID8));
        a2.Add(DataAccess.GetAcademicGraduationReport(StudentID, CSemesterID9));
        a2.Add(DataAccess.GetAcademicGraduationReport(StudentID, CSemesterID10));

        //a2.Add(DataAccess.GetModelReport(StudentID));
        //a2.Add(DataAccess.GetAcademicAdvisingReport(StudentID, "1"));
        //a2.Add(DataAccess.GetAcademicAdvisingReport(StudentID, "2"));
        //a2.Add(DataAccess.GetAcademicAdvisingReport(StudentID, "3"));
        //a2.Add(DataAccess.GetAcademicAdvisingReport(StudentID, "4"));
        //a2.Add(DataAccess.GetAcademicAdvisingReport(StudentID, "5"));
        //a2.Add(DataAccess.GetAcademicAdvisingReport(StudentID, "6"));
        //a2.Add(DataAccess.GetAcademicAdvisingReport(StudentID, "7"));
        //a2.Add(DataAccess.GetAcademicAdvisingReport(StudentID, "8"));
        //a2.Add(DataAccess.GetAcademicAdvisingReport(StudentID, "9"));
        //a2.Add(DataAccess.GetAcademicAdvisingReport(StudentID, "10"));
        CreatePDF("AcademicGraduation", @"Academic\Reports\GraduationReport.rdlc", a1, a2);
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