using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Emp_Degree_AddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        Repeater1.DataBind();
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("JobDegreeID")).Text;
        DataTable DT = DataAccess.Degree_TB_Get(id);
        txtName.Text = DT.Rows[0]["Job_Degree_code"].ToString();
        DropDownList1.SelectedValue = DT.Rows[0]["Job_Category_ID"].ToString();

        lblDegreetID.Text = id;
    }
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        RepeaterItem ri = (RepeaterItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("JobDegreeID")).Text;

        if (DataAccess.Contract_Type_TB_Delete(id, UserID) > 0)
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
            if (DataAccess.Degree_TB_AddEdit(lblDegreetID.Text, txtName.Text, Convert.ToInt16(DropDownList1.SelectedValue), Convert.ToInt16(UserID), (Session["JobDegreeID"] == null) ? 0 : Convert.ToInt16(UserID)) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblDegreetID, txtName });
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
        EmptyControls(new WebControl[] { txtName, DropDownList1 });
        txtName.Text = "";
    }
}