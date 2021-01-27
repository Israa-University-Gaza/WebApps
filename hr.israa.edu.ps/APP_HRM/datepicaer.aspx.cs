using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Emp_Vacation_Exit_AddEdit :UserPage
{
    DataTable DT = new DataTable(); int EmpID; int EmpID2;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Vacation_ID"] != null)
            {
                //DataTable DT = DataAccess.Vacation_TB_Get(Session["Vacation_ID"].ToString());
                //VacationTypeID.SelectedValue = DT.Rows[0]["Vacation_Type_ID"].ToString();
                //VacationCount.Text = DT.Rows[0]["Vacation_Day_Count"].ToString();
                //// cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
                //SDate.Text = Convert.ToDateTime(DT.Rows[0]["Vacation_Start_Date"]).ToShortDateString();
                //FDate.Text = Convert.ToDateTime(DT.Rows[0]["Vacation_End_Date"]).ToShortDateString();
                //Reason.Text = DT.Rows[0]["Vacation_Reason"].ToString();
                //EmpID = Convert.ToInt16(DT.Rows[0]["Emp_ID"].ToString());
                //check1.Visible = false;
            }

           
        }
      
    }
    //protected void Button1_Click(object sender, EventArgs e)// اجازات
    //{

    //    if (ValidateControls(new WebControl[] { VacationTypeID, SDate, FDate, VacationCount }))
    //    {

    //        if (DataAccess.Vacation_TB_AddEdit((Session["Vacation_ID"] == null) ? "" : Session["Vacation_ID"].ToString(), Convert.ToInt16(VacationTypeID.SelectedValue), Convert.ToDateTime(SDate.Text),
    //                 Convert.ToDateTime(FDate.Text), Convert.ToInt16(VacationCount.Text), DateTime.Now.Date, Convert.ToInt16(HiddenField1.Value), 18, Reason.Text, "") > 0)
    //            {
    //                Session["Vacation_ID"] = null;
    //                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
    //                EmptyControls(new WebControl[] { VacationTypeID, SDate, FDate, VacationCount });
             
    //            }
    //            else
    //            {
    //                ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
    //            }
    //    }
    //    else
    //    {
    //        ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
    //    }

    //}

    //protected void Username_Checker_Click(object sender, EventArgs e)// فحص رقم الموظف 
    //{
    //    try
    //    {
    //        if (ValidateControls(new WebControl[] { txtEmpID }))
    //        {
    //            DT = DataAccess.EmployeeNO_Get(txtEmpID.Text);
             
    //                Label1.Text = DT.Rows[0]["Ar_F_Name"].ToString() + " " + DT.Rows[0]["Ar_S_Name"].ToString() + " " + DT.Rows[0]["Ar_Th_Name"].ToString() + " " + DT.Rows[0]["Ar_Family_Name"].ToString();
    //                HiddenField1.Value = DT.Rows[0]["Emp_ID"].ToString();
    //            // else ShowToast(this, "يرجى تأكيد رقم الموظف بشكل صحيح.", "", "error");
    //        }
    //        else
    //        {
    //            ShowToast(this, "الرجاء ادخال رقم الموظف   بشكل صحيح.", "", "error");
    //        }
    //    }
    //    catch { ShowToast(this, "الرجاء ادخال رقم الموظف   بشكل صحيح.", "", "error"); }
    //}
  

    //protected void btnCancel_Click(object sender, EventArgs e)
    //{
    //    EmptyControls(new WebControl[] { VacationTypeID, SDate, FDate, VacationCount });
    //    Session["Vaction_ID"] = null;
    //}
 
}