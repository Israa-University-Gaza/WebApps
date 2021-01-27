using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finanical_Tax_Bracket_AddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("TaxBracketID")).Text;
        DataTable DT = DataAccess.Tax_Bracket_TB_Get(id);
        txtName.Text = DT.Rows[0]["Tax_Bracket_Name"].ToString();
        txtMax.Text = DT.Rows[0]["Tax_Bracket_Max_Yearly"].ToString();
        txtMin.Text = DT.Rows[0]["Tax_Bracket_Min_Yearly"].ToString();
        txtRate.Text = DT.Rows[0]["Tax_Bracket_Rate"].ToString();
        lblBracketID.Text = id;
        CurrType.SelectedValue = DT.Rows[0]["Currancy_ID"].ToString();          

      


    }
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("TaxBracketID")).Text;

        if (DataAccess.Tax_Bracket_TB_Delete(id, UserID) > 0)
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
        bool Validate= ValidateControls(new WebControl[] { lblBracketID,txtName });
        bool DecimalValidate = DecimalValidateControls(new WebControl[] {  txtMin, txtMax, txtRate });
        if(Validate && DecimalValidate)
        {
            if (DataAccess.Tax_Bracket_TB_AddEdit(lblBracketID.Text, txtName.Text,
                Convert.ToDecimal(txtMin.Text),Convert.ToDecimal(txtMax.Text),Convert.ToDecimal(txtRate.Text),  Convert.ToInt16(CurrType.SelectedValue),Convert.ToInt16(UserID),
                (Session["Tax_Bracket_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
            {
                lblBracketID.Text = "";
                Session["Tax_Bracket_ID"] = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { txtName, txtMin, txtMax, txtRate });
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
        EmptyControls(new WebControl[] { txtName, txtMin, txtMax, txtRate });
       
    }
}