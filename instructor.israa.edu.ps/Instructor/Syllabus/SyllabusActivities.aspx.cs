using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_Syllabus_SyllabusActivities : UserPage
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
                lblCourseName.Text = Session["CourseName"].ToString();
            else
                Response.Redirect("/Instructor/Default");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { txtArActivityName, txtEnActivityName });
        if (Validate)
        {
            DataTable DT = DataAccess.SyllabusActivityAddEdit(lblSyllabusActivityID.Text, lblSyllabusID.Text, txtArActivityName.Text, txtEnActivityName.Text, EmployeeID);
            ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() == "1") ? "success" : "danger");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { lblSyllabusActivityID, txtArActivityName, txtEnActivityName });
                ListView1.DataBind();
            }
        }
        else
        {
            ShowMsg1("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
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
        DataTable DT = DataAccess.SyllabusActivityDelete(id, EmployeeID);
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
        Session["CourseName"] = lblCourseName.Text;
        Response.Redirect("SyllabusDetailedDescriptions");
    }

    protected void lbNext_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Response.Redirect("SyllabusOutcomes");
    }
}