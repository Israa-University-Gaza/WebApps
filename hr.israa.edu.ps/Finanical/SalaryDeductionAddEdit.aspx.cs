using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finanical_SalaryDeductionAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {

        }
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { ddlEmployeeName, ddlDeductionType, ddlCurrencyType, ddlYear });
        bool DecimalValidate = DecimalValidateControls(new WebControl[] { txtSalaryValue });
        if (DecimalValidate && validate)
        {

            DataTable DT = DataAccess.SalaryDeductionAddEdit(lblDeductionID.Text,ddlEmployeeName.SelectedValue, ddlMonth.SelectedValue, ddlYear.SelectedValue, ddlDeductionType.SelectedValue, txtSalaryValue.Text, ddlCurrencyType.SelectedValue, txtDetails.Text, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { lblDeductionID, ddlCurrencyType, txtSalaryValue , txtDetails});
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
        EmptyControls(new WebControl[] { ddlEmployeeName, ddlDeductionType, ddlCurrencyType, txtSalaryValue,ddlYear,ddlMonth });

    }
    protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void ddlFilterYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void txtNameFilter_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem Li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)Li.FindControl("lblID")).Text;
        

            DataTable DT = DataAccess.SalaryDeductionDelete(ID, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                ListView1.DataBind();
            }

      
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem Li = (ListViewItem)((LinkButton)sender).Parent;
        lblDeductionID.Text = ((Label)Li.FindControl("lblID")).Text;
        DataTable DT = DataAccess.SalaryDeductionGet(lblDeductionID.Text);
        
        ddlEmployeeName.SelectedValue = DT.Rows[0]["EmployeeID"].ToString();
        ddlMonth.SelectedValue = DT.Rows[0]["Month"].ToString();
        ddlYear.SelectedValue = DT.Rows[0]["Year"].ToString();
        ddlDeductionType.SelectedValue = DT.Rows[0]["DeductionTypeID"].ToString();
        ddlCurrencyType.SelectedValue = DT.Rows[0]["CurrencyID"].ToString();
        txtSalaryValue.Text = DT.Rows[0]["DeductionValue"].ToString();

    }
}