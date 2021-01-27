using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdmissionApp_MainData : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable DT = DA.StudentMainDataGet(UserPage.StudentID);
            if (DT.Rows.Count > 0)
            {
                lbSuperiorData.Visible = !DT.Rows[0]["ArFirstName"].ToString().Equals("");

                txtArFirstName.Text = DT.Rows[0]["ArFirstName"].ToString();
                txtArSecoundName.Text = DT.Rows[0]["ArSecoundName"].ToString();
                txtArThirdName.Text = DT.Rows[0]["ArThirdName"].ToString();
                txtArFamilyName.Text = DT.Rows[0]["ArFamilyName"].ToString();
                txtEnFirstName.Text = DT.Rows[0]["EnFirstName"].ToString();
                txtEnSecoundName.Text = DT.Rows[0]["EnSecoundName"].ToString();
                txtEnThirdName.Text = DT.Rows[0]["EnThirdName"].ToString();
                txtEnFamilyName.Text = DT.Rows[0]["EnFamilyName"].ToString();

                txtSSN.Text = DT.Rows[0]["SSN"].ToString();
                txtPassport.Text = DT.Rows[0]["Passport"].ToString();
                txtDateOfBirth.Text = DT.Rows[0]["DateOfBirth"].ToString();

                txtPlaceOfBirth.Text = DT.Rows[0]["PlaceOfBirth"].ToString();

                string CNationalityID = DT.Rows[0]["CNationalityID"].ToString();
                if (CNationalityID != "" && CNationalityID != null)
                    ddlCNationalityID.SelectedValue = CNationalityID;

                string CReligionID = DT.Rows[0]["CReligionID"].ToString();
                if (CReligionID != "" && CReligionID != null)
                    ddlCReligionID.SelectedValue = CReligionID;

                txtMotherName.Text = DT.Rows[0]["MotherName"].ToString();
                txtFatherSSN.Text = DT.Rows[0]["FatherSSN"].ToString();

                string CStatusID = DT.Rows[0]["CStatusID"].ToString();
                if (CStatusID != "" && CStatusID != null) ddlCStatusID.SelectedValue = CStatusID;

                Status.Visible = (CStatusID == "10");

                txtNextSSN.Text = DT.Rows[0]["NextSSN"].ToString();

                rbMale.Checked = (DT.Rows[0]["Gender"].ToString() == "1");
                rbFemale.Checked = (DT.Rows[0]["Gender"].ToString() == "2");

                string CHealthStatusID = DT.Rows[0]["CHealthStatusID"].ToString();
                if (CHealthStatusID != "" && CHealthStatusID != null)
                {
                    ddlCHealthStatusID.DataBind();
                    ddlCHealthStatusID.SelectedValue = CHealthStatusID;
                }

                DiseaseType.Visible = (CHealthStatusID == "60");
                txtDiseaseType.Text = DT.Rows[0]["DiseaseType"].ToString();

                rbDisabilityOk.Checked = (Convert.ToBoolean(DT.Rows[0]["Disability"]) == true);

                Disability.Visible = (rbDisabilityOk.Checked == true);
                txtDisabilityStatus.Text = DT.Rows[0]["DisabilityStatus"].ToString();

            }
        }
    }

    protected void ddlCStatusID_SelectedIndexChanged(object sender, EventArgs e)
    {
        Status.Visible = (ddlCStatusID.SelectedValue == "10");
    }
    protected void btnSaveMainData_Click(object sender, EventArgs e)
    {
        bool DateValidate = DateValidateControls(new WebControl[] { txtDateOfBirth });
        bool Validate = ValidateControls(new WebControl[] { (txtDiseaseType.Visible == true) ? txtDiseaseType : null, (txtDisabilityStatus.Visible == true) ? txtDisabilityStatus : null, ddlCNationalityID, ddlCReligionID, ddlCStatusID, ddlCHealthStatusID, txtArFirstName, txtArSecoundName, txtArThirdName, txtArFamilyName, txtEnFirstName, txtEnSecoundName, txtEnThirdName, txtEnFamilyName, ((txtSSN.Text == "") && (txtPassport.Text == "")) ? txtSSN : null, txtPlaceOfBirth, txtMotherName });

        bool intValidate = IntValidateControls(new WebControl[] { txtFatherSSN, txtSSN });

        if (DateValidate && Validate && intValidate)
        {
            if (DA.StudentMainDataAddEdit(
                    UserPage.StudentID,
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
                lbSuperiorData.Visible = true;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
            }
            else
            {
                ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
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
    protected void lbSuperiorData_Click(object sender, EventArgs e)
    {
        Response.Redirect("SuperiorData.aspx");
    }
}