using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_SyllabusDetailedDescriptions : UserPage
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
        bool Validate = ValidateControls(new WebControl[] { txtWeekName, txtArUnitName, txtEnUnitName });
        if (Validate)
        {
            DataTable DT = DataAccess.SyllabusDetailedDescriptionAddEdit(lblSyllabusDetailedDescriptionID.Text, lblSyllabusID.Text, txtWeekName.Text, txtArUnitName.Text, txtEnUnitName.Text, EmployeeID, lblAccreditationDepartmentID.Text);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { lblSyllabusDetailedDescriptionID, txtWeekName, txtArUnitName, txtEnUnitName });
                ListView1.DataBind();
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void lbSyllabusDetailedDescriptionEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("SyllabusDetailedDescriptionID")).Text;
        lblSyllabusDetailedDescriptionID.Text = id;
        DataTable dt = DataAccess.SyllabusDetailedDescriptionGet(lblSyllabusDetailedDescriptionID.Text);
        if (dt.Rows.Count > 0)
        {
            txtWeekName.Text = dt.Rows[0]["WeekName"].ToString();
            txtArUnitName.Text = dt.Rows[0]["ArUnitName"].ToString();
            txtEnUnitName.Text = dt.Rows[0]["EnUnitName"].ToString();
        }
    }

    protected void lbSyllabusDetailedDescriptionDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("SyllabusDetailedDescriptionID")).Text;
        DataTable DT = DataAccess.SyllabusDetailedDescriptionDelete(id, EmployeeID, lblAccreditationDepartmentID.Text);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }



    protected void lbPrev_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Session["AccreditationDepartmentID"] = lblAccreditationDepartmentID.Text;
        Response.Redirect("SyllabusBookReference.aspx");
    }

    protected void lbNext_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Session["AccreditationDepartmentID"] = lblAccreditationDepartmentID.Text;
        Response.Redirect("SyllabusActivities.aspx");
    }
}