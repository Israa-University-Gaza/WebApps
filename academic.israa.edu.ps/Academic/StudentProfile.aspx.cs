using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_StudentProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        int tab = Convert.ToInt32(Request.QueryString["tab"]);

        tab1.Attributes.Add("class", (tab == 1) ? "tab-pane active" : "tab-pane");
        tab2.Attributes.Add("class", (tab == 2) ? "tab-pane active" : "tab-pane");
        tab3.Attributes.Add("class", (tab == 3) ? "tab-pane active" : "tab-pane");


        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                lblStudentID.Text = Request.QueryString["id"];

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
            }
            else
                Response.Redirect("~/Academic/Students.aspx");
        }
        else if (lblStudentID.Text == "")
        {
            Response.Redirect("~/Academic/Students.aspx");
        }
    }


}