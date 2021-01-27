using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_AttVariables :UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            activeTab(1);
            if (Session["Vacation_Type_ID"] != null)
            {
              
                DataTable DT = DataAccess.Vacation_Type_TB_Get(Session["Vacation_Type_ID"].ToString());
                txtVacationType.Text = DT.Rows[0]["Vacation_Type"].ToString();
                VacSymbol.Text = DT.Rows[0]["Vacation_Symbol"].ToString();
                VacDays.Text = DT.Rows[0]["Vacation_Period"].ToString();
               DropDownList2.SelectedValue = DT.Rows[0]["Who"].ToString();
               IsPaid.SelectedValue = DT.Rows[0]["IsPaid"].ToString();
            //    Li1.Attributes.Add("Class", "active");
                // tab_0.Attributes.Add("Class", "active");
  activeTab(2);
            }
            if (Session["Holiday_ID"] != null)
            {
                activeTab(1);
                DataTable DT = DataAccess.Holiday_Main_Get(Session["Holiday_ID"].ToString());
                txtHolidayName.Text = DT.Rows[0]["Holiday_Name"].ToString();
                txtHolidayDate.Text =  Convert.ToDateTime(DT.Rows[0]["Holiday_Date"]).ToShortDateString();
                txtHolidayDays.Text = DT.Rows[0]["NO_OF_Days"].ToString();
               // 

            }

        }
    }
    void activeTab(int i)
    {

        li1.Attributes.Add("Class", (i == 1) ? "active" : "");
        li2.Attributes.Add("Class", (i == 2) ? "active" : "");


        tab_1.Attributes.Add("Class", (i == 1) ? "tab-pane active" : "tab-pane ");
        tab_2.Attributes.Add("Class", (i == 2) ? "tab-pane active" : "tab-pane ");

    }

    protected void Button1_Click(object sender, EventArgs e) // العطلات الرسمية 
    {
       if (ValidateControls(new WebControl[] { txtHolidayName, txtHolidayDate }))
        {

            if (DataAccess.Holiday_Main_AddEdit((Session["Holiday_ID"] == null) ? "" : Session["Holiday_ID"].ToString(), 
                txtHolidayName.Text, Convert.ToInt16(txtHolidayDays.Text), Convert.ToDateTime(txtHolidayDate.Text),Convert.ToInt16(UserID),
                (Session["Holiday_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
                {
                    Session["Holiday_ID"] = null;
                    ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                    EmptyControls(new WebControl[] { txtHolidayName, txtHolidayDate });
                    Repeater3.DataBind();
                    activeTab(1);
                }
                else
                {
                    ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
                    activeTab(1);
                }
        }
       else
       {
           ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
           activeTab(1);
       }
       
    }
    protected void Button3_Click(object sender, EventArgs e) // انوا ع الاجازات
    {
        if (ValidateControls(new WebControl[] { txtVacationType, VacSymbol, VacDays }))
        {

            if (DataAccess.Vacation_Type_TB_AddEdit((Session["Vacation_Type_ID"] == null) ? "" : Session["Vacation_Type_ID"].ToString(),
                txtVacationType.Text, VacSymbol.Text, Convert.ToInt16(VacDays.Text), Convert.ToInt16(DropDownList2.SelectedValue),  Convert.ToBoolean(IsPaid.SelectedValue)) > 0)
                {
                    Session["Vacation_Type_ID"] = null;
                    ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                    EmptyControls(new WebControl[] { txtVacationType, VacSymbol, VacDays, DropDownList2 });
                    Repeater1.DataBind();
                    activeTab(2);
                }
                else
                {
                    ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
                    activeTab(2);
                }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
            activeTab(2);
        }
    }

    protected void HolilbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Holiday_ID"] = ((Label)ri.FindControl("HolidayID")).Text;
        Response.Redirect("~/Attendance/AttVariables.aspx");
        activeTab(1);
    }

    protected void HolilbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("HolidayID")).Text;

        if (DataAccess.Holiday_Main_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater3.DataBind();
            activeTab(1);
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        activeTab(1);
    }
    protected void VaclbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Vacation_Type_ID"] = ((Label)ri.FindControl("VacationTypeID")).Text;
        activeTab(2);
        Response.Redirect("~/Attendance/AttVariables.aspx");
       
     
    }

    protected void VaclbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("VacationTypeID")).Text;

        if (DataAccess.Vacation_Type_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
            activeTab(2);
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        activeTab(2);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { txtHolidayName, txtHolidayDate, txtHolidayDays });
        Session["Holiday_ID"] = null;
        activeTab(1);
    }
    protected void Button4_Click(object sender, EventArgs e) 
    {
        EmptyControls(new WebControl[] { txtVacationType, VacSymbol, VacDays, DropDownList2 });
        Session["Vacation_Type_ID"] = null;
        activeTab(2);
    }
}