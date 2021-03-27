using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_College : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPermissionsContains("College"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("CollegeID")).Text;
        DataTable DT = DataAccess.CollegeGet(id);
        if (DT.Rows.Count > 0)
        {
            txtCollegeNum.Text = DT.Rows[0]["CollegeNum"].ToString();
            txtArName.Text = DT.Rows[0]["ArName"].ToString();
            txtEnName.Text = DT.Rows[0]["EnName"].ToString();
            ddlProgramID.DataBind();
            ddlProgramID.SelectedValue = DT.Rows[0]["ProgramID"].ToString();
            ddlEmployeeID.DataBind();
            ddlEmployeeID.SelectedValue = DT.Rows[0]["EmployeeID"].ToString();
            ddlEmployeeID2.SelectedValue = DT.Rows[0]["EmployeeID2"].ToString();
            txtAcceptanceRate.Text = DT.Rows[0]["AcceptanceRate1"].ToString();
            txtAcceptanceRate2.Text = DT.Rows[0]["AcceptanceRate2"].ToString();
            cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
            lblCollegeID.Text = id;
            ListView1.DataBind();
        }
    }


    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("CollegeID")).Text;
        DataTable DT = DataAccess.CollegeDelete(id, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
     
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool IntValidate = IntValidateControls(new WebControl[] { txtCollegeNum, ddlEmployeeID, ddlProgramID });
        bool DoubleValidate = DoubleValidateControls(new WebControl[] { txtAcceptanceRate, txtAcceptanceRate2 });

        bool Validate = ValidateControls(new WebControl[] { txtArName, txtEnName, ddlEmployeeID, ddlProgramID });

        if (IntValidate && DoubleValidate && Validate)
        {
            if (DataAccess.CollegeAddEdit(lblCollegeID.Text, txtCollegeNum.Text, txtArName.Text, txtEnName.Text, ddlEmployeeID.SelectedValue, ddlEmployeeID2.SelectedValue, ddlProgramID.SelectedValue, Convert.ToDouble(txtAcceptanceRate.Text), Convert.ToDouble(txtAcceptanceRate2.Text), "", cbActive.Checked, EmployeeID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblCollegeID, txtCollegeNum, txtArName, txtEnName, ddlEmployeeID,ddlEmployeeID2, ddlProgramID, txtAcceptanceRate, txtAcceptanceRate2 });
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

    protected void btnEditSave_Click(object sender, EventArgs e)
    {
        bool IntValidate = IntValidateControls(new WebControl[] { txtCollegeNum, ddlEmployeeID, ddlProgramID });
        bool DoubleValidate = DoubleValidateControls(new WebControl[] { txtAcceptanceRate, txtAcceptanceRate2 });

        bool Validate = ValidateControls(new WebControl[] { txtArName, txtEnName, ddlEmployeeID, ddlProgramID });

        if (IntValidate && DoubleValidate && Validate)
        {
            if (DataAccess.CollegeAddEdit(lblCollegeID.Text, txtCollegeNum.Text, txtArName.Text, txtEnName.Text, ddlEmployeeID.SelectedValue,ddlEmployeeID2.SelectedValue, ddlProgramID.SelectedValue, Convert.ToDouble(txtAcceptanceRate.Text), Convert.ToDouble(txtAcceptanceRate2.Text), lblCollegeID.Text, cbActive.Checked, EmployeeID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblCollegeID, txtCollegeNum, txtArName, txtEnName, ddlEmployeeID,ddlEmployeeID2, ddlProgramID, txtAcceptanceRate, txtAcceptanceRate2 });
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
        EmptyControls(new WebControl[] { lblCollegeID, txtCollegeNum, txtArName, txtEnName, ddlEmployeeID,ddlEmployeeID2, ddlProgramID, txtAcceptanceRate, txtAcceptanceRate2 });
    }

    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("CollegeID")).Text;

        if (DataAccess.CollegeActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
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