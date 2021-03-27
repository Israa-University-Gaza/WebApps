using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_AcademicOfferdCourseManage : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPermissionsContains("AcademicOfferdCourse"))
        {
            lblEmployeeID.Text = EmployeeID;
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("OfferdCourseID")).Text;
        divSections.Visible = true;
        DataTable DT = DataAccess.GetOfferdCourseSections(id);
        Repeater1.DataSource = DT;
        Repeater1.DataBind();
    }


    protected void btnAdd_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        Session["OfferdCourseID"] = ((Label)item.FindControl("OfferdCourseID")).Text;
        Response.Redirect("SectionAddEdit.aspx");
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        Session["OfferdCourseID"] = ((Label)item.FindControl("OfferdCourseID")).Text;
        Response.Redirect("AcademicOfferCourse.aspx");
    }

    protected void btnAccrediation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("OfferdCourseID")).Text;
        DataTable DT = DataAccess.OfferdCourseAccreditation(id, EmployeeID, "3");
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("OfferdCourseID")).Text;
        if (DataAccess.OfferdCourseDelete(id, EmployeeID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            ListView1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }

    protected void cbSectionIsActive1_CheckedChanged(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((CheckBox)sender).Parent;
        string id = ((Label)ri.FindControl("SectionID")).Text;
        if (DataAccess.SectionActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowToast(this, "تمت العملية بنجاح.", "", "success");
            id = ((Label)ri.FindControl("OfferdCourseID")).Text;
            divSections.Visible = true;
            DataTable DT = DataAccess.GetOfferdCourseSections(id);
            Repeater1.DataSource = DT;
            Repeater1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم العملية.", "", "error");
        }
    }
    protected void cbSectionIsActive2_CheckedChanged(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((CheckBox)sender).Parent;
        string id = ((Label)ri.FindControl("SectionID2")).Text;
        if (DataAccess.SectionActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowToast(this, "تمت العملية بنجاح.", "", "success");
            ri.Parent.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم العملية.", "", "error");
        }
    }
    protected void cbSectionIsActive3_CheckedChanged(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((CheckBox)sender).Parent;
        string id = ((Label)ri.FindControl("SectionID3")).Text;
        if (DataAccess.SectionActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowToast(this, "تمت العملية بنجاح.", "", "success");
            ri.Parent.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم العملية.", "", "error");
        }
    }

    protected void lbSectionEdit1_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["SectionID"] = ((Label)ri.FindControl("SectionID")).Text;
        Response.Redirect("~/Academic/SectionAddEdit.aspx");
    }
    protected void lbSectionEdit2_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["SectionID"] = ((Label)ri.FindControl("SectionID2")).Text;
        Response.Redirect("~/Academic/SectionAddEdit.aspx");
    }
    protected void lbSectionEdit3_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["SectionID"] = ((Label)ri.FindControl("SectionID3")).Text;
        Response.Redirect("~/Academic/SectionAddEdit.aspx");
    }

    protected void lbSectionDelete1_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("SectionID")).Text;
        if (DataAccess.SectionDelete(id, EmployeeID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            id = ((Label)ri.FindControl("OfferdCourseID")).Text;
            divSections.Visible = true;
            DataTable DT = DataAccess.GetOfferdCourseSections(id);
            Repeater1.DataSource = DT;
            Repeater1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم يتم الحذف.", "", "error");
        }
    }
    protected void lbSectionDelete2_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("SectionID2")).Text;
        if (DataAccess.SectionDelete(id, EmployeeID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            ri.Parent.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم يتم الحذف.", "", "error");
        }
    }
    protected void lbSectionDelete3_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("SectionID3")).Text;
        if (DataAccess.SectionDelete(id, EmployeeID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            ri.Parent.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم يتم الحذف.", "", "error");
        }
    }
}