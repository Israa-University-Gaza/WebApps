using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_PeriodicBookSurvay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //Required to verify that the control is rendered properly on page
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string FileName = "PeriodicBookSurvay.doc";
        mygrid.AllowPaging = false;
        mygrid.DataSourceID = "SqlDataSource1";
        mygrid.DataBind();

        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";

        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/msword";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        mygrid.GridLines = GridLines.Both;
        mygrid.HeaderStyle.Font.Bold = true;
        mygrid.Attributes.CssStyle.Add("font-size", "12px");
        mygrid.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();
    }
}