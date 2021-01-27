using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_CollegeRoom : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Permissions.Contains("CollegeRoom"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlProgramID, ddlRoomID, ddlCollegeID }))
        {
            DataTable DT = DataAccess.CollegeRoomAddEdit(CollegeRoomID.Text, ddlCollegeID.SelectedValue, ddlRoomID.SelectedValue, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {

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
        ddlProgramID.SelectedValue = null;
        ddlRoomID.SelectedValue = null;
        ddlCollegeID.SelectedValue = null;
    }


    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("CollegeRomID")).Text;
        CollegeRoomID.Text = id;
        DataTable dt = DataAccess.CollegeRoomGet(CollegeRoomID.Text);

        if (dt.Rows.Count > 0)
        {
            ddlProgramID.DataBind();
            ddlProgramID.SelectedValue = dt.Rows[0]["ProgramID"].ToString();
            ddlCollegeID.DataBind();
            ddlCollegeID.SelectedValue = dt.Rows[0]["CollegeID"].ToString();
            ddlRoomID.SelectedValue = dt.Rows[0]["RoomID"].ToString();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("CollegeRomID")).Text;
        DataTable DT = DataAccess.CollegeRoomDelete(id, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }



    protected void ddlProgramID1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void ddlCollegeID2_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void txtRoomName_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void Search_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void ddlRoomID1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}