using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Web.ActionFillters;
using IsraaSystem.Web.Security;
using log4net;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Data;
using System.Web.Mvc;
using IsraaSystem.Application.Common.CustomExceptions;


namespace IsraaSystem.Web.Controllers
{

    [AuthorizeArea]
    public class IsraaBaseController : Controller
    {
        protected ILog Logger;
        protected IUnitOfWork UnitOfWork;

        public IsraaBaseController(ILog looger, IUnitOfWork unitOfWork)
        {
            Logger = looger;
            UnitOfWork = unitOfWork;
        }



        public IsraaUser ThisUser()
        {
            return new IsraaUser(Convert.ToInt32(User.Identity.Name));
        }

        public int ThisUserId()
        {
            return Convert.ToInt32(User.Identity.Name);
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
            Logger.Error(filterContext, filterContext.Exception);



            Exception exception = filterContext.Exception;
            //Logging the Exception

            var t = exception.GetType();


            if (exception.GetType() == typeof(FriendlyException))
            {
                filterContext.Controller.TempData.Add("FriendlyException", "exception.Message");
                filterContext.ExceptionHandled = true;
                //var Result = this.View("_ALERTS").WithToastWarning(exception.Message, "");
                // filterContext.Result = Result;

            }



        }


        public int GetEmployeeID()
        {
            return Convert.ToInt32(User.Identity.Name);
        }


        public JsonResult OkJsonResult(string msg = "success")
        {
            return Json(new { success = true, responseText = msg }, JsonRequestBehavior.AllowGet);
        }
    }


    //public class CustomExceptionAttribute : System.Web.Mvc.HandleErrorAttribute
    //{
    //    public override void OnException(System.Web.Mvc.ExceptionContext filterContext)
    //    {
    //        if (!filterContext.ExceptionHandled)
    //        {



    //            Exception exception = filterContext.Exception;
    //            //Logging the Exception

    //            var t = exception.GetType();


    //            if (exception.GetType() == typeof(FriendlyException))
    //            {
    //                filterContext.Controller.TempData.Add("FriendlyException", "exception.Message");
    //                filterContext.ExceptionHandled = true;
    //                //var Result = this.View("_ALERTS").WithToastWarning(exception.Message, "");
    //                // filterContext.Result = Result;

    //            }
    //        }
    //    }
    //}
}