using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_FinancialCollection : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnChechStudent_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.CheckStudent(txtStudentNo.Text);
        if (DT.Rows.Count > 0)
        {
            lblStudentID.Text = DT.Rows[0]["StudentID"].ToString();
            lblStudentName.Text = DT.Rows[0]["StudentName"].ToString();
            std.Visible = true;
            ShowToast(this, DT.Rows[0]["StudentName"].ToString(), "", "success");
        }
        else
        {
            ShowToast(this, "رقم الطالب غير صحيح", "", "error");
        }
    }

    protected void btnConfirmation_Click(object sender, EventArgs e)
    {
        if (lblStudentID.Text != "")
        {
            bool IntValidate = IntValidateControls(new WebControl[] { lblStudentID, ddlAction });
            bool Validate = ValidateControls(new WebControl[] { lblStudentID, txtAmount1, txtAmount2, txtAmount3, ddlAction });
            if (Validate && IntValidate)
            {
                DataTable DT = DataAccess.AddCashTransaction(lblStudentID.Text, txtAmount1.Text, txtAmount2.Text, txtAmount3.Text, ddlAction.SelectedValue, EmployeeID);
                if (DT.Rows.Count > 0)
                {
                    Repeater1.DataBind();
                    lblDocumentID.Text = DT.Rows[0]["documentid"].ToString();
                    btnDocument.Visible = true;
                    ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                }
                else
                {
                    ShowToast(this, "رقم الطالب غير صحيح", "", "error");
                }
            }
            else
            {
                ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تحديد الطالب.", "", "error");
        }
    }

    protected void ddlAction_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.GetActionValue(ddlAction.SelectedValue);
        if (DT.Rows.Count > 0)
        {
            txtAmount1.Text = DT.Rows[0]["Value"].ToString();
        }
    }
    protected void btnDocument_Click(object sender, EventArgs e)
    {

    }
}