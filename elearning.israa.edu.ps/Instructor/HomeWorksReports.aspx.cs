using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_HomeWorksReports : System.Web.UI.Page
{
    eLern r = new eLern();
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt1 = r.std_cours(Request.QueryString["crs"], Request.QueryString["section"]);

        GridView1.DataSource = dt1;
        GridView1.DataBind();
    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {


    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.FindControl("DataList1") != null)
        {
            Label studentNo = (Label)e.Row.FindControl("studentNo");
 Label Label3 = (Label)e.Row.FindControl("Label3");
            Label Label4 = (Label)e.Row.FindControl("Label4");
            DataList DataList1 = (DataList)e.Row.FindControl("DataList1");
            DataList1.DataBind();
            int h_no=0;
            int marks = 0;
            float avg = 0;
            for (int i = 0; i < DataList1.Items.Count; i++)
            {
                h_no = h_no + 1;
                Label id = (Label)DataList1.Items[i].FindControl("id");
                Label grade = (Label)DataList1.Items[i].FindControl("grade");
                SqlDataAdapter DA = new SqlDataAdapter("SELECT     grade FROM   e_HomeWork_answer_answer where std_id='" + studentNo.Text + "' and h_id=" + id.Text, conn);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                if (DT.Rows.Count == 0)
                {
                    grade.Text = "0";
                    marks = marks + 0;
                    grade.ForeColor = System.Drawing.Color.Red;
                }

                else
                {
                    if(DT.Rows[0][0].ToString()=="NULL" || DT.Rows[0][0].ToString() == "")
                    {
                        grade.Text = "0";
                        grade.ForeColor = System.Drawing.Color.Brown;
                    }
                    else
                    {
                        grade.Text = DT.Rows[0][0].ToString();
                        marks = marks + Convert.ToInt32(DT.Rows[0][0]);
                    }
                    
                }
                   
            }
             avg = (float)marks / (float)h_no;
            Label3.Text = avg.ToString("0.00");
            Label4.Text = marks.ToString();
        }

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        string crs = r.get_crs_name(Request.QueryString["crs"]);
        Response.Clear();
        //Response.AddHeader("content-disposition", "attachment;filename=Elearning" + DateTime.Now.ToString("dd-MM-yyyy") + ".xls");
        Response.AddHeader("content-disposition", "attachment;filename=Elearning" + crs + ".xls");
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
       // GridView1.Columns[GridView1.Columns.Count - 1].Visible = false;
        GridView1.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
    }
   

    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
   
    }
    public override void VerifyRenderingInServerForm(Control control)
    {

    }
}