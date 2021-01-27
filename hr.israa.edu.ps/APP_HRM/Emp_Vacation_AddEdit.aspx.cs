using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Emp_Vacation_Exit_AddEdit : UserPage
{
    DataTable DT = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        EmployeeID.Text = UserID;
    }
    protected void Button1_Click(object sender, EventArgs e)// اجازات
    {
       
            balance.Visible = false;
            bool validate = ValidateControls(new WebControl[] { VacationTypeID, SDate, FDate, VacationCount, Reason });
            bool decimalValidate = DecimalValidateControls(new WebControl[] { });
            bool DateValidate = DateValidateControls(new WebControl[] { SDate, FDate });
        if (validate && decimalValidate && DateValidate)
        {
            if (Convert.ToInt16(VacationCount.Text) < 1) ShowToast(this, "لايمكن اضافة اجازة بتاريخ البدء اكبر من تاريخ الانتهاء.", "", "error");
            else
            {
                DataTable DT = DataAccess.Vacation_TB_AddEdit(lblID.Text, Convert.ToInt16(VacationTypeID.SelectedValue),
                    Convert.ToDateTime(SDate.Text), Convert.ToDateTime(FDate.Text), Convert.ToInt16(VacationCount.Text), Convert.ToInt16(UserID), 18, Reason.Text, rblPlace.SelectedValue, Convert.ToInt16(UserID));
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                {

                    EmptyControls(new WebControl[] { lblID, VacationTypeID, SDate, FDate, VacationCount, Reason });
                    Repeater1.DataBind();
                }

            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }

        

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { VacationTypeID, SDate, FDate, VacationCount });
        Session["Vaction_ID"] = null;
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        lblID.Text = ((Label)ri.FindControl("VacationID")).Text;
        DataTable DT = DataAccess.Vacation_TB_Get(lblID.Text);
        if (DT.Rows.Count > 0)
        {
            VacationTypeID.SelectedValue = DT.Rows[0]["Vacation_Type_ID"].ToString();
            VacationCount.Text = DT.Rows[0]["Vacation_Day_Count"].ToString();
            if ((DT.Rows[0]["Vacation_Start_Date"].ToString()) != "")
                SDate.Text = DT.Rows[0]["Vacation_Start_Date1"].ToString();
            if ((DT.Rows[0]["Vacation_End_Date"].ToString()) != "")
                FDate.Text = DT.Rows[0]["Vacation_End_Date1"].ToString();
            Reason.Text = DT.Rows[0]["Vacation_Reason"].ToString();
            rblPlace.SelectedValue = DT.Rows[0]["VacationPlace"].ToString();
           
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("VacationID")).Text;

        if (DataAccess.Vacation_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }



    protected int Subtract(int item1, int item2)
    {
        return (item1 - item2);
    }
    protected void FDate_TextChanged(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { SDate, FDate });

        bool DateValidate = DateValidateControls(new WebControl[] { SDate, FDate });
        if (validate && DateValidate)
        {
            DataTable DT = DataAccess.GetCountOfVacationDays(SDate.Text, FDate.Text);
            //TimeSpan v = (DateTime.ParseExact((FDate.Text), "yyyy/MM/dd", CultureInfo.InvariantCulture) - DateTime.ParseExact((SDate.Text), "yyyy/MM/dd", CultureInfo.InvariantCulture));
           // VacationCount.Text = v.TotalDays.ToString();
            VacationCount.Text = DT.Rows[0]["VacationDayCount"].ToString();
        }
    }
    protected void VacationTypeID_TextChanged(object sender, EventArgs e)
    {
        balance.Visible = true;
        Repeater2.DataBind();
    }
    protected void VacationCount_TextChanged(object sender, EventArgs e)
    {
    }

}