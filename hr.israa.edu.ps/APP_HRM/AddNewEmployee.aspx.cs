using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_AddNewEmployee : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Permissions.Contains("AddNewEmployee"))
        {
            Response.Redirect("../Login.aspx");
        }


    }
    protected void ButtonReg_Click(object sender, EventArgs e)
    {
        //departmentID
        string departmentID;
        if (section.SelectedValue != "-1") departmentID = section.SelectedValue;
        else if (Department.SelectedValue != "-1") departmentID = Department.SelectedValue;
        else if (DDL.SelectedValue != "-1") departmentID = DDL.SelectedValue;
        else if (Unite.SelectedValue != "-1") departmentID = Unite.SelectedValue;
        else departmentID = ddlPresident.SelectedValue;
        //test
        //bool DateValidate = (DateValidateControls(new WebControl[] { txtFDate,txtSDate,txtTestFrom,txtTestTo}));
        //if (DateValidate) ShowToast(this, "ok.", "", "error");
        //else ShowToast(this, "عذرًا , لم تتم الحفظ.", "", "error");

        //DataTable DT = DataAccess.AddNewEmployee("", "2", "2", "200", true, "",
        //txtFirstName.Text, txtSecondName.Text, txtThirdName.Text, txtFamilyName.Text, "2", "2016",
        //"7", (subcontract.Visible != false) ? ddlContractSubType.SelectedValue : "-1", "", "", "", "",
        //txtSalary.Text, "3", CityID.SelectedValue, Region.SelectedValue, txtSSN.Text, (ddlAcademicData.SelectedValue == "1") ? true : false, ddlEmpAttCategory.SelectedValue, UserID);
        //ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");


        //end test



        bool Validate = (ValidateControls(new WebControl[] { txtFirstName, txtSecondName, txtThirdName, txtFamilyName, txtSSN, JobTitle, CityID, Region, ddlEmpType, ddlEmployeeCat, ddlEmpAttCategory, txtMobile }));
        bool DateValidate = true;
        if (Div1.Visible == true) DateValidate = (DateValidateControls(new WebControl[] { txtFDate, txtSDate }));
        if (Validate && DateValidate)
        {
            DataTable DT = DataAccess.AddNewEmployee("", ddlEmployeeCat.SelectedValue, ddlEmpType.SelectedValue, txtEmployeeNo.Text, IsActive.Checked, (txtAppointmentDate.Text != "") ? txtAppointmentDate.Text : "",
         txtFirstName.Text, txtSecondName.Text, txtThirdName.Text, txtFamilyName.Text, departmentID, JobTitle.SelectedValue,
         (ContractType.Visible != false) ? ddlContractType.SelectedValue : "-1", (subcontract.Visible != false) ? ddlContractSubType.SelectedValue : "-1", txtTestFrom.Text, txtTestTo.Text, txtSDate.Text, txtFDate.Text,
         txtSalary.Text, ddlCurrency.SelectedValue, CityID.SelectedValue, Region.SelectedValue, txtSSN.Text, (ddlAcademicData.SelectedValue == "1") ? true : false, ddlEmpAttCategory.SelectedValue, ddlGender.SelectedValue, txtMobile.Text, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            //if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0 && ddlEmpCategory.SelectedValue == "6")
            //{
            //    Session["VolunteerID"] = DT.Rows[0]["ID"].ToString();
            //    Response.Redirect("VolunteerRequirement.aspx");
            //}
            //else
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { txtAppointmentDate, txtEmployeeNo, txtFirstName, txtSecondName, txtThirdName, txtFamilyName, txtSSN, ddlEmployeeCat, CityID, Region, ddlEmpType, JobTitle, Unite, DDL, Department, section, ddlAcademicData, txtFDate, txtSDate, txtTestFrom, txtTestTo, txtSalary, ddlCurrency, ddlContractSubType, ddlContractType, txtSalary, ddlContractType });
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
    protected void ButtonCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { txtFirstName, txtSecondName, txtThirdName, txtFamilyName, txtSSN, txtEmployeeNo ,txtMobile});
    }
    protected void ddlEmployeeCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        ContractType.Visible = false;
        AppointmentDate.Visible = false;
        Div2.Visible = false;
        Div1.Visible = false;
        if (ddlEmployeeCat.SelectedValue == "-1")
        {
            txtEmployeeNo.Text = "";
        }
        else if (ddlEmployeeCat.SelectedValue == "1")
        {
            AppointmentDate.Visible = true;
            DataTable DT = DataAccess.GenerateNewEmployeeNo("-1");
            txtEmployeeNo.Text = DT.Rows[0]["NewEmployeeNo"].ToString();
        }
        else if (ddlEmployeeCat.SelectedValue == "2")
        {
            ContractType.Visible = true;
            Div2.Visible = true;
            Div1.Visible = true;
        }

    }
    protected void Unite_SelectedIndexChanged(object sender, EventArgs e)
    {
        DDL.DataBind();
        Department.DataBind();
        section.DataBind();
        JobTitle.DataBind();

    }
    protected void DDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        Department.DataBind();
        section.DataBind();
        JobTitle.DataBind();

    }
    protected void Department_SelectedIndexChanged(object sender, EventArgs e)
    {

        section.DataBind();
        JobTitle.DataBind();

    }
    protected void section_SelectedIndexChanged(object sender, EventArgs e)
    {
        JobTitle.DataBind();

    }
    protected void Employee_SelectedIndexChanged(object sender, EventArgs e)
    {
        JobTitle.DataBind();
    }
    protected void ddlContractType_SelectedIndexChanged(object sender, EventArgs e)
    {
        subcontract.Visible = false;
        Div1.Visible = true;
        Div2.Visible = true;
        if (ddlContractType.SelectedValue == "7")
        {
            subcontract.Visible = true;
        }
        else if (ddlContractType.SelectedValue == "6" || ddlContractType.SelectedValue == "15")
        {
            Div1.Visible = false;
            Div2.Visible = false;
        }
        else
        {
            Div1.Visible = true;
            Div2.Visible = true;
        }
        DataTable DT = DataAccess.GenerateNewEmployeeNo(ddlContractType.SelectedValue);
        txtEmployeeNo.Text = DT.Rows[0]["NewEmployeeNo"].ToString();
    } 
}