using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_Semester : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPermissionsContains("Semester"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["SemesterID"] = ((Label)item.FindControl("SemesterID")).Text;
        Response.Redirect("~/Academic/SemesterAddEdit.aspx");
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("SemesterID")).Text;

        if (DataAccess.SemesterDelete(id, EmployeeID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            ListView1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }

    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("SemesterID")).Text;

        if (DataAccess.SemesterActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowToast(this, "تمت العملية بنجاح.", "", "success");
            ListView1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم العملية.", "", "error");
    }
}