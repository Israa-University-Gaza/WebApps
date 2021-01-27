using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_OfficeHourAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EmpID.Text = EmployeeID;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlDay, ddlEmployeeID, ddlRoom, txtTimeFrom, txtTimeTo }))
        {
            DataTable DT = DataAccess.OfficeHourAddEdit(lblOfficeHourID.Text, ddlEmployeeID.SelectedValue,ddlRoom.SelectedValue,ddlDay.SelectedValue, txtTimeFrom.Text, txtTimeTo.Text, EmployeeID);
            if (DT.Rows.Count > 0)
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            }
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { lblOfficeHourID, ddlDay, ddlEmployeeID, ddlRoom, txtTimeFrom, txtTimeTo });
                ListView1.DataBind();
            }


        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { ddlDay, ddlEmployeeID, ddlRoom, txtTimeFrom, txtTimeTo });
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;
        lblOfficeHourID.Text = ID;
        DataTable DT = DataAccess.OfficeHourGet(lblOfficeHourID.Text);
        if (DT.Rows.Count > 0)
        {
            ddlEmployeeID.DataBind();
            ddlEmployeeID.SelectedValue = DT.Rows[0]["InstructorID"].ToString();
            ddlDay.DataBind();
            ddlDay.SelectedValue = DT.Rows[0]["DayID"].ToString();
            ddlRoom.DataBind();
            ddlRoom.SelectedValue = DT.Rows[0]["RoomID"].ToString();
            txtTimeFrom.Text = DT.Rows[0]["FromHour"].ToString();
            txtTimeTo.Text = DT.Rows[0]["ToHour"].ToString();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;
        DataTable DT = DataAccess.OfficeHourDelete(ID, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void ddlInstructore_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}