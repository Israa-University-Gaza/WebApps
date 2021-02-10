using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Det : System.Web.UI.Page
{
    Marq m = new Marq();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt = m.EnJAZ_GetAll_EnJAZ_ads_byID(Convert.ToInt32(Request.QueryString["id"]));
        title1.Text = title.Text = dt.Rows[0]["title"].ToString();
        bady2.Text = bady1.Text = dt.Rows[0]["det"].ToString();
        dt1.Text=dt11.Text= dt.Rows[0]["DateEntered"].ToString().Split(' ')[0];
    }
}