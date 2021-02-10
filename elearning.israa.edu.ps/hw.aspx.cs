using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hw : System.Web.UI.Page
{
    eLern r = new eLern();
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt1 = r.std_cours("UNIV3121", "101");

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
            DataList DataList1 = (DataList)e.Row.FindControl("DataList1");
            DataList1.DataBind();
            for (int i = 0; i < DataList1.Items.Count; i++)
            {
                Label id = (Label)DataList1.Items[i].FindControl("id");
                Label grade = (Label)DataList1.Items[i].FindControl("grade");
                SqlDataAdapter DA = new SqlDataAdapter("SELECT        ISNULL(e_HomeWork_answer_answer.grade,0)  grade FROM   e_HomeWork_answer_answer where std_id='" + studentNo.Text + "' and h_id=" + id.Text, conn);
                DataTable DT = new DataTable();
                DA.Fill(DT);
                if (DT.Rows.Count == 0)
                    grade.Text = "0";
                else
                    grade.Text = DT.Rows[0][0].ToString();
            }
        }
      
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}

