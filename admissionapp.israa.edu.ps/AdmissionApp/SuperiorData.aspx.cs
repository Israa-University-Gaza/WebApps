using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdmissionApp_SuperiorDate : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            DataTable DT = DA.StudentSuperiorDataGet(UserPage.StudentID);
            DataTable DT1 = DA.StudentMainDataGet(UserPage.StudentID);
            if (DT.Rows.Count > 0)
            {
                lbContactData.Visible = !DT.Rows[0]["SuperiorName"].ToString().Equals("");

                ddlCSuperiorLink.DataBind();
                string CSuperiorLink = DT.Rows[0]["CSuperiorLink"].ToString();
                if (CSuperiorLink != "" && CSuperiorLink != null)
                {
                    ddlCSuperiorLink.SelectedValue = CSuperiorLink;
                    link.Visible = (ddlCSuperiorLink.SelectedItem.Text == "غير ذلك");
                }

                txtSuperiorLink.Text = DT.Rows[0]["SuperiorLink"].ToString();

                lblFatherSSN.Text = DT1.Rows[0]["FatherSSN"].ToString();
                txtSuperiorSSN.Text = (ddlCSuperiorLink.SelectedItem.Text == "أب") ? DT1.Rows[0]["FatherSSN"].ToString() : DT.Rows[0]["SuperiorSSN"].ToString();
                txtSuperiorSSN.Enabled = (ddlCSuperiorLink.SelectedItem.Text != "أب");

                txtSuperiorName.Text = DT.Rows[0]["SuperiorName"].ToString();

                ddlCSuperiorJopID.DataBind();
                string CSuperiorJopID = DT.Rows[0]["CSuperiorJopID"].ToString();
                if (CSuperiorJopID != "" && CSuperiorJopID != null)
                    ddlCSuperiorJopID.SelectedValue = CSuperiorJopID;

                txtSuperiorJop.Text = DT.Rows[0]["SuperiorJop"].ToString();
                job.Visible = (ddlCSuperiorJopID.SelectedItem.Text == "غير ذلك");

                txtSuperiorAddress.Text = DT.Rows[0]["SuperiorAddress"].ToString();
                txtSuperiorPlaceJop.Text = DT.Rows[0]["SuperiorPlaceJop"].ToString();
                txtSuperiorMobile.Text = DT.Rows[0]["SuperiorMobile"].ToString();
                txtSuperiorPhone.Text = DT.Rows[0]["SuperiorPhone"].ToString();
            }
        }
    }

    protected void ddlCSuperiorLink_SelectedIndexChanged(object sender, EventArgs e)
    {
        link.Visible = (ddlCSuperiorLink.SelectedItem.Text == "غير ذلك");
        txtSuperiorSSN.Text = (ddlCSuperiorLink.SelectedItem.Text == "أب") ? lblFatherSSN.Text : txtSuperiorSSN.Text;
        txtSuperiorSSN.Enabled = (ddlCSuperiorLink.SelectedItem.Text != "أب");
    }
    protected void ddlCSuperiorJopID_SelectedIndexChanged(object sender, EventArgs e)
    {
        job.Visible = (ddlCSuperiorJopID.SelectedItem.Text == "غير ذلك");
    }


    protected void btnSaveSuperiorData_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlCSuperiorLink, txtSuperiorName, txtSuperiorAddress, ddlCSuperiorJopID, txtSuperiorPlaceJop, (ddlCSuperiorLink.SelectedItem.Text == "غير ذلك") ? txtSuperiorLink : null, (ddlCSuperiorJopID.SelectedItem.Text == "غير ذلك") ? txtSuperiorJop : null });
        bool IntValidate = IntValidateControls(new WebControl[] { txtSuperiorMobile, txtSuperiorPhone });
        bool IDValidate = IDValidateControls(new WebControl[] { txtSuperiorSSN });
        if (Validate && IntValidate && IDValidate)
        {
            if (DA.StudentSuperiorDataAddEdit(UserPage.StudentID, txtSuperiorSSN.Text, ddlCSuperiorLink.SelectedValue, txtSuperiorLink.Text, txtSuperiorName.Text, txtSuperiorAddress.Text, ddlCSuperiorJopID.SelectedValue, txtSuperiorJop.Text, txtSuperiorPlaceJop.Text, txtSuperiorMobile.Text, txtSuperiorPhone.Text) > 0)
            {
                lbContactData.Visible = true;
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
    protected void lbContactData_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContactData.aspx");
    }
}