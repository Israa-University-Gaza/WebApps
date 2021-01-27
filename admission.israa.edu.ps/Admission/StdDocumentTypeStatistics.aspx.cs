using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Admission_StdDocumentTypeStatistics : UserPage

{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            ddlStdDocumentType.DataBind();
            ddlStdDocumentType.Items.Insert(0, new ListItem("الكل", "-1"));
        }
    }


    protected void DataBind_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}