using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_MCQestion : System.Web.UI.Page
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
                r.MCQestion_add(qes.Text, a.Text, b.Text, c.Text, d.Text, DropDownList1.SelectedValue, DropDownList2.SelectedValue.ToString().Split('.')[0].Split(' ')[0], dt_sec.Rows[i][1].ToString(), DropDownList2.SelectedItem.Text.Split('.')[0].Replace("شعبة", ""), Session["log"].ToString());
                //r.TFQestion_add(qes.Text, RadioButtonList1.SelectedValue, DropDownList2.SelectedValue.ToString().Split('.')[0].Split(' ')[0], dt_sec.Rows[i][1].ToString(), DropDownList2.SelectedItem.Text.Split('.')[0].Replace("شعبة", ""), Session["log"].ToString());
        }
        else
            r.MCQestion_add(qes.Text, a.Text, b.Text, c.Text, d.Text, DropDownList1.SelectedValue, DropDownList2.SelectedValue.ToString().Split('.')[0].Split(' ')[0], DropDownList2.SelectedValue.ToString().Split('.')[1], DropDownList2.SelectedItem.Text.Split('.')[0].Replace("شعبة", ""), Session["log"].ToString());

     GridView1.DataBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (DataBinder.Eval(e.Row.DataItem, "answer") != null)
        {
            string answer = DataBinder.Eval(e.Row.DataItem, "answer").ToString();
            if (answer == "A")
                e.Row.Cells[4].Style.Add(" background-color", "#0ddc11");
            if (answer == "B")
                e.Row.Cells[5].Style.Add(" background-color", "#0ddc11");
            if (answer == "C")
                e.Row.Cells[6].Style.Add(" background-color", "#0ddc11");
            if (answer == "D")
                e.Row.Cells[7].Style.Add(" background-color", "#0ddc11");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Button Button2 = (Button)sender;
        string id = Button2.CommandArgument;
        r.del_qestion(id, "2");
        GridView1.DataBind();
    }
}