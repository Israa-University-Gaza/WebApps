using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AddTelephone :UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        emp_id.Text = UserID;
        if (!IsPostBack)
        {
            if (Session["TelephoneID"] != null)
            {
                TelephoneID.Text = Session["TelephoneID"].ToString();
                DataTable dt = TelephoneDataAccess.GetTelephone(TelephoneID.Text);
                Session["TelephoneID"] = null;
                if (dt.Rows.Count > 0)
                {
                    DropDownList1.SelectedValue = dt.Rows[0]["EmployeeID"].ToString();

                    TelephoneNumber.Text = dt.Rows[0]["TelephoneNum"].ToString();
                    ActivateBox.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"].ToString());
                    btnAddTelefon.Text = "تعديل";

                    DropDownList1.Enabled = false;
                }
                else
                {
                    ShowToast(this, "بالرجاء ادخال بيانات سليمة ", "", "error");
                }
            }
        }
      
    }
    protected void btnAddTelefon_Click(object sender, EventArgs e)
    {
        bool valid = ValidateControls(new WebControl[] { TelephoneNumber, DropDownList1 });
        bool intValid = IntValidateControls(new WebControl[] { TelephoneNumber });
        if (valid)
        {
            if (intValid)
            {
                string Employee = DropDownList1.SelectedValue;

                DataTable DT = TelephoneDataAccess.AddTelephone(TelephoneID.Text, TelephoneNumber.Text, Employee, ActivateBox.Checked, emp_id.Text);
                if (DT.Rows.Count > 0)
                {
                    ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                    Session["TelephoneID"] = null;
                    EmptyControls(new WebControl[] { TelephoneNumber,ActivateBox });
                }

                else
                {
                    ShowToast(this, "لايوجد بيانات صحيحة", "", "error");

                }
            }

            else
            {
                ShowToast(this, "يرجى ادخال رقم هاتف صحيح", "", "error");

            }
        }

        else
        {
            ShowToast(this, "بالرجاء ادخال البيانات", "", "error");
        }

    }


 }
