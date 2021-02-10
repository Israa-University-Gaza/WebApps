using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_ViewAnnouncements : System.Web.UI.Page
{
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {
        Done.Visible = false;
        r.seen_Re(Session["log"].ToString(), Session["name"].ToString(), "how", Request.QueryString["id"]);
        if (Session["log"] == null)
            Response.Redirect("../login.aspx");

        if (!IsPostBack)
        {
            er.Visible = false;
        }
            DataTable dt = r.e_homework_get1(Request.QueryString["id"]);
        if (dt.Rows[0]["file_att"].ToString() == "")
            HyperLink1.Visible = false;
        HyperLink1.NavigateUrl = "~/Filess/" + dt.Rows[0]["file_att"].ToString();


        DataTable dt_answer = r.e_HomeWork_answer_answer_get(Request.QueryString["id"], Session["log"].ToString());
        if (!IsPostBack)
        {
            if (dt_answer.Rows.Count > 0)
            {

                stat.Text = "تم التسليم";
                dt_deliv.Text = dt_answer.Rows[0]["EnterDate"].ToString();
                dt_edit.Text = dt_answer.Rows[0]["EditDate"].ToString();
                Editor2.Text = dt_answer.Rows[0]["det"].ToString();
                if (dt_answer.Rows[0]["grade"].ToString() != "")
                {
                    stat.Text = " تم التقييم  " + dt_answer.Rows[0]["grade"].ToString();
                    stat.ForeColor = System.Drawing.Color.Red;
                    Editor2.Enabled = false;
                    Button1.Visible = false;
                    edit.Visible = true;
                    edit1.Visible = true;
                }
                else
                {
                    edit.Visible = false;
                    edit1.Visible = false;
                }


            }
            else
            {
edit.Visible = false;
                edit1.Visible = false;
            }
            

        }
        det.Text = dt.Rows[0]["det"].ToString();
        DateTime dob = DateTime.Parse(dt.Rows[0]["d"].ToString().Replace('?', ' '));
        Label1.Text = dob.ToString("dd/MM/yyyy");
        Label2.Text = dob.ToString("HH:mm");
        if (dob > DateTime.Now)
        {
            open.Visible = true;
            close.Visible = false;
        }
        else
        {
            open.Visible = false;
            close.Visible = true;
            Button1.Visible = false;
            Editor2.Enabled = false;
        }
        if (!IsPostBack)
        {
            Repeater.DataSource = r.comments_get(Request.QueryString["id"], "how");
            Repeater.DataBind();
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string image = "";
        if (FileUpload1.HasFile)
        {
            string[] fname = FileUpload1.FileName.Split('.');
            string ext = fname[fname.Length - 1];
            if (ext.ToLower().Equals("ppt") || ext.ToLower().Equals("pptx") || ext.ToLower().Equals("pdf") || ext.ToLower().Equals("doc") || ext.ToLower().Equals("docx") || ext.ToLower().Equals("xls") || ext.ToLower().Equals("xlsx") || ext.ToLower().Equals("jpg") || ext.ToLower().Equals("jpeg") || ext.ToLower().Equals("png"))
            {
                if (FileUpload1.PostedFile.ContentLength <= 5242880)
                {
                    string newname = DateTime.Now.Ticks.ToString() + "." + ext;
                    image = newname;
                    FileUpload1.SaveAs(Request.PhysicalApplicationPath + "Filess/" + image);
                    r.e_HomeWork_answer_answer_add(Request.QueryString["id"], Session["log"].ToString(), Session["name"].ToString(), Editor2.Text,image);
                    homework.Visible = false;
                    Done.Visible = true;
                   // Response.Redirect("Default.aspx");
                }
                else
                {
                    er.Visible = true;
                    ertxt.InnerText = "اقصى حجم 5 ميجا";
                }
            }
            else
            {
                er.Visible = true;
                ertxt.InnerText = "امتداد غير صالح";
            }
        }
        else
        {
            r.e_HomeWork_answer_answer_add(Request.QueryString["id"], Session["log"].ToString(), Session["name"].ToString(), Editor2.Text, "");
            homework.Visible = false;
            Done.Visible = true;

            //Response.Redirect("Default.aspx");

        }




    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        r.e_comments_add(Session["log"].ToString(), Session["name"].ToString(), Editor2.Text, Request.QueryString["id"], "how");
        Response.Redirect("Viewhomework.aspx?id=" + Request.QueryString["id"]);
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButton1 = (ImageButton)sender;
        string id = ImageButton1.CommandArgument;
        r.comments_del(id);
        Response.Redirect("Viewhomework.aspx?id=" + Request.QueryString["id"]);

    }

    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        ImageButton ImageButton1 = (ImageButton)e.Item.FindControl("ImageButton1");
        string who = DataBinder.Eval(e.Item.DataItem, "std_id").ToString();
        if (who == Session["log"].ToString())
            ImageButton1.Visible = true;
        else
            ImageButton1.Visible = false;

    }
}