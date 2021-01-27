using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Accept_Emp_Exit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    void activeTab(int i)
    {

        li1.Attributes.Add("Class", (i == 1) ? "active" : "");
        li2.Attributes.Add("Class", (i == 2) ? "active" : "");


        tab_1.Attributes.Add("Class", (i == 1) ? "tab-pane active" : "tab-pane ");
        tab_5.Attributes.Add("Class", (i == 2) ? "tab-pane active" : "tab-pane ");

    }




    protected void Refused_CheckedChanged(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((RadioButton)sender).Parent;
        ((TextBox)ri.FindControl("TextBox1")).Enabled = true;
        //string reason = ((TextBox)ri.FindControl("TextBox1")).Text;
        //  ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        activeTab(2);

    }
    protected void Reason_Changed(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string reason = ((TextBox)ri.FindControl("TextBox1")).Text;

        string id = ((Label)ri.FindControl("ExitID")).Text;

        if (((RadioButton)ri.FindControl("Accept")).Checked)
        {
            if (DataAccess.Exit_Follow_Request(id, true, "", UserID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                Repeater1.DataBind();
                activeTab(2);
            }
            else
                ShowToast(this, "عذرًا , لم يتم حفظ القبول.", "", "error");
            activeTab(2);
        }
        else if (((RadioButton)ri.FindControl("Refused")).Checked)
        {
            if (DataAccess.Exit_Follow_Request(id, false, reason, UserID) > 0)
            {
                ShowToast(this, "تم الاعتماد بنجاح.", "", "success");
                Repeater1.DataBind();
                activeTab(2);
            }
            else
                ShowToast(this, "عذرًا , لم يتم اعتماد الرفض.", "", "error");
            activeTab(2);
        }
    }



    protected void Refused1_CheckedChanged(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((RadioButton)sender).Parent;
        ((TextBox)ri.FindControl("TextBox2")).Enabled = true;
        //string reason = ((TextBox)ri.FindControl("TextBox1")).Text;
        //  ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        activeTab(1);
    }
    protected void Reason1_Changed(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string reason = ((TextBox)ri.FindControl("TextBox2")).Text;

        string id = ((Label)ri.FindControl("WExitID")).Text;

        if (((RadioButton)ri.FindControl("Accept")).Checked)
        {

            if (DataAccess.WExit_Follow_Request(id, true, "", UserID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                Repeater2.DataBind();
                activeTab(1);
            }
            else
                ShowToast(this, "عذرًا , لم يتم  الحفظ.", "", "error");
            activeTab(1);
        }
        else if (((RadioButton)ri.FindControl("Refused")).Checked)
        {

            if (DataAccess.WExit_Follow_Request(id, false, reason, UserID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                Repeater2.DataBind();
                activeTab(1);
            }
            else
                ShowToast(this, "عذرًا , لم يتم حفظ الرفض.", "", "error");
            activeTab(1);
        }
    }
    protected void AdoptHRM_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;

        bool adopt = false;
        string id = ((Label)ri.FindControl("ExitID")).Text;
        if (((RadioButton)ri.FindControl("RadioButton1")).Checked)
        {
            adopt = true;
        }
        else if (((RadioButton)ri.FindControl("RadioButton2")).Checked)
        {
            adopt = false;
        }
        if (DataAccess.Exit_Adopt_Request(id, UserID,adopt) > 0)
        {
            ShowToast(this, "تم الاعتماد بنجاح.", "", "success");
            Repeater1.DataBind();
            Repeater3.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم يتم الاعتماد .", "", "error");
        activeTab(2);
    }
    protected void AdoptHRM1_Click(object sender, EventArgs e)
    {
        bool adopt = false;
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;

        
        string id = ((Label)ri.FindControl("WExitID")).Text;
        if (((RadioButton)ri.FindControl("RadioButton1")).Checked)
        {
            adopt = true;
        }
        else if (((RadioButton)ri.FindControl("RadioButton2")).Checked)
        {
            adopt = false;
        }
        if (DataAccess.WExit_Adopt_Request(id, UserID, adopt) > 0)
        {
            ShowToast(this, "تم الاعتماد بنجاح.", "", "success");
            Repeater2.DataBind();
            Repeater4.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم يتم الاعتماد .", "", "error");
        activeTab(1);
    }


    protected void PrintRequest_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string id = ((Label)ri.FindControl("ExitID")).Text;
        Response.Redirect("../ReportView.aspx?ExitID=" + id);

    }
    protected void PrintRequest2_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string id = ((Label)ri.FindControl("WExitID")).Text;
        Response.Redirect("../ReportView.aspx?WExitID=" + id);
    }
}