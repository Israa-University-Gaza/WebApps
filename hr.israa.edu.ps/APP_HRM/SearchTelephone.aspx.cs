using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class SearchTelephone : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Edit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("ID")).Text;
        Session["TelephoneID"] = id;
        Response.Redirect("AddTelephone.aspx");
    }
    protected void Delete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)li.FindControl("ID")).Text;
        DataTable DT = TelephoneDataAccess.DeleteTelephone(id, "2");
        if (DT.Rows.Count > 0)
        {
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "لايوجد بيانات صحيحة", "", "error");

        }
    }

    //protected void search_Click(object sender, EventArgs e)
    //{
    //    if (TelephoneNum.Text != "" || DepartmentName.Text != "" || EmployeeName.Text != "")
    //    {
    //        ListView1.DataBind();

    //    }

    //    else
    //    {
    //        ShowToast(this, "بالرجاء ادخال البيانات", "", "error");
    //    }

    //}

    protected void print_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ReportView.aspx?searchId=1");
    }
  
    protected void Employee_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();

    }
    protected void TelephoneNum_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();

    }
}