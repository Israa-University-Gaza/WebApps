using System;
using Microsoft.Reporting.WebForms;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;

public partial class Academic_TransforamtionAccreditation : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("BlockPage.aspx");
        //if (!Permissions.Contains("TransforamtionAccreditation"))
        //{
        //    Response.Redirect("Default.aspx");
        //}   
 }

    protected void lbAccrediteTransformation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("StudentID")).Text;
        DataTable DT = DataAccess.TransformationAccreditation(id, EmployeeID, "4");

        string r = "https://system.israa.edu.ps/app/UpdateGraduationStatusID?studentId=" + id;
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();

        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        //if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
        //{
        //    SendSMS(DT.Rows[0]["jawwal"].ToString(), DT.Rows[0]["smstext"].ToString());
        //}
        ListView1.DataBind();
    }

    protected void lbUnaccrediteTransformation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("StudentID")).Text;
        DataTable DT = DataAccess.TransformationUnaccreditation(id, EmployeeID, "4");
        string r = "https://system.israa.edu.ps/app/UpdateGraduationStatusID?studentId=" + id;
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void lbEditTransformation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("StudentID")).Text;
        Session["StudentID"] = id;
        Response.Redirect("~/Academic/StudentMain.aspx#tab3");
    }

    protected void lbDeleteTransformation_Click(object sender, EventArgs e)
    {

    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }


    protected void lbUnAccreditePDF_Click(object sender, EventArgs e)
    {

        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("StudentID")).Text;
        ArrayList a1 = new ArrayList();
        a1.Add("dsStdTransformationCourses");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetUnaccrediteETransformation(id));

        CreatePDF("StdTransformationCourses", @"Academic\Reports\AccrediteETransformation.rdlc", a1, a2);
    }

    protected void lbAccreditePDF_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("StudentID")).Text;
        ArrayList a1 = new ArrayList();
        a1.Add("dsStdTransformationCourses");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetAccrediteETransformation(id));

        CreatePDF("StdTransformationCourses", @"Academic\Reports\AccrediteETransformation.rdlc", a1, a2);
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