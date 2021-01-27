using System;
using Microsoft.Reporting.WebForms;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class Admission_FinalExamStudentStatistics : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            //lblSemesterID.Text = "9";
            //ddlProgram.DataBind();
            //ddlProgram.Items.Insert(0, new ListItem("الكل", "-1"));
            //ddlExamDate.DataBind();
            //ddlExamDate.Items.Insert(0, new ListItem("الكل", "-1"));
            //ddlExamTime.DataBind();
            //ddlExamTime.Items.Insert(0, new ListItem("الكل", "-1"));

            ddlBranch.DataBind();
            ddlBranch.Items.Insert(0, new ListItem("الكل", "-1"));
            ddlExamDate.DataBind();
            ddlExamDate.Items.Insert(0, new ListItem("الكل", "-1"));
            ddlExamTime.DataBind();
            ddlExamTime.Items.Insert(0, new ListItem("الكل", "-1"));
            ddlGovernorates.DataBind();
            ddlGovernorates.Items.Insert(0, new ListItem("الكل", "-1"));

        }
    }


    protected void ddlExamDate_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlExamTime.DataBind();
        ddlExamTime.Items.Insert(0, new ListItem("الكل", "-1"));
        ListView1.DataBind();

    }

    protected void ddlExamTime_SelectedIndexChanged(object sender, EventArgs e)
    {

        ListView1.DataBind();
    }


    protected void lbExcel_Click(object sender, EventArgs e)
    {

        DataTable DT = DataAccess.GetFinalExamStudentStatistics(ddlSemester.SelectedValue, ddlExamDate.SelectedValue, ddlExamTime.SelectedValue, ddlBranch.SelectedValue, ddlGovernorates.SelectedValue);
        ExportToExcel(DT);
    }


    public void ExportToExcel(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            string filename = "FinalExamStudentStatistics.xls";
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


    protected void lbPrint_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.GetFinalExamStudentStatistics1(ddlSemester.SelectedValue, ddlExamDate.SelectedValue, ddlExamTime.SelectedValue, ddlBranch.SelectedValue, ddlGovernorates.SelectedValue);
        ExportToExcel(DT);
    }
}
