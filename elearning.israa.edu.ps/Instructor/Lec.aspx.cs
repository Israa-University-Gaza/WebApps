using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    eLern r = new eLern();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Response.Redirect("login.aspx");
        DataTable dt = r.coll_lect(DropDownList1.SelectedValue);

        Repeater.DataSource = r.RemoveDuplicateRows(dt, "employeeNo"); ;
        Repeater.DataBind();

    }

    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        string last = DataBinder.Eval(e.Item.DataItem, "lastLogin").ToString();
        HyperLink HyperLink4 = (HyperLink)e.Item.FindControl("HyperLink4");
       
        HyperLink4.NavigateUrl = "createSession.aspx?id=" + DataBinder.Eval(e.Item.DataItem, "employeeNo").ToString()+"&name=ك--"+ DataBinder.Eval(e.Item.DataItem, "instructor").ToString()+ "&last_log=no&session="+ Guid.NewGuid();
        Label lastl = (Label)e.Item.FindControl("last");
        if (last.Contains("لم"))
            lastl.ForeColor = System.Drawing.Color.Red;

    }
}
