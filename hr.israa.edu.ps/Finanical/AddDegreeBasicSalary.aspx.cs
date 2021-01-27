using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finanical_AddDegreeBasicSalary : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlCader, ddlGrade, ddlCurrency, ddlDegree, lblID, txtSalary });
        if (Validate)
        {
            DataTable DT = DataAccess.DegreeBasicSalaryAddEdit(lblID.Text, ddlDegree.SelectedValue, txtSalary.Text, ddlCurrency.SelectedValue, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { ddlCader, ddlGrade, ddlCurrency, ddlDegree, lblID, txtSalary });
                ListView1.DataBind();

            }
        }
        else ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
    }

    protected void ddlCader_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlGrade.DataBind();
        ddlDegree.DataBind();
    }
    protected void ddlGrade_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDegree.DataBind();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { ddlCader, ddlGrade, ddlCurrency, ddlDegree, lblID, txtSalary });
    }
    //protected void lbEdit_Click(object sender, EventArgs e)
    //{
    //    ListViewItem Li = (ListViewItem)((LinkButton)sender).Parent;
    //    string id = ((Label)Li.FindControl("ID")).Text;
    //    DataTable DT = DataAccess.DegreeBasicSalaryGet(id);
    //    lblID.Text = id;
    //    ddlCader.SelectedValue=DT.Rows[0]["caderID"].ToString();
    //    ddlGrade.DataBind();
    //    ddlGrade.SelectedValue = DT.Rows[0]["GradeID"].ToString();
    //    ddlDegree.DataBind();
    //    ddlDegree.SelectedValue = DT.Rows[0]["DegreeID"].ToString();
    //    txtSalary.Text = DT.Rows[0]["SalaryAmount"].ToString();
    //    ddlCurrency.SelectedValue =  DT.Rows[0]["CurrencyID"].ToString();
    //}
}