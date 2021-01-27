using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_OfferdCourse : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string id = GridView1.SelectedDataKey.Value.ToString();
        divSections.Visible = true;
        DataTable DT1 = DataAccess.GetOfferdCourseDetails(id);
        if (DT1.Rows.Count > 0)
        {
            lblCourseName.Text = DT1.Rows[0]["CourseName"].ToString();
            lblNumOfHours.Text = DT1.Rows[0]["NumOfHours"].ToString();
            lblExamDate.Text = DT1.Rows[0]["ExamDate"].ToString();
            lblExamTime.Text = DT1.Rows[0]["ExamTime"].ToString();
        }
        DataTable DT = DataAccess.GetStdOfferdCourseSections(id, StudentID);
        Repeater2.DataSource = DT;
        Repeater2.DataBind();
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
        divSections.Visible = false;
    }
}