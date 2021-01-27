using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_CollegeEmployee : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddlProgramID_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCollegeID.DataBind();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlEmployeeID, ddlQualification, ddlEmployeeType }))
        {
            DataTable DT = DataAccess.CollegeEmployeeAddEdit(lblID.Text, ddlCollegeID.SelectedValue, ddlEmployeeID.SelectedValue, ddlQualification.SelectedValue, ddlEmployeeType.SelectedValue, EmployeeID);
            if (DT.Rows.Count > 0)
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            }
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { lblID, ddlEmployeeID, ddlProgramID, ddlCollegeID, ddlQualification });
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
        EmptyControls(new WebControl[] { ddlEmployeeID, ddlQualification });
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
       lblID.Text= ((Label)item.FindControl("CollegeEmployeeID")).Text;
       DataTable DT = DataAccess.CollegeEmployeeGet(lblID.Text);
        ddlProgramID.SelectedValue = DT.Rows[0]["ProgramID"].ToString();
        ddlCollegeID.DataBind();
        ddlCollegeID.SelectedValue = DT.Rows[0]["CollegeID"].ToString();
        ddlEmployeeID.SelectedValue = DT.Rows[0]["EmployeeID"].ToString();
        ddlQualification.SelectedValue = DT.Rows[0]["QualificationID"].ToString();

    }
    protected void lbAccrediation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        lblID.Text = ((Label)item.FindControl("CollegeEmployeeID")).Text;
        DataTable DT = DataAccess.CollegeEmployeeAccrediation(lblID.Text,EmployeeID);
        if (DT.Rows.Count>0)
        {
            ShowToast(this,DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString()=="1")? "success": "error");
        }
    }
    protected void ddlFilterCollege_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void ddlFilteProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlFilterCollege.DataBind();
        ListView1.DataBind();
    }
}