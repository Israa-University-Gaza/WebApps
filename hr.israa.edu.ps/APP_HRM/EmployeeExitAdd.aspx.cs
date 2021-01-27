using HRModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_EmployeeExitAdd : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbEmployeeID.Text = UserID;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlAttendanceExitType, txtExitDate, txtMobile, txtNote, txtExitReason, txtExpectedHourFrom, txtExpectedHourTo, txtActualTimeFrom, txtActualTimeTo });
        bool DateValidate = DateValidateControls(new WebControl[] { txtExitDate });
        bool TimeValadate = TimeValidateControls(new WebControl[] { txtExpectedHourFrom, txtExpectedHourTo, txtActualTimeFrom, txtActualTimeTo });
        if (Validate && DateValidate)
        {
           
            var item = new AttendanceExit();
            item.EmployeeID = Convert.ToInt32(UserID);
            item.AttendanceExitTypeID = Convert.ToInt16(ddlAttendanceExitType.SelectedValue);
            item.ExitDate = Convert.ToDateTime(txtExitDate.Text);
            item.ExitReason = txtExitReason.Text;
            item.ExpectedTimeFrom = new TimeSpan(Convert.ToInt32(txtExpectedHourFrom.Text.Split(':')[0]), Convert.ToInt32(txtExpectedHourFrom.Text.Split(':')[1]), 0);
            item.ExpectedTimeTo = new TimeSpan(Convert.ToInt32(txtExpectedHourTo.Text.Split(':')[0]), Convert.ToInt32(txtExpectedHourTo.Text.Split(':')[1]), 0);
            item.ActualTimeFrom = new TimeSpan(Convert.ToInt32(txtActualTimeFrom.Text.Split(':')[0]), Convert.ToInt32(txtActualTimeFrom.Text.Split(':')[1]), 0);
            item.ActualTimeTo = new TimeSpan(Convert.ToInt32(txtActualTimeTo.Text.Split(':')[0]), Convert.ToInt32(txtActualTimeTo.Text.Split(':')[1]), 0);

            item.Mobile = txtMobile.Text;
            item.Notes = txtNote.Text;
            item.InsertEmployeeID = Convert.ToInt32(UserID);
            item.DMAccreditation = null;
            DataTable DT = DataAccess.AttendanceExitAdd(item);

            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { ddlAttendanceExitType, txtExitDate, txtMobile, txtNote, txtExitReason, txtExpectedHourFrom, txtExpectedHourTo, txtActualTimeFrom, txtActualTimeTo });

                ListView1.DataBind();
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");

        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {

    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {

    }
}