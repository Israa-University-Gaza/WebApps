using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdmissionApp_ContactData : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable DT = DA.StudentContactDataGet(UserPage.StudentID);
            if (DT.Rows.Count > 0)
            {
                lbStudentWishes.Visible = !DT.Rows[0]["Neighborhood"].ToString().Equals("");

                ddlCountryID.DataBind();
                string CountryID = DT.Rows[0]["CountryID"].ToString();
                if (CountryID != "" && CountryID != null)
                    ddlCountryID.SelectedValue = CountryID;

                ddlGovernoratesID.DataBind();
                string GovernoratesID = DT.Rows[0]["GovernoratesID"].ToString();
                if (GovernoratesID != "" && GovernoratesID != null)
                    ddlGovernoratesID.SelectedValue = GovernoratesID;

                ddlCityID.DataBind();
                string CityID = DT.Rows[0]["CityID"].ToString();
                if (CityID != "" && CityID != null)
                    ddlCityID.SelectedValue = CityID;

                txtNeighborhood.Text = DT.Rows[0]["Neighborhood"].ToString();
                txtStreet.Text = DT.Rows[0]["Street"].ToString();
                txtHomeNo.Text = DT.Rows[0]["HomeNo"].ToString();
                txtAddressDetails.Text = DT.Rows[0]["AddressDetails"].ToString();
                txtPhone.Text = DT.Rows[0]["Phone"].ToString();
                txtMobile.Text = DT.Rows[0]["Mobile"].ToString();
                txtEmail.Text = DT.Rows[0]["Email"].ToString();
            }
        }
    }

    protected void btnSaveContactData_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlCountryID, ddlGovernoratesID, ddlCityID, txtNeighborhood, txtStreet, txtAddressDetails });
        bool IntValidate = IntValidateControls(new WebControl[] { txtPhone, txtMobile });
        //bool EmailValidate = EmailValidateControls(new WebControl[] { txtEmail });
        //&& EmailValidate
        if (Validate && IntValidate)
        {
            if (DA.StudentContactDataAddEdit(UserPage.StudentID, ddlCountryID.SelectedValue, ddlGovernoratesID.SelectedValue, ddlCityID.SelectedValue, txtNeighborhood.Text, txtStreet.Text, txtHomeNo.Text, txtAddressDetails.Text, txtPhone.Text, txtMobile.Text, txtEmail.Text) > 0)
            {
                lbStudentWishes.Visible = true;
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
    protected void lbStudentWishes_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentWishes.aspx");
    }
}