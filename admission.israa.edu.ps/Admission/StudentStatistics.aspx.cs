﻿using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StudentStatistics : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Permissions.Contains("AdmissionModelReport"))
            Response.Redirect("Default.aspx");
    }

    protected void lbIsraStudentStatistics_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsIsraStudentDepartmentStatistic");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStudentDepartmentStatistic());

        CreatePDF("IsraStudentStatistic", @"Admission\Reports\IsraStudentDepartmentStatistic.rdlc", a1, a2);
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

    protected void lbIsraStudentStatisticsWithPercent_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsIsraStudentDepartmentStatistic");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetIsraStudentDepartmentStatistic());

        CreatePDF("IsraStudentStatistic", @"Admission\Reports\IsraStudentDepartmentStatisticWithPercentage.rdlc", a1, a2);
    }
}