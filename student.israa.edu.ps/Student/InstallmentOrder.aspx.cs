using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_InstallmentOrder : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int CoursesHours = 0;
        double balance = 0;
        double TotalCost = 0;
        double payed = 0;
        double wanted = 0;
        double GetStudentLastPaid = 0;
        if (!IsPostBack)
        {
            DataTable dt = DataAccess.GetStudentCoursesStatistics(StudentID);
            DataTable dt2 = DataAccess.GetStudentBalance(StudentID);
            DataTable dtLastPaid = DataAccess.GetStudentLastPaid(StudentID);

            if (dt.Rows.Count > 0)
            {
                lblCoursesHours.Text=txtCoursesHours.Text = dt.Rows[0]["TotalCourseHours"].ToString();
                lblTotalCost.Text = dt.Rows[0]["TotalCost"].ToString();
                lblLastPaidAmount.Text= txtLastPaidAmount.Text = dtLastPaid.Rows[0][0].ToString();
                lblBalance.Text= dt2.Rows[0][0].ToString();


                if (!string.IsNullOrEmpty(lblCoursesHours.Text))
                {
                    CoursesHours = Convert.ToInt32(lblCoursesHours.Text);
                    TotalCost = Convert.ToDouble(lblTotalCost.Text);
                    balance = Convert.ToDouble(lblBalance.Text);


                    if (balance < 0)
                    {
                        payed = balance * -1;
                    }
                    lblPayed.Text=txtPayed.Text = payed.ToString();
                    lblRemain.Text= txtRemain.Text = (TotalCost -payed).ToString();


                    ShowHideMsg(DataAccess.InstallmentOrderStudentCalc(StudentID).Rows[0]["msg"].ToString(), "warning");
                }
                }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string CoursesHours = "";
        string payed = "";
        string remain = "";
        string lastPaidAmount = "";

        if (!string.IsNullOrEmpty(lblCoursesHours.Text))
        {
            CoursesHours = lblCoursesHours.Text;
            lastPaidAmount = lblLastPaidAmount.Text;
            remain = lblRemain.Text;
            payed = lblPayed.Text;
            DataTable dtAdd = DataAccess.InstallmentOrderStudentAdd(StudentID, CoursesHours, payed, remain,lastPaidAmount);
            if (dtAdd.Rows[0]["status"].ToString() == "0")
            {
                ShowHideMsg("لا يمكن إضافة اكثر من طلب تقسيط للفصل الواحد", "warning");
            }
            else
            {
                ShowHideMsg("تم إضافة طلب تقسيط", "success");
            }
        }

        else
        {
            ShowHideMsg("يجب عليك تقديم طلب تسجيل للمواد", "error");
            btnSave.Enabled = false;
        }
    }

    public void ShowHideMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable");
    }
}