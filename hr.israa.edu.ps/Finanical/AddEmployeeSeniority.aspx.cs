using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Finanical_EmployeeSeniorityAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void Save_Click(object sender, EventArgs e)
    {

        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        bool Validate = ValidateControls(new WebControl[] {(TextBox)li.FindControl("txtSeniority") });
        if (Validate)
        {

            string EmpID = ((Label)li.FindControl("EmpID")).Text;
            string Seniority = ((TextBox)li.FindControl("txtSeniority")).Text;

            DataTable DT = DataAccess.EmployeeSeniorityAddEdit(EmpID, Seniority, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { (TextBox)li.FindControl("txtSeniority") });
                ListView1.DataBind();

            }
        }
        else ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");

    }
}