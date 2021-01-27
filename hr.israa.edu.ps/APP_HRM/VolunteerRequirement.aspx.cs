using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_VolunteerRequirement : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["VolunteerID"] != null)
            {
                VolunteerID.Text = Session["VolunteerID"].ToString();
                Session["VolunteerID"] = null;
            }
        }
        
    }


    protected void ddlEducation_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlEducation.SelectedValue == "2101") EduName.Visible = true;
        else EduName.Visible = false;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string Known = ""; string Activity = "";
        foreach (ListItem Item in cbKnown.Items)
        {
            if (Item.Selected==true)
            {
                Known += Item.Value + ",";
               
            }
        }
       // txtKnownName.Text = Known;
        foreach (ListItem Item in cblActivity.Items)
        {
            if (Item.Selected == true)
            {
                Activity += Item.Value + ",";

            }
        }
        DataTable dtSkills = new DataTable();
        dtSkills.Columns.Add("ID", typeof(int));
        dtSkills.Columns.Add("Skill", typeof(string));
        foreach (ListViewItem item in ListView1.Items)
        {
            Label ID = (Label)item.FindControl("txtSkillID");
            TextBox Skill = (TextBox)item.FindControl("txtQulification");
            if (Skill.Text != "")
            {
                DataRow r = dtSkills.NewRow();
                r["ID"] = ID.Text;
                r["Skill"] = Skill.Text;
                dtSkills.Rows.Add(r);
            }
        }


        bool validate = ValidateControls(new WebControl[] { });
        bool DateValidate = DateValidateControls(new WebControl[] { txtDateFrom, txtDateTo,txtDOB });

        if (validate && DateValidate)
        {

            DataTable DT = DataAccess.VolunteerRequestAddEdit(VolunteerID.Text, txtDOB.Text, txtTelephone.Text, txtMobile.Text, txtEmail.Text,txtJob.Text,txtCompanyName.Text,
                ddlEducation.SelectedValue, txtQualName.Text, txtUniversityName.Text, Known, txtKnownName.Text, txtOrganization.Text, Activity, txtOtherActivity.Text,txtScopeName.Text,
                txtVolunteerHours.Text, rblPeriod.SelectedValue, txtDateFrom.Text, txtDateTo.Text, txtcontactName.Text, txtContactphone.Text, UserID, dtSkills);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                Response.Redirect("~/App_HRM/GetEmployeeData.aspx");
            }
        }
      
    }
    protected void cbKnown_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (cbKnown.SelectedValue == "2075") Div2.Visible = true;
        else Div2.Visible = false;
    }
 
}