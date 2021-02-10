using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_Exam : System.Web.UI.Page
{
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)
            Response.Redirect("../Login.aspx");
        if (!IsPostBack)
        {
            Done.Visible = false;
            exam.Visible = true;
            DataTable dt = r.lec_COURS(Session["log"].ToString());
            DropDownList2.DataSource = dt;
            DropDownList2.DataValueField = "courseCode+sectionNum";
            DropDownList2.DataTextField = "courseArName+sectionNum";
            DropDownList2.DataBind();
        }
        }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //DateTime start = DateTime.Parse(Request.Form[deadline.UniqueID]);

       // DateTime start = DateTime.ParseExact(Request.Form[deadline.UniqueID], "dd-MM-yyyy", new CultureInfo("en-CA"));
        if (CheckBox1.Checked)
        {

            DataTable dt_sec = new DataTable();
            dt_sec = r.lec_section(Session["log"].ToString(), DropDownList2.SelectedValue.ToString().Split('.')[0].Split(' ')[0]);
            for (int i = 0; i < dt_sec.Rows.Count; i++)
            {
                r.e_exams_add(tit.Text, DropDownList2.SelectedValue.ToString().Split('.')[0].Split(' ')[0], DropDownList1.SelectedValue, "", Editor1.Text, 
                    dt_sec.Rows[i][1].ToString(), CheckBox1.Checked.ToString(), Session["log"].ToString(), DropDownList2.SelectedItem.Text.Split('.')[0].Replace("شعبة", ""),link.Text,pass.Text);
                Done.Visible = true;
                exam.Visible = false;
            }

        }
        else
        {
            r.e_exams_add(tit.Text, DropDownList2.SelectedValue.ToString().Split('.')[0].Split(' ')[0], DropDownList1.SelectedValue, "", Editor1.Text, DropDownList2.SelectedValue.ToString().Split('.')[1], CheckBox1.Checked.ToString(), Session["log"].ToString(), DropDownList2.SelectedItem.Text.Split('.')[0].Replace("شعبة", ""),link.Text,pass.Text);
            Done.Visible = true;
            exam.Visible = false;
        }


    }
}