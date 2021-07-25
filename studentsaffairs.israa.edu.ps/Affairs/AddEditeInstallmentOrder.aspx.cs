using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddEditeInstallmentOrder :UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //try
        //   {


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



            if (Session["OrderID"] != null)
            {
                lblOrderID.Text = Session["OrderID"].ToString();
                Session["OrderID"] = null;
                DataTable dt = DataAccess.InstallmentOrderGet(lblOrderID.Text);
                if (dt.Rows.Count > 0)
                {
                    lblStudentID.Text = dt.Rows[0]["StudentID"].ToString();
                    txtRegisterHourNumber.Text = dt.Rows[0]["RegisterHourNumber"].ToString();
                    txtPaidAmount.Text = dt.Rows[0]["PaidAmount"].ToString();
                    txtRemainingAmount.Text = dt.Rows[0]["RemainingAmount"].ToString();
                   


                }
                else
                {
                    ShowToast(this, " ", "", "error");
                }
            }



            //   }

            //catch
            //{
            //    ShowToast(this, "بالرجاء ادخال بيانات سليمة", "", "error");

            //}
        }
    }

    protected void BtnAddEdit_Click(object sender, EventArgs e)
    {
      /* by RSR  bool valid = ValidateControls(new WebControl[] { txtRegisterHourNumber,txtPaidAmount,txtRemainingAmount});
       
        if (valid)
        {

            DataTable DT = DataAccess.AddEditeInstallmentOrder(lblOrderID.Text, lblStudentID.Text, txtRegisterHourNumber.Text, txtPaidAmount.Text, txtRemainingAmount.Text, EmployeeID);
                if (DT.Rows.Count > 0)
                {
                    ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                    EmptyControls(new WebControl[] { lblOrderID, lblStudentID, txtRegisterHourNumber, txtPaidAmount, txtRemainingAmount });
                    
                // if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                //    {
                //        //txtRegisterHourNumber.Enabled = false;
                //        //txtPaidAmount.Enabled = false;
                //        //txtRemainingAmount.Enabled = false;
                //        //BtnAddEdit.Enabled = false;
                //        //ShowAddInstallment.Visible = true;
                //        //ShowInstallments.Visible = true;
                //        //lblOrderID.Text = DT.Rows[0]["OrderID"].ToString();
                //    }

                //else
                // {
                //        EmptyControls(new WebControl[] {lblOrderID,lblStudentID, txtRegisterHourNumber,txtPaidAmount,txtRemainingAmount});
                // }

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
   
    protected void btnChechStudent_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.CheckStudent(txtStudentNo.Text);
        if (DT.Rows.Count > 0)
        {
            Session["StudentID"] = DT.Rows[0]["StudentID"].ToString();
            Response.Redirect("~/Affairs/Student.aspx");
        }
        else
        {
            ShowToast(this, "رقم الطالب غير صحيح", "", "error");
        }
    }
}
    //protected void lbEDiteInstallment_Click(object sender, EventArgs e)
    //{

        //ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        //string id = ((Label)li.FindControl("StudentInstallmentID")).Text;
        //DataTable dt = DataAccess.StudentInstallmentGet(id);
        //if (dt.Rows.Count > 0)
        //{

        //    //lblStudentID.Text = dt.Rows[0]["StudentID"].ToString();
        //    txtInstallmentName.Text = dt.Rows[0]["InstallmentName"].ToString();
        //    txtInstallmentValue.Text = dt.Rows[0]["InstallmentValue"].ToString();
        //    txtInstallmentRequestDate.Text = dt.Rows[0]["RequestDate"].ToString();
        //    txtInstallmentRepayDate.Text = dt.Rows[0]["RepayDate"].ToString();


        //}
        //else
        //{
        //    ShowToast(this, " ", "", "error");
        //}
    //}

