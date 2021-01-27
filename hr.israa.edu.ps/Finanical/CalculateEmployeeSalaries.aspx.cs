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

public partial class Finanical_CalculateEmployeeSalaries : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { ddlYear, ddlMonth });
        if (validate)
        {

            DataTable DT = DataAccess.EmployeeSalaryAdd(ddlMonth.SelectedValue, ddlYear.SelectedValue, ddlEmployeeName.SelectedValue, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                ListView1.DataBind();
            }

        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
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

    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
    { 
        ListView1.DataBind();
    }

    protected void btnExcel_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlYear, ddlMonth,ddlBank }))
        {
            DataTable DT = DataAccess.GetExcelEmployeeSalary(ddlMonth.SelectedValue, ddlYear.SelectedValue, ddlEmployeeName.SelectedValue,ddlBank.SelectedValue);
            ExportToExcel(DT);
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
    public void ExportToExcel(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            string filename = "DownloadExcel.xls";
            Response.ContentEncoding = System.Text.Encoding.Unicode;
            Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());
            System.IO.StringWriter tw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
            DataGrid dgGrid = new DataGrid();
            dgGrid.DataSource = dt;
            dgGrid.DataBind();
            //dt.Rows.Add("اسم الموظف", "رقم الموظف","راتب الصندوق","عملة الصندوق","راتب محول","عملة المحول","خصم شئون موظفين","خصم محول","تسليم صندوق","عملة التسليم");
            //Get the HTML for the control.
            dgGrid.RenderControl(hw);
            //Write the HTML back to the browser.
            //Response.ContentType = application/vnd.ms-excel;
            Response.ContentType = "application/vnd.ms-excel";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename + "");
            this.EnableViewState = false;
            Response.Write(tw.ToString());
            Response.End();
        }
    }

    protected void lbReCalculate_Click(object sender, EventArgs e)
    {
        //EmployeeSalaryUpdate
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string EmployeeID = ((Label)li.FindControl("lblEmployeeID")).Text;
        bool validate = ValidateControls(new WebControl[] { ddlYear, ddlMonth });
        if (validate)
        {

            DataTable DT = DataAccess.EmployeeSalaryUpdate(ddlMonth.SelectedValue, ddlYear.SelectedValue, EmployeeID, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                ListView1.DataBind();
            }

        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnReCalculateAll_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { ddlYear, ddlMonth });
        if (validate)
        {

            DataTable DT = DataAccess.EmployeeSalaryUpdate(ddlMonth.SelectedValue, ddlYear.SelectedValue, "-1", UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                ListView1.DataBind();
            }

        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void lbSalaryForm_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string EmployeeID = ((Label)li.FindControl("lblEmployeeID")).Text;
        ArrayList a1 = new ArrayList();
            a1.Add("GetEmployeeSalaryForm1");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.GetEmployeeSalaryForm1(EmployeeID,ddlMonth.SelectedValue,ddlYear.SelectedValue));
            CreatePDF("استمارة الراتب", @"Reports\SalaryForm1.rdlc", a1, a2);

        
    }

    protected void btnshikel_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlYear, ddlMonth }))
        {
            ArrayList a1 = new ArrayList();
            a1.Add("GetCalculatedEmployeeSalary");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.GetCalculatedEmployeeSalary(ddlMonth.SelectedValue, ddlYear.SelectedValue, ddlBank.SelectedValue));
            CreatePDF("SalaryReport", @"Reports\CaderSalaryReport.rdlc", a1, a2);
            // CreateExcel("SalaryReportshikel", @"Reports\ExcelSalaryReport.rdlc", a1, a2);
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
    protected void btnExcelShikel_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlYear, ddlMonth }))
        {
            DataTable DT = DataAccess.GetExcelCalculatedEmployeeSalary(ddlMonth.SelectedValue, ddlYear.SelectedValue, ddlBank.SelectedValue);
            ExportToExcel(DT);
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnPrintAllSalaryForms_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { ddlMonth,ddlYear});
        if (validate)
        {

            AllReportPDF();

        }
        else ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
    }
    #region AllReport
    private void CreatePDF2(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray, string ID, int type)
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

        if (!System.IO.Directory.Exists(Server.MapPath("~/Uploads/FilesPDF")))
        {
            System.IO.Directory.CreateDirectory(Server.MapPath("~/Uploads/FilesPDF"));
        }
        using (FileStream fs = new FileStream(Server.MapPath("~/Uploads/FilesPDF/") + ID + ".pdf", FileMode.Create))
        {
            fs.Write(bytes, 0, bytes.Length);

        }

    }
    private void AllReportPDF()
    {
        int count = 0;
        foreach (ListViewItem item in ListView1.Items)
        {
            CheckBox cb = (CheckBox)item.FindControl("CheckBox1");
            if (cb.Checked)
            {
               string EmployeeID = ((Label)item.FindControl("lblEmployeeID")).Text;
                ArrayList a1 = new ArrayList();
                a1.Add("GetEmployeeSalaryForm1");

                ArrayList a2 = new ArrayList();
                a2.Add(DataAccess.GetEmployeeSalaryForm1(EmployeeID, ddlMonth.SelectedValue, ddlYear.SelectedValue));
                CreatePDF2("استمارة الراتب_" + EmployeeID + "_" + ddlMonth.SelectedValue + "_" + ddlYear.SelectedValue, @"Reports\SalaryForm1.rdlc", a1, a2, EmployeeID, 1);
                count = count + 1;
            }
        }
       mergePdfs(count);


        //DataTable DT = new DataTable();
        //DT = DataAccess.GetEmployeeSalary(ddlMonth.SelectedValue, ddlYear.SelectedValue);


        //        foreach (DataRow row in DT.Rows)
        //{
        //    string EmployeeID = row["EmployeeID"].ToString();
        //    ArrayList a1 = new ArrayList();
        //        a1.Add("GetEmployeeSalaryForm1");

        //        ArrayList a2 = new ArrayList();
        //        a2.Add(DataAccess.GetEmployeeSalaryForm1(EmployeeID, ddlMonth.SelectedValue, ddlYear.SelectedValue));
        //        CreatePDF2("استمارة الراتب_"+ row["EmployeeName"].ToString()+"_" + ddlMonth.SelectedValue+"_"+ddlYear.SelectedValue, @"Reports\SalaryForm1.rdlc", a1, a2, EmployeeID, 1);

        //}


        //after this
        //merge all pdfs in one pdf

        // mergePdfs(DT.Rows.Count);

    }

    private void mergePdfs(int countPDF)
    {
        string[] lstFiles = new string[countPDF+1];
        int h = 0;
        while (h < countPDF)
        {
            foreach (ListViewItem item in ListView1.Items)
            {
                CheckBox cb = (CheckBox)item.FindControl("CheckBox1");
                if (cb.Checked)
                {
                    string EmployeeID = ((Label)item.FindControl("lblEmployeeID")).Text;
                    lstFiles[h] = Server.MapPath("~/Uploads/FilesPDF/") + EmployeeID + ".pdf";
                    h++;
                }
            }

        }
        //DataTable DT = new DataTable();
        //DT = DataAccess.GetEmployeeSalary(ddlMonth.SelectedValue, ddlYear.SelectedValue);

        //string[] lstFiles = new string[countPDF];
        //int h = 0;
        //while (h < countPDF)
        //{
        //    foreach (DataRow row in DT.Rows)
        //    {

        //        string EmployeeID = row["EmployeeID"].ToString();
        //        lstFiles[h] = @"C:\\Inetpub\\vhosts\\israa.edu.ps\\hr.israa.edu.ps\\Uploads\\FilesPDF\\" + EmployeeID + ".pdf";
        //        h++;

        //    }
        //}

        PdfReader reader = null;
        Document sourceDocument = null;
        PdfCopy pdfCopyProvider = null;
        PdfImportedPage importedPage;
        string outputPdfPath = Server.MapPath("~/Uploads/FilesPDF/") +"SalaryForm_"+ddlMonth.SelectedValue+"_"+ddlYear.SelectedValue+".pdf";


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

                    //    string Emp_ID = row["ID"].ToString();
                    //    File.Delete(@"C:\\Inetpub\\vhosts\\israa.edu.ps\\hr.israa.edu.ps\\Uploads\\FilesPDF\\" + ID + ".pdf");

                    //}
        //send it to the client to download
       Process p = new Process();
        ProcessStartInfo s = new ProcessStartInfo(Server.MapPath("~/Uploads/FilesPDF/") + "SalaryForm_" + ddlMonth.SelectedValue + "_" + ddlYear.SelectedValue + ".pdf");
        p.StartInfo = s;
        p.Start();


      //  WebClient webClient = new System.Net.WebClient();
     // webClient.DownloadFile((Server.MapPath("~/Uploads/FilesPDF/") + "SalaryForm_" + ddlMonth.SelectedValue + "_" + ddlYear.SelectedValue + ".pdf"), @"C:\folder" );
    }
    private int get_pageCcount(string file)
    {
        using (StreamReader sr = new StreamReader(File.OpenRead(file)))
        {
            Regex regex = new Regex(@" / Type\s*/Page[^s]");
            MatchCollection matches = regex.Matches(sr.ReadToEnd());

            return matches.Count;
        }
    }

    #endregion

    protected void ddlCaderEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlYear, ddlMonth }))
        {
            ArrayList a1 = new ArrayList();
            a1.Add("GetTotalCaderEmployeeSalaryReport");
            ArrayList a2 = new ArrayList();
            a2.Add(DataAccess.GetTotalCaderEmployeeSalaryReport(ddlMonth.SelectedValue, ddlYear.SelectedValue, ddlBank.SelectedValue));
            if (ddlBank.SelectedValue == "2039")
            {
                CreatePDF("  صرف رواتب البنك الاسلامي العربي لشهر" + ddlMonth.SelectedItem.Text + "لسنة " + ddlYear.SelectedValue, @"Reports\CaderTotalEmployeesSalary.rdlc", a1, a2);
            }
            else if (ddlBank.SelectedValue == "2124")
            {
                CreatePDF(" صرف رواتب البنك الاسلامي الوطني لشهر " + ddlMonth.SelectedItem.Text + "لسنة " + ddlYear.SelectedValue, @"Reports\CaderTotalEmployeesSalary2.rdlc", a1, a2);
            }

        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
}