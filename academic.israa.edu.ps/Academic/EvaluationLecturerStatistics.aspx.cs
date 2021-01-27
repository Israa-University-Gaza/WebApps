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

public partial class Academic_EvaluationLecturerStatistics : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = EmployeeID;

        if (!IsPostBack)
        {
            using (SqlConnection conn = DataAccess.GetConnection5())
            {
                SqlDataAdapter DA = new SqlDataAdapter("GetAllLecturerInSemester", conn);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                DA.SelectCommand.Parameters.AddWithValue("@SemesterID", 12);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                DropDownList1.DataSource = DT;
                DropDownList1.DataBind();
                //return DT;
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ArrayList a1 = new ArrayList();
        a1.Add("DataSet1");


        ArrayList a2 = new ArrayList();
        a2.Add(DataAccess.GetEvaluation( ddlSection.SelectedValue));

        CreatePDF("تقييم الطلبة للمحاضر", @"Academic\Reports\EvaluationLecturerStatistics.rdlc", a1, a2);
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
    protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repeater2.DataBind();
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {

        Repeater1.DataBind();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DataTable DT = DataAccess.EvaluationLecturerResultInAllSections(DropDownList1.SelectedValue);
            if (DT.Rows.Count > 0) FinalPercentage.Text = DT.Rows[0]["EvaluatedPercentage"].ToString() + "%";
        }
        catch { }
    }

    protected void group11_Click(object sender, EventArgs e)
    {
        group1.Visible = true;
        group2.Visible = false;
    }
    protected void group22_Click(object sender, EventArgs e)
    {
        group1.Visible = false;
        group2.Visible = true;
    }
}