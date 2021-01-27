using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Job_AddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { Ar_Title, En_Title, ddlDepartment }))
        {
            DataTable DT = DataAccess.JobTitle_TB_AddEdit(lblID.Text, Ar_Title.Text, En_Title.Text, ddlDepartment.SelectedValue, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { lblID, Ar_Title, En_Title, ddlDepartment });
                Repeater1.DataBind();
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }


    protected void btnFilter_Click(object sender, EventArgs e)
    {
        Repeater1.DataBind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] {lblID, Ar_Title, En_Title, ddlDepartment });
       
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        lblID.Text = ((Label)ri.FindControl("JobTitleID")).Text;
        DataTable DT = DataAccess.JobTitle_TB_Get(lblID.Text);
        Ar_Title.Text = DT.Rows[0]["Ar_Job_Name"].ToString();
        En_Title.Text = DT.Rows[0]["En_Job_Name"].ToString();
        if (DT.Rows[0]["Department_ID"].ToString() != "") ddlDepartment.SelectedValue = DT.Rows[0]["Department_ID"].ToString();
        else ddlDepartment.SelectedValue = "-1";
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("JobTitleID")).Text;
        DataTable DT = DataAccess.JobTitle_TB_Delete(id, UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        Repeater1.DataBind();
    }
}