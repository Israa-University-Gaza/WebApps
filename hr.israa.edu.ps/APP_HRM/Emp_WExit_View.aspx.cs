using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Emp_WExit_View : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lbEdit_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Exit_ID"] = ((Label)ri.FindControl("ExitID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Exit_AddEdit.aspx");
    }

    protected void lbDelete_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("ExitID")).Text;

        if (DataAccess.Exit_Permission_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater2.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }
    }

    protected void lbEdit2_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Work_Exit_ID"] = ((Label)ri.FindControl("WExitID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Exit_AddEdit.aspx");
    }

    protected void lbDelete2_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("WExitID")).Text;

        if (DataAccess.Exit_Permission_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater2.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }
    }
    protected void Cancel_Request(object sender, EventArgs e)
    {

    }
}