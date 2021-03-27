using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_AcademicSectionEmployee : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Permissions.Contains("AcademicSectionEmployee"))
            lblEmployeeID.Text = EmployeeID;
        else
            Response.Redirect("Default.aspx");
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
    protected void lbSaveEmployee1_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("SectionID")).Text;
        DropDownList ddlEmployeeID = ((DropDownList)item.FindControl("ddlEmployee"));
        DropDownList ddlPTEmployee = ((DropDownList)item.FindControl("ddlPTEmployee"));
        Panel divPTEmployee = ((Panel)item.FindControl("divPTEmployee"));
        bool Validate = ValidateControls(new WebControl[] { ddlEmployeeID, (divPTEmployee.Visible) ? ddlPTEmployee : null });
        if (Validate)
        {
            DataTable DT = DataAccess.SetSectionEmployee(id, ddlEmployeeID.SelectedValue, (divPTEmployee.Visible) ? ddlPTEmployee.SelectedValue : "", EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() == "1") ? "success" : "error");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "الرجاء إختيار محاضر للشعبة", "", "error");
        }
    }
    protected void lbSaveEmployee2_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("SectionID2")).Text;
        DropDownList ddlEmployeeID = ((DropDownList)item.FindControl("ddlEmployee"));
        DropDownList ddlPTEmployee = ((DropDownList)item.FindControl("ddlPTEmployee"));
        Panel divPTEmployee = ((Panel)item.FindControl("divPTEmployee"));
        bool Validate = ValidateControls(new WebControl[] { ddlEmployeeID, (divPTEmployee.Visible) ? ddlPTEmployee : null });
        if (Validate)
        {
            DataTable DT = DataAccess.SetSectionEmployee(id, ddlEmployeeID.SelectedValue, (divPTEmployee.Visible) ? ddlPTEmployee.SelectedValue : "", EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() == "1") ? "success" : "error");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "الرجاء إختيار محاضر للشعبة", "", "error");
        }
    }
    protected void lbSaveEmployee3_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("SectionID3")).Text;
        DropDownList ddlEmployeeID = ((DropDownList)item.FindControl("ddlEmployee"));
        DropDownList ddlPTEmployee = ((DropDownList)item.FindControl("ddlPTEmployee"));
        Panel divPTEmployee = ((Panel)item.FindControl("divPTEmployee"));
        bool Validate = ValidateControls(new WebControl[] { ddlEmployeeID, (divPTEmployee.Visible) ? ddlPTEmployee : null });
        if (Validate)
        {
            DataTable DT = DataAccess.SetSectionEmployee(id, ddlEmployeeID.SelectedValue, (divPTEmployee.Visible) ? ddlPTEmployee.SelectedValue : "", EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() == "1") ? "success" : "error");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "الرجاء إختيار محاضر للشعبة", "", "error");
        }
    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        ((DropDownList)e.Item.FindControl("ddlEmployee")).SelectedValue = ((Label)e.Item.FindControl("EmployeeID")).Text;
        ((Panel)e.Item.FindControl("divPTEmployee")).Visible = (((DropDownList)e.Item.FindControl("ddlEmployee")).SelectedValue == "9999");
        ((DropDownList)e.Item.FindControl("ddlPTEmployee")).SelectedValue = ((Label)e.Item.FindControl("PTEmployeeID")).Text;
    }

    protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        ((DropDownList)e.Item.FindControl("ddlEmployee")).SelectedValue = ((Label)e.Item.FindControl("EmployeeID")).Text;
        ((Panel)e.Item.FindControl("divPTEmployee")).Visible = (((DropDownList)e.Item.FindControl("ddlEmployee")).SelectedValue == "9999");
        ((DropDownList)e.Item.FindControl("ddlPTEmployee")).SelectedValue = ((Label)e.Item.FindControl("PTEmployeeID")).Text;
    }

    protected void Repeater3_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        ((DropDownList)e.Item.FindControl("ddlEmployee")).SelectedValue = ((Label)e.Item.FindControl("EmployeeID")).Text;
        ((Panel)e.Item.FindControl("divPTEmployee")).Visible = (((DropDownList)e.Item.FindControl("ddlEmployee")).SelectedValue == "9999");
        ((DropDownList)e.Item.FindControl("ddlPTEmployee")).SelectedValue = ((Label)e.Item.FindControl("PTEmployeeID")).Text;
    }

    protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((DropDownList)sender).Parent;
        DropDownList ddlEmployeeID = ((DropDownList)item.FindControl("ddlEmployee"));
        Panel divPTEmployee = ((Panel)item.FindControl("divPTEmployee"));
        divPTEmployee.Visible = ddlEmployeeID.SelectedValue == "9999";
    }
}