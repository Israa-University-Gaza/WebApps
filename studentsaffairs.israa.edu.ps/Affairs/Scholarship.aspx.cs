using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Affairs_Scholarship : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(EmployeeID!= "5124" && EmployeeID != "5267")
        Response.Redirect("Block.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool valid = ValidateControls(new WebControl[] { txtArName, txtEnName, cbActive, txtvalue });
        valid = valid && DoubleValidateControls(new WebControl[] { txtvalue });

        if (valid)
        {
            if (DataAccess.ActionAddEdit(lblScholarshipID.Text, txtArName.Text, txtEnName.Text, txtvalue.Text, "-1", ((rbRate.Checked) ? "1" : "2"), true, cbActive.Checked, EmployeeID) > 0)
            {
                EmptyControls(new WebControl[] { lblScholarshipID, txtArName, txtEnName, cbActive, txtvalue });
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
        DataTable DT = DataAccess.ActionGet(id);
        if (DT.Rows.Count > 0)
        {
            txtArName.Text = DT.Rows[0]["ArName"].ToString();
            txtEnName.Text = DT.Rows[0]["EnName"].ToString();
            txtvalue.Text = DT.Rows[0]["Value"].ToString();
            rbRate.Checked = DT.Rows[0]["RVType"].ToString() == "1";
            rbValue.Checked = DT.Rows[0]["RVType"].ToString() == "2";
            cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
            lblScholarshipID.Text = id;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { txtArName, txtEnName, cbActive, txtvalue, rbRate, rbValue });
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;

        if (DataAccess.ActionDelete(id, EmployeeID) > 0)
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

        if (DataAccess.ActionActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
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