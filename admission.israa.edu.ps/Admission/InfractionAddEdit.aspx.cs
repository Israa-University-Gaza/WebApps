using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_InfractionAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
 


    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("InfractionID")).Text;
        lblInfractionID.Text = ID;
        DataTable DT = DataAccess.InfractionGet(lblInfractionID.Text);
        if (DT.Rows.Count > 0)
        {
            txtInfraction.Text = DT.Rows[0]["Title"].ToString();
            ddlInfractionTypeID.SelectedValue = DT.Rows[0]["InfractionTypeID"].ToString();
        }


    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("InfractionID")).Text;
        DataTable DT = DataAccess.InfractionDelete(ID, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView2.DataBind();

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { txtInfraction, ddlInfractionTypeID });
        if (Validate)
        {
            DataTable DT = DataAccess.InfractionAddEdit(lblInfractionID.Text, txtInfraction.Text, ddlInfractionTypeID.SelectedValue, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if ((Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0))
            {
                EmptyControls(new WebControl[] { txtInfraction, ddlInfractionTypeID });
                ListView2.DataBind();
            }
        }
        else
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { txtInfraction, ddlInfractionTypeID });
    }

}