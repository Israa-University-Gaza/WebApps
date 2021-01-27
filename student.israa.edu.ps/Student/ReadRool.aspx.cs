using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

public partial class Student_ReadRool : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = DataAccess.IsStudentReadUnRole(StudentID);
        if (dt.Rows[0]["status"].ToString() == "1")
        {
            CheckBox1.Visible = false;
        }
    }


    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.SetIsReadUnRole(CheckBox1.Checked, StudentID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");

    }
}