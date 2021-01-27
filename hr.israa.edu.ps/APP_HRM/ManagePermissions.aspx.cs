using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_ManagePermissions : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (UserID != "5015")
            Response.Redirect("default.aspx");
        if (!IsPostBack)
        {
         //   bindListView();
        }
       
    }

    protected void bindListView()
    {
      //  ListView1.DataSourceID = null;
      //  ListView1.DataSource = DataAccess.EmployeesRolesGet(txtEmployeeName.Text, txtRoleName.Text);
        ListView1.DataBind();
        
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bindListView();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem item = (ListViewItem)(sender as Control).Parent;
        string id = ((Label)item.FindControl("ID")).Text;
       // Response.Write(id);
        bool IsActive = ((CheckBox)item.FindControl("rbtnIsActive")).Checked;
        DataAccess.EmployeeRoleActivate(id, IsActive, UserID);
        bindListView();
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem item = (ListViewItem)(sender as Control).Parent;
        string id = ((Label)item.FindControl("ID")).Text;
        // Response.Write(id);
        bool IsActive = ((CheckBox)item.FindControl("rbtnIsActive")).Checked;
        DataAccess.EmployeeRoleDelete(id, UserID);
        bindListView();
    }
}