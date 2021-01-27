using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_Account : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        bool valid = ValidateControls(new WebControl[] { txtAccountNo, txtAccountName });

        if (valid)
        {
            if (DataAccess.AccountAddEdit(lblAccountID.Text, txtAccountNo.Text, txtAccountName.Text, cbActive.Checked, EmployeeID) > 0)
            {
                EmptyControls(new WebControl[] { lblAccountID, txtAccountNo, txtAccountName, cbActive });
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
        DataTable DT = DataAccess.AccountGet(id);
        if (DT.Rows.Count > 0)
        {
            lblAccountID.Text = id;
            txtAccountNo.Text = DT.Rows[0]["AccountNo"].ToString();
            txtAccountName.Text = DT.Rows[0]["AccountName"].ToString();
            cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { txtAccountNo, txtAccountName, cbActive });
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        //RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        //string id = ((Label)ri.FindControl("ID")).Text;

        //if (DataAccess.CurrencyDelete(id, EmployeeID) > 0)
        //{
        //    ShowToast(this, "تم الحذف بنجاح.", "", "success");
        //    Repeater1.DataBind();
        //}
        //else
        //{
        ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        //}
    }

    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((CheckBox)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;

        if (DataAccess.AccountActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
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