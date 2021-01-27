using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StudentAcademicCalendar : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblSemesterID.Text = "20";

            DataTable DT = DataAccess.SemesterGet(lblSemesterID.Text);

            if (DT.Rows.Count > 0)
            {
                TxtStudentRegisterBeginning.Text = Convert.ToDateTime(DT.Rows[0]["StudentRegisterBeginning"]).ToString("yyyy/MM/dd");
                TxtStudentRegisterEnd.Text = Convert.ToDateTime(DT.Rows[0]["StudentRegisterEnd"]).ToString("yyyy/MM/dd");
                txtRegisterBeginning.Text = Convert.ToDateTime(DT.Rows[0]["RegisterBeginning"]).ToString("yyyy/MM/dd");
                txtRegisterEnd.Text = Convert.ToDateTime(DT.Rows[0]["RegisterEnd"]).ToString("yyyy/MM/dd");
                txtStudyBeginning.Text = Convert.ToDateTime(DT.Rows[0]["StudyBeginning"]).ToString("yyyy/MM/dd");
                txtStudyEnd.Text = Convert.ToDateTime(DT.Rows[0]["StudyEnd"]).ToString("yyyy/MM/dd");
                txtAddBeginning.Text = Convert.ToDateTime(DT.Rows[0]["AddBeginning"]).ToString("yyyy/MM/dd");
                txtAddEnd.Text = Convert.ToDateTime(DT.Rows[0]["AddEnd"]).ToString("yyyy/MM/dd");
                txtDelayEnd.Text = Convert.ToDateTime(DT.Rows[0]["DelayEnd"]).ToString("yyyy/MM/dd");
                txtWithdrawEnd.Text = Convert.ToDateTime(DT.Rows[0]["WithdrawEnd"]).ToString("yyyy/MM/dd");
                TxtStartMidtermExams.Text = Convert.ToDateTime(DT.Rows[0]["StartMidtermExams"]).ToString("yyyy/MM/dd");
                TxtEndMidtermExams.Text = Convert.ToDateTime(DT.Rows[0]["EndMidtermlExams"]).ToString("yyyy/MM/dd");
                TxtMidtermExamResults.Text = Convert.ToDateTime(DT.Rows[0]["MidtermExamResults"]).ToString("yyyy/MM/dd");
                TxtMidtermExamRevisionBeginning.Text = Convert.ToDateTime(DT.Rows[0]["MidtermExamRevisionBeginning"]).ToString("yyyy/MM/dd");
                TxtMidtermExamRevisionEnd.Text = Convert.ToDateTime(DT.Rows[0]["MidtermExamRevisionEnd"]).ToString("yyyy/MM/dd");
                txtStartFinalExams.Text = Convert.ToDateTime(DT.Rows[0]["StartFinalExams"]).ToString("yyyy/MM/dd");
                txtEndFinalExams.Text = Convert.ToDateTime(DT.Rows[0]["EndFinalExams"]).ToString("yyyy/MM/dd");
                TxtMarkResults.Text = Convert.ToDateTime(DT.Rows[0]["MarkResults"]).ToString("yyyy/MM/dd");
                TxtMarkRevisionBeginning.Text = Convert.ToDateTime(DT.Rows[0]["MarkRevisionBeginning"]).ToString("yyyy/MM/dd");
                TxtMarkRevisionEnd.Text = Convert.ToDateTime(DT.Rows[0]["MarkRevisionEnd"]).ToString("yyyy/MM/dd");
                txtDeadlinePayment.Text = Convert.ToDateTime(DT.Rows[0]["DeadlinePayment"]).ToString("yyyy/MM/dd");
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] {TxtStudentRegisterBeginning,TxtStudentRegisterEnd, txtRegisterBeginning, txtRegisterEnd, txtStudyBeginning, txtStudyEnd, txtAddBeginning, txtAddEnd, txtDelayEnd, txtWithdrawEnd,
          TxtStartMidtermExams,TxtEndMidtermExams,TxtMidtermExamResults,TxtMidtermExamRevisionBeginning,TxtMidtermExamRevisionEnd  ,txtStartFinalExams, txtEndFinalExams,TxtMarkResults,TxtMarkRevisionBeginning,TxtMarkRevisionEnd});
        bool DateValidate = DateValidateControls(new WebControl[] { txtDeadlinePayment, txtRegisterBeginning, txtRegisterEnd, TxtStudentRegisterBeginning, TxtStudentRegisterEnd, txtStudyBeginning, txtStudyEnd, txtAddBeginning, txtAddEnd, txtDelayEnd, txtWithdrawEnd, TxtStartMidtermExams, TxtEndMidtermExams, TxtMidtermExamResults, TxtMidtermExamRevisionBeginning, TxtMidtermExamRevisionEnd, txtStartFinalExams, txtEndFinalExams, TxtMarkResults, TxtMarkRevisionBeginning, TxtMarkRevisionEnd });

        if (Validate && DateValidate)
        {
            DataTable DT = DataAccess.StudentAcademicCalendarAddEdit(lblID.Text, lblSemesterID.Text,
                 Convert.ToDateTime(TxtStudentRegisterBeginning.Text),
                 Convert.ToDateTime(TxtStudentRegisterEnd.Text),
                 Convert.ToDateTime(txtRegisterBeginning.Text),
                 Convert.ToDateTime(txtRegisterEnd.Text),
                 Convert.ToDateTime(txtStudyBeginning.Text),
                 Convert.ToDateTime(txtStudyEnd.Text),
                 Convert.ToDateTime(txtAddBeginning.Text),
                 Convert.ToDateTime(txtAddEnd.Text),
                 Convert.ToDateTime(txtDelayEnd.Text),
                 Convert.ToDateTime(txtWithdrawEnd.Text),
                 Convert.ToDateTime(TxtStartMidtermExams.Text),
                 Convert.ToDateTime(TxtEndMidtermExams.Text),
                 Convert.ToDateTime(TxtMidtermExamResults.Text),
                 Convert.ToDateTime(TxtMidtermExamRevisionBeginning.Text),
                 Convert.ToDateTime(TxtMidtermExamRevisionEnd.Text),
                 Convert.ToDateTime(txtStartFinalExams.Text),
                 Convert.ToDateTime(txtEndFinalExams.Text),
                 Convert.ToDateTime(TxtMarkResults.Text),
                 Convert.ToDateTime(TxtMarkRevisionBeginning.Text),
                 Convert.ToDateTime(TxtMarkRevisionEnd.Text),
                 Convert.ToDateTime(txtDeadlinePayment.Text),
                EmployeeID);
            if (DT.Rows.Count > 0)
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                ListView1.DataBind();
            }

            else
            {
                ShowToast(this, "لايوجد بيانات صحيحة", "", "error");

            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblSemesterID, txtDeadlinePayment, txtRegisterBeginning, txtRegisterEnd, txtStudyBeginning, txtStudyEnd, txtAddBeginning, txtAddEnd, txtDelayEnd, txtWithdrawEnd, txtStartFinalExams, txtEndFinalExams });
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("ID")).Text;
        lblID.Text = id;
        DataTable DT = DataAccess.StudentAcademicCalendarGet(id);
        if (DT.Rows.Count > 0)
        {
            TxtStudentRegisterBeginning.Text = Convert.ToDateTime(DT.Rows[0]["StudentRegisterBeginning"]).ToString("yyyy/MM/dd");
            TxtStudentRegisterEnd.Text = Convert.ToDateTime(DT.Rows[0]["StudentRegisterEnd"]).ToString("yyyy/MM/dd");
            txtRegisterBeginning.Text = Convert.ToDateTime(DT.Rows[0]["RegisterBeginning"]).ToString("yyyy/MM/dd");
            txtRegisterEnd.Text = Convert.ToDateTime(DT.Rows[0]["RegisterEnd"]).ToString("yyyy/MM/dd");
            txtStudyBeginning.Text = Convert.ToDateTime(DT.Rows[0]["StudyBeginning"]).ToString("yyyy/MM/dd");
            txtStudyEnd.Text = Convert.ToDateTime(DT.Rows[0]["StudyEnd"]).ToString("yyyy/MM/dd");
            txtAddBeginning.Text = Convert.ToDateTime(DT.Rows[0]["AddBeginning"]).ToString("yyyy/MM/dd");
            txtAddEnd.Text = Convert.ToDateTime(DT.Rows[0]["AddEnd"]).ToString("yyyy/MM/dd");
            txtDelayEnd.Text = Convert.ToDateTime(DT.Rows[0]["DelayEnd"]).ToString("yyyy/MM/dd");
            txtWithdrawEnd.Text = Convert.ToDateTime(DT.Rows[0]["WithdrawEnd"]).ToString("yyyy/MM/dd");
            TxtStartMidtermExams.Text = Convert.ToDateTime(DT.Rows[0]["StartMidtermExams"]).ToString("yyyy/MM/dd");
            TxtEndMidtermExams.Text = Convert.ToDateTime(DT.Rows[0]["EndMidtermlExams"]).ToString("yyyy/MM/dd");
            TxtMidtermExamResults.Text = Convert.ToDateTime(DT.Rows[0]["MidtermExamResults"]).ToString("yyyy/MM/dd");
            TxtMidtermExamRevisionBeginning.Text = Convert.ToDateTime(DT.Rows[0]["MidtermExamRevisionBeginning"]).ToString("yyyy/MM/dd");
            TxtMidtermExamRevisionEnd.Text = Convert.ToDateTime(DT.Rows[0]["MidtermExamRevisionEnd"]).ToString("yyyy/MM/dd");
            txtStartFinalExams.Text = Convert.ToDateTime(DT.Rows[0]["StartFinalExams"]).ToString("yyyy/MM/dd");
            txtEndFinalExams.Text = Convert.ToDateTime(DT.Rows[0]["EndFinalExams"]).ToString("yyyy/MM/dd");
            TxtMarkResults.Text = Convert.ToDateTime(DT.Rows[0]["MarkResults"]).ToString("yyyy/MM/dd");
            TxtMarkRevisionBeginning.Text = Convert.ToDateTime(DT.Rows[0]["MarkRevisionBeginning"]).ToString("yyyy/MM/dd");
            TxtMarkRevisionEnd.Text = Convert.ToDateTime(DT.Rows[0]["MarkRevisionEnd"]).ToString("yyyy/MM/dd");
            txtDeadlinePayment.Text = Convert.ToDateTime(DT.Rows[0]["DeadlinePayment"]).ToString("yyyy/MM/dd");
        }
    }
}