using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using Microsoft.Reporting.WebForms;

public partial class Affairs_HelpRequest : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("ID")).Text;
        string StudentID = ((Label)item.FindControl("StudentID")).Text;
        ArrayList a1 = new ArrayList();
        a1.Add("GetStudentDataSet");
        a1.Add("GetStudentHelpRequest");
        
        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetStudentData(StudentID));
        DataTable dt = DataAccess.GetStudentHelpRequest(id);
        a2.Add(dt);

        CreatePDF("HelpRequest_" + dt.Rows[0]["StudentNo"].ToString(), @"Affairs\Reports\HelpRequest.rdlc", a1, a2);
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

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem Li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)Li.FindControl("ID")).Text;
        Response.Redirect("~/Affairs/HelpRequestForm.aspx?HelpRequestID=" + id);
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem Li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)Li.FindControl("ID")).Text;

        DataTable DT = DataAccess.HelpRequestDelete(id, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "success");
    }


    protected void cbIsBenefit_CheckedChanged(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((CheckBox)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;

        DataTable DT = DataAccess.HelpRequestBenefit(id, ((CheckBox)sender).Checked, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "success");
    }
}