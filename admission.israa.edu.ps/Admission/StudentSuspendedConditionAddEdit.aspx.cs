using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StudentSuspendedConditionAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtName, cbActive }))
        {
            if (DataAccess.StudentSuspendedConditionAddEdit(lblConditionID.Text,txtName.Text, cbActive.Checked, EmployeeID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblConditionID, txtName, cbActive });
                ListView1.DataBind();
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
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { txtName,lblConditionID, cbActive });
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("ID")).Text;
        DataTable DT = DataAccess.StudentSuspendedConditionGet(id);
        if (DT.Rows.Count > 0)
        {
            lblConditionID.Text = id;
            txtName.Text = DT.Rows[0]["Name"].ToString();
            cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
            ListView1.DataBind();
        }
    }
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("ID")).Text;
        DataTable DT = DataAccess.StudentSuspendedConditionDelete(id, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
    }
    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("ID")).Text;
        if(DataAccess.StudentSuspendedConditionActivate(id, ((CheckBox)item.FindControl("cbIsActive")).Checked)>0)
         {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
         
                ListView1.DataBind();
            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ.", "", "error");
            }
    }
}