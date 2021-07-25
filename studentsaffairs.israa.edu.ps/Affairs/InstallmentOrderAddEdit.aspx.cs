using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InstallmentOrderAddEdit : UserPage
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

                if (Session["OrderID"] != null)
                {
                    lblOrderID.Text = Session["OrderID"].ToString();
                    Session["OrderID"] = null;
                    DataTable dt = DataAccess.InstallmentOrderGet(lblOrderID.Text);
                    if (dt.Rows.Count > 0)
                    {
                        lblStudentID.Text = dt.Rows[0]["StudentID"].ToString();
                        txtNumOfHours.Text = dt.Rows[0]["NumOfHours"].ToString();
                        txtPaidAmount.Text = dt.Rows[0]["PaidAmount"].ToString();
                        txtRemainingAmount.Text = dt.Rows[0]["RemainingAmount"].ToString();
                    }
                }

            }
            else
            {
                Response.Redirect("Students.aspx");
            }
        }
    }

    protected void btnInstallmentOrderAddEdit_Click(object sender, EventArgs e)
    {
        /* by RSR bool valid = ValidateControls(new WebControl[] { txtNumOfHours, txtPaidAmount, txtRemainingAmount });

        if (valid)
        {
            DataTable DT = DataAccess.InstallmentOrderAddEdit(lblOrderID.Text, lblStudentID.Text, txtNumOfHours.Text, txtPaidAmount.Text, txtRemainingAmount.Text, EmployeeID);
            if (DT.Rows.Count > 0)
            {
                ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                EmptyControls(new WebControl[] { lblOrderID, lblStudentID, txtNumOfHours, txtPaidAmount, txtRemainingAmount });
            }

            else
            {
                ShowToast(this, "لايوجد بيانات صحيحة", "", "error");
            }
        }
        else
        {
            ShowToast(this, "بالرجاء ادخال البيانات", "", "error");
        }*/
    }
}