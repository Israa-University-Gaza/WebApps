using System;
//using Microsoft.Reporting.WebForms;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_InternalTransforamtionAccreditation : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(Permissions.Contains("TransforamtionAccreditation") || Permissions.Contains("DeanTransforamtionAccreditation")))
        {
            Response.Redirect("Default.aspx");
        }
        EmpID.Text = EmployeeID;
    }

    protected void lbAccrediteTransformation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string StudentID = ((Label)item.FindControl("StudentID")).Text;
        DataTable DT = DataAccess.SetStudentInternalTransformationAccreditation(StudentID, EmployeeID, "3");
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        //if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
        //{
        //    SendSMS(DT.Rows[0]["jawwal"].ToString(), DT.Rows[0]["smstext"].ToString());
        //}

        string r = "https://system.israa.edu.ps/app/CalculateGpa?studentId=" + StudentID + "&stdSemesterId=&accreditationStatusEnum=1";
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();
        ListView1.DataBind();
    }

    protected void lbUnaccrediteTransformation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string StudentID = ((Label)item.FindControl("StudentID")).Text;
        DataTable DT = DataAccess.SetStudentInternalTransformationUnAccreditation(StudentID, EmployeeID, "3");
        //InternalTransformationUnaccreditation
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");

        string r = "https://system.israa.edu.ps/app/CalculateGpa?studentId=" + StudentID + "&stdSemesterId=&accreditationStatusEnum=0";
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();

        ListView1.DataBind();
    }


    protected void lbDeanAccrediteTransformation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string StudentID = ((Label)item.FindControl("StudentID")).Text;
        DataTable DT = DataAccess.SetStudentInternalTransformationAccreditation(StudentID, EmployeeID, "2");
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        //if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
        //{
        //    SendSMS(DT.Rows[0]["jawwal"].ToString(), DT.Rows[0]["smstext"].ToString());
        //}


        string r = "https://system.israa.edu.ps/app/CalculateGpa?studentId=" + StudentID + "&stdSemesterId=&accreditationStatusEnum=1";
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();

        ListView1.DataBind();
    }

    protected void lbDeanUnaccrediteTransformation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string StudentID = ((Label)item.FindControl("StudentID")).Text;
        DataTable DT = DataAccess.SetStudentInternalTransformationUnAccreditation(StudentID, EmployeeID, "2");
        //InternalTransformationUnaccreditation
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");

        string r = "https://system.israa.edu.ps/app/CalculateGpa?studentId=" + StudentID + "&stdSemesterId=&accreditationStatusEnum=0";
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();

        ListView1.DataBind();
    }
    protected void lbEditTransformation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("StudentID")).Text;
        Session["StudentID"] = id;
        Response.Redirect("~/Academic/StdInternalTransformationAdd.aspx");
    }


    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCollege.DataBind();
        ddlDepartment.DataBind();
        ListView1.DataBind();
    }

    protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
    {

        ddlDepartment.DataBind();
        ListView1.DataBind();
    }

    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    //protected void lbUnAccreditePDF_Click(object sender, EventArgs e)
    //{

    //    ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
    //    string id = ((Label)item.FindControl("StudentID")).Text;
    //    ArrayList a1 = new ArrayList();
    //    a1.Add("StdUnaccrediteInternalTransformation");

    //    ArrayList a2 = new ArrayList();
    //    a2.Add(DataAccess.GetStdUnaccrediteInternalTransformation(id));

    //    CreatePDF("StdUnaccrediteInternalTransformation", @"Academic\Reports\AccrediteInternalTransformation.rdlc", a1, a2);
    //}

    //protected void lbAccreditePDF_Click(object sender, EventArgs e)
    //{
    //    ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
    //    string id = ((Label)item.FindControl("StudentID")).Text;
    //    ArrayList a1 = new ArrayList();
    //    a1.Add("StdUnaccrediteInternalTransformation");

    //    ArrayList a2 = new ArrayList();
    //    a2.Add(DataAccess.GetStdAccrediteInternalTransformation(id));

    //    CreatePDF("AccrediteInternalTransformation", @"Academic\Reports\AccrediteInternalTransformation.rdlc", a1, a2);
    //}

    //protected void lbStdMarksReport_Click(object sender, EventArgs e)
    // {

    //     ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
    //     string id = ((Label)item.FindControl("StudentID")).Text;
    //     ArrayList a1 = new ArrayList();

    //     a1.Add("GetStdSemesterMarksReport2");
    //     a1.Add("CalculateGPAInternalTrans");
    //     ArrayList a2 = new ArrayList();
    //     a2.Add(DataAccess.GetStdSemesterMarksReport2(id));
    //     a2.Add(DataAccess.CalculateGPAInternalTransRequestCheck(id));
    //     CreatePDF("GetStdSemesterMarksReport2", @"Academic\Reports\GetStdSemesterMarksReport2.rdlc", a1, a2);
    // }
    // private void CreatePDF(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray)
    // {
    //     //ReportViewer viwer = new ReportViewer();
    //     //Warning[] warnings = null;
    //     //string[] streamIds = null;
    //     //string mimeType = string.Empty;
    //     //string encoding = string.Empty;
    //     //string extension = string.Empty;
    //     //string filetype = string.Empty;

    //     //viwer.SizeToReportContent = true;
    //     //viwer.LocalReport.ReportPath = reportpath;
    //     //viwer.ProcessingMode = ProcessingMode.Local;

    //     //for (int i = 0; i < dsNameArray.Count; i++)
    //     //{
    //     //    ReportDataSource rds1 = new ReportDataSource((string)dsNameArray[i], (DataTable)DTArray[i]);
    //     //    viwer.LocalReport.DataSources.Add(rds1);
    //     //}

    //     //viwer.LocalReport.Refresh();

    //     //byte[] bytes = viwer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

    //     //// Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
    //     //Response.Buffer = true;
    //     //Response.Clear();
    //     //Response.ContentType = mimeType;
    //     //Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
    //     //Response.BinaryWrite(bytes); // create the file
    //     //Response.Flush(); // send it to the client to download
    // }
}