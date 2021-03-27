using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_RefusalStudent :UserPage
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
        }
    }


    protected void btnRefusalStudent_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.RefusalStudent(lblStudentID.Text, txtRefusalNotes.Text, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");

    }



}