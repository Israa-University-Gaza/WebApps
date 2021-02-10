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
        DataTable dt = r.e_crs_OverVeiw_get(Request.QueryString["crs"]);
        //Label1.Text = dt.Rows[0]["title"].ToString();

        det.Text = dt.Rows[0]["det"].ToString();
       
    }
}