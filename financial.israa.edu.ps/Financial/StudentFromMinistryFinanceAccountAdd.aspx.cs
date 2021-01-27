using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_StudentFromMinistryFinanceAccountAdd : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddAccountToStdTransFromMinisFinance_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string StudentID = ((Label)item.FindControl("lblStudentID")).Text;
        string ValueJOD = ((Label)item.FindControl("lblValueJOD")).Text;
string ID = ((Label)item.FindControl("lblID")).Text;
        DataTable DT = DataAccess.AddAccountToStudentTransaction("9", StudentID, ValueJOD, EmployeeID);
if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
        {
            DataTable DT2 = DataAccess.StudentFromAcountAPIsTransitionUpdate(ID);
        }
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView2.DataBind();
    }
}