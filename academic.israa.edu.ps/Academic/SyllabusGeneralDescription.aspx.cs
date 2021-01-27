using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_SyllabusGeneralDescription : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["SyllabusID"] != null)
            {
                lblAccreditationDepartmentID.Text = Session["AccreditationDepartmentID"].ToString();
                lblSyllabusID.Text = Session["SyllabusID"].ToString();
                DataTable DT = DataAccess.SyllabusGet(lblSyllabusID.Text);
                if (DT.Rows.Count > 0)
                {
                    Session["CourseName"] = DT.Rows[0]["CourseName"].ToString();
                    lblCourseName.Text = DT.Rows[0]["CourseName"].ToString();
                    txtArGeneralDescription.Text = DT.Rows[0]["ArGeneralDescription"].ToString();
                    txtEnGeneralDescription.Text = DT.Rows[0]["EnGeneralDescription"].ToString();
                }
            }
            else
                Response.Redirect("Default.aspx");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtArGeneralDescription, txtEnGeneralDescription }))
        {
            DataTable DT = DataAccess.SyllabusGeneralDescriptionUpdate(lblSyllabusID.Text, txtArGeneralDescription.Text, txtEnGeneralDescription.Text, EmployeeID, lblAccreditationDepartmentID.Text);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void lbNext_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Session["AccreditationDepartmentID"] = lblAccreditationDepartmentID.Text;
        Response.Redirect("SyllabusGoals.aspx");
    }
}