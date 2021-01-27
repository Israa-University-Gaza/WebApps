using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finanical_Exemption_AddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("ExemptionTypeID")).Text;
        DataTable DT = DataAccess.Exemption_Type_TB_Get(id);
        txtName.Text = DT.Rows[0]["Exemption_Type"].ToString();
        txtValue.Text = DT.Rows[0]["Exemption_Value_Yearly"].ToString();
        lblExemptionID.Text = id;
        CurrType.SelectedValue = DT.Rows[0]["Currancy_ID"].ToString();          



    }
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("ExemptionTypeID")).Text;

        if (DataAccess.Exemption_Type_TB_Delete(id, UserID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            Repeater1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { txtName });
        bool DecimalValidate = DecimalValidateControls(new WebControl[] { txtValue });
        if (validate && DecimalValidate)
     
        {
            if (DataAccess.Exemption_Type_TB_AddEdit(lblExemptionID.Text, txtName.Text,
                Convert.ToDecimal(txtValue.Text), Convert.ToInt16(UserID), Convert.ToInt16(CurrType.Text),
                (Session["Exemption_Type_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
            {
                Session["Exemption_Type_ID"] = null;
                lblExemptionID.Text = "";
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { txtName, txtValue });
                Repeater1.DataBind();
            }
            else
            {
                ShowToast(this, "عذرًا , لم يتم الحفظ.", "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { txtName, txtValue });
        txtName.Text = ""; txtValue.Text = ""; 
    }
}