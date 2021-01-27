using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RDLCToWord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // if (Request.QueryString["CVid"] != null)
       // {

            ArrayList a1 = new ArrayList();
            a1.Add("EmpPersonalInformationCV");
            a1.Add("EmpQualGetAll");
            a1.Add("EmpCourcesGetAll");
            a1.Add("EmpExperienceGetAll");
            a1.Add("ComputerSkillsEmp_GetAll");
            a1.Add("LanguagesEmp_Option_GetAll");


            ArrayList a2 = new ArrayList();

            a2.Add(DataAccess.EmpPersonalInformationCV("5029"));
            a2.Add(DataAccess.EmpQualGetAll("5029"));
            a2.Add(DataAccess.EmpCourcesGetAll("5029"));
            a2.Add(DataAccess.EmpExperienceGetAll("5029"));
            a2.Add(DataAccess.ComputerSkillsEmp_GetAll("5029"));
            a2.Add(DataAccess.LanguagesEmp_Option_GetAll("5029"));
            CreateWord("EmpCV", @"Reports\CV.rdlc", a1, a2);
       // }
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


        //Byte[] mybytes = viwer.LocalReport.Render("WORD");
        ////Byte[] mybytes = report.Render("PDF"); for exporting to PDF
        //using (FileStream fs = File.Create(@"D:\CV.doc"))
        //{
        //    fs.Write(mybytes, 0, mybytes.Length);
        //    fs.Flush();
        //}
      
    }
}