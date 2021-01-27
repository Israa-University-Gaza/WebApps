using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Affairs_StudentInstallmentOrderAll : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnOrder_Click(object sender, EventArgs e)
    {
        DataTable dt = DataAccess.GetStdsSemesterBySemesterID();

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string studentID = dt.Rows[i]["StudentID"].ToString();
            StdOrder(studentID);
            ShowToast(this, "تم الحفظ بنجاح", "", "success");
            ListView1.DataBind();
        }
    }

    protected void StdOrder(string StudentID)
    {
        int CoursesHours = 0;
        double balance = 0;
        double TotalCost = 0;
        double payed = 0;
        string LastPaidAmount = "";
        double remain = 0;

        DataTable dt = DataAccess.GetStudentCoursesStatistics(StudentID);
        DataTable dt2 = DataAccess.GetStudentBalance(StudentID);
        DataTable dtLastPaid = DataAccess.GetStudentLastPaid(StudentID);

        if (dt.Rows.Count > 0)
        {
            CoursesHours =Convert.ToInt32( dt.Rows[0]["TotalCourseHours"].ToString());
            TotalCost = Convert.ToDouble(dt.Rows[0]["TotalCost"].ToString());
            LastPaidAmount = dtLastPaid.Rows[0][0].ToString();
            balance = Convert.ToDouble(dt2.Rows[0][0].ToString());


            if (CoursesHours > 0)
            {

                if (balance < 0)
                {
                    payed = balance * -1;
                }
                remain = TotalCost - payed;


                DataTable dtAdd = DataAccess.InstallmentOrderStudentAdd(StudentID, CoursesHours.ToString(), payed.ToString(), remain.ToString(), LastPaidAmount);

            }
        }
    }
}