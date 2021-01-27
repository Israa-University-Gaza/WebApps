using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_FinancialProfile : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            lblStudentID.Text = Request.QueryString["id"];
        }
    }

    protected void btnDeleteTransaction_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string id = ((Label)item.FindControl("TransactionID")).Text;
        DataTable DT = DataAccess.DeleteTransaction(id, EmployeeID);
        ListView1.DataBind();
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
    }
}