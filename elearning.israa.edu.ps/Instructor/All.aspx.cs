using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Instructor_All : System.Web.UI.Page
{
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataSource = r.all_lect();
            GridView1.DataBind();
        }
    }

    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        
    }


    protected void GridView1_Sorting1(object sender, GridViewSortEventArgs e)
    {
        //Retrieve the table from the session object.
        DataTable dt = r.all_lect() as DataTable;

        if (dt != null)
        {

            //Sort the data.
            dt.DefaultView.Sort = e.SortExpression;
            GridView1.DataSource = dt.DefaultView;
            GridView1.DataBind();
        }
    }
}