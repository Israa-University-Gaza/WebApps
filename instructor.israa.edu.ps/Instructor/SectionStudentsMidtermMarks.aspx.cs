using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_SectionStudentsMidtermMarks : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

//Response.Redirect("Default");
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        ListView1.DataSource = DataAccess.ListviewResult(ddlSection.SelectedValue).ToList();
        Repeater1.DataBind();
        ListView1.DataBind();
    }

    protected void btnSaveMark_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        TextBox txtMidtermMark = (TextBox)item.FindControl("txtMidtermMark");
        bool IsMidtermNoMark = (txtMidtermMark.Text == "N" || txtMidtermMark.Text == "غياب" || txtMidtermMark.Text == "غ . م");
        txtMidtermMark.Text = IsMidtermNoMark ? "0" : txtMidtermMark.Text;

        if (IntValidateControls(new WebControl[] { txtMidtermMark }))
        {
            DataTable DT = DataAccess.SetStdSectionMidtermMark(StdSectionID, txtMidtermMark.Text, IsMidtermNoMark, EmployeeID);
            ShowMsg(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
            if (DT.Rows[0]["status"].ToString() != "0")
            {
                ListView1.DataSource = DataAccess.ListviewResult(ddlSection.SelectedValue).ToList();
                Repeater1.DataBind();
                ListView1.DataBind();
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
            TextBox txtMidtermMark = (TextBox)item.FindControl("txtMidtermMark");
            bool IsMidtermNoMark = (txtMidtermMark.Text == "N" || txtMidtermMark.Text == "غياب" || txtMidtermMark.Text == "غ . م");
            txtMidtermMark.Text = IsMidtermNoMark ? "0" : txtMidtermMark.Text;
            if (IntValidateControls(new WebControl[] { txtMidtermMark }))
            {
                DataTable DT = DataAccess.SetStdSectionMidtermMark(StdSectionID, txtMidtermMark.Text, IsMidtermNoMark, EmployeeID);
                if (DT.Rows[0]["status"].ToString() == "1") { s++; } else { f++; }
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
            Repeater1.DataBind();
            ListView1.DataBind();
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
        Repeater1.DataBind();
        ListView1.DataBind();
    }

    protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataSource = DataAccess.ListviewResult(ddlSection.SelectedValue).ToList();
        Repeater1.DataBind();
        ListView1.DataBind();
    }


    protected void lbSectionStudentsMarksPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsSectionStudentsMarks");
        a1.Add("dsSectionStatistics");

        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetSectionStudentsMarks(ddlSection.SelectedValue));
        a2.Add(DataAccess.GetSectionStatistics(ddlSection.SelectedValue));

        CreatePDF("SectionStudentsMarks_" + ddlSection.SelectedValue, @"Instructor\Reports\SectionStudentsMarks.rdlc", a1, a2);
    }

    protected void lbSectionStudentsEmptyMarksPDF_Click(object sender, EventArgs e)
    {

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

    protected void lbSectionStudentsMidtermMarksPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsSectionStudentsMarksAPI");
        //a1.Add("dsSectionStudentsMidtermMarks");
        a1.Add("dsSectionStatistics");

        ArrayList a2 = new ArrayList();
        a2.Add(ToDataTable(DataAccess.ListviewResult(ddlSection.SelectedValue).ToList()));
        //a2.Add(DataAccess.GetSectionStudentsMidtermMarks(ddlSection.SelectedValue));
        a2.Add(DataAccess.GetSectionStatistics(ddlSection.SelectedValue));

        CreatePDF("SectionStudentsMidtermMarks_" + ddlCourse.SelectedItem.Text.Replace(' ', '-') + "_" + ddlSection.SelectedItem.Text.Replace(' ', '-'), @"Instructor\Reports\SectionStudentsMidtermMarks.rdlc", a1, a2);
    }

    protected void lbSectionStudentsMidtermEmptyMarksPDF_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("dsSectionStudentsMarksAPI");
        //a1.Add("dsSectionStudentsMarks");
        a1.Add("dsSectionStatistics");

        ArrayList a2 = new ArrayList();
        a2.Add(ToDataTable(DataAccess.ListviewResult(ddlSection.SelectedValue).ToList()));
        //a2.Add(DataAccess.GetSectionStudentsMarks(ddlSection.SelectedValue));
        a2.Add(DataAccess.GetSectionStatistics(ddlSection.SelectedValue));

        CreatePDF("SectionStudentsMidtermMarks_" + ddlCourse.SelectedItem.Text.Replace(' ', '-') + "_" + ddlSection.SelectedItem.Text.Replace(' ', '-'), @"Instructor\Reports\SectionStudentsMidtermEmptyMarks.rdlc", a1, a2);
    }

    protected void btnSaveMarkAndAccerdiate_OnClick(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        TextBox txtMidtermMark = (TextBox)item.FindControl("txtMidtermMark");
        bool IsMidtermNoMark = (txtMidtermMark.Text == "N" || txtMidtermMark.Text == "غياب" || txtMidtermMark.Text == "غ . م");
        txtMidtermMark.Text = IsMidtermNoMark ? "0" : txtMidtermMark.Text;

        if (IntValidateControls(new WebControl[] { txtMidtermMark }))
        {
            DataTable DT = DataAccess.SetStdSectionMidtermMark(StdSectionID, txtMidtermMark.Text, IsMidtermNoMark, EmployeeID);
            ShowMsg(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
            if (DT.Rows[0]["status"].ToString() != "0")
            {


                DataTable DT2 = DataAccess.SetMarkAccreditation(StdSectionID, "1", EmployeeID);

                ListView1.DataSource = DataAccess.ListviewResult(ddlSection.SelectedValue).ToList();
                Repeater1.DataBind();
                ListView1.DataBind();
            }
        }
        else
        {
            ShowMsg("الرجاء إدخال العلامة بالشكل الصحيح", "danger");
        }


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