using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finanical_EmployeeTaxValueAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void Save_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        bool validate = ValidateControls(new WebControl[] { ddlYear, ddlMonth, ((TextBox)li.FindControl("TaxValue")) });
        bool DecimalValidate = DecimalValidateControls(new WebControl[] {((TextBox)li.FindControl("TaxValue")) });
        if (validate)
        {

            DataTable DT = DataAccess.EmployeeTaxValueAddEdit(((Label)li.FindControl("ID")).Text, ddlMonth.SelectedValue, ddlYear.SelectedValue, ((Label)li.FindControl("EmpID")).Text, ((TextBox)li.FindControl("TaxValue")).Text, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                //EmptyControls(new WebControl[] { ddlYear, ddlMonth });
                ListView1.DataBind();
            }

        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
}