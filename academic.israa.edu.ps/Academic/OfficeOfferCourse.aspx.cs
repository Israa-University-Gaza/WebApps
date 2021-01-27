using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_OfficeOfferCourse : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            lblEmployeeID.Text = EmployeeID;
            ddlDepartment.DataBind();
            ddlDepartment.Items.Insert(0, new ListItem("اختر القسم", "-1"));
            ddlCourse.DataBind();
            ddlCourse.Items.Insert(0, new ListItem("اختر المساق", "-1"));

        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlDepartment, ddlCourse, ddlInstructor, txtFinalExamDate, txtFinalExamTimeFrom1, txtFinalExamTimeTo1 });
        bool ValidateDate = DateValidateControls(new WebControl[] { txtFinalExamTimeFrom1, txtFinalExamTimeTo1 });
        if (Validate && ValidateDate)
        {
            DataTable DT = DataAccess.OfficeOfferdCourseAdd(lblOfferCourseID.Text, ddlSemester.SelectedValue, ddlCourse.SelectedValue, ddlInstructor.SelectedValue, txtFinalExamDate.Text, txtFinalExamTimeFrom1.Text, txtFinalExamTimeTo1.Text, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblOfferCourseID, ddlSemester, ddlCourse, ddlInstructor, txtFinalExamDate, txtFinalExamTimeFrom1, txtFinalExamTimeTo1 });
    }





    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCourse.DataBind();
    }

    protected void DataBind(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }


    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        ((DropDownList)e.Item.FindControl("ddlDay")).SelectedValue = ((Label)e.Item.FindControl("CDayID")).Text;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((Button)sender).Parent;
        string SectionID = ((Label)li.FindControl("SectionID")).Text;
        string CdayID = ((DropDownList)li.FindControl("ddlDay")).SelectedValue;
        string txtFromHour = ((TextBox)li.FindControl("txtFromHour")).Text;
        string txtToHour = ((TextBox)li.FindControl("txtToHour")).Text;
        bool Validate = ValidateControls(new WebControl[] { ((DropDownList)li.FindControl("ddlDay")), ((TextBox)li.FindControl("txtFromHour")), ((TextBox)li.FindControl("txtToHour")) });
        bool ValidateDate = DateValidateControls(new WebControl[] { ((TextBox)li.FindControl("txtFromHour")), ((TextBox)li.FindControl("txtToHour")) });
        if (Validate && ValidateDate)
        {
            DataTable DT = DataAccess.OfficeLectureAdd(SectionID, CdayID, txtFromHour, txtToHour, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
}