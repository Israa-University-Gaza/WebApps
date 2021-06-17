﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_SyllabusOutcomes : UserPage
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
        bool Validate = ValidateControls(new WebControl[] { txtArOutcome, txtEnOutcome });
        if (Validate)
        {
            DataTable DT = DataAccess.SyllabusOutcomeAddEdit(lblSyllabusOutcomeID.Text, lblSyllabusID.Text, txtArOutcome.Text, txtEnOutcome.Text, EmployeeID, lblAccreditationDepartmentID.Text);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { lblSyllabusOutcomeID, txtArOutcome, txtEnOutcome });
                ListView1.DataBind();
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void lbSyllabusOutcomeEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("SyllabusOutcomeID")).Text;
        lblSyllabusOutcomeID.Text = id;
        DataTable dt = DataAccess.SyllabusOutcomeGet(lblSyllabusOutcomeID.Text);
        if (dt.Rows.Count > 0)
        {
            txtArOutcome.Text = dt.Rows[0]["ArOutcome"].ToString();
            txtEnOutcome.Text = dt.Rows[0]["EnOutcome"].ToString();
        }
    }

    protected void lbSyllabusOutcomeDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("SyllabusOutcomeID")).Text;
        DataTable DT = DataAccess.SyllabusOutcomeDelete(id, EmployeeID, lblAccreditationDepartmentID.Text);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }



    protected void lbPrev_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName1.Text;
        Session["AccreditationDepartmentID"] = lblAccreditationDepartmentID.Text;
        Response.Redirect("SyllabusActivities.aspx");
    }

    protected void lbNext_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName1.Text;
        Session["AccreditationDepartmentID"] = lblAccreditationDepartmentID.Text;
        Response.Redirect("SyllabusEvaluation.aspx");
    }
}