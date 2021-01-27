using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdmissionApp_StudentWishes : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblStudentID.Text = UserPage.StudentID;
            DataTable DT = DA.StudentDepDataGet(UserPage.StudentID);
            if (DT.Rows.Count > 0)
            {

                lbStudentImage.Visible = !DT.Rows[0]["CollegeID1"].ToString().Equals("");
                ddlCollege1.DataBind();
                string CollegeID1 = DT.Rows[0]["CollegeID1"].ToString();
                if (CollegeID1 != "" && CollegeID1 != null)
                    ddlCollege1.SelectedValue = CollegeID1;
                ddlDepartment1.DataBind();
                string DepartID1 = DT.Rows[0]["DepartID1"].ToString();
                if (DepartID1 != "" && DepartID1 != null)
                    ddlDepartment1.SelectedValue = DepartID1;

                ddlCollege2.DataBind();
                string CollegeID2 = DT.Rows[0]["CollegeID2"].ToString();
                if (CollegeID2 != "" && CollegeID2 != null)
                    ddlCollege2.SelectedValue = CollegeID2;
                ddlDepartment2.DataBind();
                string DepartID2 = DT.Rows[0]["DepartID2"].ToString();
                if (DepartID2 != "" && DepartID2 != null)
                    ddlDepartment2.SelectedValue = DepartID2;

                ddlCollege3.DataBind();
                string CollegeID3 = DT.Rows[0]["CollegeID3"].ToString();
                if (CollegeID3 != "" && CollegeID3 != null)
                    ddlCollege3.SelectedValue = CollegeID3;
                ddlDepartment3.DataBind();
                string DepartID3 = DT.Rows[0]["DepartID3"].ToString();
                if (DepartID3 != "" && DepartID3 != null)
                    ddlDepartment3.SelectedValue = DepartID3;


                string PlaceOfStudyID = DT.Rows[0]["PlaceOfStudyID"].ToString();
                if (!string.IsNullOrEmpty(PlaceOfStudyID))
                    ddlPlacesOfStudy.SelectedValue = DT.Rows[0]["PlaceOfStudyID"].ToString();

            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool IntValidate = IntValidateControls(new WebControl[] { ddlPlacesOfStudy, ddlDepartment1, ddlDepartment2, ddlDepartment3 });
        bool Validate = ValidateControls(new WebControl[] { ddlPlacesOfStudy, ddlDepartment1, ddlDepartment2, ddlDepartment3 });

        if (ddlDepartment1.SelectedValue != ddlDepartment2.SelectedValue && ddlDepartment1.SelectedValue != ddlDepartment3.SelectedValue && ddlDepartment2.SelectedValue != ddlDepartment3.SelectedValue)
        {
            if (Validate && IntValidate)
            {
                //! DA.StudentPlacesOfStudyAddEdit => خاصة باختيار مكان الدراسة
                if (DA.StudentDepDataAddEdit(UserPage.StudentID, ddlDepartment1.SelectedValue, ddlDepartment2.SelectedValue, ddlDepartment3.SelectedValue) > 0 && DA.StudentPlacesOfStudyAddEdit(StudentID, ddlPlacesOfStudy.SelectedValue) > 0)
                {
                    lbStudentImage.Visible = true;
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
        else
        {
            ShowToast(this, "الرجاء إختيار رغبات مختلفة.", "", "error");
        }
    }

    protected void lbStudentImage_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentImage.aspx");
    }
}