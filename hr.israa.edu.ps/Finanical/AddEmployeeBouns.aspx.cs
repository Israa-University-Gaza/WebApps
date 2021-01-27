using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finanical_AddEmployeeBouns : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlBounsType, ddlBouns, ddlEmployee });
        if (Validate)
        {
            DataTable DT = DataAccess.EmployeeBounsAdd(ddlBouns.SelectedValue, ddlEmployee.SelectedValue, UserID, true);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { ddlBounsType, ddlBouns, ddlEmployee });
                ListView1.DataBind();


            }
        }
        else ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
    }

    protected void IsActive_CheckedChanged(object sender, EventArgs e)
    {

        ListViewItem li = (ListViewItem)((CheckBox)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;
        Boolean IsActive = ((CheckBox)li.FindControl("IsActive")).Checked;
        DataTable DT = DataAccess.EmployeeBounsActive(ID, IsActive, UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
        {

            ListView1.DataBind();


        }

    }


    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}
