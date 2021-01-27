using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_StudentVoucherNote : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["ID"] != null && Session["StudentID"] != null)
            {
                lblStudentVoucherID.Text = Session["ID"].ToString();
                Session["ID"] = null;
                lblStudentID.Text = Session["StudentID"].ToString();
                Session["StudentID"] = null;
            }

            else
            {
                Response.Redirect("StudentVoucher.aspx?id=" + lblStudentID.Text);
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        DataTable DT = DataAccess.UpdateVoucherNote(lblStudentVoucherID.Text, txtNote.Text, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }
}