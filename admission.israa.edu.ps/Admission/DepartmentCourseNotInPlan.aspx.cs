using System;

using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class Admission_DepartmentCourseNotInPlan : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            ddlProgram.DataBind();
            ddlProgram.Items.Insert(0, new ListItem("الكل", "-1"));
        }
    }

    protected void lbExcel_Click(object sender, EventArgs e)
    {

        DataTable DT = DataAccess.GetDepartmentCourseNotInPlan(ddlDepartment.SelectedValue);
        string[] cols = { "RowNo", "CourseID", "StudentDepartment" ,"DepartmentID"};
        foreach (string col in cols)
        {
            DT.Columns.Remove(col);
        }
        ExportToExcel(DT);
    }
    public void ExportToExcel(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            DataTable DT = DataAccess.GetDepartmentCourseNotInPlan(ddlDepartment.SelectedValue);
            string filename = DT.Rows[0]["StudentDepartment"].ToString() + " "+ ".xls";
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

    protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDepartment.DataBind();
    }

    protected void lbStudentExcel_Click(object sender, EventArgs e)
    {

        ListViewItem li = (ListViewItem)((Button)sender).Parent;
        string CourseID = ((Label)li.FindControl("CourseID")).Text;
        string DepartmentID = ((Label)li.FindControl("DepartmentID")).Text;
        DataTable DT = DataAccess.GetStudentCourseNotInPlan(DepartmentID, CourseID);
        string[] cols = { "StudentID", "CourseID", "StudentDepartment" 
};
        foreach (string col in cols)
        {
            DT.Columns.Remove(col);
        }
        ExportToExcel1(DT);
    }

    public void ExportToExcel1(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            DataTable DT = DataAccess.GetDepartmentCourseNotInPlan(ddlDepartment.SelectedValue);
            string filename = DT.Rows[0]["StudentDepartment"].ToString() + " _ " + DT.Rows[0]["CourseName"].ToString() + "  " + ".xls";
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
}
