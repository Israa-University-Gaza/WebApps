using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_PeriodicDetailsAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["BookID"] != null)
            {
                Label1.Text = Session["BookID"].ToString();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] {PeriodicNo,Label1 ,date});

        if (Validate)
        {
            if (
            DataAccess.PeriodicNoAddEdit("",
            Label1.Text, FolderNo.Text, PeriodicNo.Text, date.Text, UserID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { PeriodicNo, date,FolderNo });
                Repeater1.DataBind();
            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ .", "", "error");
            }
        }
        else
        {
            ShowToast(this, "يرجى تعبئة البيانات المطلوبة .", "", "error");
        }
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {

        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        string ID = ((Label)ri.FindControl("Label2")).Text;
        if (((Button)ri.FindControl("lbEdit")).Text == "تحرير")
        {
            ((TextBox)ri.FindControl("TextBox1")).Enabled = true;
            ((TextBox)ri.FindControl("TextBox2")).Enabled = true;
            ((TextBox)ri.FindControl("TextBox3")).Enabled = true;
            ((Button)ri.FindControl("lbEdit")).Text = "حفظ";
        }
        else if (((Button)ri.FindControl("lbEdit")).Text == "حفظ")
        {
           
                if (DataAccess.PeriodicNoAddEdit(ID, Label1.Text, ((TextBox)ri.FindControl("TextBox1")).Text, ((TextBox)ri.FindControl("TextBox2")).Text, ((TextBox)ri.FindControl("TextBox3")).Text,  UserID) > 0)
            {

                ShowToast(this, "تم التعديل بنجاح.", "", "success");
                Repeater1.DataBind();
                ((Button)ri.FindControl("lbEdit")).Text = "تحرير";
            }
            else
                ShowToast(this, "عذرًا , لم يتم الحفظ .", "", "error");
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((Button)sender).Parent;
        Session["PeriodicID"] = ((Label)ri.FindControl("Label2")).Text;
        Response.Redirect("ArticlesAddEdit.aspx");
    }
}