using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Students_HomeworkReport : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"] + "");
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Unnamed1_RowDataBound(object sender, GridViewRowEventArgs e)

    {
        if(DataBinder.Eval(e.Row.DataItem, "id")!=null)
        {

       
        Label grade = (Label)e.Row.FindControl("stat");
        string id = DataBinder.Eval(e.Row.DataItem, "id").ToString();
        SqlDataAdapter DA = new SqlDataAdapter("SELECT     grade FROM   e_HomeWork_answer_answer where std_id='" + Session["log"] + "' and h_id=" + id, conn);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        if (DT.Rows.Count == 0)
        {
            grade.Text = "لم يتم التسليم";
            grade.ForeColor = System.Drawing.Color.Red;
        }

        else
        {
            if (DT.Rows[0][0].ToString() == "NULL" || DT.Rows[0][0].ToString() == "")
            {
                grade.Text = "في انتظار التقييم";
                grade.ForeColor = System.Drawing.Color.Brown;
            }
            else
            {
              
                    grade.Text = DT.Rows[0][0].ToString();
                    grade.ForeColor = System.Drawing.Color.Brown;
                    grade.Font.Bold = true;
                }

        }
    }
    }
}