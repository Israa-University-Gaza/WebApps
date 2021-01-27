using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finanical_Emp_Exemption : UserPage
{
    DataTable DT = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button2_Click(object sender, EventArgs e)
    {

        try
        {
            if (ValidateControls(new WebControl[] { DropDownList1, TextBox1 }))
            {



                if (DataAccess.CalculateEmpExemption(Convert.ToInt16(DropDownList8.SelectedValue), Convert.ToInt16(TextBox1.Text), Convert.ToInt16(DropDownList1.SelectedValue), Convert.ToInt16(UserID)) > 0)
                {
                    ShowToast(this, "تم احتساب الاعفاءات بنجاح.", "", "success");
                  //  row.Visible = true;
                    Repeater1.DataBind();

                }
                else
                {
                    ShowToast(this, "عذرًا , تم احتسابه مسبقا .", "", "error");
                }
               // row.Visible = true;
                Repeater1.DataBind();
            }

            else
            {
                ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
            }

        }
        catch
        {
            ShowToast(this, "عذرًا , تم احتسابه مسبقا .", "", "error");
            Repeater1.DataBind();
        }
    }
}