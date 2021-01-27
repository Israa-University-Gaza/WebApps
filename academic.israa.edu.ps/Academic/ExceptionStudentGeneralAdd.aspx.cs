using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_ExceptionStudentGeneralAdd : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString["id"] != null)
            {
                lblStudentID.Text = Request.QueryString["id"].ToString();
            }
            else
                Response.Redirect("~/Academic/Students.aspx");
        }
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlExceptionType, ddlSemester, txtDeadlineDate, txtHoursCount, txtNote }))
        {
            DataTable DT = DataAccess.ExceptionStudentGeneralAdd(lblID.Text, ddlSemester.SelectedValue, lblStudentID.Text, ddlExceptionType.SelectedValue, txtHoursCount.Text, Convert.ToDateTime(txtDeadlineDate.Text + " " + txtDeadlineTime.Text), txtNote.Text, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { lblID, ddlSemester, ddlExceptionType, txtDeadlineDate, txtHoursCount, txtNote });
                ListView1.DataBind();

            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");

        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("lblID")).Text;
        DataTable DT = DataAccess.ExceptionStudentGeneralDelete(ID, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void IsActive_CheckedChanged(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((CheckBox)sender).Parent;
        string ID = ((Label)li.FindControl("lblID")).Text;
        bool IsActive = ((CheckBox)li.FindControl("IsActive")).Checked;
        DataTable DT = DataAccess.ExceptionStudentGeneralActivate(ID, IsActive,EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

protected void ddlExceptionType_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlExceptionType.SelectedValue == "12")
        {
            txtHoursCount.Text = "24";
            txtHoursCount.ReadOnly = true;
        }
        else
        {
            txtHoursCount.Text = "";
            txtHoursCount.ReadOnly = false;
        }
    }
}