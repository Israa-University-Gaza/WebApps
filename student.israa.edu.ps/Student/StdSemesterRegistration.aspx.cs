using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Student_StdSemesterRegistration : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // By RSR lblStudentID.Text = StudentID;
            DataTable DT1 = DataAccess.GetStdOfferdCourse(StudentID);
            if (DT1.Rows.Count > 0)
                lblSemesterID.Text = DT1.Rows[0]["SemesterID"].ToString();
        }
        Response.Redirect("Default.aspx");
    }

    protected void lbRelay_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.RemoveCourse(id, StudentID);
        if ((Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0))
        {
            Repeater10.DataBind();
        }
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("OfferdCourseID")).Text;
        divSections.Visible = true;
        lblCourseName.Text = ((Label)item.FindControl("CourseArName")).Text;
        lblNumOfHours.Text = ((Label)item.FindControl("NumOfHours")).Text;
        lblExamDate.Text = ((Label)item.FindControl("ExamDate")).Text;
        lblExamTime.Text = ((Label)item.FindControl("ExamTime")).Text;
        DataTable DT = DataAccess.GetStdOfferdCourseSections(id, StudentID);
        Repeater2.DataSource = DT;
        Repeater2.DataBind();

        ShowHideMsg("إختر الشعبة للتسجيل", "info");
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string id = ((Label)ri.FindControl("SectionID")).Text;
        Repeater dissRepeater = (Repeater)ri.FindControl("Repeater4");
        Repeater labRepeater = (Repeater)ri.FindControl("Repeater5");

        string dissid = Request.Form["sec1" + id];
        string labid = Request.Form["sec2" + id];

        DataTable DT = DataAccess.RegisterCourse1(StudentID, lblSemesterID.Text, id, dissid, labid, StudentID);

        DataTable DT3 = DataAccess.GetStdOfferdCourseSections(((Label)ri.FindControl("OfferdCourseID")).Text, StudentID);
        Repeater2.DataSource = DT3;
        Repeater2.DataBind();

        Repeater1.DataBind();
        Repeater7.DataBind();

        ShowHideMsg(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string id = ((Label)ri.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.RemoveCourse(id, StudentID);

        DataTable DT3 = DataAccess.GetStdOfferdCourseSections(((Label)ri.FindControl("OfferdCourseID")).Text, StudentID);
        Repeater2.DataSource = DT3;
        Repeater2.DataBind();

        Repeater1.DataBind();
        Repeater7.DataBind();

        ShowHideMsg(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
    }

    public void ShowHideMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable");
    }

    protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        bool IsClosed = (((Label)e.Item.FindControl("IsClosed")).Text) == "1";
        bool Registerd = int.Parse(((Label)e.Item.FindControl("StdSectionID")).Text) > 0;
        ((Button)e.Item.FindControl("btnRemove")).Visible = Registerd;
        ((Button)e.Item.FindControl("btnRegister")).Visible = !Registerd && !IsClosed;
        ((Label)e.Item.FindControl("lblClosedSection")).Visible = !Registerd && IsClosed;
    }
}