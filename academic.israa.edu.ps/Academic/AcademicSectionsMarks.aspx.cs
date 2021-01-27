using System;
using Microsoft.Reporting.WebForms;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_AcademicSectionsMarks : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Permissions.Contains("AcademicSectionStudentsMarks"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void btnMarkAllAccreditation_Click(object sender, EventArgs e)
    {
        ListViewItem item = (ListViewItem)((Button)sender).Parent;
        string SectionID = ((Label)item.FindControl("SectionID")).Text;
        DataTable DT = DataAccess.SetSectionMarkAccreditation(SectionID, EmployeeID, 4);
        ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
    }

    protected void btnMarkAllAccreditation1_Click(object sender, EventArgs e)
    {
        ListViewItem item = (ListViewItem)((Button)sender).Parent;
        string SectionID = ((Label)item.FindControl("SectionID")).Text;
        DataTable DT = DataAccess.SetSectionMarkAccreditation(SectionID, EmployeeID, 3);
        ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
    }
    protected void BtnSaveAll_Click(object sender, EventArgs e)
    {
        int c = 0, s = 0, f = 0;
        foreach (ListViewItem li in ListView1.Items)
        {
            string SectionID = ((Label)li.FindControl("SectionID")).Text;
            if (((CheckBox)li.FindControl("cbAdopt")).Checked)
            {
                c++;
                DataTable DT = DataAccess.SetSectionMarkAccreditation(SectionID, EmployeeID, 4);
                if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                    s++;
                else
                    f++;
            }
        }
        ListView1.DataBind();
        ShowMsg1("تم اعتماد " + s + " ولم يتم اعتماد " + f + " من أصل " + c, (f == 0) ? "success" : "error");
    }

    protected void BtnSaveAll1_Click(object sender, EventArgs e)
    {
        int c = 0, s = 0, f = 0;
        foreach (ListViewItem li in ListView1.Items)
        {
            string SectionID = ((Label)li.FindControl("SectionID")).Text;
            if (((CheckBox)li.FindControl("cbAdopt")).Checked)
            {
                c++;
                DataTable DT = DataAccess.SetSectionMarkAccreditation(SectionID, EmployeeID, 3);
                if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                    s++;
                else
                    f++;
            }
        }
        ListView1.DataBind();
        ShowMsg1("تم اعتماد " + s + " ولم يتم اعتماد " + f + " من أصل " + c, (f == 0) ? "success" : "error");
    }

    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg1.Visible = (msg != "");
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
    protected void lbSectionStudentsMarksPDF_Click(object sender, EventArgs e)
    {
        ListViewItem item = (ListViewItem)((LinkButton)sender).Parent;
        string SectionID = ((Label)item.FindControl("SectionID")).Text;

        ArrayList a1 = new ArrayList();
        a1.Add("dsSectionStudentsMarks");
        a1.Add("dsSectionStatistics");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetSectionStudentsMarks(SectionID));
        a2.Add(DataAccess.GetSectionStatistics(SectionID));

        CreatePDF("SectionStudentsMarks_" + SectionID, @"Academic\Reports\SectionStudentsMarks.rdlc", a1, a2);
    }

    protected void lbSectionStudentsMidtermMarksPDF_Click(object sender, EventArgs e)
    {
        ListViewItem item = (ListViewItem)((LinkButton)sender).Parent;
        string SectionID = ((Label)item.FindControl("SectionID")).Text;
        ArrayList a1 = new ArrayList();
        a1.Add("dsSectionStudentsMarks");
        a1.Add("dsSectionStatistics");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetSectionStudentsMarks(SectionID));
        a2.Add(DataAccess.GetSectionStatistics(SectionID));

        CreatePDF("SectionStudentsMidtermMarks_" + SectionID, @"Academic\Reports\SectionStudentsMidtermMarks.rdlc", a1, a2);
    }
}