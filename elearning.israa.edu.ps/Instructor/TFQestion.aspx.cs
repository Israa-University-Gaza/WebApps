using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_TFQestion : System.Web.UI.Page
{
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)
            Response.Redirect("../Login.aspx");
        if (!IsPostBack)
        {


            DataTable dt = r.lec_COURS(Session["log"].ToString());
            DropDownList2.DataSource = dt;
            DropDownList2.DataValueField = "courseCode+sectionNum";
            DropDownList2.DataTextField = "courseArName+sectionNum";
            DropDownList2.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (CheckBox1.Checked)
        {

            DataTable dt_sec = new DataTable();
            dt_sec = r.lec_section(Session["log"].ToString(), DropDownList2.SelectedValue.ToString().Split('.')[0].Split(' ')[0]);
            for (int i = 0; i < dt_sec.Rows.Count; i++)
                r.TFQestion_add(qes.Text, RadioButtonList1.SelectedValue, DropDownList2.SelectedValue.ToString().Split('.')[0].Split(' ')[0], dt_sec.Rows[i][1].ToString(),DropDownList2.SelectedItem.Text.Split('.')[0].Replace("شعبة",""),Session["log"].ToString());
        }
        else
            r.TFQestion_add(qes.Text, RadioButtonList1.SelectedValue, DropDownList2.SelectedValue.ToString().Split('.')[0].Split(' ')[0], DropDownList2.SelectedValue.ToString().Split('.')[1], DropDownList2.SelectedItem.Text.Split('.')[0].Replace("شعبة", ""), Session["log"].ToString());
        GridView1.DataBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.FindControl("Image1") != null)
        {
            Image Image1 = (Image)e.Row.FindControl("Image1");
            Boolean answer = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "answer"));
            if (answer)
                Image1.ImageUrl = "~/assets/truee.png";
            else
                Image1.ImageUrl = "~/assets/false.png";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Button Button2 = (Button)sender;
        string id = Button2.CommandArgument;
        r.del_qestion(id, "1");
        GridView1.DataBind();
    }
}