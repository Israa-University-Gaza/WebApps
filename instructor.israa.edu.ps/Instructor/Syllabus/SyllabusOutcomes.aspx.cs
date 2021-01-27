﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_Syllabus_SyllabusOutcomes : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["SyllabusID"] != null)
                lblSyllabusID.Text = Session["SyllabusID"].ToString();
            else
                Response.Redirect("/Instructor/Default");

            if (Session["CourseName"] != null)
                lblCourseName1.Text = lblCourseName2.Text = Session["CourseName"].ToString();
            else
                Response.Redirect("/Instructor/Default");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { txtArOutcome, txtEnOutcome });
        if (Validate)
        {
            DataTable DT = DataAccess.SyllabusOutcomeAddEdit(lblSyllabusOutcomeID.Text, lblSyllabusID.Text, txtArOutcome.Text, txtEnOutcome.Text, EmployeeID);
            ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() == "1") ? "success" : "danger");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { lblSyllabusOutcomeID, txtArOutcome, txtEnOutcome });
                ListView1.DataBind();
            }
        }
        else
        {
            ShowMsg1("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
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
        DataTable DT = DataAccess.SyllabusOutcomeDelete(id, EmployeeID);
        ShowMsg2(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        ListView1.DataBind();
    }

    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-" + status + " alert-top");
        divMsg1.Visible = (msg != "");
    }

    public void ShowMsg2(string msg = "", string status = "warning")
    {
        lblMsg2.Text = msg;
        divMsg2.Attributes.Add("Class", "alert alert-" + status + " alert-top");
        divMsg2.Visible = (msg != "");
    }

    protected void lbPrev_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName1.Text;
        Response.Redirect("SyllabusActivities");
    }

    protected void lbNext_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName1.Text;
        Response.Redirect("SyllabusEvaluation");
    }
}