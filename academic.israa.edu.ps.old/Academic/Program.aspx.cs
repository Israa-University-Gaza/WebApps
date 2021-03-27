using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_Program : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPermissionsContains("Program"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("ProgramID")).Text;
        DataTable DT = DataAccess.ProgramGet(id);
        if (DT.Rows.Count > 0)
        {
            txtProgramNum.Text = DT.Rows[0]["ProgramNum"].ToString();
            txtArName.Text = DT.Rows[0]["ArName"].ToString();
            txtEnName.Text = DT.Rows[0]["EnName"].ToString();
            txtAdmissionkey.Text = DT.Rows[0]["Admissionkey"].ToString();
            cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
            lblProgramID.Text = id;
            ddlEmployeeID.SelectedValue = DT.Rows[0]["EmployeeID"].ToString();
            if (DT.Rows[0]["EmployeeID2"].ToString() != "")
            {
                ddlEmployeeID2.SelectedValue = DT.Rows[0]["EmployeeID2"].ToString();

            }
            else ddlEmployeeID2.SelectedValue = "-1";
            ListView1.DataBind();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("ProgramID")).Text;
        DataTable DT = DataAccess.ProgramDelete(id, EmployeeID);

        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();

        //if (DataAccess.ProgramDelete(id, EmployeeID) > 0)
        //{
        //    ShowToast(this, "تم الحذف بنجاح.", "", "success");
        //    ListView1.DataBind();
        //}
        //else
        //{
        //    ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        //}
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool IntValidate = IntValidateControls(new WebControl[] { txtProgramNum, txtAdmissionkey });
        bool Validate = ValidateControls(new WebControl[] { txtArName, txtEnName, txtProgramNum, txtAdmissionkey, ddlEmployeeID });

        if (IntValidate && Validate)
        {
            DataTable DT = DataAccess.ProgramAddEdit(lblProgramID.Text, txtProgramNum.Text, txtArName.Text, txtEnName.Text, txtAdmissionkey.Text, cbActive.Checked, EmployeeID, ddlEmployeeID.SelectedValue, ddlEmployeeID2.SelectedValue);
            if (DT.Rows.Count > 0)
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                {
                    EmptyControls(new WebControl[] { lblProgramID, txtArName, txtEnName, cbActive, txtProgramNum, txtAdmissionkey, ddlEmployeeID, ddlEmployeeID2 });
                    ListView1.DataBind();
                }
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

    protected void btnEditSave_Click(object sender, EventArgs e)
    {
        bool IntValidate = IntValidateControls(new WebControl[] { txtProgramNum, txtAdmissionkey });
        bool Validate = ValidateControls(new WebControl[] { txtArName, txtEnName, txtProgramNum, txtAdmissionkey });

        if (IntValidate && Validate)
        {
            DataTable DT = DataAccess.ProgramAddEdit(lblProgramID.Text, txtProgramNum.Text, txtArName.Text, txtEnName.Text, txtAdmissionkey.Text, cbActive.Checked, EmployeeID, ddlEmployeeID.SelectedValue, ddlEmployeeID2.SelectedValue);
            if (DT.Rows.Count > 0)
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                EmptyControls(new WebControl[] { lblProgramID, txtArName, txtEnName, cbActive, txtProgramNum, txtAdmissionkey, ddlEmployeeID, ddlEmployeeID2 });
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
        EmptyControls(new WebControl[] { lblProgramID, txtArName, txtEnName, cbActive, txtProgramNum, txtAdmissionkey });
    }

    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("ProgramID")).Text;

        if (DataAccess.ProgramActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
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