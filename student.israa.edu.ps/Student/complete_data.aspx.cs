using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_complete_data : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    
    protected void btnSave_Click(object sender, EventArgs e)
    {
        int result= DataAccess.CompleteStudentData(StudentID, ddlHomeType.SelectedValue, rBtnFatherStatus.SelectedValue == "1" ? true : false,
            DDLStdStatus.SelectedValue, txtOriginalTown.Text, rBtnHaveOtherNationality.SelectedValue == "1" ? true : false, txtOtherNationality.Text, txtFamilyNo.Text,
            txtStdNo.Text, txtStdFSerial.Text, txtFIncome.Text, DDLFurnStatus.SelectedValue, rBtnHavePrisonar.SelectedValue == "1" ? true : false,
            txtPrisonerName.Text, rBtnHaveMartyr.SelectedValue == "1" ? true : false, txtMartyrName.Text);
        if (result == 1)
        {
            ShowHideMsg("تم الحفظ بنجاح", "success");
            Response.Redirect("Default.aspx");
        }
            
    }

    public void ShowHideMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable");
    }
}