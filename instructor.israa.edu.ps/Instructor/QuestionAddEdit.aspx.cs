using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Instructor_QuestionAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["QuestionID"] != null)
        {
            lblQuestionID.Text = Session["QuestionID"].ToString();
            DataTable DT = DataAccess.QuestionGet(lblQuestionID.Text);
            txtQuestionText.Text = DT.Rows[0]["QuestionText"].ToString();

            ddlCourse.DataBind();
            ddlCourse.SelectedValue = DT.Rows[0]["CourseID"].ToString();
            ddlQuestionType.DataBind();
            ddlQuestionType.SelectedValue = DT.Rows[0]["QuestionTypeID"].ToString();
            ddlQuestionHardness.DataBind();
            ddlQuestionHardness.SelectedValue = DT.Rows[0]["QuestionHardnessID"].ToString();
            cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());

            DataTable DT2 = DataAccess.GetQuestionAnswers(lblQuestionID.Text);

            if (DT2.Rows.Count > 0)
            {
                if (ddlQuestionType.SelectedValue == "1")
                {
                    lblAnswerID11.Text = DT2.Rows[0]["ID"].ToString();
                    rbAnswer11.Checked = Convert.ToBoolean(DT2.Rows[0]["IsCourrectAnswer"].ToString());
                    txtAnswer11.Text = DT2.Rows[0]["AnswerText"].ToString();

                    lblAnswerID12.Text = DT2.Rows[1]["ID"].ToString();
                    rbAnswer12.Checked = Convert.ToBoolean(DT2.Rows[1]["IsCourrectAnswer"].ToString());
                    txtAnswer12.Text = DT2.Rows[1]["AnswerText"].ToString();

                    if (DT2.Rows.Count > 2)
                    {
                        lblAnswerID13.Text = DT2.Rows[2]["ID"].ToString();
                        rbAnswer13.Checked = Convert.ToBoolean(DT2.Rows[2]["IsCourrectAnswer"].ToString());
                        txtAnswer13.Text = DT2.Rows[2]["AnswerText"].ToString();
                    }
                    if (DT2.Rows.Count > 3)
                    {
                        lblAnswerID14.Text = DT2.Rows[3]["ID"].ToString();
                        rbAnswer14.Checked = Convert.ToBoolean(DT2.Rows[3]["IsCourrectAnswer"].ToString());
                        txtAnswer14.Text = DT2.Rows[3]["AnswerText"].ToString();
                    }
                }
                else if (ddlQuestionType.SelectedValue == "2")
                {
                    lblAnswerID21.Text = DT2.Rows[0]["ID"].ToString();
                    rbAnswer21.Checked = Convert.ToBoolean(DT2.Rows[0]["IsCourrectAnswer"].ToString());
                    txtAnswer21.Text = DT2.Rows[0]["AnswerText"].ToString();

                    lblAnswerID22.Text = DT2.Rows[1]["ID"].ToString();
                    rbAnswer22.Checked = Convert.ToBoolean(DT2.Rows[1]["IsCourrectAnswer"].ToString());
                    txtAnswer22.Text = DT2.Rows[1]["AnswerText"].ToString();
                }
                else {
                    lblAnswerID31.Text = DT2.Rows[0]["ID"].ToString();
                    txtAnswer31.Text = DT2.Rows[0]["AnswerText"].ToString();
                }
            }
            Session["QuestionID"] = null;
        }
    }

    protected void btnSaveQuestion_Click(object sender, EventArgs e)
    {

        if (ValidateControls(new WebControl[] { txtQuestionText, ddlCourse, ddlCoursePart, ddlQuestionHardness, ddlQuestionType, (ddlQuestionType.SelectedValue == "1") ? txtAnswer11 : null, (ddlQuestionType.SelectedValue == "1") ? txtAnswer12 : null, (ddlQuestionType.SelectedValue == "2") ? txtAnswer21 : null, (ddlQuestionType.SelectedValue == "3") ? txtAnswer31 : null }))
        {
            DataTable DT = DataAccess.QuestionAddEdit(lblQuestionID.Text, txtQuestionText.Text, ddlCourse.SelectedValue, ddlCoursePart.SelectedValue, ddlQuestionType.SelectedValue, ddlQuestionHardness.SelectedValue, "1", cbActive.Checked, EmployeeID);

            if (DT.Rows[0]["status"].ToString() == "1")
            {
                lblQuestionID.Text = DT.Rows[0]["QuestionID"].ToString();
            }

            if (ddlQuestionType.SelectedValue == "1")
            {
                DataAccess.QuestionAnswerAddEdit(lblAnswerID11.Text, lblQuestionID.Text, txtAnswer11.Text, rbAnswer11.Checked, true, EmployeeID);
                DataAccess.QuestionAnswerAddEdit(lblAnswerID12.Text, lblQuestionID.Text, txtAnswer12.Text, rbAnswer12.Checked, true, EmployeeID);
                if (txtAnswer13.Text != "")
                    DataAccess.QuestionAnswerAddEdit(lblAnswerID13.Text, lblQuestionID.Text, txtAnswer13.Text, rbAnswer13.Checked, true, EmployeeID);
                if (txtAnswer14.Text != "")
                    DataAccess.QuestionAnswerAddEdit(lblAnswerID14.Text, lblQuestionID.Text, txtAnswer14.Text, rbAnswer14.Checked, true, EmployeeID);
            }
            else if (ddlQuestionType.SelectedValue == "2")
            {
                DataAccess.QuestionAnswerAddEdit(lblAnswerID21.Text, lblQuestionID.Text, txtAnswer21.Text, rbAnswer21.Checked, true, EmployeeID);
                DataAccess.QuestionAnswerAddEdit(lblAnswerID22.Text, lblQuestionID.Text, txtAnswer22.Text, rbAnswer22.Checked, true, EmployeeID);
            }
            else if (ddlQuestionType.SelectedValue != "9")
            {
                DataAccess.QuestionAnswerAddEdit(lblAnswerID31.Text, lblQuestionID.Text, txtAnswer31.Text, true, true, EmployeeID);
            }

            rbAnswer11.Checked = rbAnswer12.Checked = rbAnswer13.Checked = rbAnswer14.Checked = rbAnswer21.Checked = rbAnswer22.Checked = false;
            EmptyControls(new WebControl[] { lblQuestionID, txtQuestionText, lblAnswerID11, txtAnswer11, lblAnswerID12, txtAnswer12, lblAnswerID13, txtAnswer13, lblAnswerID14, txtAnswer14, lblAnswerID31, txtAnswer31 });

            ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() == "1") ? "success" : "danger");
        }
        else
        {
            ShowMsg1("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
        }
    }

    protected void btnCancelQuestion_Click(object sender, EventArgs e)
    {
        rbAnswer11.Checked = rbAnswer12.Checked = rbAnswer13.Checked = rbAnswer14.Checked = rbAnswer21.Checked = rbAnswer22.Checked = false;
        EmptyControls(new WebControl[] { lblQuestionID, txtQuestionText, ddlCourse, ddlCoursePart, ddlQuestionHardness, ddlQuestionType, lblAnswerID11, txtAnswer11, lblAnswerID12, txtAnswer12, lblAnswerID13, txtAnswer13, lblAnswerID14, txtAnswer14, lblAnswerID31, txtAnswer31 });
    }

    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-" + status + " alert-top");
        divMsg1.Visible = (msg != "");
    }
}