using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StudentSemesterRegistration : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {

                lblEmployeeID.Text = EmployeeID;
                if (Request.QueryString["id"] != null)
                {
                    DataTable DT2 = DataAccess.GetStudentData(Request.QueryString["id"].ToString());
                    lblStdStatusID.Text = DT2.Rows[0]["StdStatusID"].ToString();
                    lblStudentID.Text = Request.QueryString["id"];


                    DataTable DT1 = DataAccess.GetStdOfferdCourse(lblStudentID.Text);
                    if (DT1.Rows.Count > 0)
                        lblSemesterID.Text = DT1.Rows[0]["SemesterID"].ToString();

                    ListView1.DataSource = DT1;
                    ListView1.DataBind();

                    Repeater1.DataBind();
                }
                else
                    Response.Redirect("~/Admission/Students.aspx");
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Admission/Students.aspx");
            }
        }
        else if (lblStudentID.Text == "")
        {
            Response.Redirect("~/Admission/Students.aspx");
        }
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("OfferdCourseID")).Text;
        divSections.Visible = true;
        lblCourseID.Text = id;
        lblCourseName.Text = ((Label)item.FindControl("CourseArName")).Text;
        lblNumOfHours.Text = ((Label)item.FindControl("NumOfHours")).Text;
        lblMidtermExamDate.Text = ((Label)item.FindControl("MidtermExamDate")).Text;
        lblMidtermExamTime.Text = ((Label)item.FindControl("MidtermExamTime")).Text;
        lblFinalExamDate.Text = ((Label)item.FindControl("FinalExamDate")).Text;
        lblFinalExamTime.Text = ((Label)item.FindControl("FinalExamTime")).Text;

        DataTable DT1;
        if (txtCourseCode.Text == "" && txtCourseName.Text == "")
            DT1 = DataAccess.GetStdOfferdCourse(lblStudentID.Text);
        else
            DT1 = DataAccess.GetStdSearchOfferdCourse(lblStudentID.Text, txtCourseCode.Text, txtCourseName.Text);

        ListView1.DataSource = DT1;
        ListView1.DataBind();

        DataTable DT = DataAccess.GetStdOfferdCourseSections(id, lblStudentID.Text);
        Repeater2.DataSource = DT;
        Repeater2.DataBind();

        ListView1.DataBind();

        ShowHideMsg("إختر الشعبة للتسجيل", "info");
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string id = ((Label)ri.FindControl("SectionID")).Text;

        DataTable DT = DataAccess.RegisterCourse(lblStudentID.Text, lblSemesterID.Text, id, EmployeeID);
        DataTable DA = DataAccess.StudentBranchAddEdit(lblStudentID.Text, 20);


        DataTable DT1 = DataAccess.GetStdOfferdCourse(lblStudentID.Text);
        ListView1.DataSource = DT1;
        ListView1.DataBind();

        DataTable DT3 = DataAccess.GetStdOfferdCourseSections(((Label)ri.FindControl("OfferdCourseID")).Text, lblStudentID.Text);
        Repeater2.DataSource = DT3;
        Repeater2.DataBind();

        ShowHideMsg(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");

        string stdSemesterId = DT.Rows[0]["stdSemesterId"].ToString();
        string a = "https://system.israa.edu.ps/app/AllCalculatOfStdSemester?stdSemesterId=" + stdSemesterId + "&IsReg=true&accreditationStatusEnum=1";
        ExcuteApI(a);
        Repeater1.DataBind();
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string id = ((Label)ri.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.RemoveCourse(id, EmployeeID);
        DataTable DA = DataAccess.StudentBranchAddEdit(lblStudentID.Text, 16);

        DataTable DT2 = DataAccess.GetCountOfRegisterHours(lblStudentID.Text, lblSemesterID.Text);

        DataTable DT1 = DataAccess.GetStdOfferdCourse(lblStudentID.Text);
        ListView1.DataSource = DT1;
        ListView1.DataBind();

        DataTable DT3 = DataAccess.GetStdOfferdCourseSections(((Label)ri.FindControl("OfferdCourseID")).Text, lblStudentID.Text);
        Repeater2.DataSource = DT3;
        Repeater2.DataBind();

        ShowHideMsg(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        string stdSemesterId = DT.Rows[0]["stdSemesterId"].ToString();
        string a = "https://system.israa.edu.ps/app/AllCalculatOfStdSemester?stdSemesterId=" + stdSemesterId + "&IsReg=true&accreditationStatusEnum=1";
        ExcuteApI(a);
        Repeater1.DataBind();
    }

    public void ShowHideMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable");
    }



    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DataTable DT1 = DataAccess.GetStdSearchOfferdCourse(lblStudentID.Text, txtCourseCode.Text, txtCourseName.Text);
        ListView1.DataSource = DT1;
        ListView1.DataBind();
    }



}