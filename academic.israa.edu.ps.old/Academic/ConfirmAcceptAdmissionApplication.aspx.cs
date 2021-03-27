using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_ConfirmAcceptAdmissionApplication : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPermissionsContains("AdmissionApp"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void lbAccept_Click(object sender, EventArgs e)
    {
        ListViewDataItem ri = (ListViewDataItem)((LinkButton)sender).Parent;
        string s = ((RadioButtonList)ri.FindControl("rblWishes")).SelectedValue;
        string StudentID = ((Label)ri.FindControl("StudentID")).Text;

        if (((RadioButtonList)ri.FindControl("rblWishes")).SelectedIndex >= 0)
        {
            DataTable DT = DataAccess.AccreditStudent(StudentID, s, EmployeeID);
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                SendSMS(DT.Rows[0]["jawwal"].ToString(), DT.Rows[0]["smstext"].ToString());
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "success");
                ListView1.DataBind();
            }
            else
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "error");
            }
        }
        else
        {
            ShowToast(this, "يجب اختيار القسم", "", "error");
        }
    }

}