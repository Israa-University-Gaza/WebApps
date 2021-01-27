using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finanical_Emp_Advance_AddEdit : UserPage
{
    DataTable DT = new DataTable(); 

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["Advance_ID"] != null)
            {
                DataTable DT = DataAccess.Advance_TB_Get(Session["Advance_ID"].ToString());

                txtValue.Text = DT.Rows[0]["Advance_Value"].ToString();
                txtFirst.Text = DT.Rows[0]["Advance_first_installment"].ToString();
                EmpName.SelectedValue = DT.Rows[0]["Advance_EmpID"].ToString();

                TxtNo.Text = DT.Rows[0]["Advance_PaymentNo"].ToString();
                txtNotes.Text = DT.Rows[0]["Advance_Notes"].ToString();

                if ((DT.Rows[0]["Advance_Date"].ToString()) != "")
                    txtSDate.Text = DT.Rows[0]["Advance_Date1"].ToString();

                if ((DT.Rows[0]["Advance_Due_Date"].ToString()) != "")
                    txtFDate.Text = DT.Rows[0]["Advance_Due_Date1"].ToString();


             CurrType.SelectedValue = DT.Rows[0]["Currancy_ID"].ToString();          


             
            }
        }
    }
   

    protected void Button12_Click(object sender, EventArgs e)
    {

        bool validate = ValidateControls(new WebControl[] { txtValue, txtFirst, txtNotes, txtSDate, txtFDate, TxtNo, EmpName, CurrType });
        bool DecimalValidate = DecimalValidateControls(new WebControl[] {txtValue, txtFirst  });
        bool DateValidate=DateValidateControls(new WebControl[] { txtSDate, txtFDate });
        if (validate && DecimalValidate && DateValidate)
        {

            if (DataAccess.Advance_TB_AddEdit((Session["Advance_ID"] == null) ? "" : Session["Advance_ID"].ToString(),

                Convert.ToDecimal(txtValue.Text)
                , Convert.ToInt16(EmpName.SelectedValue), Convert.ToDecimal(txtFirst.Text),
                Convert.ToDateTime(txtSDate.Text), Convert.ToDateTime(txtFDate.Text), Convert.ToInt16(TxtNo.Text), txtNotes.Text,
               Convert.ToInt16(CurrType.SelectedValue),  Convert.ToInt16(UserID),(Session["Advance_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
            {
                Session["Advance_ID"] = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { txtValue, txtFirst, txtNotes, txtSDate, txtFDate, TxtNo, CurrType });
               Repeater1.DataBind();
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
    protected void btnCancel_Click2(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { txtValue, txtFirst, txtNotes, txtSDate, txtFDate, EmpName });
        Session["Advance_ID"] = null;
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        Session["Advance_ID"] = ((Label)ri.FindControl("AdvanceID")).Text;
        Response.Redirect("~/Finanical/Emp_Advance_AddEdit.aspx");
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("AdvanceID")).Text;

        if (DataAccess.Advance_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
          Repeater1.DataBind();
        }
        else
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
    }

}