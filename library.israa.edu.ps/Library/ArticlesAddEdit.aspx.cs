using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_ArticlesAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["PeriodicID"].ToString() != null)
        {
            Label1.Text = Session["PeriodicID"].ToString();
            DataTable DT = DataAccess.PeriodicDetailsNoGet(Label1.Text);
            name.Text = DT.Rows[0]["BookTitle"].ToString();
            number.Text = DT.Rows[0]["PeriodicNo"].ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { pageNo, Label1, title,author });

        if (Validate)
        {
            if (
            DataAccess.ArticlesAddEdit((Session["Articles_ID"] == null) ? "" : Session["Articles_ID"].ToString(),
            Label1.Text,title.Text,  pageNo.Text,author.Text, UserID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { pageNo, title, author });
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

            if (DataAccess.ArticlesAddEdit(ID, Label1.Text, ((TextBox)ri.FindControl("TextBox1")).Text, ((TextBox)ri.FindControl("TextBox3")).Text, ((TextBox)ri.FindControl("TextBox2")).Text, UserID) > 0)
            {

                ShowToast(this, "تم التعديل بنجاح.", "", "success");
                Repeater1.DataBind();
                ((Button)ri.FindControl("lbEdit")).Text = "تحرير";
            }
            else
                ShowToast(this, "عذرًا , لم يتم الحفظ .", "", "error");
        }

    }
}