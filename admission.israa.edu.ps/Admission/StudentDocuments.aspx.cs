using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StudentDocuments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString["ID"]!= null)
        {
            lblStdDocumentID.Text = Request.QueryString["ID"].ToString();
        }
        else
        {
            Response.Redirect("StudentDocumentStatistic.aspx");
        }
    }
}