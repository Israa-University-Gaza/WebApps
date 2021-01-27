using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_LectureIrregular : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
  
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void lbHRAccredit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string ID = ((Label)item.FindControl("ID")).Text;
        DataTable DT = DataAccess.LectureIrregularAccreditation(ID,"3",UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
    }

    protected void ddlSemesterID_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void ddlInstructor_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}