using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Academic_SummerWorkFinalMark : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btnAcceptFinalMarkIncomplete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string FinalMarkIncompleteID = ((Label)item.FindControl("FinalMarkIncompleteID")).Text;
        DataTable DT = DataAccess.AcceptFinalMarkIncomplete(FinalMarkIncompleteID, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
        ListView1.DataBind();

    }



    protected void btnSave_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string ID = ((Label)item.FindControl("StdSectionID")).Text;
        string TotalMark = ((TextBox)item.FindControl("txtTotalMark")).Text;
        DataTable DT = DataAccess.SetStdSectionSummerWorkFinalMark(ID, TotalMark,EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
        ListView1.DataBind();
    }
}