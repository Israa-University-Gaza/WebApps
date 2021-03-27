//using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_InstructorAttendance : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlEmploymentTypeID.DataBind();
            ddlEmploymentTypeID.Items.Insert(0, new ListItem("جميع أنواع التعيينات", "-1"));
            ddlAttendanceInstructorStatusID.DataBind();
            ddlAttendanceInstructorStatusID.Items.Insert(0, new ListItem("جميع الحالات", "-1"));
            //txtDateFrom.Text = DateTime.Now.AddDays(-7).ToString("yyyy/MM/dd");
            txtDateFrom.Text = DateTime.Now.ToString("yyyy/MM/dd");
            txtDateTo.Text = DateTime.Now.ToString("yyyy/MM/dd");

        }

    }
   

    protected void DataBind_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    //protected void btnAttendance_Click(object sender, EventArgs e)
    //{
    //    ArrayList a1 = new ArrayList();
    //    a1.Add("InstructorAttendance");
    //    ArrayList a2 = new ArrayList();

    //    a2.Add(DataAccess.GetAcademicInstructorAttendance(EmployeeID,ddlSemester.SelectedValue, Date.Text, "-1", "-1"));
    //    CreatePDF("كشف دوام المحاضرين", @"Academic\Reports\InstructorAttendanceReport.rdlc", a1, a2);
    //}
    //private void CreatePDF(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray)
    //{
    //    ReportViewer viwer = new ReportViewer();
    //    Warning[] warnings = null;
    //    string[] streamIds = null;
    //    string mimeType = string.Empty;
    //    string encoding = string.Empty;
    //    string extension = string.Empty;
    //    string filetype = string.Empty;

    //    viwer.SizeToReportContent = true;
    //    viwer.LocalReport.ReportPath = reportpath;
    //    viwer.ProcessingMode = ProcessingMode.Local;

    //    for (int i = 0; i < dsNameArray.Count; i++)
    //    {
    //        ReportDataSource rds1 = new ReportDataSource((string)dsNameArray[i], DTArray[i]);
    //        viwer.LocalReport.DataSources.Add(rds1);
    //    }

    //    viwer.LocalReport.Refresh();


    //    byte[] bytes = viwer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

    //    // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
    //    Response.Buffer = true;
    //    Response.Clear();
    //    Response.ContentType = mimeType;
    //    Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
    //    Response.BinaryWrite(bytes); // create the file
    //    Response.Flush(); // send it to the client to download
    //}


    //protected void lbAbsentPDF_Click(object sender, EventArgs e)
    //{
    //    ArrayList a1 = new ArrayList();
    //    a1.Add("InstructorAttendance");
    //    ArrayList a2 = new ArrayList();

    //    a2.Add(DataAccess.GetAcademicInstructorAttendance(EmployeeID,ddlSemester.SelectedValue,Date.Text, "1", "-1"));
    //    CreatePDF("كشف غياب المحاضرين", @"Academic\Reports\AbsentInstructorReport.rdlc", a1, a2);
    //}

    //protected void btnLate_Click(object sender, EventArgs e)
    //{
    //    ArrayList a1 = new ArrayList();
    //    a1.Add("InstructorAttendance");
    //    ArrayList a2 = new ArrayList();

    //    a2.Add(DataAccess.GetAcademicInstructorAttendance(EmployeeID,ddlSemester.SelectedValue, Date.Text, "-1", "1"));
    //    CreatePDF("كشف تأخير المحاضرين", @"Academic\Reports\InstructorsLateReport.rdlc", a1, a2);
    //}



   
}