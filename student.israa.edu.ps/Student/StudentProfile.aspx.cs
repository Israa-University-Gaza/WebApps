using System;
using System.Data;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_StudentProfile : UserPage
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
        if (!DataAccess.IsStudentFinishEvaluation(StudentID))
        {
            Response.Redirect("EvaluationChooseEmployeeCourse.aspx");
        }

       
        if (!IsPostBack)
        {

            DataTable DT = DataAccess.StudentImageGet(StudentID);
            if (DT.Rows.Count > 0)
            {
                if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
                {
                    byte[] imgBytes = (byte[])DT.Rows[0]["StudentImage"];
                    string imgString = Convert.ToBase64String(imgBytes);
                    image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                }
                else
                {
                    image.Src = "../images/std.jpg";
                }
            }

            DataTable DT1 = DataAccess.StudentMainDataGet(StudentID);
            DataTable DT2 = DataAccess.StudentSuperiorDataGet(StudentID);
            DataTable DT3 = DataAccess.StudentContactDataGet(StudentID);
            DataTable DT4 = DataAccess.StudentOtherDataGet(StudentID);


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
            }


            if (DT2.Rows.Count > 0)
            {
                ddlCSuperiorLink.DataBind();
                string CSuperiorLink = DT2.Rows[0]["CSuperiorLink"].ToString();
                if (CSuperiorLink != "" && CSuperiorLink != null)
                {
                    ddlCSuperiorLink.SelectedValue = CSuperiorLink;
                    link.Visible = (ddlCSuperiorLink.SelectedItem.Text == "أخرى");
                }

                txtSuperiorLink.Text = DT2.Rows[0]["SuperiorLink"].ToString();

                lblFatherSSN.Text = DT1.Rows[0]["FatherSSN"].ToString();
                txtSuperiorSSN.Text = (ddlCSuperiorLink.SelectedItem.Text == "أب") ? DT1.Rows[0]["FatherSSN"].ToString() : DT2.Rows[0]["SuperiorSSN"].ToString();
                txtSuperiorSSN.Enabled = (ddlCSuperiorLink.SelectedItem.Text != "أب");

                txtSuperiorName.Text = DT2.Rows[0]["SuperiorName"].ToString();

                ddlCSuperiorJopID.DataBind();
                string CSuperiorJopID = DT2.Rows[0]["CSuperiorJopID"].ToString();
                if (CSuperiorJopID != "" && CSuperiorJopID != null)
                    ddlCSuperiorJopID.SelectedValue = CSuperiorJopID;

                txtSuperiorJop.Text = DT2.Rows[0]["SuperiorJop"].ToString();
                job.Visible = (ddlCSuperiorJopID.SelectedItem.Text == "أخرى");

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

            if (DT4.Rows.Count > 0)
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
        }

    }

    protected void lbSignOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }

    protected void btnSaveMainData_Click(object sender, EventArgs e)
    {
        bool DateValidate = DateValidateControls(new WebControl[] { txtDateOfBirth });
        bool Validate = ValidateControls(new WebControl[] { ddlCNationalityID, ddlCReligionID, ddlCStatusID, txtArFirstName, txtArSecoundName, txtArThirdName, txtArFamilyName, txtEnFirstName, txtEnSecoundName, txtEnThirdName, txtEnFamilyName, ((txtSSN.Text == "") && (txtPassport.Text == "")) ? txtSSN : null });
        bool IDValidate = IDValidateControls(new WebControl[] { txtFatherSSN, (txtSSN.Text != "") ? txtSSN : null, (ddlCStatusID.SelectedItem.Text == "متزوج") ? txtNextSSN : null });

        if (DateValidate && Validate && IDValidate)
        {
            if (DataAccess.StudentMainDataAddEdit(StudentID,
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
                    (rbMale.Checked ? "1" : "2")) > 0)
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


    protected void btnSaveOtherData_Click(object sender, EventArgs e)
    {
        int result = DataAccess.CompleteStudentData(StudentID, DDLHouseType.SelectedValue, rBtnFatherStatus.SelectedValue == "1" ? true : false,
          DDLStdStatus.SelectedValue, txtOriginalTown.Text, rBtnHaveOtherNationality.SelectedValue == "1" ? true : false, txtOtherNationality.Text, txtFamilyNo.Text,
          txtStdsUnivNo.Text, txtStdFSerialNo.Text, txtFIncome.Text, DDLFurStatus.SelectedValue, rBtnHavePrisoner.SelectedValue == "1" ? true : false,
          txtPrisName.Text, rbtnHaveMartyr.SelectedValue == "1" ? true : false, txtMartyr.Text);
        if (result == 1)
        {
            ShowMsg1("تم الحفظ بنجاح .", "success");
        }
        else
        {
            ShowMsg1("عذرًا , لم تتم الحفظ .", "danger");
        }

        RunJQuery();
    }
    protected void ddlCStatusID_SelectedIndexChanged(object sender, EventArgs e)
    {
        Status.Visible = (ddlCStatusID.SelectedItem.Text == "متزوج");
        RunJQuery();
    }

    protected void btnSaveSuperiorData_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlCSuperiorLink, txtSuperiorName, txtSuperiorAddress, ddlCSuperiorJopID, txtSuperiorPlaceJop, (ddlCSuperiorLink.SelectedItem.Text == "أخرى") ? txtSuperiorLink : null, (ddlCSuperiorJopID.SelectedItem.Text == "أخرى") ? txtSuperiorJop : null });
        bool IntValidate = IntValidateControls(new WebControl[] { txtSuperiorMobile, txtSuperiorPhone });
        bool IDValidate = IDValidateControls(new WebControl[] { txtSuperiorSSN });

        if (Validate && IntValidate && IDValidate)
        {
            if (DataAccess.StudentSuperiorDataAddEdit(StudentID, txtSuperiorSSN.Text, ddlCSuperiorLink.SelectedValue, txtSuperiorLink.Text, txtSuperiorName.Text, txtSuperiorAddress.Text, ddlCSuperiorJopID.SelectedValue, txtSuperiorJop.Text, txtSuperiorPlaceJop.Text, txtSuperiorMobile.Text, txtSuperiorPhone.Text) > 0)
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
        bool Validate = ValidateControls(new WebControl[] { ddlCountryID, ddlGovernoratesID, ddlCityID, txtNeighborhood, txtStreet, txtHomeNo, txtAddressDetails });
        bool IntValidate = IntValidateControls(new WebControl[] { txtPhone, txtMobile });
        bool EmailValidate = EmailValidateControls(new WebControl[] { txtEmail });

        if (Validate && IntValidate && EmailValidate)
        {
            if (DataAccess.StudentContactDataAddEdit(StudentID, ddlCountryID.SelectedValue, ddlGovernoratesID.SelectedValue, ddlCityID.SelectedValue, txtNeighborhood.Text, txtStreet.Text, txtHomeNo.Text, txtAddressDetails.Text, txtPhone.Text, txtMobile.Text, txtEmail.Text) > 0)
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
        link.Visible = (ddlCSuperiorLink.SelectedItem.Text == "أخرى");
        txtSuperiorSSN.Text = (ddlCSuperiorLink.SelectedItem.Text == "أب") ? lblFatherSSN.Text : txtSuperiorSSN.Text;
        txtSuperiorSSN.Enabled = (ddlCSuperiorLink.SelectedItem.Text != "أب");
        RunJQuery();
    }

    protected void ddlCSuperiorJopID_SelectedIndexChanged(object sender, EventArgs e)
    {
        job.Visible = (ddlCSuperiorJopID.SelectedItem.Text == "أخرى");
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
    public void ShowMsg3(string msg = "", string status = "warning")
    {
        lblMsg3.Text = msg;
        divMsg3.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg3.Visible = (msg != "");
    }

    public void RunJQuery()
    {
        String s = "$('document').ready(function () {$('.date-picker').datepicker({rtl: true, orientation: 'right', autoclose: true,format: 'yyyy/mm/dd',});" +
                       "$('.select').select2({placeholder: 'إختر من القائمة', allowClear: true});" +
                       "$('.numeric').keyup(function () { if (this.value.match(/[^0-9]/g)) {this.value = this.value.replace(/[^0-9]/g, '');}});});";
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "customScript", s, true);
    }
}