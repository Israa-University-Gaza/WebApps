using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_HeadPlan : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPermissionsContains("HeadPlan"))
        {
            lblEmployeeID.Text = EmployeeID;
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("PlanID")).Text;
        DataTable DT = DataAccess.PlanGet(id);
        txtPlanNum.Text = DT.Rows[0]["PlanNum"].ToString();
        if (DT.Rows.Count > 0)
        {
            ddlDepartmentID.DataBind();
            ddlDepartmentID.SelectedValue = DT.Rows[0]["DepartmentID"].ToString();
            txtYear.Text = DT.Rows[0]["Year"].ToString();
            lblPlanID.Text = id;
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("PlanID")).Text;

        if (DataAccess.PlanDelete(id, EmployeeID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtPlanNum, ddlDepartmentID, txtYear }))
        {
            if (DataAccess.PlanAddEdit(lblPlanID.Text, txtPlanNum.Text, ddlDepartmentID.SelectedValue, txtYear.Text,false,false, EmployeeID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblPlanID, txtPlanNum, ddlDepartmentID, txtYear });
                ListView1.DataBind();
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
        EmptyControls(new WebControl[] { lblPlanID, txtPlanNum, ddlDepartmentID, txtYear });
    }

    protected void lbAccrediation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("PlanID")).Text;
        DataTable DT = DataAccess.PlanAccreditation(id, EmployeeID, "1");
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void lbViewCourses_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["PlanID"] = ((Label)item.FindControl("PlanID")).Text;
        Response.Redirect("PlanCourse.aspx");
    }
}