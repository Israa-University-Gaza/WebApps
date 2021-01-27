using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_CurrencyPrice : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Permissions.Contains("CurrencyPrice"))
        //{
        //    Response.Redirect("Default.aspx");
        //}
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        bool valid = ValidateControls(new WebControl[] { cbActive,ddlCurrency });
        valid = valid && DoubleValidateControls(new WebControl[] { txtPrice });

        if (valid)
        {
            if (DataAccess.CurrencyPriceAddEdit(lblID.Text, ddlCurrency.SelectedValue, txtPrice.Text, cbActive.Checked, EmployeeID) > 0)
            {
                EmptyControls(new WebControl[] { lblID, cbActive, ddlCurrency, cbActive, txtPrice });
                Repeater1.DataBind();
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
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

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;
        DataTable DT = DataAccess.CurrencyPriceGet(id);
        if (DT.Rows.Count > 0)
        {
            txtPrice.Text = DT.Rows[0]["Price"].ToString();
            ddlCurrency.SelectedValue = DT.Rows[0]["CurrencyID"].ToString();
            cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
            lblID.Text = id;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblID, cbActive, ddlCurrency, cbActive, txtPrice });
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;

        if (DataAccess.CurrencyPriceDelete(id, EmployeeID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }
    }

    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((CheckBox)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;

        if (DataAccess.CurrencyPriceActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowToast(this, "تمت العملية بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم العملية.", "", "error");
        }
    }
}