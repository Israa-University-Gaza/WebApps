using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SendSMS : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        
        //int count1 = 0, count2 = 0;
        //DataTable DT = DataAccess.GetStudentWirelessData();
        //count1 = DT.Rows.Count;
        //if (DT.Rows.Count > 0)
        //{
        //    foreach (DataRow item in DT.Rows)
        //    {
        //        string username = item["StudentNo"].ToString();
        //        string pass = item["pass"].ToString();
        //        string msg = "خدمة الواي فاي " + "اسم المستخدم " + username + " , كلمة المرور " + pass;

        //        if (SendSMS(item["Mobile"].ToString(), msg))
        //        {
        //            count2 = count2 + 1;
        //        }
        //    }
        //    ShowToast(this, "تم ارسال الرسالة للطلبة", "", "success");
        //}
        //else
        //{
        //    ShowToast(this, "لا يوجد طلاب", "", "error");
        //}
        //Label1.Text = count2 + "   /   " + count1;

        //Label1.Text = "wajed";
    }
}