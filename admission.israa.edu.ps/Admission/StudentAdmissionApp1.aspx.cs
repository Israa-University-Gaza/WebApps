using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_StudentAdmissionApp1 : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Session["StdID"] != null)
                lblStudentID.Text = Session["StdID"].ToString();
            DataTable DT4 = DataAccess.StudentImageGet(lblStudentID.Text);
            if (DT4.Rows.Count > 0)
            {
                if (!Convert.IsDBNull(DT4.Rows[0]["StudentImage"]))
                {
                    // Get the byte array from image file
                    byte[] imgBytes = (byte[])DT4.Rows[0]["StudentImage"];

                    string imgString = Convert.ToBase64String(imgBytes);
                    //Set the source with data:image/bmp
                    image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                }
            }
            else
                Response.Redirect("~/Admission/ShowAdmissionApplication.aspx");

            DataTable DT1 = DataAccess.StudentMainDataGet(lblStudentID.Text);
            DataTable DT2 = DataAccess.StudentSuperiorDataGet(lblStudentID.Text);
            DataTable DT3 = DataAccess.StudentContactDataGet(lblStudentID.Text);


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

                string CNationalityID = DT1.Rows[0]["CNationalityID"].ToString();
                if (CNationalityID != "" && CNationalityID != null)
                    ddlCNationalityID.SelectedValue = CNationalityID;

                string CReligionID = DT1.Rows[0]["CReligionID"].ToString();
                if (CReligionID != "" && CReligionID != null)
                    ddlCReligionID.SelectedValue = CReligionID;

                txtMotherName.Text = DT1.Rows[0]["MotherName"].ToString();
                txtFatherSSN.Text = DT1.Rows[0]["FatherSSN"].ToString();

                string CStatusID = DT1.Rows[0]["CStatusID"].ToString();
                if (CStatusID != "" && CStatusID != null) ddlCStatusID.SelectedValue = CStatusID;

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
                txtSuperiorSSN.Text = (ddlCSuperiorLink.SelectedItem.Text == "أب") ? DT1.Rows[0]["FatherSSN"].ToString() : DT2.Rows[0]["SuperiorSSN"].ToString();
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

        }
        RunJQuery();
    }

    protected void btnSaveMainData_Click(object sender, EventArgs e)
    {
        bool DateValidate = DateValidateControls(new WebControl[] { txtDateOfBirth });
        bool Validate = ValidateControls(new WebControl[] { ddlCNationalityID, ddlCReligionID, ddlCStatusID, txtArFirstName, txtArSecoundName, txtArThirdName, txtArFamilyName, txtEnFirstName, txtEnSecoundName, txtEnThirdName, txtEnFamilyName, ((txtSSN.Text == "") && (txtPassport.Text == "")) ? txtSSN : null });
        bool IDValidate = IDValidateControls(new WebControl[] { txtFatherSSN, (txtSSN.Text != "") ? txtSSN : null, (ddlCStatusID.SelectedItem.Text == "متزوج") ? txtNextSSN : null });

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

    protected void ddlCStatusID_SelectedIndexChanged(object sender, EventArgs e)
    {
        Status.Visible = (ddlCStatusID.SelectedItem.Text == "متزوج");
        RunJQuery();
    }

    protected void btnSaveSuperiorData_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlCSuperiorLink, txtSuperiorName, txtSuperiorAddress, ddlCSuperiorJopID, txtSuperiorPlaceJop, (ddlCSuperiorLink.SelectedItem.Text == "غير ذلك") ? txtSuperiorLink : null, (ddlCSuperiorJopID.SelectedItem.Text == "غير ذلك") ? txtSuperiorJop : null });
        bool IntValidate = IntValidateControls(new WebControl[] { txtSuperiorMobile, txtSuperiorPhone });
        bool IDValidate = IDValidateControls(new WebControl[] { txtSuperiorSSN });

        if (Validate && IntValidate && IDValidate)
        {
            if (DataAccess.StudentSuperiorDataAddEdit(lblStudentID.Text, txtSuperiorSSN.Text, ddlCSuperiorLink.SelectedValue, txtSuperiorLink.Text, txtSuperiorName.Text, txtSuperiorAddress.Text, ddlCSuperiorJopID.SelectedValue, txtSuperiorJop.Text, txtSuperiorPlaceJop.Text, txtSuperiorMobile.Text, txtSuperiorPhone.Text) > 0)
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
            if (DataAccess.StudentContactDataAddEdit(lblStudentID.Text, ddlCountryID.SelectedValue, ddlGovernoratesID.SelectedValue, ddlCityID.SelectedValue, txtNeighborhood.Text, txtStreet.Text, txtHomeNo.Text, txtAddressDetails.Text, txtPhone.Text, txtMobile.Text, txtEmail.Text) > 0)
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
    public void ShowMsg3(string msg = "", string status = "warning")
    {
        lblMsg3.Text = msg;
        divMsg3.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg3.Visible = (msg != "");
    }

    public void ShowMsg4(string msg = "", string status = "warning")
    {
        lblMsg4.Text = msg;
        divMsg4.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg4.Visible = (msg != "");
    }

    public void RunJQuery()
    {
        String s = "$('document').ready(function () {$('.date-picker').datepicker({rtl: true, orientation: 'right', autoclose: true,format: 'yyyy/mm/dd',});" +
                       "$('.select').select2({placeholder: 'إختر من القائمة', allowClear: true});" +
                       "$('.numeric').keyup(function () { if (this.value.match(/[^0-9]/g)) {this.value = this.value.replace(/[^0-9]/g, '');}});});";
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "customScript", s, true);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlDepartment }))
        {
            DataTable DT = DataAccess.AdmissionAccreditStudent(lblStudentID.Text, ddlDepartment.SelectedValue, EmployeeID);
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                SendSMS(DT.Rows[0]["jawwal"].ToString(), DT.Rows[0]["smstext"].ToString());
                ShowMsg4(DT.Rows[0]["msg"].ToString(), "success");
            }
            else
            {
                ShowMsg4(DT.Rows[0]["msg"].ToString(), "danger");
            }
        }
        else
        {
            ShowMsg4("يجب اختيار القسم", "danger");
        }
        RunJQuery();
    }
    protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDepartment.DataBind();
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

}