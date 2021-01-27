using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_AdmissionConditions : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPermissionsContains("AdmissionConditions"))
        //{
        //    Response.Redirect("Default.aspx");
        //}
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("AdmissionConditionsID")).Text;
        DataTable DT = DataAccess.AdmissionConditionsGet(id);
        if (DT.Rows.Count > 0)
        {
            lblAdmissionConditionsID.Text = id;
            ddlConditions.SelectedValue = DT.Rows[0]["ConditionID"].ToString();
            ddlProgram.SelectedValue = DT.Rows[0]["ProgramID"].ToString();
            ddlStudentType.SelectedValue = DT.Rows[0]["StudentTypeID"].ToString();
            cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
            ListView1.DataBind();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("AdmissionConditionsID")).Text;

        if (DataAccess.AdmissionConditionsDelete(id, EmployeeID) > 0)
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
        if (ValidateControls(new WebControl[] { ddlProgram, ddlStudentType, ddlConditions, cbActive  }))
        {
            if (DataAccess.AdmissionConditionsAddEdit(lblAdmissionConditionsID.Text, ddlProgram.SelectedValue,ddlStudentType.SelectedValue, ddlConditions.SelectedValue ,cbActive.Checked, EmployeeID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblAdmissionConditionsID, ddlStudentType,ddlConditions, cbActive });
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
        EmptyControls(new WebControl[] { lblAdmissionConditionsID, cbActive, ddlConditions,ddlStudentType,ddlProgram});
    }

    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("AdmissionConditionsID")).Text;

        if (DataAccess.AdmissionConditionsActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowToast(this, "تمت العملية بنجاح.", "", "success");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم العملية.", "", "error");
        }
    }

    protected void cbIsTransformation_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("AdmissionConditionsID")).Text;

        if (DataAccess.AdmissionConditionsIsTransformation(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowToast(this, "تمت العملية بنجاح.", "", "success");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم العملية.", "", "error");
        }
    }
}