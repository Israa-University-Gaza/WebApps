using Microsoft.Reporting.WebForms;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Text;
using System.Web.UI.WebControls;

public partial class Instructor_SectionStudentsFinalMarks : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Redirect("Default");
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        ListView1.DataSource= DataAccess.ListviewResult(ddlSection.SelectedValue).ToList();
        Repeater1.DataBind();
        ListView1.DataBind();
    }

    protected void btnSaveMark_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        TextBox txtFinalMark = (TextBox)item.FindControl("txtFinalMark");
        bool IsFinalNoMark = (txtFinalMark.Text == "N" || txtFinalMark.Text == "غياب");
        txtFinalMark.Text = IsFinalNoMark ? "0" : txtFinalMark.Text;

        if (IntValidateControls(new WebControl[] { txtFinalMark }))
        {
            DataTable DT = DataAccess.SetStdSectionFinalMark(StdSectionID, txtFinalMark.Text, IsFinalNoMark, EmployeeID);
            ShowMsg(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
            if (DT.Rows[0]["status"].ToString() != "0")
            {
                ListView1.DataSource = DataAccess.ListviewResult(ddlSection.SelectedValue).ToList();
                ListView1.DataBind();
                Repeater1.DataBind();
            }
        }
        else
        {
            ShowMsg("الرجاء إدخال العلامة بالشكل الصحيح", "danger");
        }
    }

    protected void btnSaveMarks_Click(object sender, EventArgs e)
    {
        int s = 0, f = 0;
        foreach (ListViewItem item in ListView1.Items)
        {
            string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
            TextBox txtFinalMark = (TextBox)item.FindControl("txtFinalMark");
            bool IsFinalNoMark = (txtFinalMark.Text == "N" || txtFinalMark.Text == "غياب");
            txtFinalMark.Text = IsFinalNoMark ? "0" : txtFinalMark.Text;

            if (IntValidateControls(new WebControl[] { txtFinalMark }))
            {
                DataTable DT = DataAccess.SetStdSectionFinalMark(StdSectionID, txtFinalMark.Text, IsFinalNoMark, EmployeeID);
                ShowMsg(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
                if (DT.Rows[0]["status"].ToString() != "0") { s++; } else { f++; }
            }
            else
            {
                f++;
            }
        }

        ShowMsg("تم حفظ " + s + " درجة بنجاح ,,, " + "لم يتم حفظ " + f + " درجة ", (f == 0) ? "success" : "danger");
        if (s > 0)
        {
            ListView1.DataSource = DataAccess.ListviewResult(ddlSection.SelectedValue).ToList();
            ListView1.DataBind();
            Repeater1.DataBind();
        }
    }

    protected void btnMarkAccreditation_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.SetSectionMarkAccreditation(ddlSection.SelectedValue, EmployeeID);
        ShowMsg(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataSource = DataAccess.ListviewResult(ddlSection.SelectedValue).ToList();
            ListView1.DataBind();
            Repeater1.DataBind();
        }
    }

    protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSection.DataBind();
        ListView1.DataSource = DataAccess.ListviewResult(ddlSection.SelectedValue).ToList();
        ListView1.DataBind();
        Repeater1.DataBind();
    }

    protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataSource = DataAccess.ListviewResult(ddlSection.SelectedValue).ToList();
        ListView1.DataBind();
        Repeater1.DataBind();
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

    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-" + status + " alert-top");
        divMsg.Visible = (msg != "");
    }

    protected void lbSectionStudentsEmptyMarksPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsSectionStudentsMarksAPI");
        //a1.Add("dsSectionStudentsMarks");
        a1.Add("dsSectionStatistics");

        ArrayList a2 = new ArrayList();
        a2.Add(ToDataTable(DataAccess.ListviewResult(ddlSection.SelectedValue).ToList()));
        //a2.Add(DataAccess.GetSectionStudentsMarks(ddlSection.SelectedValue));
        a2.Add(DataAccess.GetSectionStatistics(ddlSection.SelectedValue));

        CreatePDF("SectionStudentsEmptyMarks_" + ddlSection.SelectedValue, @"Instructor\Reports\SectionStudentsEmptyMarks.rdlc", a1, a2);
    }

    protected void lbSectionStudentsMarksPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        //a1.Add("dsSectionStudentsMarks");
        a1.Add("dsSectionStatistics");
        a1.Add("dsSectionStudentsMarksAPI");

        ArrayList a2 = new ArrayList();
        //a2.Add(DataAccess.GetSectionStudentsMarks(ddlSection.SelectedValue));
        a2.Add(DataAccess.GetSectionStatistics(ddlSection.SelectedValue));
        a2.Add(ToDataTable(DataAccess.ListviewResult(ddlSection.SelectedValue).ToList()));

        CreatePDF("SectionStudentsMarks_" + ddlSection.SelectedValue, @"Instructor\Reports\SectionStudentsMarks.rdlc", a1, a2);
    }

    protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCourse.DataBind();
        ddlSection.DataBind();
        ListView1.DataSource = DataAccess.ListviewResult(ddlSection.SelectedValue).ToList();
        ListView1.DataBind();
    }

    public DataTable ToDataTable<T>(List<T> items)
    {
        DataTable dataTable = new DataTable(typeof(T).Name);
        //Get all the properties by using reflection   
        PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
        foreach (PropertyInfo prop in Props)
        {
            //Setting column names as Property names  
            dataTable.Columns.Add(prop.Name);
        }
        foreach (T item in items)
        {
            var values = new object[Props.Length];
            for (int i = 0; i < Props.Length; i++)
            {

                values[i] = Props[i].GetValue(item, null);
            }
            dataTable.Rows.Add(values);
        }

        return dataTable;
    }

}