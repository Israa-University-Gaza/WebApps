using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StudentsNotRegisterdStdSection : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            ddlSemester.DataBind();
            ddlSemester.Items.Insert(0, new ListItem("الكل", "-1"));
            ddlSemesterStatus.DataBind();
            ddlSemesterStatus.Items.Insert(0, new ListItem("الكل", "-1"));

        }

    }


    protected void dataBind_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("ID")).Text;
        DataTable DT = DataAccess.CancelRegisterSemester(id, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
    }
}