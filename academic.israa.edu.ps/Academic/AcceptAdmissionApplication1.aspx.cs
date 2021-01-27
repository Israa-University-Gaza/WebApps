using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_AcceptAdmissionApplication1 : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void lbAccept_Click(object sender, EventArgs e)
    {
        //ListViewDataItem ri = (ListViewDataItem)((LinkButton)sender).Parent;
        //string s = ((RadioButtonList)ri.FindControl("rblWishes")).SelectedValue;
        //string StudentID = ((Label)ri.FindControl("StudentID")).Text;

        //if (((RadioButtonList)ri.FindControl("rblWishes")).SelectedIndex >= 0)
        //{
        //    DataTable DT = DataAccess.AdmissionAccreditStudent(StudentID, s, EmployeeID);
        //    if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
        //    {
        //        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "success");
        //    }
        //    else
        //    {
        //        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "error");
        //    }
        //}
        //else
        //{
        //    ShowToast(this, "يجب اختيار القسم", "", "error");
        //}

        ListViewDataItem ri = (ListViewDataItem)((LinkButton)sender).Parent;
        string s = ((RadioButtonList)ri.FindControl("rblWishes")).SelectedValue;
        string StudentID = ((Label)ri.FindControl("StudentID")).Text;

        if (((RadioButtonList)ri.FindControl("rblWishes")).SelectedIndex >= 0)
        {
            //DataTable dt = DataAccess.StudentTawjehyDataGet(StudentID);
            //if (Convert.ToInt32(dt.Rows[0]["TawjehyGPA"]) >= 70)
            //{
                DataTable DT = DataAccess.AccreditStudent(StudentID, s, EmployeeID);
                if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                {
                    SendSMS(DT.Rows[0]["jawwal"].ToString(), DT.Rows[0]["smstext"].ToString());
                    ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "success");
                }
                else
                {
                    ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "error");
                }
            //}
            //else
            //{
            //    ShowToast(this, "في انتظار قرار مجلس الجامعة", "", "error");
            //}
                ListView1.DataBind();
            
        }
        else
        {
            ShowToast(this, "يجب اختيار القسم", "", "error");
        }
    }

}