using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Affairs : UserPage
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
        string id = ((Label)ri.FindControl("AffairsID")).Text;
        DataTable DT = DataAccess.Affairs_TB_Get(id);
        txtName.Text = DT.Rows[0]["Affairs_Name"].ToString();
        TextBox1.Text = DT.Rows[0]["Affairs_Code"].ToString();
        cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
        lblAffairsID.Text = id;
     
    


    }
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("AffairsID")).Text;

        if (DataAccess.Affairs_TB_Delete(id, UserID) > 0)
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
            if (DataAccess.Affairs_TB_AddEdit(lblAffairsID.Text, txtName.Text, TextBox1.Text,
                cbActive.Checked, Convert.ToInt16(UserID), (Session["Affairs_ID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
            {
                Repeater1.DataBind();
                Session["Affairs_ID"] = null;
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { txtName, TextBox1 });
                lblAffairsID.Text = "";
            
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
        EmptyControls(new WebControl[] { lblAffairsID, txtName,TextBox1,  cbActive });
        txtName.Text = "";
       
    }

}