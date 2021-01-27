using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_PlanReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }
    }
    protected void lbPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetPlanSemester11Report");
        a1.Add("dsGetPlanSemester12Report");
        a1.Add("dsGetPlanSemester21Report");
        a1.Add("dsGetPlanSemester22Report");
        a1.Add("dsGetPlanSemester31Report");
        a1.Add("dsGetPlanSemester32Report");
        a1.Add("dsGetPlanSemester41Report");
        a1.Add("dsGetPlanSemester42Report");
        a1.Add("dsGetPlanSemester51Report");
        a1.Add("dsGetPlanSemester52Report");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetPlanSemester11Report(ddlPlan.SelectedValue));
        a2.Add(DataAccess.GetPlanSemester12Report(ddlPlan.SelectedValue));
        a2.Add(DataAccess.GetPlanSemester21Report(ddlPlan.SelectedValue));
        a2.Add(DataAccess.GetPlanSemester22Report(ddlPlan.SelectedValue));
        a2.Add(DataAccess.GetPlanSemester31Report(ddlPlan.SelectedValue));
        a2.Add(DataAccess.GetPlanSemester32Report(ddlPlan.SelectedValue));
        a2.Add(DataAccess.GetPlanSemester41Report(ddlPlan.SelectedValue));
        a2.Add(DataAccess.GetPlanSemester42Report(ddlPlan.SelectedValue));
        a2.Add(DataAccess.GetPlanSemester51Report(ddlPlan.SelectedValue));
        a2.Add(DataAccess.GetPlanSemester52Report(ddlPlan.SelectedValue));
        CreatePDF("Plan", @"Admission\Reports\Report.rdlc", a1, a2);
    }
    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repeater1.DataBind();
    }
    protected void ddlPlan_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repeater1.DataBind();
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