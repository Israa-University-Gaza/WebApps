using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StudentsPasswordNotupdated : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LinkButtonTest_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string StudentID = ((Label)item.FindControl("lblStudentID")).Text;
        DataTable DT = DataAccess.GetStudentMobile(StudentID);
        if (DT.Rows.Count > 0)
        {
            DataTable DT2 = DataAccess.UpdateStudentPassword(StudentID, EmployeeID);
            bool sendStatus = SendSMS(DT.Rows[0]["Mobile"].ToString(), "تم تغيير كلمة مرور صفحة الطالب وأصبحت: " + DT2.Rows[0]["NewPassword"].ToString());
            DataAccess.StdMessageAdd(EmployeeID, StudentID, DT.Rows[0]["Mobile"].ToString(), "", sendStatus);
            ShowToast(this, DT2.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT2.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        }
        else
        {
            ShowToast(this, "لا يمتلك الطالب رقم جوال", "", "error");
        }
    }
}