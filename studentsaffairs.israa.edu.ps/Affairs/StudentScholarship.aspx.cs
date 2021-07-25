using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StudentScholarship : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblEmployeeID.Text = EmployeeID;
        if (!IsPostBack)
        {
            //try
            //{
                if (Session["StudentID"].ToString() != null)
                {
                    DataTable DT2 = DataAccess.GetStudentData(Session["StudentID"].ToString().ToString());
                    //lblStdStatusID.Text = DT2.Rows[0]["StdStatusID"].ToString();
                    lblStudentID.Text = Session["StudentID"].ToString().ToString();

                }
                else
                    Response.Redirect("~/Affairs/Students.aspx");
            //}
            //catch (Exception ex)
            //{
            //    Response.Redirect("~/Affairs/Students.aspx");
            //}
        }
        else if (lblStudentID.Text == "")
        {
            Response.Redirect("~/Affairs/Students.aspx");
        }
    }


}