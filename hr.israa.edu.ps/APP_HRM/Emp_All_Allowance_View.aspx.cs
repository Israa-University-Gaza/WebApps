using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Emp_All_View : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn1Filter_Click(object sender, EventArgs e)
    {
        Repeater1.DataBind();
    }

    protected void btn2Filter_Click(object sender, EventArgs e)
    {
        Repeater2.DataBind();
    }
    protected void btn3Filter_Click(object sender, EventArgs e)
    {
        Repeater3.DataBind();
    }

    protected void btn4Filter_Click(object sender, EventArgs e)
    {
        Repeater4.DataBind();
    }

    protected void btn5Filter_Click(object sender, EventArgs e)
    {
        Repeater5.DataBind();
    }



    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Allowance_ID"] = ((Label)ri.FindControl("AllowanceID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Allownace_AddEdit.aspx");
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("AllowanceID")).Text;

        if (DataAccess.Allowance_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }

    protected void lbEdit_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Bouns_ID"] = ((Label)ri.FindControl("BounsID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Allownace_AddEdit.aspx");
    }

    protected void lbDelete_Click2(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("BounsID")).Text;

        if (DataAccess.Bouns_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater2.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }

    protected void lbEdit_Click3(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Deduction_ID"] = ((Label)ri.FindControl("DeductionID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Allownace_AddEdit.aspx");
    }

    protected void lbDelete_Click3(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("DeductionID")).Text;

        if (DataAccess.Deduction_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater3.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }

    protected void lbEdit_Click4(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Motivation_ID"] = ((Label)ri.FindControl("MotivationID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Allownace_AddEdit.aspx");
    }

    protected void lbDelete_Click4(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("MotivationID")).Text;

        if (DataAccess.Motivation_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater4.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }

    protected void lbEdit_Click5(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Penalty_ID"] = ((Label)ri.FindControl("PenatlyID")).Text;
        Response.Redirect("~/APP_HRM/Emp_Allownace_AddEdit.aspx");
    }

    protected void lbDelete_Click5(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("PenatlyID")).Text;

        if (DataAccess.Penalty_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater5.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }
}