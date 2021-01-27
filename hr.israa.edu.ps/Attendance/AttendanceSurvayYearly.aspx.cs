using iTextSharp.text;
using iTextSharp.text.pdf;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_AttendanceSurvayYearly : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
  //  Response.Redirect("~/ReportView.aspx?Attyear1=" + TextBox1.Text);
        AllReportPDF(Convert.ToInt16(TextBox1.Text));
    }

    #region AllReport
    private void CreatePDF2(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray, string EmpID)
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

        if (!System.IO.Directory.Exists("D:\\FilesPDF"))
        {
            System.IO.Directory.CreateDirectory("D:\\FilesPDF");
        }
        using (FileStream fs = new FileStream("D:\\FilesPDF\\AttSurvayY" + EmpID + ".PDF", FileMode.Create))
        {
            fs.Write(bytes, 0, bytes.Length);

        }

    }
    private void AllReportPDF( int Year)
    {
        DataTable DT = new DataTable();
        DT = DataAccess.Employee_TB_GetAll();


        foreach (DataRow row in DT.Rows)
        {
            string EmpID = row["Emp_ID"].ToString();

            ArrayList a1 = new ArrayList();

            a1.Add("AttendanceSurvayYearly");
            ArrayList a2 = new ArrayList();



          
            a2.Add(DataAccess.AttendanceSurvayYearly(Year,Convert.ToInt16(EmpID)));


            CreatePDF2("Attendance", @"Reports\AttendanceSurvayYearly.rdlc", a1, a2, EmpID +  "_" + Year);



        }
        //after this
        //merge all pdfs in one pdf

        mergePdfs(DT.Rows.Count, Year);
    }

    private void mergePdfs(int countPDF, int Year)
    {
        DataTable DT = new DataTable();
        DT = DataAccess.Employee_TB_GetAll();

        string[] lstFiles = new string[countPDF];
        int h = 0;
        while (h < countPDF)
        {
            foreach (DataRow row in DT.Rows)
            {

                string Emp_ID = row["Emp_ID"].ToString();
                lstFiles[h] = @"D:/FilesPDF/AttSurvayY" + Emp_ID  + "_" + Year + ".pdf";
                h++;

            }
        }

        PdfReader reader = null;
        Document sourceDocument = null;
        PdfCopy pdfCopyProvider = null;
        PdfImportedPage importedPage;

        string outputPdfPath = @"D:/FilesPDF/AttSurvayY" + "_" + Year + ".pdf";
        if (File.Exists("D:/FilesPDF/AttSurvayY" + "_" + Year + ".pdf")) File.Delete(@"D:/FilesPDF/AttSurvayY" + "_" + Year + ".pdf");


        sourceDocument = new Document();
        pdfCopyProvider = new PdfCopy(sourceDocument, new System.IO.FileStream(outputPdfPath, System.IO.FileMode.Create));

        //Open the output file
        sourceDocument.Open();

        try
        {
            //Loop through the files list
            for (int f = 0; f < lstFiles.Length - 1; f++)
            {
                int pages = get_pageCcount(lstFiles[f]);

                reader = new PdfReader(lstFiles[f]);
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
        //remove single files 
        //foreach (DataRow row in DT.Rows)
        //{

        //    string Emp_ID = row["Emp_ID"].ToString();
        //    File.Delete(@"D:/FilesPDF/AttSurvayY" + Emp_ID  + "_" + Year + ".pdf");


        //}


        // send it to the client to download
        //Process p = new Process();
        //ProcessStartInfo s = new ProcessStartInfo(@"D:/FilesPDF/AttSurvayY" + "_" + Year + ".pdf");
        //p.StartInfo = s;
        //p.Start();
        //string FilePath = Server.MapPath(@"D:/FilesPDF/AttSurvayY" + "_" + Year + ".pdf");
        //WebClient User = new WebClient();
        //Byte[] FileBuffer = User.DownloadData(FilePath);
        //if (FileBuffer != null)
        //{
        //    Response.ContentType = "application/pdf";
        //    Response.AddHeader("content-length", FileBuffer.Length.ToString());
        //    Response.BinaryWrite(FileBuffer);
        //}


        printAll.Visible = true;

        ShowToast(this, "تم حصر اجازات الموظفين بنجاح.", "", "success");




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

    #endregion
    protected void printReport_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("EmpID")).Text;
        string filepath="D:/FilesPDF/AttSurvayY" + ((Label)ri.FindControl("EmpID")).Text + "_" + TextBox1.Text + ".pdf";
        if (File.Exists(filepath))
        {
         Response.ContentType = "application/pdf";
        Response.Clear();
        Response.TransmitFile("D:/FilesPDF/AttSurvayY" + ((Label)ri.FindControl("EmpID")).Text + "_" + TextBox1.Text + ".pdf");
        Response.End();  
        }
    }
    
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
         string filepath = "D:/FilesPDF/AttSurvayY" +  "_" + TextBox1.Text + ".pdf";
        if (File.Exists(filepath))
        {
      
            Repeater1.Visible = true;
            Repeater1.DataBind();
            printAll.Visible = true;
        }
    }
    protected void printAll_Click(object sender, EventArgs e)
    {
        string filepath = "D:/FilesPDF/AttSurvayY" +  "_" + TextBox1.Text + ".pdf";
        if (File.Exists(filepath))
        {
            Response.ContentType = "application/pdf";
            Response.Clear();
            Response.TransmitFile(filepath);
            Response.End();
        }
    }
}