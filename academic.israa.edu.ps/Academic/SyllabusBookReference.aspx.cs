using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_SyllabusBookReference : UserPage
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
                lblCourseName2.Text = Session["CourseName"].ToString();
            }
            else
                Response.Redirect("Default.aspx");

        }
    }

    protected void lbSyllabusBookEdit_Click(object sender, EventArgs e)
    {
        ListViewItem item = (ListViewItem)((LinkButton)sender).Parent;
        lblSyllabusBookID.Text = ((Label)item.FindControl("SyllabusBookID")).Text;
        txtSyllabusBook.Text = ((Label)item.FindControl("lblSyllabusBook")).Text;
    }

    protected void lbSyllabusBookDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("SyllabusBookID")).Text;
        DataTable DT = DataAccess.SyllabusBookDelete(id, EmployeeID, lblAccreditationDepartmentID.Text);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void btnSyllabusBookSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtSyllabusBook }))
        {
            DataTable DT = DataAccess.SyllabusBookAddEdit(lblSyllabusBookID.Text, lblSyllabusID.Text, txtSyllabusBook.Text, EmployeeID, lblAccreditationDepartmentID.Text);
            ListView1.DataBind();
            EmptyControls(new WebControl[] { lblSyllabusBookID, txtSyllabusBook });
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }
    protected void lbSyllabusReferenceEdit_Click(object sender, EventArgs e)
    {
        ListViewItem item = (ListViewItem)((LinkButton)sender).Parent;
        lblSyllabusReferenceID.Text = ((Label)item.FindControl("SyllabusReferenceID")).Text;
        txtSyllabusReference.Text = ((Label)item.FindControl("lblSyllabusReference")).Text;
    }

    protected void lbSyllabusReferenceDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("SyllabusReferenceID")).Text;
        DataTable DT = DataAccess.SyllabusReferenceDelete(id, EmployeeID, lblAccreditationDepartmentID.Text);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView2.DataBind();
    }
    protected void btnSyllabusReferenceSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtSyllabusReference }))
        {
            DataTable DT = DataAccess.SyllabusReferenceAddEdit(lblSyllabusReferenceID.Text, lblSyllabusID.Text, txtSyllabusReference.Text, EmployeeID, lblAccreditationDepartmentID.Text);
            ListView2.DataBind();
            EmptyControls(new WebControl[] { lblSyllabusReferenceID, txtSyllabusReference });
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void lbPrev_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Session["AccreditationDepartmentID"] = lblAccreditationDepartmentID.Text;
        Response.Redirect("SyllabusGoals.aspx");
    }

    protected void lbNext_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Session["AccreditationDepartmentID"] = lblAccreditationDepartmentID.Text;
        Response.Redirect("SyllabusDetailedDescriptions.aspx");
    }



}