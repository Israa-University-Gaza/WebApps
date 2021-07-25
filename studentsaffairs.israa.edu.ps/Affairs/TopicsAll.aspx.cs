using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Affairs_Topics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Context.User.Identity.Name.ToString() != "5124")
        //    Response.Redirect("Default.aspx");
        GridView2.DataSourceID = "all";
        GridView2.DataBind();         
    }






    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (DataBinder.Eval(e.Row.DataItem, "std_id") != null)
        {
            string stdID = DataBinder.Eval(e.Row.DataItem, "std_id").ToString();
            Label stdNo = (Label)e.Row.FindControl("stdNo");
            Label stdName = (Label)e.Row.FindControl("stdName");

            Label DeptDate = (Label)e.Row.FindControl("DeptDate");
            HyperLink Dept = (HyperLink)e.Row.FindControl("Dept");
            Label DeptComment1 = (Label)e.Row.FindControl("DeptComment1");

            HyperLink StudentAff = (HyperLink)e.Row.FindControl("StudentAff");
            Label StudentAffDate = (Label)e.Row.FindControl("StudentAffDate");
            Label StudentAffComment1 = (Label)e.Row.FindControl("StudentAffComment1");

            Label acadmicAccdate = (Label)e.Row.FindControl("acadmicAccdate");
            HyperLink acadmicAcc = (HyperLink)e.Row.FindControl("acadmicAcc");
            Label acadmicComment1 = (Label)e.Row.FindControl("acadmicComment1");

            Label mangmentAccdate = (Label)e.Row.FindControl("mangmentAccdate");
            HyperLink mangmentAcc = (HyperLink)e.Row.FindControl("mangmentAcc");
            Label mangmentComment1 = (Label)e.Row.FindControl("mangmentComment1");



            //HiddenField HiddenField1 = (HiddenField)e.Row.FindControl("HiddenField1");
            SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["IsraaStudentIssue"] + "");
            SqlDataAdapter DA3 = new SqlDataAdapter("select * from topics where id=" + DataBinder.Eval(e.Row.DataItem, "id").ToString(), conn1);
            DataTable DT3 = new DataTable();
            DA3.Fill(DT3);
            if (DT3.Rows[0]["DeptAccerdationEmployeeID"].ToString() != "")
            {
                //القسم
                if (Convert.ToBoolean(DT3.Rows[0]["Deptacc"]))
                {
                    Dept.Text = "موافقة";
                    DeptDate.Text = DT3.Rows[0]["DeptAccdate"].ToString();
                    DeptComment1.Text = DT3.Rows[0]["DeptComment"].ToString();
                }

                else
                {
                    Dept.Text = " رفض";
                    DeptDate.Text = DT3.Rows[0]["DeptAccdate"].ToString();
                    DeptComment1.Text = DT3.Rows[0]["DeptComment"].ToString();
                    if (DT3.Rows[0]["DeptAccerdationEmployeeID"].ToString() == "")
                        Dept.Text = "معلقة";
                }
                //المدير
                if (Convert.ToBoolean(DT3.Rows[0]["StudentAffAcc"]))
                {
                    StudentAff.Text = "موافقة";
                    StudentAffDate.Text = DT3.Rows[0]["StudentAffAccdate"].ToString();
                    StudentAffComment1.Text = DT3.Rows[0]["StudentAffComment"].ToString();
                }

                else
                {
                    StudentAff.Text = " رفض";
                    StudentAffDate.Text = DT3.Rows[0]["StudentAffAccdate"].ToString();
                    StudentAffComment1.Text = DT3.Rows[0]["StudentAffComment"].ToString();
                    if (DT3.Rows[0]["StudentAffAccerdationEmployeeID"].ToString() == "")
                    {
                        StudentAff.Text = "معلقة"; StudentAffComment1.Text = "معلقة"; StudentAff.Enabled = false;
                    }

                }
                //الشؤون الاكاديمية
                if (Convert.ToBoolean(DT3.Rows[0]["AcadmicAcc"]))
                {
                    acadmicAcc.Text = "موافقة";
                    acadmicAccdate.Text = DT3.Rows[0]["acadmicAccdate"].ToString();
                    acadmicComment1.Text = DT3.Rows[0]["AcadmicComment"].ToString();

                }

                else
                {
                    acadmicAcc.Text = " رفض";
                    acadmicAccdate.Text = DT3.Rows[0]["acadmicAccdate"].ToString();
                    acadmicComment1.Text = DT3.Rows[0]["AcadmicComment"].ToString();
                    if (DT3.Rows[0]["AcadmicAccerdationEmployeeID"].ToString() == "")
                    { acadmicAcc.Text = "معلقة"; acadmicComment1.Text = "معلقة"; }

                }
                //الشؤون الادارية
                if (Convert.ToBoolean(DT3.Rows[0]["mangmentAcc"]))
                {
                    mangmentAcc.Text = "موافقة";

                    mangmentAccdate.Text = DT3.Rows[0]["mangmentAccdate"].ToString();
                    mangmentAcc.ToolTip = DT3.Rows[0]["mangmentComment"].ToString();
                }

                else
                {
                    mangmentAcc.Text = " رفض";

                    mangmentAccdate.Text = DT3.Rows[0]["mangmentAccdate"].ToString();
                    mangmentAcc.ToolTip = DT3.Rows[0]["mangmentComment"].ToString();
                    if (DT3.Rows[0]["mangmentAccerdationEmployeeID"].ToString() == "")
                    {
                        mangmentAcc.Text = "معلقة"; mangmentComment1.Text = "معلقة";

                    }


                }
            }
            else
            {
                mangmentAcc.Text = "معلقة"; mangmentComment1.Text = "معلقة";
                acadmicAcc.Text = "معلقة"; acadmicComment1.Text = "معلقة";

                StudentAff.Text = "معلقة"; StudentAffComment1.Text = "معلقة";
                Dept.Text = "معلقة";DeptComment1.Text = "معلقة";
            }





            Label SemesterName = (Label)e.Row.FindControl("SemesterName");
            Label program = (Label)e.Row.FindControl("program");
            Label StudentLevel = (Label)e.Row.FindControl("StudentLevel");
            Label StudentName = (Label)e.Row.FindControl("StudentName");
            Label StudentCollege = (Label)e.Row.FindControl("StudentCollege");
            Label StudentNo = (Label)e.Row.FindControl("StudentNo");
            Label StudentDepartment = (Label)e.Row.FindControl("StudentDepartment");
            Label StudentStudiedHour = (Label)e.Row.FindControl("StudentStudiedHour");
            Label StudentGPAUniversity = (Label)e.Row.FindControl("StudentGPAUniversity");
            Label StudentSucceedHour = (Label)e.Row.FindControl("StudentSucceedHour");
            Label StudentBalance = (Label)e.Row.FindControl("StudentBalance");
            Label StudentRegisteredHours = (Label)e.Row.FindControl("StudentRegisteredHours");
            Label ScholarshipArName = (Label)e.Row.FindControl("ScholarshipArName");
            Label SemesterGPA = (Label)e.Row.FindControl("SemesterGPA");
            Label SemesterSucceedHour = (Label)e.Row.FindControl("SemesterSucceedHour");
            Label LoanValue = (Label)e.Row.FindControl("LoanValue");
            Label LoanValue1 = (Label)e.Row.FindControl("LoanValue1");





            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["isra2"] + "");
            SqlDataAdapter DA = new SqlDataAdapter("GetStudentShowIssueReportInfo", conn);
            DA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DA.SelectCommand.Parameters.AddWithValue("@StudentID", stdID);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            stdNo.Text = DT.Rows[0]["studentNo"].ToString();
            stdName.Text = DT.Rows[0]["studentName"].ToString();
            SemesterName.Text = DT.Rows[0]["SemesterName"].ToString();
            program.Text = DT.Rows[0]["program"].ToString();
            StudentLevel.Text = DT.Rows[0]["StudentLevel"].ToString();
            StudentName.Text = DT.Rows[0]["StudentName"].ToString();
            StudentCollege.Text = DT.Rows[0]["StudentCollege"].ToString();
            StudentNo.Text = DT.Rows[0]["StudentNo"].ToString();
            StudentDepartment.Text = DT.Rows[0]["StudentDepartment"].ToString();
            StudentStudiedHour.Text = DT.Rows[0]["StudentStudiedHour"].ToString();
            StudentGPAUniversity.Text = DT.Rows[0]["StudentGPAUniversity"].ToString();
            StudentSucceedHour.Text = DT.Rows[0]["StudentSucceedHour"].ToString();
            StudentBalance.Text = DT.Rows[0]["StudentBalance"].ToString();
            StudentRegisteredHours.Text = DT.Rows[0]["StudentRegisteredHours"].ToString();
            ScholarshipArName.Text = DT.Rows[0]["ScholarshipArName"].ToString();
            SemesterGPA.Text = DT.Rows[0]["SemesterGPA"].ToString();
            SemesterSucceedHour.Text = DT.Rows[0]["SemesterSucceedHour"].ToString();
            LoanValue.Text = DT.Rows[0]["LoanValue"].ToString();
            LoanValue1.Text = DT.Rows[0]["LoanValue"].ToString();


            Label Label554 = (Label)e.Row.FindControl("Label554");
            bool IsFinish = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "IsFinish"));
            if (IsFinish)
                Label554.Text = "منتهية منذ " + DataBinder.Eval(e.Row.DataItem, "FinishData");
            else
                Label554.Visible = false;
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["isra3"] + "");
        SqlDataAdapter DA3 = new SqlDataAdapter("select id from Student where IsDelete=0 and  studentNo=" + TextBox1.Text, conn1);
        DataTable DT3 = new DataTable();
        DA3.Fill(DT3);
        if (DT3.Rows.Count != 0)
        {
            HiddenField1.Value = DT3.Rows[0][0].ToString();
            GridView2.DataSourceID = "byid";
            GridView2.DataBind();
        }

    }
}