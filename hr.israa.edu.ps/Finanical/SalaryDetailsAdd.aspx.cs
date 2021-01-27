using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finanical_SalaryDetailsAdd : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { ddlEmployeeName, ddlSalaySourceType, ddlCurrencyType });
        bool DecimalValidate = DecimalValidateControls(new WebControl[] { txtSalaryValue });
        if (DecimalValidate && validate)
        {

            DataTable DT = DataAccess.SalaryDetailsAdd(ddlEmployeeName.SelectedValue, ddlSalaySourceType.SelectedValue, txtSalaryValue.Text, ddlCurrencyType.SelectedValue, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { ddlEmployeeName, ddlSalaySourceType, ddlCurrencyType, txtSalaryValue });
                ListView1.DataBind();
            }

        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { ddlEmployeeName, ddlSalaySourceType, ddlCurrencyType, txtSalaryValue });
                
    }

    protected void btnFilter2_Click(object sender, EventArgs e)
    {
        ListView2.DataBind();
    }

    protected void CBDeactivate_CheckedChanged(object sender, EventArgs e)
    {
        ListViewItem Li = (ListViewItem)((CheckBox)sender).Parent;
        string ID = ((Label)Li.FindControl("lblDetailsID")).Text;
       DataTable DT = DataAccess.SalaryDetailsDeactivate(ID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
             ListView2.DataBind();
            ListView1.DataBind();
        }

    }
}