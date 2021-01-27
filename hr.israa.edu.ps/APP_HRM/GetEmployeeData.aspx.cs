using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class APP_HRM_GetEmployeeData : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
            ReportDataSource rds1 = new ReportDataSource((string)dsNameArray[i], (System.Data.DataTable)DTArray[i]);
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


    protected void PageVolunteerREquest_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string EmpID = ((Label)li.FindControl("EmpID")).Text;

        Session["VolunteerID"] = EmpID;
        Response.Redirect("VolunteerRequirement.aspx");
    
    }


    protected void PDFVolunteerREquest_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string EmpID = ((Label)li.FindControl("EmpID")).Text;
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetVolunteerPersonalInformation");
        a1.Add("dsGetVolunteerInformation");
        a1.Add("dsGetVolunteerSkillsInformation");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetVolunteerPersonalInformation(EmpID));
        a2.Add(DataAccess.GetVolunteerInformation(EmpID));
        a2.Add(DataAccess.GetVolunteerSkillsInformation(EmpID));
        CreatePDF("VolunteerRequestReport", @"Reports\VolunteerRequestReport.rdlc", a1, a2);
    }



    protected void ddlEmpName_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void ddlEmpType_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}