using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_CourseAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EmpID.Text = EmployeeID;
        if (!IsPostBack)
        {
            ddlStudyLevel.DataBind();
            ddlStudyLevel.Items.Insert(0, new ListItem("اختر المستوى الدراسي", "-1"));
        }
        if (Session["CourseID"] != null)
        {
            //if (Permissions.Contains("AcademicCourseEdit"))
            //{
            lblCourseID.Text = Session["CourseID"].ToString();
            Session["CourseID"] = null;
            DataTable DT = DataAccess.CourseGet(lblCourseID.Text);
            if (DT.Rows.Count > 0)
            {
                txtCourseCode.Text = DT.Rows[0]["CourseCode"].ToString();
                txtArName.Text = DT.Rows[0]["ArName"].ToString();
                txtEnName.Text = DT.Rows[0]["EnName"].ToString();
                ddlProgram.DataBind();
                ddlProgram.SelectedValue = DT.Rows[0]["ProgramID"].ToString();
                ddlCollege.DataBind();
                ddlCollege.SelectedValue = DT.Rows[0]["CollegeID"].ToString();
                ddlDepartment.DataBind();
                ddlDepartment.SelectedValue = DT.Rows[0]["DepartmentID"].ToString();
                ddlSemester.SelectedValue = DT.Rows[0]["SemesterID"].ToString();
                ddlStudyLevel.SelectedValue = DT.Rows[0]["LevelID"].ToString();
                ddlCCourseType.SelectedValue = DT.Rows[0]["CCourseTypeID"].ToString();
                ddlCourseType.SelectedValue = DT.Rows[0]["CourseType"].ToString();
                cbIsScholarship.Checked = !Convert.ToBoolean(DT.Rows[0]["IsScholarship"]);
                cbHaveLab.Checked = Convert.ToBoolean(DT.Rows[0]["IsHaveLab"]);
                cbHaveDiscussion.Checked = Convert.ToBoolean(DT.Rows[0]["IsHaveDiscussion"]);
                txtNumOfHours.Text = DT.Rows[0]["NumOfHours"].ToString();
                cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
                if (DT.Rows[0]["PreReqID"].ToString() != null && DT.Rows[0]["PreReqID"].ToString() != "")
                {
                    ddlPreRequest.DataBind();
                    ddlPreRequest.SelectedValue = DT.Rows[0]["PreReqID"].ToString();
                }

            }
            // }
        }

    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("CourseID")).Text;
        DataTable DT = DataAccess.CourseGet(id);

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool IntValidate = IntValidateControls(new WebControl[] { ddlProgram, ddlCollege, ddlDepartment, ddlStudyLevel, ddlSemester, ddlCCourseType, ddlCourseType, txtNumOfHours });
        bool Validate = ValidateControls(new WebControl[] { ddlProgram, ddlCollege, ddlDepartment, ddlStudyLevel, ddlSemester, ddlCCourseType, ddlCourseType, txtArName, txtCourseCode, txtEnName, txtNumOfHours });
        if (Validate && IntValidate)
        {
            DataTable DT = DataAccess.CourseAddEdit(lblCourseID.Text, txtCourseCode.Text, txtArName.Text, txtEnName.Text, "", ddlDepartment.SelectedValue, ddlStudyLevel.SelectedValue, ddlSemester.SelectedValue, ddlCCourseType.SelectedValue, ddlCourseType.SelectedValue, txtNumOfHours.Text, "0", !cbIsScholarship.Checked, cbHaveLab.Checked, cbHaveDiscussion.Checked, cbActive.Checked, ddlPreRequest.SelectedValue, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if ((Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0))
            {
                EmptyControls(new WebControl[] { lblCourseID, ddlPreRequest, ddlCCourseType, ddlCourseType, txtArName, txtCourseCode, txtEnName, txtNumOfHours, cbActive, cbHaveDiscussion, cbHaveLab/*, ddlProgram, ddlCollege, ddlDepartment*/ });

                ddlPreRequest.DataBind();
            }
        }
        else
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblCourseID, ddlPreRequest, ddlCCourseType, ddlCourseType, ddlStudyLevel, ddlSemester, txtArName, txtCourseCode, txtEnName, txtNumOfHours, cbActive, cbHaveDiscussion, cbHaveLab/*, ddlProgram, ddlCollege, ddlDepartment*/ });
    }

    protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCollege.DataBind();
        ddlDepartment.DataBind();
    }

    protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDepartment.DataBind();
    }
}