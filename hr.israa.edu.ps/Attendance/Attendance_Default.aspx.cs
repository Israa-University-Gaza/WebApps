using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_Attendance_Default : UserPage
{
    DataTable DT = new DataTable(); int EmpID; int EmpID_Week; int EmpID_Month;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["AttConstant_ID"] != null)
            {
                cssDefault();
                DataTable DT = DataAccess.Attendance_Constant_TB_Get(Session["AttConstant_ID"].ToString());

                // cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());

                ConstantSTime.Text = Convert.ToDateTime(DT.Rows[0]["Attendance_From"].ToString()).ToString("HH:mm");
                ConstantFTime.Text = Convert.ToDateTime(DT.Rows[0]["Attendance_To"].ToString()).ToString("HH:mm");
                DropDownList1.SelectedValue = DT.Rows[0]["WeekEndDayID"].ToString();
                DropDownList2.SelectedValue = DT.Rows[0]["OptionalWeekEndDayID"].ToString();
                TextBox1.Text = DT.Rows[0]["AttendanceFormat"].ToString();
            }

        }
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["AttConstant_ID"] = ((Label)ri.FindControl("AttConstantID")).Text;
        Response.Redirect("~/Attendance/Attendance_Default.aspx");

    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("AttConstantID")).Text;

        if (DataAccess.Attendance_Constant_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        cssDefault();
    }
    protected void Button3_Click(object sender, EventArgs e)// الدوام الثابت
    {
        bool validate = ValidateControls(new WebControl[] { ConstantSTime, ConstantFTime });

        bool TimeValidate = TimeValidateControls(new WebControl[] { ConstantSTime, ConstantFTime });
        if (validate && TimeValidate)

            if (ValidateControls(new WebControl[] { ConstantSTime, ConstantFTime }))
            {


                if (DataAccess.Attendance_Constant_TB_AddEdit((Session["AttConstant_ID"] == null) ? "" : Session["AttConstant_ID"].ToString(), TextBox1.Text,
                    Convert.ToDateTime(ConstantSTime.Text), Convert.ToDateTime(ConstantFTime.Text), Convert.ToInt16(DropDownList1.SelectedValue), Convert.ToInt16(DropDownList2.SelectedValue),
                    Convert.ToInt16(UserID), (Session["AttConstant_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
                {
                    Session["AttConstant_ID"] = null;
                    ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                    EmptyControls(new WebControl[] { ConstantSTime, ConstantFTime });
                    Repeater1.DataBind();
                }
                else
                {
                    ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
                }
            }

            else
            {
                ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
            }
        cssDefault();
    }




    protected void Button4_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { ConstantSTime, ConstantFTime, DropDownList1, DropDownList2 });
        cssDefault();
    }







    /// الدوام الاسبوعي
    protected void Button5_Click(object sender, EventArgs e)
    {
        foreach (DataListItem ri in DLCat.Items)
        {

            if (((CheckBox)ri.FindControl("CheckBox1")).Checked)//220072144
            {

                bool validate = ValidateControls(new WebControl[] { (TextBox)ri.FindControl("AttSTime"), (TextBox)ri.FindControl("AttFTime"), ddlDefaultAttendanceWeekFormatID });

                bool TimeValidate = TimeValidateControls(new WebControl[] { (TextBox)ri.FindControl("AttSTime"), (TextBox)ri.FindControl("AttFTime") });
                if (validate && TimeValidate)
                {
                    DateTime from = Convert.ToDateTime(((TextBox)ri.FindControl("AttSTime")).Text);
                    DateTime to = Convert.ToDateTime(((TextBox)ri.FindControl("AttFTime")).Text);
                    string subId = ((Label)ri.FindControl("SubConstantID")).Text;


                    if (DataAccess.Attendance_Week_TB_AddEdit((Session["AttWeek_ID"] == null) ? "" : Session["AttWeek_ID"].ToString(),
                        from, to, Convert.ToInt16(ddlDefaultAttendanceWeekFormatID.SelectedValue), Convert.ToInt16(subId),
                        Convert.ToInt16(UserID), (Session["AttWeek_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
                    {
                        Session["AttWeek_ID"] = null;
                        ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                        EmptyControls(new WebControl[] { (TextBox)ri.FindControl("AttSTime"), (TextBox)ri.FindControl("AttFTime"), (CheckBox)ri.FindControl("CheckBox1") });
                        Repeater2.DataBind();
                    }
                    else
                    {
                        ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
                    }
                }
                else
                {
                    ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
                }

            }

        }
       
    }

    protected void Day_Check(object sender, EventArgs e)//تحديد ايام الدوام
    {
        DataListItem ri = (DataListItem)((CheckBox)sender).Parent;
        ((TextBox)ri.FindControl("AttSTime")).Enabled = true;
        ((TextBox)ri.FindControl("AttFTime")).Enabled = true;

        cssWeek();

    }




    protected void lbEdit_Click2(object sender, EventArgs e)
    {



        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        if (((LinkButton)ri.FindControl("lbEdit")).Text == "حفظ")
        {
            DateTime from = Convert.ToDateTime(((TextBox)ri.FindControl("TextBox1")).Text);
            DateTime to = Convert.ToDateTime(((TextBox)ri.FindControl("TextBox2")).Text);
            string subId = ((Label)ri.FindControl("Attendance_Day_ID")).Text;

           // bool TimeValidate = TimeValidateControls(new WebControl[] { });
            if (DataAccess.Attendance_Week_TB_AddEdit(((Label)ri.FindControl("AttWeekID")).Text,
                        from, to, Convert.ToInt16(ddlFilterDefaultAttendanceWeekFormatID.SelectedValue), Convert.ToInt16(subId),
                         Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {
                Session["AttWeek_ID"] = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { });
                Repeater2.DataBind();
                ((TextBox)ri.FindControl("TextBox1")).Enabled = false;
                ((TextBox)ri.FindControl("TextBox2")).Enabled = false;
                ((LinkButton)ri.FindControl("lbEdit")).Text = "تحرير";
            }
            else
            {
                ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
            }

        }
        else
        {
            Session["AttWeek_ID"] = ((Label)ri.FindControl("AttWeekID")).Text;
            ((TextBox)ri.FindControl("TextBox1")).Enabled = true;
            ((TextBox)ri.FindControl("TextBox2")).Enabled = true;
            ((LinkButton)ri.FindControl("lbEdit")).Text = "حفظ";
            // Response.Redirect("~/APP_HRM/Attendance_Weekly.aspx");
        }
        cssWeek();
    }
    protected void lbDelete_Click2(object sender, EventArgs e)
    {


        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("AttWeekID")).Text;

        if (DataAccess.Attendance_Week_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater2.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");

        cssWeek();

    }


    // الدوام الشهري

    protected void Button11_Click(object sender, EventArgs e)
    {
        show.Visible = true;
        cssMonth();
    }
    protected void lbSave_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { Date_FromTxt, Date_toTxt, Time_FromTxt, Time_ToTxt, DropDownList3 });

        bool DateValidate = DateValidateControls(new WebControl[] { Date_FromTxt, Date_toTxt });
        bool TimeValidate = TimeValidateControls(new WebControl[] {  Time_FromTxt, Time_ToTxt });

        if (validate && DateValidate && TimeValidate)
        {


            if (DataAccess.Attendance_Month_TB_AddEdit((Session["AttMonth_ID"] == null) ? "" : Session["AttMonth_ID"].ToString(),
                  Convert.ToDateTime(Date_FromTxt.Text), 
                   Convert.ToDateTime(Date_toTxt.Text), 
 
                Convert.ToDateTime(DateTime.Now),
                Convert.ToDateTime(Time_FromTxt.Text), Convert.ToDateTime(Time_ToTxt.Text), Convert.ToInt16(DropDownList3.SelectedValue),
                Convert.ToInt16(UserID), (Session["AttMonth_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
            {
                Session["AttMonth_ID"] = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { Date_FromTxt, Date_toTxt, Time_FromTxt, Time_ToTxt });
                show.Visible = false;
                Repeater3.DataBind();

            }
            else
            {
                ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
            }
        }

        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
        cssMonth();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("AttMonth_ID")).Text;

        if (((LinkButton)ri.FindControl("LinkButton1")).Text == "حفظ ")
        {

            bool validate = ValidateControls(new WebControl[] { (TextBox)ri.FindControl("date1"), (TextBox)ri.FindControl("date2"), (TextBox)ri.FindControl("time1"), (TextBox)ri.FindControl("time2") });
            //bool TimeValidate = TimeValidateControls(new WebControl[] {  (TextBox)ri.FindControl("time1"), (TextBox)ri.FindControl("time2") });
            bool DateValidate = DateValidateControls(new WebControl[] { (TextBox)ri.FindControl("date1"), (TextBox)ri.FindControl("date2") });
            if (validate && DateValidate /*&& TimeValidate*/)
            {


                if (DataAccess.Attendance_Month_TB_AddEdit(id,
                       Convert.ToDateTime(((TextBox)ri.FindControl("date1")).Text), 
                                 Convert.ToDateTime(((TextBox)ri.FindControl("date2")).Text),

               
                    Convert.ToDateTime(DateTime.Now),
                    Convert.ToDateTime(((TextBox)ri.FindControl("time1")).Text), Convert.ToDateTime(((TextBox)ri.FindControl("time2")).Text), Convert.ToInt16(DropDownList3.SelectedValue),
                    Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
                {
                    Session["AttMonth_ID"] = null;
                    ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                    EmptyControls(new WebControl[] { Date_FromTxt, Date_toTxt, Time_FromTxt, Time_ToTxt });
                    show.Visible = false;
                    Repeater3.DataBind();
                    ((TextBox)ri.FindControl("date1")).Enabled = true;
                    ((TextBox)ri.FindControl("time1")).Enabled = true;
                    ((TextBox)ri.FindControl("date2")).Enabled = true;
                    ((TextBox)ri.FindControl("time2")).Enabled = true;
                    ((LinkButton)ri.FindControl("LinkButton1")).Text = "تحرير ";

                }
                else
                {
                    ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
                }
            }

            else
            {
                ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
            }
        }
        else
        {

            ((TextBox)ri.FindControl("date1")).Enabled = true;
            ((TextBox)ri.FindControl("time1")).Enabled = true;
            ((TextBox)ri.FindControl("date2")).Enabled = true;
            ((TextBox)ri.FindControl("time2")).Enabled = true;
            ((LinkButton)ri.FindControl("LinkButton1")).Text = "حفظ ";
        }
        cssMonth();
    }
    protected void lbDelete_Click3(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("AttMonth_ID")).Text;
        if (DataAccess.Attendance_Month_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater3.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        cssMonth();
    }


    // css desgin tabs

    void cssDefault()
    {
        t3.Attributes.Add("class", "");
        t2.Attributes.Add("class", "");
        t1.Attributes.Add("class", "active");
        tab_1.Attributes.Add("class", "tab-pane active");
        tab_2.Attributes.Add("class", "tab-pane ");
        tab_3.Attributes.Add("class", "tab-pane ");
    }
    void cssWeek()
    {
        t1.Attributes.Add("class", "");
        t3.Attributes.Add("class", "");
        t2.Attributes.Add("class", "active");
        tab_2.Attributes.Add("class", "tab-pane active");
        tab_1.Attributes.Add("class", "tab-pane ");
        tab_3.Attributes.Add("class", "tab-pane ");
    }
    void cssMonth()
    {
        t1.Attributes.Add("class", "");
        t2.Attributes.Add("class", "");
        t3.Attributes.Add("class", "active");
        tab_3.Attributes.Add("class", "tab-pane active");
        tab_1.Attributes.Add("class", "tab-pane ");
        tab_2.Attributes.Add("class", "tab-pane ");
    }

    protected void DropDownList8_TextChanged(object sender, EventArgs e)
    {
        cssWeek();
    }
    protected void DropDownList3_TextChanged(object sender, EventArgs e)
    {
        cssMonth();
    }


    protected void ddlFilterDefaultAttendanceWeekFormatID_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repeater2.DataBind();
        cssWeek();
    }

    protected void btnWeekFormatName_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtWeekFormatName }))
        {
            DataTable DT = DataAccess.DefaultAttendanceWeekFormatAdd("", txtWeekFormatName.Text);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            ddlDefaultAttendanceWeekFormatID.DataBind();
            ddlFilterDefaultAttendanceWeekFormatID.DataBind();
        }
        cssWeek();
    }
}