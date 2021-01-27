using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Academic_StudentMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            UserPage userPage = new UserPage();


            if (Request.QueryString["id"] != null)
            {


                lblStudentID.Text = Request.QueryString["id"].ToString();

            }
            else
                Response.Redirect("~/Academic/Students.aspx");


            var studentid = Convert.ToInt32(lblStudentID.Text);
            DataTable dt = DataAccess.GetStudentInfo(studentid);


            GetStudentAcademicWarningOutPut da = DataAccess.GetStudentAcademicWarning(lblStudentID.Text);
            dt.Rows[0]["AcademicWarning"] = da.AcademicTitle;
            Repeater10.DataSource = dt;
            Repeater10.DataBind();


        }
    }
}