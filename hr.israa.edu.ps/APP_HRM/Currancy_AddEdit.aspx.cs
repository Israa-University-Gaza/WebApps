using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Currancy_AddEdit : UserPage
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
        string id = ((Label)ri.FindControl("CurID")).Text;
        DataTable DT = DataAccess.Currancy_TB_Get(id);
        txtName.Text = DT.Rows[0]["Cur_Ar_Name"].ToString();
        lblCurID.Text = id;
        TextBox1.Text = DT.Rows[0]["Cur_En_Name"].ToString();
        TextBox2.Text = DT.Rows[0]["FractionsNo"].ToString();
        TextBox3.Text = DT.Rows[0]["FractionName"].ToString();
        //Button7.Visible = false;


    }
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("CurID")).Text;

        if (DataAccess.Currency_TB_Delete(id, UserID) > 0)
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
        if (ValidateControls(new WebControl[] { txtName }))
        {
            if (DataAccess.Currancey_TB_AddEdit(lblCurID.Text, txtName.Text, TextBox1.Text, Convert.ToInt16(TextBox2.Text), TextBox3.Text, Convert.ToInt16(UserID), (Session["Cur_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
            {
                Session["Cur_ID"] = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { txtName, lblCurID });
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
        EmptyControls(new WebControl[] { lblCurID, txtName, TextBox3, TextBox1, TextBox2 });
        txtName.Text = "";
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
    }

}