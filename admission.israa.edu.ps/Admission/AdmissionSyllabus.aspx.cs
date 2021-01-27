﻿using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Admission_AdmissionSyllabus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbPlaceID.Text = "5";
    }

    protected void lbPrint_Click(object sender, EventArgs e)
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

        CreatePDF("SyllabusReport" + id, @"Admission\Reports\SyllabusReport.rdlc", a1, a2);
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCollege.DataBind();
        ddlDepartment.DataBind();
        ddlCourse.DataBind();
    }

    protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDepartment.DataBind();
        ddlCourse.DataBind();
    }

    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCourse.DataBind();
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