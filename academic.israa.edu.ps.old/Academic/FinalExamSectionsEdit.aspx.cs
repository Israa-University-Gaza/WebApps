using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_FinalExamSectionsEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            //ddlBranch.DataBind();
            //ddlBranch.Items.Insert(0, new ListItem("الكل", "-1"));
            //ddlProgram.DataBind();
            //ddlProgram.Items.Insert(0, new ListItem("الكل", "-1"));
            //Response.Redirect("BlockPage.aspx");       
			}
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        Repeater1.DataBind();
        ListView1.DataBind();
    }






    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        ((DropDownList)e.Item.FindControl("ddlEmployee1")).SelectedValue = ((Label)e.Item.FindControl("EmployeeID1")).Text;
        ((DropDownList)e.Item.FindControl("ddlEmployee2")).SelectedValue = ((Label)e.Item.FindControl("EmployeeID2")).Text;
     
    }



    protected void btnSetEmployees_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("FinalExamSectionID")).Text;
        DropDownList ddlEmployee1 = (DropDownList)item.FindControl("ddlEmployee1");
        DropDownList ddlEmployee2 = (DropDownList)item.FindControl("ddlEmployee2");

        DataTable DT = DataAccess.SetFinalExamSectionEmployees(id, ddlEmployee1.SelectedValue, ddlEmployee2.SelectedValue);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() == "1") ? "success" : "error");

        if (DT.Rows[0]["status"].ToString() == "1")
        {
            ListView1.DataBind();
        }
    }

}