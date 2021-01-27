using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_CourseBookAccrediation : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

   

    protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCollege.DataBind();
    }

    protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDepartment.DataBind();
    }



    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }

    protected void lbAccedit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("ID")).Text;
        DataTable DT = DataAccess.CourseBookAccredit(id,true,EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
    }

    protected void lbCancel_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("ID")).Text;
        DataTable DT = DataAccess.CourseBookAccredit(id, false, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("ID")).Text;
        DataTable DT = DataAccess.CourseBookDelete(id, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
    }
}