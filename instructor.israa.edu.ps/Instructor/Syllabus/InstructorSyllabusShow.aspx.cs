using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Instructor_InstructorSyllabusShow : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbEmployeeID.Text = EmployeeID;
        lbPlaceID.Text = "1";

        

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

    protected void lbStart_Click(object sender, EventArgs e)
    {

    }

    protected void lbPrint_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("SyllabusID")).Text;
        lbSyllabusID.Text = id;
        ArrayList a1 = new ArrayList();
        a1.Add("dsCourseInfo");
        a1.Add("dsGetSyllabusActivity");
        a1.Add("dsGetSyllabusBook");
        a1.Add("dsGetSyllabusDetailedDescription");
        a1.Add("dsGetSyllabusEvaluation");
        a1.Add("dsGetSyllabusGoal");
        a1.Add("dsGetSyllabusOutcome");
        a1.Add("dsGetSyllabusReference");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetSyllabus(lbSyllabusID.Text));
        a2.Add(DataAccess.GetSyllabusActivity(lbSyllabusID.Text));
        a2.Add(DataAccess.GetSyllabusBook(lbSyllabusID.Text));
        a2.Add(DataAccess.GetSyllabusDetailedDescription(lbSyllabusID.Text));
        a2.Add(DataAccess.GetSyllabusEvaluation(lbSyllabusID.Text));
        a2.Add(DataAccess.GetSyllabusGoal(lbSyllabusID.Text));
        a2.Add(DataAccess.GetSyllabusOutcome(lbSyllabusID.Text));
        a2.Add(DataAccess.GetSyllabusReference(lbSyllabusID.Text));

        CreatePDF("SyllabusReport", @"Instructor\Reports\SyllabusReport.rdlc", a1, a2);

    }



    protected void lbAccredit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("SyllabusID")).Text;
        lbSyllabusID.Text = id;
        DataTable DT = DataAccess.SyllabusAccredit(lbSyllabusID.Text, "1", "1", EmployeeID);
        ShowMsg(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() == "1") ? "success" : "danger");
        if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
        {
            ListView1.DataBind();
        }
    }

    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-dismissable alert-top alert-" + status);
        divMsg.Visible = (msg != "");
    }

    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        //ListViewItem item = e.Item;
        //string InstructorAccreditSyllabus = ((Label)item.FindControl("InstructorAccreditSyllabus")).Text;
        
        //if (InstructorAccreditSyllabus == "1" )
        //{
        //    LinkButton Accredit = (LinkButton)item.FindControl("lbAccredit");

        //    Accredit.Attributes["style"] = "color:green;";
        //}
    }
}

