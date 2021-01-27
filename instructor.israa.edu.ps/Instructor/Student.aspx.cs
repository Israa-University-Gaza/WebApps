using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_Student : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                lblStudentID.Text = Request.QueryString["id"];
                try
                {
                    DataTable DT = DataAccess.StudentImageGet(lblStudentID.Text);
                    if (!(DT.Rows.Count > 0))
                        Response.Redirect("~/Instructor/Default");
                }
                catch (Exception ex)
                {
                    Response.Redirect("~/Instructor/Default");
                }
            }
            else
                Response.Redirect("~/Instructor/Default");
        }
        else if (lblStudentID.Text == "")
        {
            Response.Redirect("~/Instructor/Default");
        }
    }
}