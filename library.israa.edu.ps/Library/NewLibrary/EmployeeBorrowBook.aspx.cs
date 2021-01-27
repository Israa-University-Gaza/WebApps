using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class NewLibrary_EmployeeBorrowBook : UserPage
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

    protected void btnChechEmployee_Click(object sender, EventArgs e)
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void lbBorrowBook_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string BookID = ((Label)li.FindControl("BookID")).Text;
        DataTable DT = NewDataAccess.BorrowBook(BookID, lblEmployeeID.Text, "1", UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }
}