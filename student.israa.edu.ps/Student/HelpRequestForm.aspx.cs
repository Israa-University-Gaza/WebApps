using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_HelpRequestForm : UserPage
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

    protected void houseType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (houseType.SelectedValue == "71") Rent.Visible = true;
        else Rent.Visible = false;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { HelpType, FamilyNo, UnivStudentNo, FamilySchoolNo, SpecialNeedsNo, SocialCaseType, houseType, BulidingType, BulidingStatus, BulidingArea, HouseNature, ResidencePlace, IsPerentDead, FurnitureStatus });
        bool IntValidate = IntValidateControls(new WebControl[] { FamilyNo, UnivStudentNo, FamilySchoolNo, SpecialNeedsNo });
        bool valid2 = RadioValidateControls(new WebControl[] { HelpType, SocialCaseType, HouseNature, ResidencePlace });
        if (Validate && IntValidate && valid2)
        {

            DataTable DT = DataAccess.HelpRequestAdd("", StudentID, HelpType.SelectedValue,
       FamilyNo.Text, UnivStudentNo.Text, FamilySchoolNo.Text, SpecialNeedsNo.Text, FatherWork.Text, MotherWork.Text, IsPerentDead.SelectedValue,
        FamilyIncome.Text, SocialCaseType.SelectedValue, houseType.SelectedValue, RentValue.Text, FurnitureStatus.Text, BulidingType.Text, BulidingStatus.Text,
           BulidingArea.Text, HouseNature.Text, ResidencePlace.SelectedValue, Others.Text);

            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
            if (DT.Rows[0]["status"].ToString() != "0") EmptyControls(new WebControl[] { HelpType, FamilyNo, UnivStudentNo, FamilySchoolNo, SpecialNeedsNo, SocialCaseType, houseType, BulidingType, BulidingStatus, BulidingArea, HouseNature, ResidencePlace, IsPerentDead, FurnitureStatus, FatherWork, MotherWork, FamilyIncome });


        }
        else
        {
            ShowToast(this, " الرجاء ادخال البيانات المطلوبة بشكل كامل", "", "error");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { HelpType, FamilyNo, UnivStudentNo, FamilySchoolNo, SpecialNeedsNo, SocialCaseType, houseType, BulidingType, BulidingStatus, BulidingArea, HouseNature, ResidencePlace, IsPerentDead, FurnitureStatus, FatherWork, MotherWork });

    }
}