using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SyllabusActivities : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["SyllabusID"] != null)
                lblSyllabusID.Text = Session["SyllabusID"].ToString();
            else
                Response.Redirect("Default.aspx");

            if (Session["AccreditationDepartmentID"] != null)
                lblAccreditationDepartmentID.Text = Session["AccreditationDepartmentID"].ToString();
            else
                Response.Redirect("Default.aspx");

            if (Session["CourseName"] != null)
            {
                lblCourseName.Text = Session["CourseName"].ToString();
                lblCourseName1.Text = Session["CourseName"].ToString();
            }
            else
                Response.Redirect("Default.aspx");
        }

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { txtArActivityName, txtEnActivityName });
        if (Validate)
        {
            DataTable DT = DataAccess.SyllabusActivityAddEdit(lblSyllabusActivityID.Text, lblSyllabusID.Text, txtArActivityName.Text, txtEnActivityName.Text, EmployeeID, lblAccreditationDepartmentID.Text);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { lblSyllabusActivityID, txtArActivityName, txtEnActivityName });
                ListView1.DataBind();
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void lbSyllabusActivityEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("SyllabusActivityID")).Text;
        lblSyllabusActivityID.Text = id;
        DataTable dt = DataAccess.SyllabusActivityGet(lblSyllabusActivityID.Text);
        if (dt.Rows.Count > 0)
        {
            txtArActivityName.Text = dt.Rows[0]["ArActivityName"].ToString();
            txtEnActivityName.Text = dt.Rows[0]["EnActivityName"].ToString();
        }
    }

    protected void lbSyllabusActivityDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("SyllabusActivityID")).Text;
        DataTable DT = DataAccess.SyllabusActivityDelete(id, EmployeeID, lblAccreditationDepartmentID.Text);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }



    protected void lbPrev_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Session["AccreditationDepartmentID"] = lblAccreditationDepartmentID.Text;
        Response.Redirect("SyllabusDetailedDescriptions.aspx");
    }

    protected void lbNext_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Session["AccreditationDepartmentID"] = lblAccreditationDepartmentID.Text;
        Response.Redirect("SyllabusOutcomes.aspx");
    }
}