using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_AcademicOfferCourse : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblEmployeeID.Text = EmployeeID;
            if (Session["OfferdCourseID"] != null)
            {
                //if (Permissions.Contains("AcademicOfferdCourseEdit"))
                //{
                    DataTable DT = DataAccess.OfferdCourseGet(Session["OfferdCourseID"].ToString());
                    if (DT.Rows.Count > 0)
                    {
                        lblOfferCourseID.Text = DT.Rows[0]["ID"].ToString();
                        ddlProgram.DataBind();
                        ddlProgram.SelectedValue = DT.Rows[0]["ProgramID"].ToString();
                        ddlSemester.DataBind();
                        ddlSemester.SelectedValue = DT.Rows[0]["SemesterID"].ToString();
                        ddlCollege.DataBind();
                        ddlCollege.SelectedValue = DT.Rows[0]["CollegeID"].ToString();
                        ddlDepartment.DataBind();
                        ddlDepartment.SelectedValue = DT.Rows[0]["DepartmentID"].ToString();
                        ddlCourse.DataBind();
                        ddlCourse.SelectedValue = DT.Rows[0]["CourseID"].ToString();
                        cbForMale.Checked = Convert.ToBoolean(DT.Rows[0]["ForMale"].ToString());
                        cbForFemale.Checked = Convert.ToBoolean(DT.Rows[0]["ForFemale"].ToString());

                        cbIsMidtermExam.Checked = Convert.ToBoolean(DT.Rows[0]["IsMidtermExam"].ToString());
                        pnlMidtermExamDetails.Visible = cbIsMidtermExam.Checked;
                        if (cbIsMidtermExam.Checked)
                        {
                            txtMidtermExamDate.Text = Convert.ToDateTime(DT.Rows[0]["MidtermExamDate"].ToString()).ToString("yyyy/MM/dd");
                            txtMidtermExamTimeFrom1.Text = Convert.ToDateTime(DT.Rows[0]["MidtermExamTimeFrom1"].ToString()).ToString("HH:mm");
                            txtMidtermExamTimeTo1.Text = Convert.ToDateTime(DT.Rows[0]["MidtermExamTimeTo1"].ToString()).ToString("HH:mm");
                            txtMidtermExamTimeFrom2.Text = Convert.ToDateTime(DT.Rows[0]["MidtermExamTimeFrom2"].ToString()).ToString("HH:mm");
                            txtMidtermExamTimeTo2.Text = Convert.ToDateTime(DT.Rows[0]["MidtermExamTimeTo2"].ToString()).ToString("HH:mm");
                        }
                        cbIsFinalExam.Checked = Convert.ToBoolean(DT.Rows[0]["IsFinalExam"].ToString());
                        pnlFinalExamDetails.Visible = cbIsFinalExam.Checked;
                        if (cbIsFinalExam.Checked)
                        {
                            txtFinalExamDate.Text = Convert.ToDateTime(DT.Rows[0]["FinalExamDate"].ToString()).ToString("yyyy/MM/dd");
                            txtFinalExamTimeFrom1.Text = Convert.ToDateTime(DT.Rows[0]["FinalExamTimeFrom1"].ToString()).ToString("HH:mm");
                            txtFinalExamTimeTo1.Text = Convert.ToDateTime(DT.Rows[0]["FinalExamTimeTo1"].ToString()).ToString("HH:mm");
                            txtFinalExamTimeFrom2.Text = Convert.ToDateTime(DT.Rows[0]["FinalExamTimeFrom2"].ToString()).ToString("HH:mm");
                            txtFinalExamTimeTo2.Text = Convert.ToDateTime(DT.Rows[0]["FinalExamTimeTo2"].ToString()).ToString("HH:mm");
                        }

                        Session["OfferdCourseID"] = null;
                    }
                //}
                //else
                //{
                //    Response.Redirect("Default.aspx");
                //}
            }
            else
            {
                //if (!Permissions.Contains("AcademicOfferCourse"))
                //{
                //    Response.Redirect("Default.aspx");
                //}
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlProgram, ddlSemester, ddlCollege, ddlDepartment, ddlCourse });
        bool DateValidate1 = DateValidateControls((cbIsMidtermExam.Checked) ? new WebControl[] { txtMidtermExamDate, txtMidtermExamTimeFrom1, txtMidtermExamTimeTo1, txtMidtermExamTimeFrom2, txtMidtermExamTimeTo2 } : new WebControl[] { });
        bool DateValidate2 = DateValidateControls((cbIsFinalExam.Checked) ? new WebControl[] { txtFinalExamDate, txtFinalExamTimeFrom1, txtFinalExamTimeTo1, txtFinalExamTimeFrom2, txtFinalExamTimeTo2 } : new WebControl[] { });

        if (Validate && DateValidate1 && DateValidate2)
        {
            DataTable DT = DataAccess.OfferdCourseAddEdit(lblOfferCourseID.Text, ddlSemester.SelectedValue, ddlCourse.SelectedValue, cbForMale.Checked, cbForFemale.Checked,
                cbIsMidtermExam.Checked, txtMidtermExamDate.Text, txtMidtermExamTimeFrom1.Text, txtMidtermExamTimeTo1.Text, txtMidtermExamTimeFrom2.Text, txtMidtermExamTimeTo2.Text,
                cbIsFinalExam.Checked, txtFinalExamDate.Text, txtFinalExamTimeFrom1.Text, txtFinalExamTimeTo1.Text, txtFinalExamTimeFrom2.Text, txtFinalExamTimeTo2.Text, true, true, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (lblOfferCourseID.Text == "" && (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0))
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
        EmptyControls(new WebControl[] { lblOfferCourseID, ddlProgram, ddlSemester, ddlCollege, ddlDepartment, ddlCourse, txtMidtermExamDate, txtMidtermExamTimeFrom1, txtMidtermExamTimeTo1, txtMidtermExamTimeFrom2, txtMidtermExamTimeTo2, txtFinalExamDate, txtFinalExamTimeFrom1, txtFinalExamTimeTo1, txtFinalExamTimeFrom2, txtFinalExamTimeTo2, cbForMale, cbForFemale });
    }

    protected void cbIsFinalExam_CheckedChanged(object sender, EventArgs e)
    {
        pnlFinalExamDetails.Visible = cbIsFinalExam.Checked;
    }

    protected void cbIsMidtermExam_CheckedChanged(object sender, EventArgs e)
    {
        pnlMidtermExamDetails.Visible = cbIsMidtermExam.Checked;
    }
}