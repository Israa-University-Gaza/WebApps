using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_CurPrice_AddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        Repeater1.DataBind();
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;
        DataTable DT = DataAccess.CurrancyPrice_TB_Get(id);
        txtName.Text = DT.Rows[0]["Cur_ID"].ToString();
        lblCurID.Text = id;
        TextBox1.Text = DT.Rows[0]["Price"].ToString();
        txtSDate.Text = Convert.ToDateTime(DT.Rows[0]["Date"]).ToShortDateString();
        //Button7.Visible = false;


    }
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("ID")).Text;

        if (DataAccess.CurrencyPrice_TB_Delete(id, UserID) > 0)
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
        bool validate = ValidateControls(new WebControl[] {txtName,txtSDate });
        bool decimalValidate = DecimalValidateControls(new WebControl[] { TextBox1 });
        bool DateValidate = DateValidateControls(new WebControl[] { txtSDate });

        if (validate & decimalValidate & DateValidate)
        {
            if (DataAccess.CurranceyPrice_TB_AddEdit(lblCurID.Text, Convert.ToInt16(txtName.SelectedValue), Convert.ToDecimal(TextBox1.Text),txtSDate.Text, Convert.ToInt16(UserID), (Session["ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
            {
                Session["ID"] = null;

                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { txtName, lblCurID, TextBox1, txtSDate });
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


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblCurID, txtName, TextBox1 });
        txtSDate.Text = "";
        TextBox1.Text = "";
     
    }
}