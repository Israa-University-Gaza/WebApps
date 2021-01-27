using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_LoanRequestForm : UserPage
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



    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { FamilyNo, UnivStudentNo, FamilySchoolNo, SpecialNeedsNo, SocialCaseType, IsPerentDead, HouseDesc });
        bool IntValidate = IntValidateControls(new WebControl[] { FamilyNo, UnivStudentNo, FamilySchoolNo, SpecialNeedsNo });

        if (Validate && IntValidate)
        {

            DataTable DT = DataAccess.LoanRequestAdd("", StudentID,
       FamilyNo.Text, UnivStudentNo.Text, FamilySchoolNo.Text, SpecialNeedsNo.Text, FatherWork.Text, MotherWork.Text, IsPerentDead.SelectedValue,
        FamilyIncome.Text, SocialCaseType.SelectedValue, Others.Text, HouseDesc.Text, HelpType.Text, HelpOrg.Text, HelpValue.Text);

            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
            if (DT.Rows[0]["status"].ToString() != "0") EmptyControls(new WebControl[] { HelpValue, HelpOrg, HelpType, FamilyNo, UnivStudentNo, FamilySchoolNo, SpecialNeedsNo, SocialCaseType, IsPerentDead, FatherWork, MotherWork, FamilyIncome });


        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح .", "", "danger");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { HelpValue, HelpOrg, HelpType, FamilyNo, UnivStudentNo, FamilySchoolNo, SpecialNeedsNo, SocialCaseType, IsPerentDead, FatherWork, MotherWork });

    }
}