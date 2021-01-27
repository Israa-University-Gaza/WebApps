using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_StudentsBalances : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlStudentStatus.DataBind();
            ddlStudentStatus.Items.Insert(0, new ListItem("الكل", "-1"));

        }
    }
}