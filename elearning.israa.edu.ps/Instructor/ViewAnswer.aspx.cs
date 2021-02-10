using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Instructor_ViewAnswer : System.Web.UI.Page
{
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = r.e_HomeWork_answer_answer_get1(Request.QueryString["id"]);
        det.Text = dt.Rows[0]["det"].ToString() ;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        r.e_HomeWork_answer_answer_GRADE(Request.QueryString["id"], TextBox1.Text);
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "<script type='text/JavaScript'>window.close();</script>");

    }
}