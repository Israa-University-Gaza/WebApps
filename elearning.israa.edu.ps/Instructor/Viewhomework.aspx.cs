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
        DataTable dt =r.e_homework_get1(Request.QueryString["id"]);
        if (!IsPostBack)
        {
            Repeater.DataSource = r.comments_get(Request.QueryString["id"], "how");
            Repeater.DataBind();
        }

        det.Text = dt.Rows[0]["det"].ToString();
        if (dt.Rows[0]["file_att"].ToString() == "")
            HyperLink1.Visible = false;
        HyperLink1.NavigateUrl= "~/Filess/" + dt.Rows[0]["file_att"].ToString();
        mark.Text = mark1.Text = dt.Rows[0]["mark"].ToString();
        DateTime dob = DateTime.Parse(dt.Rows[0]["d"].ToString().Replace('?',' '));
        Label1.Text = dob.ToString("dd/MM/yyyy");
        Label2.Text = dob.ToString("HH:mm"); 
        if (dob>DateTime.Now)
        {
            open.Visible = true;
            close.Visible = false;
        }
        else
        {
            open.Visible = false;
            close.Visible = true;
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button Button1 = (Button)sender;
        string id = Button1.CommandArgument;
        Response.Redirect("'javascript:openDetailsWindow("+id+",1)'");
       // window.open('BookDet.aspx?No=' + serNo, '', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=600,height=520');

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(DataBinder.Eval(e.Row.DataItem, "file_dir")!=null)
        {

        
        HyperLink HyperLink2 = (HyperLink)e.Row.FindControl("HyperLink2");
        if (DataBinder.Eval(e.Row.DataItem, "file_dir").ToString() == "")
            HyperLink2.Visible = false;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        r.e_comments_add(Session["log"].ToString(), Session["name"].ToString(), Editor1.Text, Request.QueryString["id"], "how");
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
     
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {

        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=Elearning" + DateTime.Now.ToString("dd-MM-yyyy") + ".xls");
        Response.Charset = "";
        GridView1.AllowSorting = false;
        GridView1.HeaderStyle.BackColor = System.Drawing.Color.Wheat;
        GridView1.HeaderStyle.ForeColor = System.Drawing.Color.Black;
        // If you want the option to open the Excel file without saving then
        // comment out the line below
        // Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.xls";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
        //GridView1.Columns[13].Visible = false;
        GridView1.Columns[GridView1.Columns.Count - 1].Visible = false;
        GridView1.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {

    }
}