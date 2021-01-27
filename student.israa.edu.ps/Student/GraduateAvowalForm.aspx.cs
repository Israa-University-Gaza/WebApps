using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_GraduateAvowalForm : UserPage
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

        if (DataAccess.IsStudentHavePoll(StudentID))
        {
            Response.Redirect("StudentPoll.aspx");
        }
        if (!DataAccess.IsStudentFinishEvaluation(StudentID))
        {
            Response.Redirect("EvaluationChooseEmployeeCourse.aspx");
        }
        //if (DataAccess.IsBlockedStudent(StudentID).Rows[0]["status"].ToString() == "0")
        //{
        //    Response.Redirect("Default.aspx");
        //}



        if (!IsPostBack)
        {
            DataTable dt = DataAccess.GetStdGraduateAvowalReport(StudentID);
            if (dt.Rows.Count > 0)
            {
                lbIsExist.Text = dt.Rows[0]["IsExist"].ToString();

                if (lbIsExist.Text == "1")
                {
                    txtMobileNo.Enabled = false;
                    txtEMobileNo.Enabled = false;
                    txtProblem.Enabled = false;
                    txtSuggestion.Enabled = false;
                    txtStudentAddress.Enabled = false;
                    btnSave.Enabled = false;
                }
                txtStudentNo.Text = dt.Rows[0]["StudentNo"].ToString();
                txtSemesterName.Text = dt.Rows[0]["StudentSemester"].ToString();
                txtArName.Text = dt.Rows[0]["AStudentName"].ToString();
                txtEnName.Text = dt.Rows[0]["EStudentName"].ToString();
                txtDepartment.Text = dt.Rows[0]["StudentDepartment"].ToString();
                txtCollege.Text = dt.Rows[0]["StudentCollege"].ToString();
                txtDOB.Text = dt.Rows[0]["DateOfBirth"].ToString();
                txtSSN.Text = dt.Rows[0]["SSN"].ToString();
                txtStudentGPA.Text = dt.Rows[0]["GPAGraduate"].ToString();
                txtStudentType.Text = dt.Rows[0]["StudentType"].ToString();
                txtMobileNo.Text = dt.Rows[0]["Mobile"].ToString();
                txtEMobileNo.Text = dt.Rows[0]["EMobile"].ToString();
                txtProblem.Text = dt.Rows[0]["Problem"].ToString();
                txtSuggestion.Text = dt.Rows[0]["Suggestion"].ToString();
                txtStudentAddress.Text = dt.Rows[0]["Address"].ToString();

            }
        }

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { txtStudentAddress, txtMobileNo, txtEMobileNo, txtProblem, txtSuggestion });
        bool IntValidate = IntValidateControls(new WebControl[] { txtEMobileNo, txtMobileNo });

        if (Validate && IntValidate)
        {
            DataTable DT = DataAccess.StdGraduateAvowalAddEdit(lblID.Text, StudentID, txtMobileNo.Text, txtEMobileNo.Text, txtStudentAddress.Text, txtProblem.Text, txtSuggestion.Text, StudentID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            DataTable dt = DataAccess.GetStdGraduateAvowalReport(StudentID);
            if (dt.Rows.Count > 0)
            {
                lbIsExist.Text = dt.Rows[0]["IsExist"].ToString();

                if (lbIsExist.Text == "1")
                {
                    txtMobileNo.Enabled = false;
                    txtEMobileNo.Enabled = false;
                    txtProblem.Enabled = false;
                    txtSuggestion.Enabled = false;
                    txtStudentAddress.Enabled = false;
                    btnSave.Enabled = false;
                }
                txtStudentNo.Text = dt.Rows[0]["StudentNo"].ToString();
                txtSemesterName.Text = dt.Rows[0]["StudentSemester"].ToString();
                txtArName.Text = dt.Rows[0]["AStudentName"].ToString();
                txtEnName.Text = dt.Rows[0]["EStudentName"].ToString();
                txtDepartment.Text = dt.Rows[0]["StudentDepartment"].ToString();
                txtCollege.Text = dt.Rows[0]["StudentCollege"].ToString();
                txtDOB.Text = dt.Rows[0]["DateOfBirth"].ToString();
                txtSSN.Text = dt.Rows[0]["SSN"].ToString();
                txtStudentGPA.Text = dt.Rows[0]["GPAGraduate"].ToString();
                txtStudentType.Text = dt.Rows[0]["StudentType"].ToString();
                txtMobileNo.Text = dt.Rows[0]["Mobile"].ToString();
                txtEMobileNo.Text = dt.Rows[0]["EMobile"].ToString();
                txtProblem.Text = dt.Rows[0]["Problem"].ToString();
                txtSuggestion.Text = dt.Rows[0]["Suggestion"].ToString();
                txtStudentAddress.Text = dt.Rows[0]["Address"].ToString();

            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح ", "", "error");
        }
    }

}