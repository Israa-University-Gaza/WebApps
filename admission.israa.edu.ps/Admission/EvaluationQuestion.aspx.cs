using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_EvaluationQuestion : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPermissionsContains("Block"))
        //{
        //    Response.Redirect("Default.aspx");
        //}
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("EvaluationQuestionID")).Text;
        DataTable DT = DataAccess.EvaluationQuestionGet(id);
        if (DT.Rows.Count > 0)
        {
            lblEvaluationQuestionID.Text = id;
            txtQuestionName.Text = DT.Rows[0]["QuestionName"].ToString();
            ddlEvaluationQuestionType.DataBind();
            ddlEvaluationQuestionType.SelectedValue = DT.Rows[0]["EvaluationQuestionTypeID"].ToString();
            ddlEvaluationQuestionGroup.DataBind();
            ddlEvaluationQuestionGroup.SelectedValue = DT.Rows[0]["EvaluationQuestionGroupID"].ToString();
            cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
            ListView1.DataBind();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("EvaluationQuestionID")).Text;

        if (DataAccess.EvaluationQuestionDelete(id, EmployeeID) > 0)
        {
            ShowToast(this, "تم الحذف بنجاح.", "", "success");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم الحذف.", "", "error");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtQuestionName, ddlEvaluationQuestionType, ddlEvaluationQuestionGroup }))
        {
            if (DataAccess.EvaluationQuestionAddEdit(lblEvaluationQuestionID.Text, txtQuestionName.Text, ddlEvaluationQuestionType.SelectedValue, ddlEvaluationQuestionGroup.SelectedValue, cbActive.Checked, EmployeeID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblEvaluationQuestionID, txtQuestionName, ddlEvaluationQuestionType, ddlEvaluationQuestionGroup, cbActive });
                ListView1.DataBind();
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
        EmptyControls(new WebControl[] { lblEvaluationQuestionID, cbActive, txtQuestionName, ddlEvaluationQuestionType, ddlEvaluationQuestionGroup });
    }

    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("EvaluationQuestionID")).Text;

        if (DataAccess.EvaluationQuestionActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowToast(this, "تمت العملية بنجاح.", "", "success");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "عذرًا , لم تتم العملية.", "", "error");
        }
    }
}