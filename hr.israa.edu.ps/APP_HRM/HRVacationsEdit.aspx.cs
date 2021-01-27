using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_HRVacationsEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //        if(Request.QueryString["VacationID"] != null)
            //        {
            //            DataTable DT = DataAccess.Vacation_TB_Get(Request.QueryString["vacationID"].ToString());
            //            if (DT.Rows.Count > 0)
            //            {
            //                lblID.Text = Request.QueryString["vacationID"].ToString();
            //                lblEmpID.Text = DT.Rows[0]["Emp_ID"].ToString();
            //                txtEmployee.Text = DT.Rows[0]["DisplayName"].ToString();
            //                VacationTypeID.SelectedValue = DT.Rows[0]["Vacation_Type_ID"].ToString();
            //                VacationCount.Text = DT.Rows[0]["Vacation_Day_Count"].ToString();
            //                if ((DT.Rows[0]["Vacation_Start_Date"].ToString()) != "")
            //                    SDate.Text = DT.Rows[0]["Vacation_Start_Date1"].ToString();
            //                if ((DT.Rows[0]["Vacation_End_Date"].ToString()) != "")
            //                    FDate.Text = DT.Rows[0]["Vacation_End_Date1"].ToString();
            //                Reason.Text = DT.Rows[0]["Vacation_Reason"].ToString();
            //                rblPlace.SelectedValue = DT.Rows[0]["VacationPlace"].ToString();
            //                VacStatus.Text=DT.Rows[0]["Request_Status"].ToString();

            //            }
            //        }
            //        else
            //        {
            //            ddlEmployeeName.Visible = true;
            //            txtEmployee.Visible = false;
            //            lblID.Text = "";
            //        }

            Response.Redirect("~/APP_HRM/Emp_Info_AddEdit.aspx");
        }
    }
        protected void FDate_TextChanged(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { SDate, FDate });

        bool DateValidate = DateValidateControls(new WebControl[] { SDate, FDate });
        if (validate && DateValidate)
        {
            DataTable DT = DataAccess.GetCountOfVacationDays(SDate.Text, FDate.Text);
            VacationCount.Text = DT.Rows[0]["VacationDayCount"].ToString();
        }
        Response.Redirect("~/APP_HRM/Emp_Info_AddEdit.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt16(VacationCount.Text) < 1) ShowToast(this, "لايمكن اضافة اجازة بتاريخ البدء اكبر من تاريخ الانتهاء.", "", "error");
        else
        {
            bool validate = ValidateControls(new WebControl[] { VacationTypeID, SDate, FDate, VacationCount, Reason });
            bool decimalValidate = DecimalValidateControls(new WebControl[] { });
            bool DateValidate = DateValidateControls(new WebControl[] { SDate, FDate });
            if (validate && decimalValidate && DateValidate)
            {

                DataTable DT = DataAccess.Vacation_TB_AddEdit(lblID.Text, Convert.ToInt16(VacationTypeID.SelectedValue),
                    Convert.ToDateTime(SDate.Text), Convert.ToDateTime(FDate.Text), Convert.ToInt16(VacationCount.Text), (Request.QueryString["VacationID"] != null) ? Convert.ToInt16(lblEmpID.Text) : Convert.ToInt16(ddlEmployeeName.SelectedValue), (Request.QueryString["VacationID"] != null) ? Convert.ToInt16(VacStatus.Text) :18 , Reason.Text, rblPlace.SelectedValue, Convert.ToInt16(UserID));
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                {
                    Response.Redirect("Accept_Vacation_Request.aspx");
                }

            }
            else
            {
                ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
            }

        }
    }
}