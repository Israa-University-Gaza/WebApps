using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_InstructorAttendance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Empstatus.SelectedValue = "1041";
            ddlEmpSubStatus.DataSourceID = "SqlDataSource22";
            ddlEmpSubStatus.DataBind();
            ddlEmpSubStatus.SelectedValue = "2126";
            ListView1.DataBind();
        }
    }
    protected void date_TextChanged(object sender, EventArgs e)
    {

        ListView1.DataBind();
    }
    protected void Empstatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlEmpSubStatus.Visible = true;
        if (Empstatus.SelectedValue == "1041")
        {
            ddlEmpSubStatus.DataSourceID = "SqlDataSource22";
        }
        else if (Empstatus.SelectedValue == "1043")
        {
            ddlEmpSubStatus.DataSourceID = "SqlDataSource34";

        }
        else if (Empstatus.SelectedValue == "2122")
        {
            ddlEmpSubStatus.DataSourceID = "SqlDataSource5";
        }
        else
        {
            ddlEmpSubStatus.Visible = false;
        }

        ListView1.DataBind();
    }
    protected void ddlEmpCategoryID_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void ddlEmpSubStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void btnAttendance_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("InstructorAttendance");
        ArrayList a2 = new ArrayList();

        a2.Add(DataAccess.GetInstructorAttendance(Date.Text, ddlEmpCategoryID.SelectedValue, Empstatus.SelectedValue, ddlEmpSubStatus.SelectedValue, ddlEmployeeCat.SelectedValue, ddlContractTypeID.SelectedValue, ddlSubContractType.SelectedValue,"-1","-1"));
        CreatePDF("كشف دوام المحاضرين", @"Reports\InstructorAttendanceReport.rdlc", a1, a2);
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
            ReportDataSource rds1 = new ReportDataSource((string)dsNameArray[i], DTArray[i]);
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


    protected void lbAbsentPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("InstructorAttendance");
        ArrayList a2 = new ArrayList();

        a2.Add(DataAccess.GetInstructorAttendance(Date.Text, ddlEmpCategoryID.SelectedValue, Empstatus.SelectedValue, ddlEmpSubStatus.SelectedValue, ddlEmployeeCat.SelectedValue, ddlContractTypeID.SelectedValue, ddlSubContractType.SelectedValue,"1","-1"));
        CreatePDF("كشف غياب المحاضرين", @"Reports\AbsentInstructorReport.rdlc", a1, a2);
    }

    protected void btnLate_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("InstructorAttendance");
        ArrayList a2 = new ArrayList();

        a2.Add(DataAccess.GetInstructorAttendance(Date.Text, ddlEmpCategoryID.SelectedValue, Empstatus.SelectedValue, ddlEmpSubStatus.SelectedValue, ddlEmployeeCat.SelectedValue, ddlContractTypeID.SelectedValue, ddlSubContractType.SelectedValue, "-1", "1"));
        CreatePDF("كشف تأخير المحاضرين", @"Reports\InstructorsLateReport.rdlc", a1, a2);
    }

}