using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_OverTimeAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void AddNewExit_Click(object sender, EventArgs e)
    {
        newdiv.Visible = true;
    }
    protected void btn1Filter_Click(object sender, EventArgs e)
    {
        Repeater1.DataBind();
    }

    protected void DropDownList2_SelectedIndexChanged1(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.Employee_TB_Get(DropDownList2.SelectedValue);
        if (DT.Rows.Count > 0)
            EmployeeNo.Text = DT.Rows[0]["EmployeeNo"].ToString();
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Repeater1.DataBind();

    }

    protected void AddNew_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { });

        bool DateValidate = DateValidateControls(new WebControl[] { from, to });
        if (validate && DateValidate)
        {
            if (DataAccess.WorkOverTimeAddEdit("",
                Convert.ToDateTime(Date.Text),Convert.ToInt16(DropDownList2.SelectedValue),
                Convert.ToDateTime(from.Text), Convert.ToDateTime(to.Text),Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {


                Repeater1.DataBind();
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { from, to,Date,DropDownList2 });
                newdiv.Visible = false;


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
    protected void Edit_Click(object sender, EventArgs e)
    {
         RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("Label2")).Text;
        bool validate = ValidateControls(new WebControl[] { });

        bool DateValidate = DateValidateControls(new WebControl[] { (TextBox)ri.FindControl("from"), (TextBox)ri.FindControl("to") });
        if (validate && DateValidate)
        {
            if (DataAccess.WorkOverTimeAddEdit(id, Convert.ToDateTime(((Label)ri.FindControl("Date")).Text), Convert.ToInt16(((Label)ri.FindControl("Label4")).Text),
            Convert.ToDateTime(((TextBox)ri.FindControl("from")).Text), Convert.ToDateTime(((TextBox)ri.FindControl("to")).Text), Convert.ToInt16(UserID), Convert.ToInt16(UserID)) > 0)
            {


                Repeater1.DataBind();
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { });
                newdiv.Visible = false;


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
    }
    protected void Delete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("Label2")).Text;
        if (DataAccess.Work_OverTime_TB_Delete(id, UserID) > 0)
        {

            id = null;
            Repeater1.DataBind();
            ShowToast(this, "تم الحذف بنجاح.", "", "success");



        }
        else
        {
            ShowToast(this, "عذرًا , لم يتم الحذف.", "", "error");
        }
    }
}