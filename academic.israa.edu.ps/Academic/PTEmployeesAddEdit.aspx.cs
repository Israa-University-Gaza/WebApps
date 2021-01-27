using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_PTEmployeesAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblEmployeeID.Text = EmployeeID;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlCollegeID, ddlDepartmentID, txtQualification, txtNotes, txtName }))
        {
            DataTable DT = DataAccess.PTEmployeeAddEdit(lblID.Text, txtName.Text, ddlDepartmentID.SelectedValue, txtQualification.Text, txtNotes.Text, EmployeeID);
            if (DT.Rows.Count > 0)
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            }
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { lblID, ddlProgramID, ddlDepartmentID, ddlCollegeID, txtQualification, txtNotes, txtName });

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
        EmptyControls(new WebControl[] { ddlCollegeID, txtQualification, txtNotes, txtName });
    }

    protected void ddlProgramID_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCollegeID.DataBind();
    }

    protected void ddlCollegeID_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDepartmentID.DataBind();
    }

    protected void ddlFilterProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlFilterCollege.DataBind();
        ListView1.DataBind();
    }



    protected void ddlFilterCollege_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("PTEmployeeID")).Text;
        lblID.Text = ID;
        DataTable DT = DataAccess.PTEmployeeGet(lblID.Text);
        if (DT.Rows.Count > 0)
        {
            ddlProgramID.DataBind();
            ddlProgramID.SelectedValue = DT.Rows[0]["ProgramID"].ToString();
            ddlCollegeID.DataBind();
            ddlCollegeID.SelectedValue = DT.Rows[0]["CollegeID"].ToString();
            ddlDepartmentID.DataBind();
            ddlDepartmentID.SelectedValue = DT.Rows[0]["DepartmentID"].ToString();
            txtName.Text = DT.Rows[0]["Name"].ToString();
            txtQualification.Text = DT.Rows[0]["Qualification"].ToString();
            txtNotes.Text = DT.Rows[0]["Notes"].ToString();
        }
    }
}