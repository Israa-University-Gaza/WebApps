using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


public partial class Instructor_Std : System.Web.UI.Page
{
    eLern r = new eLern();
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)
            Response.Redirect("../Login.aspx");


        if(!IsPostBack)
        {

            SqlDataAdapter DA1 = new SqlDataAdapter("SELECT       top 1  semester_id FROM            e_semester", conn);
            DataTable DT1 = new DataTable();
            DA1.Fill(DT1);



      

            DataTable dt = r.lec_COURS(Session["log"].ToString(), DT1.Rows[0][0].ToString());
            DropDownList2.DataSource = dt;
        DropDownList2.DataValueField = "courseCode+sectionNum";
        DropDownList2.DataTextField = "courseArName+sectionNum";
        DropDownList2.DataBind();

        }

      

      
       



    }
    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        System.Web.UI.HtmlControls.HtmlImage img1 = (System.Web.UI.HtmlControls.HtmlImage)e.Item.FindControl("img1");
        //System.Web.UI.HtmlControls.HtmlGenericControl mas = new System.Web.UI.HtmlControls.HtmlGenericControl();
        //System.Web.UI.HtmlControls.HtmlGenericControl Done = new System.Web.UI.HtmlControls.HtmlGenericControl();
        //Done.Attributes.Add("Visible", "false");
       
        DataTable dt = r.std_data(DataBinder.Eval(e.Item.DataItem, "id").ToString());

        img1.Src = "data:image/png;base64," + dt.Rows[0]["studentImage"].ToString();

    }
    protected void DropDownList2_DataBound(object sender, EventArgs e)
    {
        DropDownList2.Items.Insert(0, new ListItem("اختر", "-1"));
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "<script type='text/JavaScript'>window.close();</script>");

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       // Response.Redirect("Default.aspx");
        Button Button1 = (Button)sender;
        TextBox title2 =   (TextBox)Repeater1.Items[Convert.ToInt32(Button1.CommandArgument) - 1].FindControl("title2");
        TextBox Editor2 = (TextBox)Repeater1.Items[Convert.ToInt32(Button1.CommandArgument) - 1].FindControl("Editor2");
        Label to_id=        (Label)Repeater1.Items[Convert.ToInt32(Button1.CommandArgument) - 1].FindControl("to_id");
        Label to_name =     (Label)Repeater1.Items[Convert.ToInt32(Button1.CommandArgument) - 1].FindControl("to_name");

        r.e_masseges_add(Session["log"].ToString(), Session["name"].ToString(), title2.Text, Editor2.Text, to_id.Text, to_name.Text);
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "<script type='text/JavaScript'>window.close();</script>");

     
        // mas.Visible = false;
        // Done.Visible = true;
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

        DataTable dt1 = r.std_cours(DropDownList2.SelectedValue.ToString().Split('.')[0].Split(' ')[0], DropDownList2.SelectedValue.ToString().Split('.')[1]);

        Repeater1.DataSource = dt1;
        Repeater1.DataBind();
    }
}
