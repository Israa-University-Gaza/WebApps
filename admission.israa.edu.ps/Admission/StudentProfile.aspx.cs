using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StudentProfile : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        int tab = Convert.ToInt32(Request.QueryString["tab"]);

        tab1.Attributes.Add("class", (tab == 201) ? "tab-pane active" : "tab-pane");
        tab2.Attributes.Add("class", (tab == 202) ? "tab-pane active" : "tab-pane");
        tab3.Attributes.Add("class", (tab == 203) ? "tab-pane active" : "tab-pane");
        tab4.Attributes.Add("class", (tab == 204) ? "tab-pane active" : "tab-pane");

        if (!IsPostBack)
        {
           // try
            //{
                lblEmployeeID.Text = EmployeeID;
                if (Request.QueryString["id"] != null)
                {
                    lblStudentID.Text = Request.QueryString["id"].ToString();
                    DataTable DT5 = DataAccess.GetStudentData(lblStudentID.Text);
                    lblStdStatusID.Text = DT5.Rows[0]["StdStatusID"].ToString();


                    DataTable DT1 = DataAccess.StudentMainDataGet(lblStudentID.Text);
                    DataTable DT2 = DataAccess.StudentSuperiorDataGet(lblStudentID.Text);
                    DataTable DT3 = DataAccess.StudentContactDataGet(lblStudentID.Text);
                    DataTable DT4 = DataAccess.StudentOtherDataGet(lblStudentID.Text);

                    if (DT1.Rows.Count > 0)
                    {
                        txtArFirstName.Text = DT1.Rows[0]["ArFirstName"].ToString();
                        txtArSecoundName.Text = DT1.Rows[0]["ArSecoundName"].ToString();
                        txtArThirdName.Text = DT1.Rows[0]["ArThirdName"].ToString();
                        txtArFamilyName.Text = DT1.Rows[0]["ArFamilyName"].ToString();
                        txtEnFirstName.Text = DT1.Rows[0]["EnFirstName"].ToString();
                        txtEnSecoundName.Text = DT1.Rows[0]["EnSecoundName"].ToString();
                        txtEnThirdName.Text = DT1.Rows[0]["EnThirdName"].ToString();
                        txtEnFamilyName.Text = DT1.Rows[0]["EnFamilyName"].ToString();

                        txtSSN.Text = DT1.Rows[0]["SSN"].ToString();
                        txtPassport.Text = DT1.Rows[0]["Passport"].ToString();

                        txtDateOfBirth.Text = DT1.Rows[0]["DateOfBirth"].ToString();
                        txtPlaceOfBirth.Text = DT1.Rows[0]["PlaceOfBirth"].ToString();

                        ddlCNationalityID.DataBind();
                        string CNationalityID = DT1.Rows[0]["CNationalityID"].ToString();
                        if (CNationalityID != "" && CNationalityID != null)
                            ddlCNationalityID.SelectedValue = CNationalityID;

                        ddlCReligionID.DataBind();
                        string CReligionID = DT1.Rows[0]["CReligionID"].ToString();
                        if (CReligionID != "" && CReligionID != null)
                            ddlCReligionID.SelectedValue = CReligionID;

                        txtMotherName.Text = DT1.Rows[0]["MotherName"].ToString();
                        txtFatherSSN.Text = DT1.Rows[0]["FatherSSN"].ToString();

                        ddlCStatusID.DataBind();
                        string CStatusID = DT1.Rows[0]["CStatusID"].ToString();
                        if (CStatusID != "" && CStatusID != null)
                            ddlCStatusID.SelectedValue = CStatusID;

                        Status.Visible = (CStatusID == "10");
                        txtNextSSN.Text = DT1.Rows[0]["NextSSN"].ToString();

                        rbMale.Checked = (DT1.Rows[0]["Gender"].ToString() == "1");
                        rbFemale.Checked = (DT1.Rows[0]["Gender"].ToString() == "2");

                        string CHealthStatusID = DT1.Rows[0]["CHealthStatusID"].ToString();
                        if (CHealthStatusID != "" && CHealthStatusID != null)
                        {
                            ddlCHealthStatusID.DataBind();
                            ddlCHealthStatusID.SelectedValue = CHealthStatusID;
                        }

                        DiseaseType.Visible = (CHealthStatusID == "60");
                        txtDiseaseType.Text = DT1.Rows[0]["DiseaseType"].ToString();

                        rbDisabilityOk.Checked = (Convert.ToBoolean(DT1.Rows[0]["Disability"]) == true);

                        Disability.Visible = (rbDisabilityOk.Checked == true);
                        txtDisabilityStatus.Text = DT1.Rows[0]["DisabilityStatus"].ToString();
                    }


                    if (DT2.Rows.Count > 0)
                    {
                        ddlCSuperiorLink.DataBind();
                        string CSuperiorLink = DT2.Rows[0]["CSuperiorLink"].ToString();
                        if (CSuperiorLink != "" && CSuperiorLink != null)
                        {
                            ddlCSuperiorLink.SelectedValue = CSuperiorLink;
                            link.Visible = (ddlCSuperiorLink.SelectedItem.Text == "غير ذلك");
                        }

                        txtSuperiorLink.Text = DT2.Rows[0]["SuperiorLink"].ToString();

                        lblFatherSSN.Text = DT1.Rows[0]["FatherSSN"].ToString();
                        txtSuperiorSSN.Text = (ddlCSuperiorLink.SelectedItem.Text == "أب")
                            ? DT1.Rows[0]["FatherSSN"].ToString()
                            : DT2.Rows[0]["SuperiorSSN"].ToString();
                        txtSuperiorSSN.Enabled = (ddlCSuperiorLink.SelectedItem.Text != "أب");

                        txtSuperiorName.Text = DT2.Rows[0]["SuperiorName"].ToString();

                        ddlCSuperiorJopID.DataBind();
                        string CSuperiorJopID = DT2.Rows[0]["CSuperiorJopID"].ToString();
                        if (CSuperiorJopID != "" && CSuperiorJopID != null)
                            ddlCSuperiorJopID.SelectedValue = CSuperiorJopID;

                        txtSuperiorJop.Text = DT2.Rows[0]["SuperiorJop"].ToString();
                        job.Visible = (ddlCSuperiorJopID.SelectedItem.Text == "غير ذلك");

                        txtSuperiorAddress.Text = DT2.Rows[0]["SuperiorAddress"].ToString();
                        txtSuperiorPlaceJop.Text = DT2.Rows[0]["SuperiorPlaceJop"].ToString();
                        txtSuperiorMobile.Text = DT2.Rows[0]["SuperiorMobile"].ToString();
                        txtSuperiorPhone.Text = DT2.Rows[0]["SuperiorPhone"].ToString();
                    }

                    if (DT3.Rows.Count > 0)
                    {
                        ddlCountryID.DataBind();
                        string CountryID = DT3.Rows[0]["CountryID"].ToString();
                        if (CountryID != "" && CountryID != null)
                            ddlCountryID.SelectedValue = CountryID;

                        ddlGovernoratesID.DataBind();
                        string GovernoratesID = DT3.Rows[0]["GovernoratesID"].ToString();
                        if (GovernoratesID != "" && GovernoratesID != null)
                            ddlGovernoratesID.SelectedValue = GovernoratesID;

                        ddlCityID.DataBind();
                        string CityID = DT3.Rows[0]["CityID"].ToString();
                        if (CityID != "" && CityID != null)
                            ddlCityID.SelectedValue = CityID;

                        txtNeighborhood.Text = DT3.Rows[0]["Neighborhood"].ToString();
                        txtStreet.Text = DT3.Rows[0]["Street"].ToString();
                        txtHomeNo.Text = DT3.Rows[0]["HomeNo"].ToString();
                        txtAddressDetails.Text = DT3.Rows[0]["AddressDetails"].ToString();
                        txtPhone.Text = DT3.Rows[0]["Phone"].ToString();
                        txtMobile.Text = DT3.Rows[0]["Mobile"].ToString();
                        txtEmail.Text = DT3.Rows[0]["Email"].ToString();
                    }

                    if(DT4.Rows.Count > 0)
                    {
                        if (!string.IsNullOrEmpty(DT4.Rows[0]["IsDeadFather"].ToString()))
                        {
                            rBtnFatherStatus.SelectedValue = DT4.Rows[0]["IsDeadFather"].ToString() == "True" ? "1" : "0";
                            txtOriginalTown.Text = DT4.Rows[0]["StdOriginalTown"].ToString();
                            rBtnHaveOtherNationality.SelectedValue = DT4.Rows[0]["HaveOtherNationality"].ToString() == "True" ? "1" : "0";
                            txtOtherNationality.Text = DT4.Rows[0]["OtherNationalityName"].ToString();
                            txtFamilyNo.Text = DT4.Rows[0]["FamilyNo"].ToString();
                            txtStdsUnivNo.Text = DT4.Rows[0]["univStdsNo"].ToString();
                            txtStdFSerialNo.Text = DT4.Rows[0]["FamilySerialNo"].ToString();
                            txtFIncome.Text = DT4.Rows[0]["FIncome"].ToString();

                            DDLHouseType.SelectedValue = DT4.Rows[0]["HouseTypeId"].ToString();
                            DDLStdStatus.SelectedValue = DT4.Rows[0]["StdCitizenOrRefId"].ToString();
                            DDLFurStatus.SelectedValue = DT4.Rows[0]["FurStatusId"].ToString();
                            rBtnHavePrisoner.SelectedValue = DT4.Rows[0]["HavePrisoner"].ToString() == "True" ? "1" : "0";
                            txtPrisName.Text = DT4.Rows[0]["PrisonerName"].ToString();
                            rbtnHaveMartyr.SelectedValue = DT4.Rows[0]["HaveMartyr"].ToString() == "True" ? "1" : "0";
                            txtMartyr.Text = DT4.Rows[0]["MartyrName"].ToString();
                        }
                    }
                    ////////////////////
                    DataTable DT = DataAccess.StudentDepDataGet(lblStudentID.Text);
                    if (DT.Rows.Count > 0)
                    {
                        if (DT.Rows[0]["StudentTypeID"].ToString() == "1")
                        {
                            Label1.Text = DT.Rows[0]["StudentType"].ToString();

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

                        }
                        else
                        {
                            Label1.Text = DT.Rows[0]["StudentType"].ToString();

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

                            DataTable DTx = DataAccess.StudentTawjehyDataGet(lblStudentID.Text);
                            x.Visible = true;
                            xx.Visible = true;
                            xxx.Visible = true;
                            xxxx.Visible = true;
                            txtExpertYears.Text = DTx.Rows[0]["ExpertYears"].ToString();
                            txtOldDepartment.Text = DTx.Rows[0]["OldDepartment"].ToString();
                            txtOldUniversity.Text = DTx.Rows[0]["OldUniversity"].ToString();
                            txtOldUniversityGPA.Text = DTx.Rows[0]["OldUniversityGPA"].ToString();
                            txtShamelRate.Text = DTx.Rows[0]["ShamelRate"].ToString();
                            txtOldUniversityHours.Text = DTx.Rows[0]["OldUniversityHours"].ToString();
                        }
                    }

                    ////////////////////
                }
                else
                    Response.Redirect("~/Admission/Students.aspx");
           // }
           // catch (Exception ex)
           // {
            //    Response.Redirect("~/Admission/Students.aspx");
            //}
        }
        else if (lblStudentID.Text == "")
        {
            Response.Redirect("~/Admission/Students.aspx");
        }
    }


    protected void btnSaveMainData_Click(object sender, EventArgs e)
    {
        bool DateValidate = DateValidateControls(new WebControl[] { txtDateOfBirth });
        bool Validate = ValidateControls(new WebControl[]
        {
            ddlCNationalityID, ddlCReligionID, ddlCStatusID, txtArFirstName, txtArSecoundName, txtArThirdName,
            txtArFamilyName, txtEnFirstName, txtEnSecoundName, txtEnThirdName, txtEnFamilyName,
            ((txtSSN.Text == "") && (txtPassport.Text == "")) ? txtSSN : null
        });
        bool IDValidate = IDValidateControls(new WebControl[]
        {
            txtFatherSSN, (txtSSN.Text != "") ? txtSSN : null,
            (ddlCStatusID.SelectedItem.Text == "متزوج") ? txtNextSSN : null
        });

        if (DateValidate && Validate && IDValidate)
        {
            if (DataAccess.StudentMainDataAddEdit(
                    lblStudentID.Text,
                    txtArFirstName.Text, txtArSecoundName.Text, txtArThirdName.Text, txtArFamilyName.Text,
                    txtEnFirstName.Text, txtEnSecoundName.Text, txtEnThirdName.Text, txtEnFamilyName.Text,
                    txtSSN.Text, txtPassport.Text,
                    txtPlaceOfBirth.Text,
                    Convert.ToDateTime(txtDateOfBirth.Text),
                    ddlCNationalityID.SelectedValue,
                    ddlCReligionID.SelectedValue,
                    txtMotherName.Text,
                    txtFatherSSN.Text,
                    ddlCStatusID.SelectedValue,
                    txtNextSSN.Text,
                    (rbMale.Checked ? "1" : "2"),
                    ddlCHealthStatusID.SelectedValue, txtDiseaseType.Text,
                    (rbDisabilityOk.Checked ? true : false), txtDisabilityStatus.Text) > 0)
            {
                ShowMsg1("تم الحفظ بنجاح .", "success");
            }
            else
            {
                ShowMsg1("عذرًا , لم تتم الحفظ .", "danger");
            }
        }
        else
        {
            ShowMsg1("الرجاء تعبئة الحقول المطلوبة بشكل صحيح .", "danger");
        }

        RunJQuery();
    }

    protected void ddlCHealthStatusID_SelectedIndexChanged(object sender, EventArgs e)
    {
        DiseaseType.Visible = (ddlCHealthStatusID.SelectedValue == "60");
    }

    protected void rbDisabilityOk_CheckedChanged(object sender, EventArgs e)
    {
        Disability.Visible = (rbDisabilityOk.Checked == true);
    }

    protected void rbDisabilityNot_CheckedChanged(object sender, EventArgs e)
    {
        Disability.Visible = false;
    }

    protected void ddlCStatusID_SelectedIndexChanged(object sender, EventArgs e)
    {
        Status.Visible = (ddlCStatusID.SelectedItem.Text == "متزوج");
        RunJQuery();
    }

    protected void btnSaveSuperiorData_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[]
        {
            ddlCSuperiorLink, txtSuperiorName, txtSuperiorAddress, ddlCSuperiorJopID, txtSuperiorPlaceJop,
            (ddlCSuperiorLink.SelectedItem.Text == "غير ذلك") ? txtSuperiorLink : null,
            (ddlCSuperiorJopID.SelectedItem.Text == "غير ذلك") ? txtSuperiorJop : null
        });
        bool IntValidate = IntValidateControls(new WebControl[] { txtSuperiorMobile, txtSuperiorPhone });
        bool IDValidate = IDValidateControls(new WebControl[] { txtSuperiorSSN });

        if (Validate && IntValidate && IDValidate)
        {
            if (DataAccess.StudentSuperiorDataAddEdit(lblStudentID.Text, txtSuperiorSSN.Text,
                    ddlCSuperiorLink.SelectedValue, txtSuperiorLink.Text, txtSuperiorName.Text, txtSuperiorAddress.Text,
                    ddlCSuperiorJopID.SelectedValue, txtSuperiorJop.Text, txtSuperiorPlaceJop.Text,
                    txtSuperiorMobile.Text, txtSuperiorPhone.Text) > 0)
            {
                ShowMsg2("تم الحفظ بنجاح .", "success");
            }
            else
            {
                ShowMsg2("عذرًا , لم تتم الحفظ .", "danger");
            }
        }
        else
        {
            ShowMsg2("الرجاء تعبئة الحقول المطلوبة بشكل صحيح .", "danger");
        }

        RunJQuery();
    }

    protected void btnSaveContactData_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[]
            {ddlCountryID, ddlGovernoratesID, ddlCityID, txtNeighborhood, txtStreet, txtHomeNo, txtAddressDetails});
        bool IntValidate = IntValidateControls(new WebControl[] { txtPhone, txtMobile });
        //bool EmailValidate = EmailValidateControls(new WebControl[] { txtEmail });&& EmailValidate

        if (Validate && IntValidate)
        {
            if (DataAccess.StudentContactDataAddEdit(lblStudentID.Text, ddlCountryID.SelectedValue,
                    ddlGovernoratesID.SelectedValue, ddlCityID.SelectedValue, txtNeighborhood.Text, txtStreet.Text,
                    txtHomeNo.Text, txtAddressDetails.Text, txtPhone.Text, txtMobile.Text, txtEmail.Text) > 0)
            {
                ShowMsg3("تم الحفظ بنجاح .", "success");
            }
            else
            {
                ShowMsg3("عذرًا , لم تتم الحفظ .", "danger");
            }
        }
        else
        {
            ShowMsg3("الرجاء تعبئة الحقول المطلوبة بشكل صحيح .", "danger");
        }

        RunJQuery();
    }

    protected void ddlCSuperiorLink_SelectedIndexChanged(object sender, EventArgs e)
    {
        link.Visible = (ddlCSuperiorLink.SelectedItem.Text == "غير ذلك");
        txtSuperiorSSN.Text = (ddlCSuperiorLink.SelectedItem.Text == "أب") ? lblFatherSSN.Text : txtSuperiorSSN.Text;
        txtSuperiorSSN.Enabled = (ddlCSuperiorLink.SelectedItem.Text != "أب");
        RunJQuery();
    }

    protected void ddlCSuperiorJopID_SelectedIndexChanged(object sender, EventArgs e)
    {
        job.Visible = (ddlCSuperiorJopID.SelectedItem.Text == "غير ذلك");
        RunJQuery();
    }

    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg1.Visible = (msg != "");
    }

    public void ShowMsg2(string msg = "", string status = "warning")
    {
        lblMsg2.Text = msg;
        divMsg2.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg2.Visible = (msg != "");
    }

    public void ShowMsg4(string msg = "", string status = "warning")
    {
        lblMsg4.Text = msg;
        divMsg4.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg4.Visible = (msg != "");
    }

    public void ShowMsg3(string msg = "", string status = "warning")
    {
        lblMsg3.Text = msg;
        divMsg3.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg3.Visible = (msg != "");
    }

    public void RunJQuery()
    {
        String s =
            "$('document').ready(function () {$('.date-picker').datepicker({rtl: true, orientation: 'right', autoclose: true,format: 'yyyy/mm/dd',});" +
            "$('.select').select2({placeholder: 'إختر من القائمة', allowClear: true});" +
            "$('.numeric').keyup(function () { if (this.value.match(/[^0-9]/g)) {this.value = this.value.replace(/[^0-9]/g, '');}});});";
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "customScript", s, true);
    }

    protected void btStudentWishes_Click(object sender, EventArgs e)
    {
        bool IntValidate = IntValidateControls(new WebControl[] { ddlDepartment1, ddlDepartment2, ddlDepartment3 });
        bool Validate = ValidateControls(new WebControl[] { ddlDepartment1, ddlDepartment2, ddlDepartment3 });

        if (ddlDepartment1.SelectedValue != ddlDepartment2.SelectedValue &&
            ddlDepartment1.SelectedValue != ddlDepartment3.SelectedValue &&
            ddlDepartment2.SelectedValue != ddlDepartment3.SelectedValue)
        {
            if (Validate && IntValidate)
            {
                if (DataAccess.StudentTawjehyDataAddEdit(lblStudentID.Text, txtOldUniversity.Text,
                        txtOldDepartment.Text, txtOldUniversityHours.Text, txtOldUniversityGPA.Text, txtShamelRate.Text,
                        txtExpertYears.Text) > 0)
                {
                    ShowMsg4("تم الحفظ بنجاح .", "success");
                }
                else
                    ShowMsg4("عذرًا , لم تتم الحفظ .", "danger");
            }
            else
            {
                ShowMsg4("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
            }

        }
        else
        {
            ShowMsg4("الرجاء إختيار رغبات مختلفة.", "danger");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Repeater2.Items.Count > 0)
        {
            foreach (RepeaterItem item in Repeater2.Items)
            {
                Label AdmissionConditionID = (Label)item.FindControl("lblAdmissionConditionID");
                CheckBox cbIsValidate = (CheckBox)item.FindControl("cbIsValidate");
                TextBox txtNotes = (TextBox)item.FindControl("txtNotes");
                DataAccess.SetStudentCondition(lblStudentID.Text, AdmissionConditionID.Text, cbIsValidate.Checked,
                    txtNotes.Text, EmployeeID);
            }

            Repeater2.DataBind();
            ShowMsg4("تم اعتماد الشروط بنجاح", "success");
        }
        else
        {
            ShowMsg4("الرجاء اختيار الشروط المتحققة لدي الطالب", "danger");
        }
    }


    protected void btnSaveOtherData_Click(object sender, EventArgs e)
    {
        int result = DataAccess.CompleteStudentData(lblStudentID.Text, DDLHouseType.SelectedValue, rBtnFatherStatus.SelectedValue == "1" ? true : false,
          DDLStdStatus.SelectedValue, txtOriginalTown.Text, rBtnHaveOtherNationality.SelectedValue == "1" ? true : false, txtOtherNationality.Text, txtFamilyNo.Text,
          txtStdsUnivNo.Text, txtStdFSerialNo.Text, txtFIncome.Text, DDLFurStatus.SelectedValue, rBtnHavePrisoner.SelectedValue == "1" ? true : false,
          txtPrisName.Text, rbtnHaveMartyr.SelectedValue == "1" ? true : false, txtMartyr.Text);
        if(result==1)
        {
            ShowMsg1("تم الحفظ بنجاح .", "success");
        }
        else
        {
            ShowMsg1("عذرًا , لم تتم الحفظ .", "danger");
        }

        RunJQuery();
    }
}