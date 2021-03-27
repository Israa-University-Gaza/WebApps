using iTextSharp.text;
using iTextSharp.text.pdf;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_DeanSyllabus : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Permissions.Contains("DeanSyllabus"))
        {
            lbEmployeeID.Text = EmployeeID;
            lbPlaceID.Text = "3";
        }

        else
            Response.Redirect("Default.aspx");
    }


    private void CreateWord(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray)
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

        byte[] bytes = viwer.LocalReport.Render("WORD", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

        // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
        Response.Buffer = true;
        Response.Clear();
        Response.ContentType = mimeType;
        Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
        Response.BinaryWrite(bytes); // create the file
        Response.Flush(); // send it to the client to download
    }


    private void CreateWord2(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray, string ID, int type)
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

        byte[] bytes = viwer.LocalReport.Render("WORD", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

        if (!System.IO.Directory.Exists(Server.MapPath("~/ReportFiles/Syllabus/AllSyllabus")))
        {
            System.IO.Directory.CreateDirectory(Server.MapPath("~/ReportFiles/Syllabus/AllSyllabus"));
        }
        using (FileStream fs = new FileStream(Server.MapPath("~/ReportFiles/Syllabus/AllSyllabus/") + ID + ".docx", FileMode.Create))
        {
            fs.Write(bytes, 0, bytes.Length);
        }
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
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
        a2.Add(DataAccess.GetSyllabusActivity(id, lbPlaceID.Text));
        a2.Add(DataAccess.GetSyllabusBook(id, lbPlaceID.Text));
        a2.Add(DataAccess.GetSyllabusDetailedDescription(id, lbPlaceID.Text));
        a2.Add(DataAccess.GetSyllabusEvaluation(id, lbPlaceID.Text));
        a2.Add(DataAccess.GetSyllabusGoal(id, lbPlaceID.Text));
        a2.Add(DataAccess.GetSyllabusOutcome(id, lbPlaceID.Text));
        a2.Add(DataAccess.GetSyllabusReference(id, lbPlaceID.Text));

        CreatePDF("SyllabusReport" + id, @"Academic\Reports\SyllabusReport.rdlc", a1, a2);
    }


    protected void lbWord_Click(object sender, EventArgs e)
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
        a2.Add(DataAccess.GetSyllabusActivity(id, lbPlaceID.Text));
        a2.Add(DataAccess.GetSyllabusBook(id, lbPlaceID.Text));
        a2.Add(DataAccess.GetSyllabusDetailedDescription(id, lbPlaceID.Text));
        a2.Add(DataAccess.GetSyllabusEvaluation(id, lbPlaceID.Text));
        a2.Add(DataAccess.GetSyllabusGoal(id, lbPlaceID.Text));
        a2.Add(DataAccess.GetSyllabusOutcome(id, lbPlaceID.Text));
        a2.Add(DataAccess.GetSyllabusReference(id, lbPlaceID.Text));

        CreateWord("SyllabusReport" + id, @"Academic\Reports\SyllabusReport.rdlc", a1, a2);
    }
    protected void lbAccept_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("SyllabusID")).Text;
        DataTable DT = DataAccess.SyllabusAccredit(id, "1", lbPlaceID.Text, EmployeeID, lbPlaceID.Text);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() == "1") ? "success" : "Error");
        ListView1.DataBind();
    }

    protected void lbReturn_Click(object sender, EventArgs e)
    {

        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("SyllabusID")).Text;
        DataTable DT = DataAccess.SyllabusAccredit(id, "3", lbPlaceID.Text, EmployeeID, lbPlaceID.Text);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() == "1") ? "success" : "Error");
        ListView1.DataBind();
    }

    protected void lbReject_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("SyllabusID")).Text;
        DataTable DT = DataAccess.SyllabusAccredit(id, "2", lbPlaceID.Text, EmployeeID, lbPlaceID.Text);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() == "1") ? "success" : "Error");
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

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("SyllabusID")).Text;
        string CourseName = ((Label)li.FindControl("CourseName")).Text;
        Session["SyllabusID"] = ID;
        Session["CourseName"] = CourseName;
        Session["AccreditationDepartmentID"] = lbPlaceID.Text;
        Response.Redirect("SyllabusGeneralDescription.aspx");
    }



    protected void lbSyllabusAllWord_Click(object sender, EventArgs e)
    {
        ArrayList list = AllReportWord();
        mergePdfs(list);
    }


    protected void lbSyllabusPrintAllWord_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ReportFiles/Syllabus/" + "AllSyllabus.docx");
    }

    protected ArrayList AllReportWord()
    {
        DataTable DT = new DataTable();
        string College = ddlCollege.SelectedValue;

        DT = DataAccess.GetSyllabusIDs(College);
        ArrayList list = new ArrayList();
        foreach (DataRow row in DT.Rows)
        {
            string id = row["ID"].ToString();
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
            a2.Add(DataAccess.GetSyllabusActivity(id, lbPlaceID.Text));
            a2.Add(DataAccess.GetSyllabusBook(id, lbPlaceID.Text));
            a2.Add(DataAccess.GetSyllabusDetailedDescription(id, lbPlaceID.Text));
            a2.Add(DataAccess.GetSyllabusEvaluation(id, lbPlaceID.Text));
            a2.Add(DataAccess.GetSyllabusGoal(id, lbPlaceID.Text));
            a2.Add(DataAccess.GetSyllabusOutcome(id, lbPlaceID.Text));
            a2.Add(DataAccess.GetSyllabusReference(id, lbPlaceID.Text));
            CreateWord2("SyllabusReport" + id, @"Academic\Reports\SyllabusReport.rdlc", a1, a2,id,1);
            list.Add(Server.MapPath("~/ReportFiles/Syllabus/AllSyllabus/") + id + ".docx");
        }

        return list;
    }

    private void mergePdfs(ArrayList list)
    {

        PdfReader reader = null;
        Document sourceDocument = null;
        PdfCopy pdfCopyProvider = null;
        PdfImportedPage importedPage;
        string outputPdfPath = Server.MapPath("~/ReportFiles/Syllabus/") + "AllSyllabus.docx";

        sourceDocument = new Document();
        // string outputPdfPath = Server.MapPath("~/ReportFiles/FinalExamSectionStudents/" + ddlExamDate.SelectedValue.Replace("/", "-") + "/" + ddlExamTime.SelectedValue.Replace(":", ".") + "/") + "Total.pdf";
        pdfCopyProvider = new PdfCopy(sourceDocument, new FileStream(outputPdfPath, FileMode.Create));

        //Open the output file
        sourceDocument.Open();

        try
        {
            //Loop through the files list
            for (int f = 0; f < list.Count - 1; f++)
            {
                int pages = get_pageCcount(list[f].ToString());
                reader = new PdfReader(list[f].ToString());
                //Add pages of current file
                for (int i = 1; i <= pages; i++)
                {
                    importedPage = pdfCopyProvider.GetImportedPage(reader, i);
                    pdfCopyProvider.AddPage(importedPage);
                }
                reader.Close();
            }
            //At the end save the output file
            sourceDocument.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private int get_pageCcount(string file)
    {
        using (StreamReader sr = new StreamReader(File.OpenRead(file)))
        {
            Regex regex = new Regex(@"/Type\s*/Page[^s]");
            MatchCollection matches = regex.Matches(sr.ReadToEnd());
            return matches.Count;
        }
    }
}