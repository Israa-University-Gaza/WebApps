using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_CollegePTHours : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Permissions.Contains("CollegePTHours"))
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (ListViewItem item in ListView1.Items)
        {
            if (ValidateControls(new WebControl[] { ((TextBox)item.FindControl("txtPTHours")) }))
            {
                string ID = ((Label)item.FindControl("ID")).Text;
                string CollegeID = ((Label)item.FindControl("CollegeID")).Text;
                string PTHours = ((TextBox)item.FindControl("txtPTHours")).Text;

                DataTable DT = DataAccess.CollegePTHoursAdd(ID, ddlSemester.SelectedValue, CollegeID, PTHours, EmployeeID);
            }
        }
        ListView1.DataBind();
        ShowToast(this, "تم الحفظ بنجاح.", "", "success");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        if (ValidateControls(new WebControl[] { ((TextBox)item.FindControl("txtPTHours")) }))
        {
            string ID = ((Label)item.FindControl("ID")).Text;
            string CollegeID = ((Label)item.FindControl("CollegeID")).Text;
            string PTHours = ((TextBox)item.FindControl("txtPTHours")).Text;

            DataTable DT = DataAccess.CollegePTHoursAdd(ID, ddlSemester.SelectedValue, CollegeID, PTHours, EmployeeID);
            if (DT.Rows.Count > 0)
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            }
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
              ListView1.DataBind();
            }
        }
    }
}