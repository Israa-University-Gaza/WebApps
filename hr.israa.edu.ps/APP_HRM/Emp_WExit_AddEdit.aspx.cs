using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Emp_WExit_AddEdit : UserPage
{
    DataTable DT = new DataTable(); int EmpID; int EmpID1;
    protected void Page_Load(object sender, EventArgs e)
    {
        EmployeeID.Text = UserID;

    }

    protected void Button12_Click(object sender, EventArgs e)// اذونات ExitType, txtEmp, WExit_S_Date, WExit_F_Date 
    {
        bool validate = ValidateControls(new WebControl[] { WExit_S_Date });
        bool TimeValidate = TimeValidateControls(new WebControl[] { ConstantFTime, ConstantSTime });
        bool DateValidate = DateValidateControls(new WebControl[] { WExit_S_Date, WExit_F_Date });
        if (validate && DateValidate && TimeValidate)
        {
            DateTime from_Time = Convert.ToDateTime(ConstantSTime.Text);
            DateTime To_Time = Convert.ToDateTime(ConstantFTime.Text);
            DateTime S_Date = Convert.ToDateTime(WExit_S_Date.Text);
            DateTime F_Date = Convert.ToDateTime(WExit_F_Date.Text);
            if (DataAccess.Work_Exit_Permission_TB_AddEdit(lblWExit.Text, DateTime.Now.Date, Convert.ToInt16(ExitType.Text), from_Time,
                To_Time, S_Date, F_Date, Details.Text, Convert.ToInt16(EmployeeID.Text), 18, Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                Repeater1.DataBind();
                EmptyControls(new WebControl[] { lblWExit, ExitType, WExit_S_Date, WExit_F_Date, Details, ConstantSTime, ConstantFTime });
            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }

        activeTab(2);

    }

    protected void btnCancel_Click2(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblWExit, ExitType, WExit_S_Date, WExit_F_Date, Details, ConstantSTime, ConstantFTime });

        activeTab(2);

    }
    protected void lbEdit2_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        lblWExit.Text = ((Label)ri.FindControl("WExitID")).Text;
        DataTable DT = DataAccess.Work_Exit_Permission_TB_Get(lblWExit.Text);
        ExitType.SelectedValue = DT.Rows[0]["Work_Exit_Type_ID"].ToString();
        Details.Text = DT.Rows[0]["Work_Exit_Details"].ToString();
        ConstantSTime.Text = Convert.ToDateTime(DT.Rows[0]["Exit_From_Hour"].ToString()).ToString("HH:mm");
        ConstantFTime.Text = Convert.ToDateTime(DT.Rows[0]["Exit_To_Hour"].ToString()).ToString("HH:mm");
        if ((DT.Rows[0]["Work_Exit_From"].ToString()) != "")
            WExit_S_Date.Text = DT.Rows[0]["Work_Exit_From1"].ToString();
        if ((DT.Rows[0]["Work_Exit_To"].ToString()) != "")
            WExit_F_Date.Text = DT.Rows[0]["Work_Exit_To1"].ToString();
        activeTab(2);

    }

    protected void lbDelete2_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("WExitID")).Text;

        if (DataAccess.Work_Exit_Permission_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }
        activeTab(2);
    }

    protected void Cancel_WERequest(object sender, EventArgs e)
    {


        if (DataAccess.WExit_Cancel_Request(UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }
        activeTab(2);
    }







    protected void Button2_Click(object sender, EventArgs e)// اذونات
    {
        bool validate = ValidateControls(new WebControl[] { Exit_S_Date, Exit_F_Date, Details1 });
        bool TimeValidate = TimeValidateControls(new WebControl[] { Exit_S_Date, Exit_F_Date });

        if (validate && TimeValidate)
        {

            if (DataAccess.Exit_Permission_TB_AddEdit(lblExit.Text,
                DateTime.Now.Date, Convert.ToDateTime(Exit_S_Date.Text),
                     Convert.ToDateTime(Exit_F_Date.Text), Details1.Text, Convert.ToInt16(EmployeeID.Text), 18, 0, Convert.ToInt16(UserID), (Session["Exit_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
            {
               
                Repeater2.DataBind();
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblExit,Exit_S_Date, Exit_F_Date, Details1 });

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
        activeTab(1);
    }

    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] {lblExit, Exit_S_Date, Exit_F_Date, Details1 });
   
        activeTab(1);
    }

    protected void lbEdit_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        lblExit.Text = ((Label)ri.FindControl("ExitID")).Text;
        activeTab(1);
        DataTable DT = DataAccess.Exit_Permission_TB_Get(lblExit.Text);
            Details1.Text = DT.Rows[0]["Exit_Details"].ToString();
            Exit_S_Date.Text = Convert.ToDateTime(DT.Rows[0]["Exit_From"].ToString()).ToString("HH:mm");
            Exit_F_Date.Text = Convert.ToDateTime(DT.Rows[0]["Exit_To"].ToString()).ToString("HH:mm");

    }

    protected void lbDelete_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("ExitID")).Text;

        if (DataAccess.Exit_Permission_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater2.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }
        activeTab(1);
    }
    protected void Cancel_ERequest(object sender, EventArgs e)
    {


        if (DataAccess.Exit_Cancel_Request(UserID) > 0)
        {
            ShowToast(this, "تم الغاء الطلب بنجاح.", "", "success");
            Repeater2.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم يتم الغاء الطلب.", "", "error");
        }
        activeTab(1);
    }



    void activeTab(int i)
    {

        li1.Attributes.Add("Class", (i == 1) ? "active" : "");
        li2.Attributes.Add("Class", (i == 2) ? "active" : "");


        tab_1.Attributes.Add("Class", (i == 1) ? "tab-pane active" : "tab-pane ");
        tab_2.Attributes.Add("Class", (i == 2) ? "tab-pane active" : "tab-pane ");

    }

}