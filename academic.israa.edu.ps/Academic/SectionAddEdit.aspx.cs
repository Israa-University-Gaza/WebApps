using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_SectionAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["SectionID"] != null)
            {
                if (Permissions.Contains("SectionEdit"))
                {
                    DataTable DT = DataAccess.SectionGet(Session["SectionID"].ToString());
                    if (DT.Rows.Count > 0)
                    {
                        lblSectionID.Text = DT.Rows[0]["ID"].ToString();
                        lblOfferdCourseID.Text = DT.Rows[0]["OfferdCourseID"].ToString();
                        divSection.Visible = (DT.Rows[0]["SectionType"].ToString() != "1");
                        ddlSectionID.DataBind();
                        ddlSectionID.SelectedValue = (divSection.Visible) ? DT.Rows[0]["SectionID"].ToString() : "-1";
                        lblCourseID.Text = DT.Rows[0]["CourseID"].ToString();
                        lblCourse.Text = DT.Rows[0]["CourseName"].ToString();
                        txtSectionNum.Text = DT.Rows[0]["SectionNum"].ToString();
                        if (DT.Rows[0]["EmployeeID"].ToString() != null && DT.Rows[0]["EmployeeID"].ToString() != "")
                        {
                            ddlEmployee.DataBind();
                            ddlEmployee.SelectedValue = DT.Rows[0]["EmployeeID"].ToString();
                            try {
                                //ddlPTEmployee.SelectedValue = DT.Rows[0]["PTEmployeeID"].ToString();
                                //divPTEmployee.Visible = (DT.Rows[0]["EmployeeID"].ToString() == "9999");
                            }
                            catch  {

                            }
                            //if (DT.Rows[0]["EmployeeID"].ToString() == "9999")
                            //{
                            //    divPTEmployeeDetails.Visible = true;
                            //    DataTable DT1 = DataAccess.PTEmployeeGet(DT.Rows[0]["PTEmployeeID"].ToString());
                            //    if (DT1.Rows.Count > 0)
                            //    {
                            //        txtName.Text = DT1.Rows[0]["Name"].ToString();
                            //        ddlDepartment.DataBind();
                            //        ddlDepartment.SelectedValue = DT1.Rows[0]["DepartmentID"].ToString();
                            //        txtQualification.Text = DT1.Rows[0]["Qualification"].ToString();
                            //        txtNotes.Text = DT1.Rows[0]["Notes"].ToString();
                            //    }
                            //}
                        }
                        ddlSectionType.SelectedValue = DT.Rows[0]["SectionType"].ToString();
                        txtCapacity.Text = DT.Rows[0]["Capacity"].ToString();
                        cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());

                        rbMale.Checked = (DT.Rows[0]["Gender"].ToString() == "1");
                        rbFemale.Checked = (DT.Rows[0]["Gender"].ToString() == "2");
                        rbMaleFemale.Checked = (DT.Rows[0]["Gender"].ToString() == "3");

                        divLectures.Visible = IsPermissionsContains("Lecture");
                        divLectureAddEdit.Visible = Permissions.Contains("LectureAdd");
                        Session["SectionID"] = null;
                    }
                    else
                    {
                        Response.Redirect("~/Academic/OfferdCourseManage.aspx");
                    }
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else if (Session["OfferdCourseID"] != null)
            {
                if (Permissions.Contains("SectionAdd"))
                {
                    DataTable DT = DataAccess.OfferdCourseGet(Session["OfferdCourseID"].ToString());
                    if (DT.Rows.Count > 0)
                    {
                        lblOfferdCourseID.Text = DT.Rows[0]["ID"].ToString();
                        lblCourse.Text = DT.Rows[0]["CourseName"].ToString();
                        Session["OfferdCourseID"] = null;
                    }
                    else
                    {
                        Response.Redirect("~/Academic/OfferdCourseManage.aspx");
                    }
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Academic/OfferdCourseManage.aspx");
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool IntValidate = IntValidateControls(new WebControl[] { txtSectionNum, txtCapacity });
        bool Validate = ValidateControls(new WebControl[] { txtSectionNum, txtCapacity, (divSection.Visible) ? ddlSectionID : null, cbActive });

        if (Validate && IntValidate)
        {
            DataTable DT = DataAccess.SectionAddEdit(lblSectionID.Text, lblOfferdCourseID.Text, (divSection.Visible) ? ddlSectionID.SelectedValue : "", txtSectionNum.Text, (ddlEmployee.SelectedIndex > 0) ? ddlEmployee.SelectedValue : "", (ddlPTEmployee.SelectedIndex > 0) ? ddlPTEmployee.SelectedValue : "", ddlSectionType.SelectedValue, (rbMale.Checked) ? 1 : ((rbFemale.Checked) ? 2 : (3)), txtCapacity.Text, cbActive.Checked, EmployeeID);
            if (Convert.ToInt32(DT.Rows[0]["status"]) > 0)
            {
                divLectures.Visible = IsPermissionsContains("Lecture");
                divLectures.Visible = Permissions.Contains("LectureAdd");
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "success");
            }
            else
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnNew_Click(object sender, EventArgs e)
    {
        Session["OfferdCourseID"] = lblOfferdCourseID.Text;
        Response.Redirect("SectionAddEdit.aspx");
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("LectureID")).Text;
        DataTable DT = DataAccess.LectureGet(id);
        if (DT.Rows.Count > 0)
        {
            divLectureAddEdit.Visible = Permissions.Contains("LectureEdit");
            lblLectureID.Text = id;
            txtFromHour.Text = DT.Rows[0]["FromHour"].ToString();
            txtToHour.Text = DT.Rows[0]["ToHour"].ToString();
            ddlDayID.SelectedValue = DT.Rows[0]["CDayID"].ToString();
            ddlRoomID.SelectedValue = DT.Rows[0]["RoomID"].ToString();
            cbLectureIsActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("LectureID")).Text;
        DataTable DT = DataAccess.LectureDelete(id, EmployeeID);
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }
    }

    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((CheckBox)sender).Parent;
        string id = ((Label)ri.FindControl("LectureID")).Text;

        if (DataAccess.LectureActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowToast(this, "تمت العملية بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم العملية.", "", "error");
        }
    }

    protected void btnLectureSave_Click(object sender, EventArgs e)
    {
        bool IntValidate = IntValidateControls(new WebControl[] { ddlRoomID, ddlDayID });
        bool Validate = ValidateControls(new WebControl[] { ddlRoomID, ddlDayID, txtFromHour, txtToHour });
        bool DateValidate = DateValidateControls(new WebControl[] { txtFromHour, txtToHour });
        if (Validate && IntValidate && DateValidate)
        {
            DataTable DT = DataAccess.LectureAddEdit(lblLectureID.Text, lblSectionID.Text, ddlRoomID.SelectedValue, ddlDayID.SelectedValue, txtFromHour.Text, txtToHour.Text, cbLectureIsActive.Checked, EmployeeID);
            if (Convert.ToInt32(DT.Rows[0]["status"]) > 0)
            {
                divLectures.Visible = Permissions.Contains("LectureAdd");
                Repeater1.DataBind();
                EmptyControls(new WebControl[] { lblLectureID, txtFromHour, txtToHour, ddlDayID, ddlRoomID, cbLectureIsActive });
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "success");
            }
            else
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "error");
            }
        }

        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }

    protected void btnLectureCancel_Click1(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblLectureID, txtFromHour, txtToHour, ddlDayID, ddlRoomID, cbLectureIsActive });
    }

    protected void ddlSectionType_SelectedIndexChanged(object sender, EventArgs e)
    {
        divSection.Visible = (ddlSectionType.SelectedValue != "1");
    }
    protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        divPTEmployee.Visible = (ddlEmployee.SelectedValue == "9999");
    }

    //protected void btnNewPTEmployee_Click(object sender, EventArgs e)
    //{
    //    divPTEmployeeDetails.Visible = true;
    //}
    //protected void btnPTEmployeeSave_Click(object sender, EventArgs e)
    //{
    //    if (ValidateControls(new WebControl[] { txtName, ddlDepartment, txtQualification, txtNotes }))
    //    {
    //        DataTable DT = DataAccess.PTEmployeeAddEdit(lblPTEmployeeID.Text, txtName.Text, ddlDepartment.Text, txtQualification.Text, txtNotes.Text, EmployeeID);
    //        if (Convert.ToInt32(DT.Rows[0]["status"]) > 0)
    //        {
    //            lblPTEmployeeID.Text = DT.Rows[0]["status"].ToString();
    //            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "success");
    //        }
    //        else
    //        {
    //            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "error");
    //        }
    //    }
    //    else
    //    {
    //        ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
    //    }
    //}

    //protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    divPTEmployee.Visible = ddlEmployee.SelectedValue == "9999";
    //}

    protected void ddlPTEmployee_SelectedIndexChanged1(object sender, EventArgs e)
    {
       // lblPTEmployeeID.Text = (ddlPTEmployee.SelectedValue != "-1") ? ddlPTEmployee.SelectedValue : "";
        //divPTEmployeeDetails.Visible = (ddlPTEmployee.SelectedValue != "-1");

        //DataTable DT1 = DataAccess.PTEmployeeGet(ddlPTEmployee.SelectedValue);
        //if (DT1.Rows.Count > 0)
        //{
        //    txtName.Text = DT1.Rows[0]["Name"].ToString();
        //    ddlDepartment.DataBind();
        //    ddlDepartment.SelectedValue = DT1.Rows[0]["DepartmentID"].ToString();
        //    txtQualification.Text = DT1.Rows[0]["Qualification"].ToString();
        //    txtNotes.Text = DT1.Rows[0]["Notes"].ToString();
        //}
    }
    //protected void DepSectionSave_Click(object sender, EventArgs e)
    //{
    //    if (ValidateControls(new WebControl[] { lblSectionID, ddlDepartment2 }))
    //    {
    //        DataTable DT = DataAccess.DepartmentSectionAddEdit(lblDepSectionID.Text, ddlDepartment2.SelectedValue, lblSectionID.Text, CheckBox1.Checked, EmployeeID);
    //        if (Convert.ToInt32(DT.Rows[0]["status"]) > 0)
    //        {
    //            Repeater2.DataBind();
    //            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "success");
    //            EmptyControls(new WebControl[] { ddlDepartment2, CheckBox1, lblDepSectionID });
    //        }
    //        else
    //        {
    //            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "error");
    //        }
    //    }
    //    else
    //    {
    //        ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
    //    }
    //}
    //protected void DepSectionCancel_Click(object sender, EventArgs e)
    //{
    //    EmptyControls(new WebControl[] { ddlDepartment2, CheckBox1 });
    //}
    //protected void cbDepSectionIsActive_CheckedChanged(object sender, EventArgs e)
    //{
    //    RepeaterItem ri = (RepeaterItem)((CheckBox)sender).Parent;
    //    string id = ((Label)ri.FindControl("DepSectionID")).Text;

    //    DataTable DT = DataAccess.DepartmentSectionActivate(id, ((CheckBox)sender).Checked, EmployeeID);
    //    if (DT.Rows.Count > 0)
    //    {
    //        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "success");
    //        Repeater2.DataBind();
    //    }
    //    else
    //    {
    //        ShowToast(this, "عذرًا , لم تتم العملية.", "", "error");
    //    }
    //}
    //protected void lbDepSectionEdit_Click(object sender, EventArgs e)
    //{
    //    RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
    //    string id = ((Label)ri.FindControl("DepSectionID")).Text;
    //    DataTable DT = DataAccess.DepartmentSectionGet(id);
    //    if (DT.Rows.Count > 0)
    //    {
    //        lblDepSectionID.Text = DT.Rows[0]["ID"].ToString();
    //        ddlDepartment2.SelectedValue = DT.Rows[0]["DepartmentID"].ToString();
    //        CheckBox1.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
    //    }

    //}
    //protected void lbDepSectionDelete_Click(object sender, EventArgs e)
    //{
    //    RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
    //    string id = ((Label)ri.FindControl("DepSectionID")).Text;

    //    DataTable DT = DataAccess.DepartmentSectionDelete(id, EmployeeID);
    //    if (DT.Rows.Count > 0)
    //    {
    //        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", "success");
    //        Repeater2.DataBind();
    //    }
    //    else
    //    {
    //        ShowToast(this, "عذرًا , لم تتم العملية.", "", "error");
    //    }
    //}
}