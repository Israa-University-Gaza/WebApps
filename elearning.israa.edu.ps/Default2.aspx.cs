using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Default2 : System.Web.UI.Page
{
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = r.coll_lect(DropDownList1.SelectedValue);
       
        GridView1.DataSource = r.RemoveDuplicateRows(dt, "instructorId"); ;
        GridView1.DataBind();
    }
}