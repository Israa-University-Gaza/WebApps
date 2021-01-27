using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_Question : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("QuestionID")).Text;

        if (DataAccess.QuestionActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowMsg1("تمت العملية بنجاح.", "success");
            ListView1.DataBind();
        }
        else
        {
            ShowMsg1("عذرًا , لم تتم العملية.", "error");
        }
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("QuestionID")).Text;
        string LanguageID = ((Label)item.FindControl("LanguageID")).Text;
        Session["QuestionID"] = id;
        Response.Redirect("QuestionAddEdit" + ((LanguageID == "1") ? "" : "En") + "");
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("QuestionID")).Text;

        if (DataAccess.QuestionDelete(id, EmployeeID) > 0)
        {
            ShowMsg1("تم الحذف بنجاح.", "success");
            ListView1.DataBind();
        }
        else
        {
            ShowMsg1("عذرًا , لم تتم الحذف.", "error");
        }
    }

    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-dismissable alert-top alert-" + status);
        divMsg1.Visible = (msg != "");
    }
}