using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_AdmissionIssueEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPermissionsContains("IssueEdit"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {


        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;
        bool IsActive = ((CheckBox)li.FindControl("cbIsActive")).Checked;
        string ActiveFrom = ((TextBox)li.FindControl("txtActiveFrom")).Text;
        string ActiveTo = ((TextBox)li.FindControl("txtActiveTo")).Text;
     
        bool DateValidate = DateValidateControls(new WebControl[] { ((TextBox)li.FindControl("txtActiveTo")), ((TextBox)li.FindControl("txtActiveFrom")) });
        if (DateValidate)
        {
            DataTable DT = DataAccess.IssueEdit(ID, IsActive, ActiveFrom, ActiveTo,EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");

        }
    }
    protected void BtnSaveAll_Click(object sender, EventArgs e)
    {
        int c = 0, s = 0, f = 0;
        foreach (ListViewItem li in ListView1.Items)
        {
            c++;
            string ID = ((Label)li.FindControl("ID")).Text;
            bool IsActive = ((CheckBox)li.FindControl("cbIsActive")).Checked;
            string ActiveFrom = ((TextBox)li.FindControl("txtActiveFrom")).Text;
            string ActiveTo = ((TextBox)li.FindControl("txtActiveTo")).Text;
            bool DateValidate = DateValidateControls(new WebControl[] { ((TextBox)li.FindControl("txtActiveTo")), ((TextBox)li.FindControl("txtActiveFrom")) });
            if (DateValidate)
            {
                DataTable DT = DataAccess.IssueEdit(ID, IsActive, ActiveFrom, ActiveTo, EmployeeID);
                if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                    s++;
                else
                    f++;
            }
            else
                f++;
        }
        ShowToast(this, "تم حفظ " + s + " ولم يتم حفظ " + f + " من أصل " + c, "", (f == 0) ? "success" : "error");
    }
}

 
