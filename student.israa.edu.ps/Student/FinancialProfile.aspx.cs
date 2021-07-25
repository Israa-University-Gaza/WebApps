using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_FinancialProfile : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //GetStudentAcademicWarningOutPut da = DataAccess.GetStudentAcademicWarning(StudentID);
        //if (da.status == 1)
        //{
        //    Response.Redirect("StudentAcademicWarning.aspx");
        //}
        if (DataAccess.IsStudentReadUnRole(StudentID).Rows[0]["status"].ToString() == "0")
        {
            Response.Redirect("ReadRool.aspx");
        }
        if (DataAccess.IsStudentHavePoll(StudentID))
        {
            Response.Redirect("StudentPoll.aspx");
        }
        /* by SRS if (!DataAccess.IsStudentFinishEvaluation(StudentID))
        {
            Response.Redirect("EvaluationChooseEmployeeCourse.aspx");
        }*/


        if (!IsPostBack)
        {
            lblBalance.Text = DataAccess.GetStudentBalance(StudentID).Rows[0][0].ToString();
            double loans = 0;


            DataTable dtLoans = DataAccess.GetStudentLoans(StudentID);
            loans = dtLoans.Rows.Count > 0 ? Convert.ToDouble(dtLoans.Rows[0]["TotalLoans"].ToString()) : 0;
            lblTotalLoans.Text = loans.ToString();
            lblFinalBalance.Text = (Convert.ToDouble(lblBalance.Text) + loans).ToString();

        }
    }
}