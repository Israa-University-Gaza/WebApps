using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_Syllabus_SyllabusBookReference : UserPage
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

    protected void btnSyllabusBookSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtSyllabusBook }))
        {
            DataTable DT = DataAccess.SyllabusBookAddEdit(lblSyllabusBookID.Text, lblSyllabusID.Text, txtSyllabusBook.Text, EmployeeID);
            ListView1.DataBind();
            EmptyControls(new WebControl[] { lblSyllabusBookID, txtSyllabusBook });
            ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() == "1") ? "success" : "danger");
        }
        else
        {
            ShowMsg1("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
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
        DataTable DT = DataAccess.SyllabusBookDelete(id, EmployeeID);
        ShowMsg2(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        ListView1.DataBind();
    }

    protected void btnSyllabusReferenceSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtSyllabusReference }))
        {
            DataTable DT = DataAccess.SyllabusReferenceAddEdit(lblSyllabusReferenceID.Text, lblSyllabusID.Text, txtSyllabusReference.Text, EmployeeID);
            ListView2.DataBind();
            EmptyControls(new WebControl[] { lblSyllabusReferenceID, txtSyllabusReference });
            ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() == "1") ? "success" : "danger");
        }
        else
        {
            ShowMsg1("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
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
        DataTable DT = DataAccess.SyllabusReferenceDelete(id, EmployeeID);
        ShowMsg3(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
        ListView2.DataBind();
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

    public void ShowMsg3(string msg = "", string status = "warning")
    {
        lblMsg3.Text = msg;
        divMsg3.Attributes.Add("Class", "alert alert-" + status + " alert-top");
        divMsg3.Visible = (msg != "");
    }

    protected void lbPrev_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Response.Redirect("SyllabusGoals");
    }

    protected void lbNext_Click(object sender, EventArgs e)
    {
        Session["SyllabusID"] = lblSyllabusID.Text;
        Session["CourseName"] = lblCourseName.Text;
        Response.Redirect("SyllabusDetailedDescriptions");
    }
}