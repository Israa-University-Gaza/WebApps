using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Emp_JobTitle : UserPage
{
    int EmpID;
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { DropDownList8, JobTitle, CheckBox1, ddlDepartment }))
        {
            if (DataAccess.Emp_JobTitle_TB_AddEdit(lblID.Text, DropDownList8.SelectedValue, Convert.ToInt16(JobTitle.SelectedValue), Convert.ToInt16(ddlDepartment.SelectedValue), CheckBox1.Checked, UserID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblID, DropDownList8, JobTitle, CheckBox1, ddlDepartment });
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


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { DropDownList8, JobTitle, CheckBox1, ddlDepartment });
    }

    protected void lbEdit_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        lblID.Text = ((Label)ri.FindControl("EmpJobTitleID")).Text;

        DataTable DT = DataAccess.Emp_JobTitle_TB_Get(lblID.Text);
        ddlDepartment.SelectedValue = DT.Rows[0]["Department_ID"].ToString();
        JobTitle.DataBind();
        JobTitle.SelectedValue = DT.Rows[0]["JobTitle_ID"].ToString();
        CheckBox1.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
        DropDownList8.SelectedValue = DT.Rows[0]["Emp_ID"].ToString();
    }

    //protected void lbDelete_Click2(object sender, EventArgs e)
    //{
    //    RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
    //    string id = ((Label)ri.FindControl("EmpJobTitleID")).Text;

    //    if (DataAccess.Emp_JobTitle_TB_Delete(id, UserID) > 0)
    //    {
    //        ShowToast(this, "تم الحذف بنجاح.", "", "success");
    //        Repeater2.DataBind();
    //    }
    //    else
    //    {
    //        ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    //    }
    //}
}