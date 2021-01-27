using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_Transaction : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCkeckStudent_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.CheckStudent(txtStudentNo.Text);
        if (DT.Rows.Count > 0)
        {
            lblStudentID.Text = DT.Rows[0]["StudentID"].ToString();
            lblMsg.Text = DT.Rows[0]["StudentName"].ToString();
            divFinancial.Visible = true;
        }
        else
        {
            lblMsg.Text = "رقم الطالب غير صحيح";
            divFinancial.Visible = false;
        }
        divMsg.Visible = true;
    }
}