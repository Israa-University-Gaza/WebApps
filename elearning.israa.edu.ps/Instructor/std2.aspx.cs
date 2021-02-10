using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_std2 : System.Web.UI.Page
{
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {


        DataTable dt = r.std_cours(Request.QueryString["crs"]);

        Repeater1.DataSource = dt;
        Repeater1.DataBind();
    }
    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        System.Web.UI.HtmlControls.HtmlImage img1 = (System.Web.UI.HtmlControls.HtmlImage)e.Item.FindControl("img1");
        DataTable dt = r.std_data(DataBinder.Eval(e.Item.DataItem, "id").ToString());

        img1.Src = "data:image/png;base64," + dt.Rows[0]["studentImage"].ToString();

    }
}