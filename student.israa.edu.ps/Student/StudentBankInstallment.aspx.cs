using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_StudentBankInstallment : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblSemesterID.Text = "12";
        DataTable DT = DataAccess.IsHaveStudentBankInstallment(StudentID, lblSemesterID.Text);
        string ID = DT.Rows[0]["ID"].ToString();
        if (Convert.ToInt32(ID) != 0)
        {
            btnSave.Visible = false;
            ddlBank.Enabled = false;
            ddlBankBranch.Enabled = false;
            DataTable DA = DataAccess.StudentBankInstallmentGet(ID);
            ddlBank.SelectedValue = DA.Rows[0]["BankID"].ToString();
            ddlBank.DataBind();
            ddlBankBranch.SelectedValue = DA.Rows[0]["BankBranchID"].ToString();
        }
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlBankBranch, ddlBank });
        if (Validate)
        {
            DataTable DT = DataAccess.StudentBankInstallmentAdd(StudentID, lblSemesterID.Text, ddlBankBranch.SelectedValue);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            DataTable DT2 = DataAccess.IsHaveStudentBankInstallment(StudentID, lblSemesterID.Text);
            string ID = DT2.Rows[0]["ID"].ToString();
            if (Convert.ToInt32(ID) != 0)
            {
                btnSave.Visible = false;
                ddlBank.Enabled = false;
                ddlBankBranch.Enabled = false;
                DataTable DA = DataAccess.StudentBankInstallmentGet(ID);
                ddlBank.SelectedValue = DA.Rows[0]["BankID"].ToString();
                ddlBank.DataBind();
                ddlBankBranch.SelectedValue = DA.Rows[0]["BankBranchID"].ToString();
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");

        }
    }


    protected void ddlBank_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlBankBranch.DataBind();
    }

}