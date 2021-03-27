using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_HeadOfferCourse : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblEmployeeID.Text = EmployeeID;
            if (Session["OfferdCourseID"] != null)
            {
                if (Permissions.Contains("HeadOfferdCourseEdit"))
                {
                    DataTable DT = DataAccess.OfferdCourseGet(Session["OfferdCourseID"].ToString());
                    if (DT.Rows.Count > 0)
                    {
                        lblOfferCourseID.Text = DT.Rows[0]["ID"].ToString();
                        ddlProgram.DataBind();
                        ddlProgram.SelectedValue = DT.Rows[0]["ProgramID"].ToString();
                        ddlSemester.DataBind();
                        ddlSemester.SelectedValue = DT.Rows[0]["SemesterID"].ToString();
                        ddlDepartment.DataBind();
                        ddlDepartment.SelectedValue = DT.Rows[0]["DepartmentID"].ToString();
                        ddlCourse.DataBind();
                        ddlCourse.SelectedValue = DT.Rows[0]["CourseID"].ToString();
                        cbForMale.Checked = Convert.ToBoolean(DT.Rows[0]["ForMale"].ToString());
                        cbForFemale.Checked = Convert.ToBoolean(DT.Rows[0]["ForFemale"].ToString());
                        cbExamExist.Checked = Convert.ToBoolean(DT.Rows[0]["IsExam"].ToString());
                        if (cbExamExist.Checked)
                        {
                            txtExamDate.Text = Convert.ToDateTime(DT.Rows[0]["ExamDate"].ToString()).ToString("yyyy/MM/dd");
                            txtExamTimeFrom.Text = Convert.ToDateTime(DT.Rows[0]["ExamTimeFrom"].ToString()).ToString("HH:mm");
                            txtExamTimeTo.Text = Convert.ToDateTime(DT.Rows[0]["ExamTimeTo"].ToString()).ToString("HH:mm");
                        }
                        else
                        {
                            PnlExamDetails.Visible = false;
                        }

                        Session["OfferdCourseID"] = null;
                    }
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                if (!Permissions.Contains("HeadOfferCourse"))
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlProgram, ddlSemester, ddlDepartment, ddlCourse });
        bool DateValidate = DateValidateControls((cbExamExist.Checked) ? new WebControl[] { txtExamDate, txtExamTimeFrom, txtExamTimeTo } : new WebControl[] { });

        if (Validate && DateValidate)
        {                           //OfferdCourseAddEdit(string ID            , string SemesterID        , string CourseID        , bool ForMale     , bool ForFemale     , bool IsMidtermExam , string MidtermExamDate, string MidtermExamTimeFrom1, string MidtermExamTimeTo1, string MidtermExamTimeFrom2, string MidtermExamTimeTo2, bool IsFinalExam, string FinalExamDate, string FinalExamTimeFrom1, string FinalExamTimeTo1, string FinalExamTimeFrom2, string FinalExamTimeTo2, bool HeadAccreditation, bool DeanAccreditation, string EmployeeID)
            DataTable DT = DataAccess.OfferdCourseAddEdit(lblOfferCourseID.Text, ddlSemester.SelectedValue, ddlCourse.SelectedValue, cbForMale.Checked, cbForFemale.Checked, cbExamExist.Checked, txtExamDate.Text      , txtExamTimeFrom.Text       , txtExamTimeTo.Text       ,""                          , ""                       , false           , ""                  , ""                       , ""                     , ""                       , ""                     , false                 , false                 ,EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if ((Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0))
            {
                Session["OfferdCourseID"] = DT.Rows[0]["OfferdCourseID"].ToString();
                Response.Redirect("~/Academic/SectionAddEdit.aspx");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblOfferCourseID, ddlProgram, ddlSemester, ddlDepartment, ddlCourse, txtExamDate, txtExamTimeFrom, txtExamTimeTo, cbForMale, cbForFemale });
    }

    protected void cbExamExist_CheckedChanged(object sender, EventArgs e)
    {
        PnlExamDetails.Visible = cbExamExist.Checked;
    }
}