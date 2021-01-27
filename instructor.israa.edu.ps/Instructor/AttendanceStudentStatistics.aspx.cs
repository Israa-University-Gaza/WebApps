using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_AttendanceStudentStatistics : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    public void ExportToExcel(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            string filename = "SectionStudentsStatistics.xls";
            System.IO.StringWriter tw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
            DataGrid dgGrid = new DataGrid();

            dgGrid.DataSource = dt;
            dgGrid.DataBind();

            //Get the HTML for the control.
            dgGrid.RenderControl(hw);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename + "");
            this.EnableViewState = false;
            Response.Write(tw.ToString());
            Response.End();
        }
    }

    protected void lbAttendanceStudentStatisticsExcel_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.GetSectionAttendanceStudentStatistics(ddlSection.SelectedValue);
        string[] cols = { "ID" };
        foreach (string col in cols)
        {
            DT.Columns.Remove(col);
        }
        ExportToExcel(DT);
    }

    protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
    {

 ddlSection.DataBind();

        ListView1.DataBind();
    }
}