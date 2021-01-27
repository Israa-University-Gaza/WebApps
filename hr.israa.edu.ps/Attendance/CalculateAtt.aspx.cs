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
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_CalculateAtt : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Att_Eval(object sender, EventArgs e)
    {

   
        bool validate = ValidateControls(new WebControl[] { DropDownList1, TextBox1});
        bool intvalidate =IntValidateControls(new WebControl[] { DropDownList1, TextBox1});

        bool DateValidate = DateValidateControls(new WebControl[] {  });
        if (validate && DateValidate && intvalidate)
        {
            try
            {
               //  اولا  فحص العطلات الرسمية 
                //if (DataAccess.AttendanceHolidayCheck(DropDownList1.SelectedValue, TextBox1.Text) > 0)
                //{



                DataTable DT = DataAccess.Employee_TB_GetAll2(DropDownList2.SelectedValue);
                    foreach (DataRow Row in DT.Rows)
                    {

                        if (DataAccess.CalculateAttendance(Row["Emp_ID"].ToString(), Convert.ToInt16(DropDownList1.SelectedValue),
                            Convert.ToInt16(TextBox1.Text), Convert.ToInt16(UserID)) > 0)
                        {

                            ShowToast(this, "تم احتساب الدوام بنجاح.", "", "success");
                            row.Visible = true;
                            Repeater1.DataBind();
                            Button2.Visible = true;
                            Button3.Visible = true;

                        }
                        else
                        {
                            ShowToast(this, "عذرًا , تم احتساب الدوام مسبقا .", "", "Warning");
                            row.Visible = true;
                            Repeater1.DataBind();
                        }
                    }
               // }
       }
            catch
            {
                ShowToast(this, " عذرًا , تم احتساب الدوام مسبقا .", "", "error");
                row.Visible = true;
                Repeater1.DataBind();
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


    protected void Button2_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { DropDownList1, TextBox1, DropDownList2 });
        if (validate)
        {
            ArrayList a1 = new ArrayList();
            a1.Add("saAttendanceReport");

            ArrayList a2 = new ArrayList();


            a2.Add(DataAccess.AttendanceReportGetAll(Convert.ToInt16(DropDownList1.SelectedValue), Convert.ToInt16(TextBox1.Text), Convert.ToInt16(DropDownList2.SelectedValue)));

            CreatePDF("AllEmpAttendance", @"Reports\AttAllEmp.rdlc", a1, a2);
        }
        else ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
    }


    //AllAttendanceReport
    protected void Button3_Click(object sender, EventArgs e)
    {
          bool validate = ValidateControls(new WebControl[] { DropDownList1, TextBox1 });
          if (validate)
          {
              string filepath = "D:/FilesPDF/Attendance" + Convert.ToInt16(DropDownList1.SelectedValue) + "_" + Convert.ToInt16(TextBox1.Text) + ".pdf";
              if (File.Exists(filepath))
              {
                  Response.ContentType = "application/pdf";
                  Response.Clear();
                  Response.TransmitFile(filepath);
                  Response.End();
              }
              else
                  AllReportPDF(Convert.ToInt16(DropDownList1.SelectedValue), Convert.ToInt16(TextBox1.Text));
          }
          else ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
    }

    // methods for mergepdf AllAttendanceReport
    #region AllAttendanceReport
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
        using (FileStream fs = new FileStream("D:\\FilesPDF\\" + EmpID + ".PDF", FileMode.Create))
        {
            fs.Write(bytes, 0, bytes.Length);

        }

    }
    private void AllReportPDF(int Month, int Year)
    {
        DataTable DT = new DataTable();
        DT = DataAccess.Employee_TB_GetAll2(DropDownList2.SelectedValue);


        foreach (DataRow row in DT.Rows)
        {
            string EmpID = row["Emp_ID"].ToString();

            ArrayList a1 = new ArrayList();
            a1.Add("EmpAttendance");
            a1.Add("calculateAttendance");
            ArrayList a2 = new ArrayList();
         


            a2.Add(DataAccess.EmpAttendance(EmpID, Month, Year));
            a2.Add(DataAccess.calculateAttendanceGetAll(EmpID, Month, Year));
        

            CreatePDF2("Attendance", @"Reports\Attendance.rdlc", a1, a2, EmpID + "_" + Month + "_" + Year);



        }
        //after this
        //merge all pdfs in one pdf

        mergePdfs(DT.Rows.Count, Month, Year);
    }

    private void mergePdfs(int countPDF, int Month, int Year)
    {
        DataTable DT = new DataTable();
        DT = DataAccess.Employee_TB_GetAll2(DropDownList2.SelectedValue);

        string[] lstFiles = new string[countPDF];
        int h = 0;
        while (h < countPDF)
        {
            foreach (DataRow row in DT.Rows)
            {

                string Emp_ID = row["Emp_ID"].ToString();
                lstFiles[h] = @"D:/FilesPDF/" + Emp_ID + "_" + Month + "_" + Year + ".pdf";
                h++;

            }
        }

        PdfReader reader = null;
        Document sourceDocument = null;
        PdfCopy pdfCopyProvider = null;
        PdfImportedPage importedPage;
        string outputPdfPath = @"D:/FilesPDF/Attendance" + Month + "_" + Year + ".pdf";


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
        foreach (DataRow row in DT.Rows)
        {

            string Emp_ID = row["Emp_ID"].ToString();
            File.Delete(@"D:/FilesPDF/" + Emp_ID + "_" + Month + "_" + Year + ".pdf");


        }


        // send it to the client to download
        //Process p = new Process();
        //ProcessStartInfo s = new ProcessStartInfo(@"D:/FilesPDF/Attendance" + Month + "_" + Year + ".pdf");
        //p.StartInfo = s;
        //p.Start();

        string filepath = "D:/FilesPDF/Attendance" + Month + "_" + Year + ".pdf";
        if (File.Exists(filepath))
        {
            Button3.Visible = true;
            Button2.Visible = true;
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

    #endregion
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (TextBox1.Text != "" && DropDownList1.SelectedValue != "")
        {
           
            string filepath = "D:/FilesPDF/Attendance" + Convert.ToInt16(DropDownList1.SelectedValue) + "_" + Convert.ToInt16(TextBox1.Text) + ".pdf";
            if (File.Exists(filepath))
            {
                Button3.Visible = true;
                Button2.Visible = true;
                row.Visible = true;
                Repeater1.DataBind();
            }
            else
            {
                //Button3.Visible = false;
                //Button2.Visible = false;
            }
        }
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        if (TextBox1.Text != "" && DropDownList1.SelectedValue != "")
        {
            
            string filepath = "D:/FilesPDF/Attendance" + Convert.ToInt16(DropDownList1.SelectedValue) + "_" + Convert.ToInt16(TextBox1.Text) + ".pdf";
            if (File.Exists(filepath))
            {
                Button3.Visible = true;
                Button2.Visible = true;
                row.Visible = true;
                Repeater1.DataBind();
            }
            else
            {
                //Button3.Visible = false;
                //Button2.Visible = false;
            }
        }
    }
}