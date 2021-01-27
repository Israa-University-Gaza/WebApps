using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewLibrary_Employee : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["EmployeeID"] != null)
            {
                lblEmployeeID.Text = Session["EmployeeID"].ToString();
                DataTable DT = NewDataAccess.EmployeePhoto_Get(lblEmployeeID.Text);
                if (DT.Rows.Count > 0)
                {
                    if (!Convert.IsDBNull(DT.Rows[0]["Emp_Picture"]))
                    {
                        byte[] imgBytes = (byte[])DT.Rows[0]["Emp_Picture"];
                        string imgString = Convert.ToBase64String(imgBytes);
                        image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                    }
                }
            }
            else
            {
                Response.Redirect("Employees.aspx");
            }
        }
    }

    protected void btnEmployeeSearch_Click(object sender, EventArgs e)
    {
        DataTable DT = NewDataAccess.CheckEmployee(txtEmployeeNo.Text);
        if (DT.Rows.Count > 0)
        {
            Session["EmployeeID"] = DT.Rows[0]["EmployeeID"].ToString();
            Response.Redirect("Employee.aspx");
        }
        else
        {
            ShowToast(this, "رقم الموظف غير صحيح", "", "error");
        }
    }
}