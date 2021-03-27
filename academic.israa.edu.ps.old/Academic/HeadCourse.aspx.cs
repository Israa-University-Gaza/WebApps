using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_HeadCourse : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPermissionsContains("HeadCourse"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("CourseID")).Text;
        DataTable DT = DataAccess.CourseGet(id);
        if (DT.Rows.Count > 0)
        {
            lblCourseID.Text = DT.Rows[0]["ID"].ToString();
            txtCourseCode.Text = DT.Rows[0]["CourseCode"].ToString();
            txtArName.Text = DT.Rows[0]["ArName"].ToString();
            txtEnName.Text = DT.Rows[0]["EnName"].ToString();
            ddlDepartment.DataBind();
            ddlDepartment.SelectedValue = DT.Rows[0]["DepartmentID"].ToString();
            ddlCCourseType.SelectedValue = DT.Rows[0]["CCourseTypeID"].ToString();
            ddlCourseType.SelectedValue = DT.Rows[0]["CourseType"].ToString();
            cbHaveLab.Checked = Convert.ToBoolean(DT.Rows[0]["IsHaveLab"]);
            cbHaveDiscussion.Checked = Convert.ToBoolean(DT.Rows[0]["IsHaveDiscussion"]);
            txtNumOfHours.Text = DT.Rows[0]["NumOfHours"].ToString();
            cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
            if (DT.Rows[0]["PreReqID"].ToString() != null && DT.Rows[0]["PreReqID"].ToString() != "")
            {
                ddlPreRequest.DataBind();
                ddlPreRequest.SelectedValue = DT.Rows[0]["PreReqID"].ToString();
            }
            ListView1.DataBind();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("CourseID")).Text;
        if (DataAccess.CourseDelete(id, EmployeeID) != null)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            ListView1.DataBind();
            ddlPreRequest.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }

    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("CourseID")).Text;

        if (DataAccess.CourseActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowToast(this, "تمت العملية بنجاح.", "", "success");
            ListView1.DataBind();
            ddlPreRequest.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم العملية.", "", "error");
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool IntValidate = IntValidateControls(new WebControl[] { ddlDepartment, ddlCCourseType, ddlCourseType, txtNumOfHours });
        bool Validate = ValidateControls(new WebControl[] { ddlDepartment, ddlCCourseType, ddlCourseType, txtArName, txtCourseCode, txtEnName, txtNumOfHours });
        if (Validate && IntValidate)
        {
            DataTable DT = DataAccess.CourseAddEdit(lblCourseID.Text, txtCourseCode.Text, txtArName.Text, txtEnName.Text, "", ddlDepartment.SelectedValue, "", "", ddlCCourseType.SelectedValue, ddlCourseType.SelectedValue, txtNumOfHours.Text, "0", false, cbHaveLab.Checked, cbHaveDiscussion.Checked, cbActive.Checked, ddlPreRequest.SelectedValue, EmployeeID);
            //DataAccess.CourseAddEdit(lblCourseID.Text, txtCourseCode.Text, txtArName.Text, txtEnName.Text, "", ddlDepartment.SelectedValue, ddlCCourseType.SelectedValue, ddlCourseType.SelectedValue, txtNumOfHours.Text, "0", cbHaveLab.Checked, cbHaveDiscussion.Checked, cbActive.Checked, ddlPreRequest.SelectedValue, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if ((Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0))
            {
                EmptyControls(new WebControl[] { lblCourseID, ddlPreRequest, ddlDepartment, ddlCCourseType, ddlCourseType, txtArName, txtCourseCode, txtEnName, txtNumOfHours, cbActive, cbHaveDiscussion, cbHaveLab });
                ListView1.DataBind();
                ddlPreRequest.DataBind();
            }
        }
        else
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblCourseID, ddlPreRequest, ddlDepartment, ddlCCourseType, ddlCourseType, txtArName, txtCourseCode, txtEnName, txtNumOfHours, cbActive, cbHaveDiscussion, cbHaveLab });
    }
}