using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Affairs_HelpRequestForm : UserPage
{ string StudentID="";
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if(!IsPostBack)
        {
            if (Request.QueryString["HelpRequestID"] != null)
            {
                DataTable DT = DataAccess.HelpRequestGet(Request.QueryString["HelpRequestID"].ToString());
                if(DT.Rows.Count>0)
                {
                    StudentName.Text = DT.Rows[0]["StudentName"].ToString();
             if(DT.Rows[0]["HelpType"].ToString()!="0")  HelpType.SelectedValue = DT.Rows[0]["HelpType"].ToString();
                    StudentID = DT.Rows[0]["StudentID"].ToString();
                    FamilyNo.Text = DT.Rows[0]["FamilyCountNo"].ToString();
                    UnivStudentNo.Text = DT.Rows[0]["UnivStudentNo"].ToString();
                    FamilySchoolNo.Text = DT.Rows[0]["FamilySchoolNo"].ToString();
                    SpecialNeedsNo.Text = DT.Rows[0]["SpecialNeedsNo"].ToString();
                    FatherWork.Text = DT.Rows[0]["FatherWork"].ToString();
                    MotherWork.Text = DT.Rows[0]["MotherWork"].ToString();
                    IsPerentDead.SelectedValue = Convert.ToInt16(DT.Rows[0]["IsPerentDead"]).ToString();
                    FamilyIncome.Text = DT.Rows[0]["FamilyIncome"].ToString();
                    if (DT.Rows[0]["SocialCaseType"].ToString() != "0") SocialCaseType.SelectedValue = DT.Rows[0]["SocialCaseType"].ToString();
                    if (DT.Rows[0]["houseType"].ToString() != "0") houseType.SelectedValue = DT.Rows[0]["houseType"].ToString();
                    RentValue.Text = DT.Rows[0]["RentValue"].ToString();
                    FurnitureStatus.Text = DT.Rows[0]["FurnitureStatus"].ToString();
                    BulidingType.Text = DT.Rows[0]["BulidingType"].ToString();
                    BulidingStatus.Text = DT.Rows[0]["BulidingStatus"].ToString();
                    BulidingArea.Text = DT.Rows[0]["BulidingArea"].ToString();
                    if (DT.Rows[0]["HouseNature"].ToString() != "0") HouseNature.SelectedValue = DT.Rows[0]["HouseNature"].ToString();
                    if (DT.Rows[0]["ResidencePlace"].ToString() != "0") ResidencePlace.SelectedValue = DT.Rows[0]["ResidencePlace"].ToString();
                    Others.Text = DT.Rows[0]["Others"].ToString();
                }
            }
            else
            {

            }
        }
    }

    protected void houseType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (houseType.SelectedValue == "71") Rent.Visible = true;
        else Rent.Visible = false;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { HelpType,FamilyNo,UnivStudentNo,FamilySchoolNo,SpecialNeedsNo,SocialCaseType,houseType,BulidingType,BulidingStatus,BulidingArea,HouseNature,ResidencePlace,IsPerentDead,FurnitureStatus });
        bool IntValidate = IntValidateControls(new WebControl[] {  FamilyNo, UnivStudentNo, FamilySchoolNo, SpecialNeedsNo });

        if (Validate && IntValidate)
        {

            DataTable DT = DataAccess.HelpRequestAdd(Request.QueryString["HelpRequestID"].ToString(), StudentID, HelpType.SelectedValue,
	 FamilyNo.Text, UnivStudentNo.Text, FamilySchoolNo.Text, SpecialNeedsNo.Text, FatherWork.Text, MotherWork.Text,IsPerentDead.SelectedValue,
      FamilyIncome.Text, SocialCaseType.SelectedValue, houseType.SelectedValue, RentValue.Text, FurnitureStatus.Text, BulidingType.Text, BulidingStatus.Text,
         BulidingArea.Text, HouseNature.Text, ResidencePlace.SelectedValue, Others.Text,EmployeeID);

              ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
             // if (DT.Rows[0]["status"].ToString() != "0") EmptyControls(new WebControl[] { HelpType, FamilyNo, UnivStudentNo, FamilySchoolNo, SpecialNeedsNo, SocialCaseType, houseType, BulidingType, BulidingStatus, BulidingArea, HouseNature, ResidencePlace, IsPerentDead, FurnitureStatus ,FatherWork,MotherWork,FamilyIncome});
          
        
        }
        else
        {
            ShowToast(this,"الرجاء تعبئة الحقول المطلوبة بشكل صحيح .","", "danger");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { HelpType, FamilyNo, UnivStudentNo, FamilySchoolNo, SpecialNeedsNo, SocialCaseType, houseType, BulidingType, BulidingStatus, BulidingArea, HouseNature, ResidencePlace, IsPerentDead, FurnitureStatus, FatherWork, MotherWork });

    }
}