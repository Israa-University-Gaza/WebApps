using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Follow_Emp_Vacation : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EmployeeID.Text = UserID;
        if (DataAccess.IsDirectManager(UserID).Rows.Count < 0)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void AdoptHRM_Click(object sender, EventArgs e)
    {
        ListViewItem ri = (ListViewItem)((Button)sender).Parent;
        //string reason = ((DropDownList)ri.FindControl("ddlOtheremployee")).SelectedValue;

        string id = ((Label)ri.FindControl("VacationID")).Text;

        if (DataAccess.Vacation_Adopt_Request(id,  UserID,true) > 0)
        {
            ShowToast(this, "تم الاعتماد بنجاح.", "", "success");
            ListView1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم يتم الاعتماد .", "", "error");
    }


    protected void Accept_CheckedChanged(object sender, EventArgs e)
    {
        ListViewItem ri = (ListViewItem)((RadioButton)sender).Parent;
        ((DropDownList)ri.FindControl("ddlOtheremployee")).Enabled = true;
    }
    protected void Refused_CheckedChanged(object sender, EventArgs e)
    {
        ListViewItem ri = (ListViewItem)((RadioButton)sender).Parent;
        ((DropDownList)ri.FindControl("ddlOtheremployee")).Enabled = false;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        ListViewItem ri = (ListViewItem)((Button)sender).Parent;
        string OtherEmployee = ((DropDownList)ri.FindControl("ddlOtheremployee")).SelectedValue;
        string id = ((Label)ri.FindControl("VacationID")).Text;
       if (ValidateControls(new WebControl[] { (RadioButton)ri.FindControl("Accept") }) || ValidateControls(new WebControl[] { (RadioButton)ri.FindControl("Refused") }))
        {
            if (((RadioButton)ri.FindControl("Accept")).Checked)
            {
                if (DataAccess.Vacation_Follow_Request(id, true, OtherEmployee, UserID) > 0)
                {
                    ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                    ListView1.DataBind();
                }
                else
                    ShowToast(this, "عذرًا , لم يتم  الحفظ.", "", "error");
            }


            else if (((RadioButton)ri.FindControl("Refused")).Checked)
            {

                if (DataAccess.Vacation_Follow_Request(id, false, "-1", UserID) > 0)
                {
                    ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                    ListView1.DataBind();
                }
                else
                    ShowToast(this, "عذرًا , لم يتم حفظ الرفض.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "يرجى اختيار الموافقة او الرفض.", "", "error");
        }
    }
}