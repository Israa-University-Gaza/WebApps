using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

public partial class Student_EvaluationEmployeeCourse : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //GetStudentAcademicWarningOutPut da = DataAccess.GetStudentAcademicWarning(StudentID);
        //if (da.status == 1)
        //{
        //    Response.Redirect("StudentAcademicWarning.aspx");
        //}

        if (DataAccess.IsStudentReadUnRole(StudentID).Rows[0]["status"].ToString() == "0")
        {
            Response.Redirect("ReadRool.aspx");
        }
        if (!IsPostBack)
        {
            if (Session["EvalutionStdSection"] != null)
            {
                string[] data = Session["EvalutionStdSection"].ToString().Split(',');
                StdSectionID.Text = data[0];
                CourseCode.Text = data[1];
                CourseArName.Text = data[2];
                SectionNum.Text = data[3];
                Employee.Text = data[4];
                Session["EvalutionStdSection"] = null;
            }
            else {
                Response.Redirect("EvaluationChooseEmployeeCourse.aspx");
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool valid = true;
        DataTable dtEvaluationQuestionAnswer = new DataTable();
        dtEvaluationQuestionAnswer.Columns.Add("EvaluationQuestionID", typeof(int));
        dtEvaluationQuestionAnswer.Columns.Add("EvaluationQuestionAnswer", typeof(int));

        //foreach (RepeaterItem groupItem in Repeater1.Items)
        //{
        //    Repeater repeater11 = (Repeater)groupItem.FindControl("repeater11");
        foreach (RepeaterItem item in Repeater11.Items)
        {
            Label EvaluationQuestionID = (Label)item.FindControl("EvaluationQuestionID");
            RadioButtonList rblAnswers = (RadioButtonList)item.FindControl("rblAnswers");

            if (rblAnswers.SelectedItem != null)
            {
                DataRow r = dtEvaluationQuestionAnswer.NewRow();
                r["EvaluationQuestionID"] = EvaluationQuestionID.Text;
                r["EvaluationQuestionAnswer"] = rblAnswers.SelectedValue;
                dtEvaluationQuestionAnswer.Rows.Add(r);
            }
            else {
                valid = false;
                break;
            }
        }

        //foreach (RepeaterItem item in Repeater1.Items)
        //{
        //    Label EvaluationQuestionID = (Label)item.FindControl("EvaluationQuestionID");
        //    RadioButtonList rblAnswers = (RadioButtonList)item.FindControl("rblAnswers");

        //    if (rblAnswers.SelectedItem != null)
        //    {
        //        DataRow r = dtEvaluationQuestionAnswer.NewRow();
        //        r["EvaluationQuestionID"] = EvaluationQuestionID.Text;
        //        r["EvaluationQuestionAnswer"] = rblAnswers.SelectedValue;
        //        dtEvaluationQuestionAnswer.Rows.Add(r);
        //    }
        //    else
        //    {
        //        valid = false;
        //        break;
        //    }
        //}
        //}

        if (valid)
        {
            DataTable DT = DataAccess.AddEvaluationQuestionAnswer(StdSectionID.Text, dtEvaluationQuestionAnswer, StudentID);
            ShowMsg(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                Response.Redirect("EvaluationChooseEmployeeCourse.aspx");
        }
        else
        {
            ShowMsg("الرجاء الإجابة علي جميع الأسئلة المدرجة ...", "danger");
        }
    }

    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable");
    }
}