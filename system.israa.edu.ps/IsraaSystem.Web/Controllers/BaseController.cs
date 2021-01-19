using IsraaSystem.Web.ActionFillters;
using IsraaSystem.Web.Security;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Data;
using System.Web.Mvc;

namespace IsraaSystem.Web.Controllers
{
    [AuthorizeArea]
    public class BaseController : Controller
    {
        public int GetEmployeeID()
        {
            return Convert.ToInt32(User.Identity.Name);
        }

        public IsraaUser ThisUser()
        {
            return new IsraaUser(GetEmployeeID());
        }

        public int GetCurrentSemesterID()
        {
            return 11;
        }


        public void CreatePDF(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray)
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




        public void CreatePdfFromList(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray)
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
                ReportDataSource rds1 = new ReportDataSource((string)dsNameArray[i], (IEnumerable)DTArray[i]);
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



        protected override void OnException(ExceptionContext filterContext)
        {

        }


        



    }
}