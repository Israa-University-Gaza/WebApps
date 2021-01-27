using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Academic_DeanMarkIncomplete : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPermissionsContains("DeanSectionStudentsMarks"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnSetFinalMarkIncomplete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string FinalMarkIncompleteID = ((Label)item.FindControl("FinalMarkIncompleteID")).Text;
        TextBox txtFinalMark = (TextBox)item.FindControl("txtFinalMark");

        if (IntValidateControls(new WebControl[] { txtFinalMark }))
        {
            DataTable DT = DataAccess.SetFinalMarkIncomplete(FinalMarkIncompleteID, txtFinalMark.Text, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
            if (DT.Rows[0]["status"].ToString() != "0")
            {
                ListView1.DataBind();
            }
        }
        else
        {
            ShowToast(this, "الرجاء إدخال الدرجة ", "","error");
        }
    }
}