using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentInstallmentAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["StudentID"] != null)
            {
                lblStudentID.Text = Session["StudentID"].ToString();
                DataTable DT = DataAccess.StudentImageGet(lblStudentID.Text);
                if (DT.Rows.Count > 0)
                {
                    if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
                    {
                        byte[] imgBytes = (byte[])DT.Rows[0]["StudentImage"];
                        string imgString = Convert.ToBase64String(imgBytes);
                        image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                    }
                }
            }
            else
            {
                Response.Redirect("Students.aspx");
            }

            if (Session["StudentInstallmentID"] != null)
            {
                lblInstallmentID.Text = Session["StudentInstallmentID"].ToString();
                Session["StudentInstallmentID"] = null;
                DataTable dt = DataAccess.StudentInstallmentGet(lblInstallmentID.Text);
                if (dt.Rows.Count > 0)
                {
                    txtInstallmentName.Text = dt.Rows[0]["InstallmentName"].ToString();
                    txtInstallmentValue.Text = dt.Rows[0]["InstallmentValue"].ToString();
                    txtInstallmentRequestDate.Text = dt.Rows[0]["RequestDate"].ToString();
                    txtInstallmentRepayDate.Text = dt.Rows[0]["RepayDate"].ToString();
                    txtInstallmentNotes.Text = dt.Rows[0]["Note"].ToString();
                    btnStudentInstallmentAddEdit.Text = "تعديل القسط المالي";
                }

                else
                {
                    ShowToast(this, " ", "", "error");
                }
            }
        }
    }

    protected void btnStudentInstallmentAddEdit_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { lblStudentID, txtInstallmentName, txtInstallmentValue, txtInstallmentNotes, txtInstallmentRequestDate, txtInstallmentRepayDate });
        if (Validate)
        {
            DataTable DT = DataAccess.StudentInstallmentAddEdit(lblInstallmentID.Text, lblStudentID.Text, txtInstallmentName.Text, txtInstallmentValue.Text, Convert.ToDateTime(txtInstallmentRequestDate.Text), Convert.ToDateTime(txtInstallmentRepayDate.Text), "1", txtInstallmentNotes.Text, EmployeeID);
            if (DT.Rows.Count > 0)
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                EmptyControls(new WebControl[] { txtInstallmentName, txtInstallmentValue, txtInstallmentNotes, txtInstallmentRequestDate, txtInstallmentRepayDate });
                btnStudentInstallmentAddEdit.Text = "إضافة قسط مالي";
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح", "", "error");
        }
    }
}