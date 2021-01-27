using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_AdmissionIssueSearch : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            RefreshData();
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

    protected void DataBind_Click(object sender, EventArgs e)
    {
        RefreshData();
    }



    protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCollege.DataBind();
        ddlDepartment.DataBind();
        RefreshData();
    }

    protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDepartment.DataBind();
        RefreshData();
    }

    protected void BtnViewIssueDetails_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("ID")).Text;
        string Place = ((Label)li.FindControl("Place")).Text;
        string MinOrderDepartment = ((Label)li.FindControl("MinOrderDepartment")).Text;
        Session["IssueID"] = id;
        Session["Place"] = Place;
        Session["MinOrderDepartment"] = MinOrderDepartment;
        Response.Redirect("AdmissionIssueDetails.aspx");
    }




    protected void lbPDF_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("id")).Text;
        ArrayList a1 = new ArrayList();
        a1.Add("dsGetIssueInfoReport");
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetIssueInfoReport(id));
        CreatePDF("StudentIssueReport", @"Admission\Reports\StudentIssueReport.rdlc", a1, a2);
    }

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        RefreshData();
    }

    protected void lbGoStudent_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("lblStudentID")).Text;
        Response.Redirect("~/Admission/Student.aspx?id="  + id);
    }

    protected void lbGoStudent1_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("lblStudentID")).Text;
        Response.Redirect("~/Admission/Student.aspx?id=" + id);
    }
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("TopIssueAccerdation")).Text;
        DataTable DT = DataAccess.ReAccredationIssue(ID, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        RefreshData();
    }


    public void RefreshData()
    {
        var t = DataAccess.AdmissionIssuesSearch(
            ddlProgram.SelectedValue,
            ddlCollege.SelectedValue,
            ddlDepartment.SelectedValue,
            ddlStatus.SelectedValue,
            "%",
            "%",
            "%",
            "%",
            Issues.SelectedValue,
            "-1"
        );
        ListView1.DataSource = t;
        ListView1.DataBind();
    }

    protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        //set current page startindex, max rows and rebind to false
        DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

        //rebind List View
        RefreshData();
    }

}