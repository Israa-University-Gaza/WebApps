using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewLibrary_Visitor : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["VisitorID"] != null)
            {
                lblVisitorID.Text = Session["VisitorID"].ToString();
            }
            else
            {
                Response.Redirect("Visitors.aspx");
            }
        }
    }

    protected void btnChechVisitor_Click(object sender, EventArgs e)
    {
        DataTable DT = NewDataAccess.CheckVisitor(txtSSN.Text);
        if (DT.Rows.Count > 0)
        {
            Session["VisitorID"] = DT.Rows[0]["ID"].ToString();
            Response.Redirect("Visitor.aspx");
        }
        else
        {
            ShowToast(this, "رقم هوية الزائر غير صحيح", "", "error");
        }
    }

    protected void lbEditVisitor_Click(object sender, EventArgs e)
    {
        Session["VisitorID"] = lblVisitorID.Text;
        Response.Redirect("VisitorAddEdit.aspx");
    }
}
