using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AcademicApp_Default : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable DT = DA.StudentTawjehyDataGet(UserPage.StudentID);
            if (DT.Rows.Count > 0)
            {
                student_Num.Text = StudentNo;
                txtStudentName.Text = DT.Rows[0]["StudentName"].ToString();
                TextBox1.Text = DT.Rows[0]["TawjehyNo"].ToString();
                TextBox2.Text = DT.Rows[0]["TawjehyType"].ToString();
                TextBox3.Text = DT.Rows[0]["TawjehyYear"].ToString();
                TextBox5.Text = DT.Rows[0]["TawjehyGPA"].ToString();
                txtOldUniversity.Text = DT.Rows[0]["OldUniversity"].ToString();
                txtOldDepartment.Text = DT.Rows[0]["OldDepartment"].ToString();
                txtOldUniversityHours.Text = DT.Rows[0]["OldUniversityHours"].ToString();
                txtOldUniversityGPA.Text = DT.Rows[0]["OldUniversityGPA"].ToString();
                txtShamelRate.Text = DT.Rows[0]["ShamelRate"].ToString();
                txtExpertYears.Text = DT.Rows[0]["ExpertYears"].ToString();

                divStudentType234.Visible = ((DT.Rows[0]["StudentTypeID"].ToString()) != "1" && (DT.Rows[0]["StudentTypeID"].ToString() != "5"));
                divStudentType2.Visible = DT.Rows[0]["StudentTypeID"].ToString() == "2";
                btnNext.Visible = (DT.Rows[0]["StudentTypeID"].ToString() == "1") || (DT.Rows[0]["StudentTypeID"].ToString() != "1" && DT.Rows[0]["OldUniversity"].ToString() != "");
            }
        }
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        Response.Redirect("MainData.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (divStudentType234.Visible)
        {
            bool DoubleValidate = DoubleValidateControls(new WebControl[] { txtOldUniversityGPA });
            bool Validate = ValidateControls(new WebControl[] { txtOldUniversity, txtOldDepartment, txtOldUniversityHours, txtOldUniversityGPA });

            if (DoubleValidate && Validate && Convert.ToDouble(txtOldUniversityGPA.Text) < 100)
            {
                if (DA.StudentTawjehyDataAddEdit(UserPage.StudentID, txtOldUniversity.Text, txtOldDepartment.Text, txtOldUniversityHours.Text, txtOldUniversityGPA.Text, txtShamelRate.Text, txtExpertYears.Text) > 0)
                {
                    btnNext.Visible = true;
                    ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                }
                else
                    ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
            }
            else
            {
                ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
            }
        }

        for (int i = 0; i < cblHowKnow.Items.Count; i++)
        {
            if (cblHowKnow.Items[i].Selected)
            {
                DA.StdHowKnowAddEdit(UserPage.StudentID, cblHowKnow.Items[i].Value);
            }
        }

        ShowToast(this, "تم الحفظ بنجاح.", "", "success");
    }
}