using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_Currency : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Permissions.Contains("Currency"))
        //{
        //    Response.Redirect("Default.aspx");
        //}
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        bool valid = ValidateControls(new WebControl[] { txtArName, txtEnName, cbActive, txtFractionName, txtFractionsNo });
        valid = valid && IntValidateControls(new WebControl[] { txtFractionsNo });

        if (valid)
        {
            if (DataAccess.CurrencyAddEdit(lblID.Text, txtArName.Text, txtEnName.Text,txtFractionsNo.Text, txtFractionName.Text,  cbActive.Checked, EmployeeID) > 0)
            {
                EmptyControls(new WebControl[] { lblID, txtArName, txtEnName, cbActive, txtFractionName, txtFractionsNo });
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
        DataTable DT = DataAccess.CurrencyGet(id);
        if (DT.Rows.Count > 0)
        {
            txtArName.Text = DT.Rows[0]["ArName"].ToString();
            txtEnName.Text = DT.Rows[0]["EnName"].ToString();
            txtFractionsNo.Text = DT.Rows[0]["FractionsNo"].ToString();
            txtFractionName.Text = DT.Rows[0]["FractionName"].ToString();
            cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
            lblID.Text = id;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { txtArName, txtEnName, cbActive, txtFractionName, txtFractionsNo });
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;

        if (DataAccess.CurrencyDelete(id, EmployeeID) > 0)
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

        if (DataAccess.CurrencyActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
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