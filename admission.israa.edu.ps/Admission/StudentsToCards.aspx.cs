﻿using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StudentsToCards : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPermissionsContains("Students"))
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void btnAddToCard_Click(object sender, EventArgs e)
    {
        int count = 0;
        foreach (ListViewItem item in ListView1.Items)
        {
            string StudentID = (item.FindControl("StudentID") as Label).Text;
            CheckBox cbAddToCard = (item.FindControl("cbAddToCard") as CheckBox);
            if (cbAddToCard.Checked)
            {
                DataTable DT = DataAccess.ForStudentCardAdd(StudentID, EmployeeID);
                if (DT.Rows[0]["status"].ToString() == "1")
                    count++;
            }
        }
        ShowToast(this, "تم إضافة " + count + " بطاقة طالب", "", "success");
    }

    protected void btnStudentCardDelete_Click(object sender, EventArgs e)
    {
        int count = 0;
        foreach (ListViewItem item in ListView1.Items)
        {
            string StudentID = (item.FindControl("StudentID") as Label).Text;
            CheckBox cbAddToCard = (item.FindControl("cbAddToCard") as CheckBox);
            if (cbAddToCard.Checked)
            {
                DataTable DT = DataAccess.StudentCardDelete(StudentID, EmployeeID);
                if (DT.Rows[0]["status"].ToString() == "1")
                    count++;
            }
        }
        ShowToast(this, "تم حذف " + count + " بطاقة طالب", "", "success");
    }

    protected void btnDeleteAllCards_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.ForStudentCardDeleteAll();
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() == "1") ? "success" : "error");
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

    protected void btnPrintStudentCards_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsStudentCard1");
        a1.Add("dsStudentCard2");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStudentsCards("0"));
        a2.Add(DataAccess.GetStudentsCards("1"));

        CreatePDF("Card", @"Admission\Reports\NewStudentCard11.rdlc", a1, a2);
    }

    protected void btnPrintStudentCards2_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsStudentCard1");
        a1.Add("dsStudentCard2");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStudentsCards("0"));
        a2.Add(DataAccess.GetStudentsCards("1"));

        CreatePDF("Card", @"Admission\Reports\NewStudentCard12.rdlc", a1, a2);
    }

    protected void btnPrintSpecialStudentCard_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsStudentCard1");
        a1.Add("dsStudentCard2");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStudentsCards("0"));
        a2.Add(DataAccess.GetStudentsCards("1"));

        CreatePDF("Card", @"Admission\Reports\NewStudentCard13.rdlc", a1, a2);
    }

    protected void btnPrintSpecialStudentCard2_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsStudentCard1");
        a1.Add("dsStudentCard2");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStudentsCards("0"));
        a2.Add(DataAccess.GetStudentsCards("1"));

        CreatePDF("Card", @"Admission\Reports\NewStudentCard14.rdlc", a1, a2);
    }
}