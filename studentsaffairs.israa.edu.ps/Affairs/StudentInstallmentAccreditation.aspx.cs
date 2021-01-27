using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_StudentInstallmentAccreditation : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Permissions.Contains("StudentScholarshipAccreditation"))
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void lbAccrediteStudentInstallment_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("InstallmentOrderID")).Text;
        DataTable DT = DataAccess.StudentInstallmentAccreditation(id, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void btnAccrediteStudentInstallment_Click(object sender, EventArgs e)
    {
        int count1 = 0; int count2 = 0;
        foreach (ListViewItem item in ListView1.Items)
        {
            CheckBox cbStudentInstallment = ((CheckBox)item.FindControl("cbStudentInstallment"));
            if (cbStudentInstallment.Checked)
            {
                string id = ((Label)item.FindControl("InstallmentOrderID")).Text;
                DataTable DT = DataAccess.StudentInstallmentAccreditation(id, EmployeeID);
                if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                    count1++;
                else
                    count2++;
            }
        }
        ShowToast(this, "تم إعتماد " + count1 + " قسط طالب " + "<br />" + "لم يتم إعتماد " + count2 + " قسط طالب", "", "success");
        ListView1.DataBind();
    }
}