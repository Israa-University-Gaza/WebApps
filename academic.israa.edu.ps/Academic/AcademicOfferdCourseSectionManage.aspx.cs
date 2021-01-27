using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_AcademicOfferdCourseSectionManage : UserPage
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

    protected void cbSectionIsActive1_CheckedChanged(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((CheckBox)sender).Parent;
        string id = ((Label)ri.FindControl("SectionID")).Text;
        if (DataAccess.SectionActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowToast(this, "تمت العملية بنجاح.", "", "success");
            Repeater1.DataBind();
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

    protected void lbSectionDelete1_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("SectionID")).Text;
        if (DataAccess.SectionDelete(id, EmployeeID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم يتم الحذف.", "", "error");
        }
    }

    protected void btnLectureSave_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string id = ((Label)ri.FindControl("SectionID")).Text;
        DropDownList ddlRoomID = (DropDownList)ri.FindControl("ddlRoomID");
        DropDownList ddlDayID = (DropDownList)ri.FindControl("ddlDayID");
        TextBox txtFromHour = (TextBox)ri.FindControl("txtFromHour");
        TextBox txtToHour = (TextBox)ri.FindControl("txtToHour");
        CheckBox cbLectureIsActive = (CheckBox)ri.FindControl("cbLectureIsActive");
        Repeater Repeater4 = (Repeater)ri.FindControl("Repeater4");


        bool IntValidate = IntValidateControls(new WebControl[] { ddlRoomID, ddlDayID });
        bool Validate = ValidateControls(new WebControl[] { ddlRoomID, ddlDayID, txtFromHour, txtToHour });
        bool DateValidate = DateValidateControls(new WebControl[] { txtFromHour, txtToHour });
        if (Validate && IntValidate && DateValidate)
        {
            DataTable DT = DataAccess.LectureAddEdit("", id, ddlRoomID.SelectedValue, ddlDayID.SelectedValue, txtFromHour.Text, txtToHour.Text, true, EmployeeID);
            if (Convert.ToInt32(DT.Rows[0]["status"]) > 0)
            {
                Repeater4.DataBind();
                EmptyControls(new WebControl[] { txtFromHour, txtToHour, ddlDayID, ddlRoomID });
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "success");
            }
            else
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void lbLectureDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("LectureID")).Text;

        if (DataAccess.LectureDelete(id, EmployeeID) != null)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }
    }
}