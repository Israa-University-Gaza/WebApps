using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_UpdateOfferdCourseFinalExamDetails : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {


        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;
        bool IsFinalExam = ((CheckBox)li.FindControl("cbFinalExam")).Checked;
        bool IsFinalEExam = ((CheckBox)li.FindControl("cbFinalEExam")).Checked;
        string FinalExamDate = ((TextBox)li.FindControl("txtFinalExamDate")).Text;
        string FinalExamTimeFrom1 = ((TextBox)li.FindControl("txtFinalExamFrom")).Text;
        string FinalExamTimeTo1 = ((TextBox)li.FindControl("txtFinalExamTo")).Text;
        bool DateValidate = DateValidateControls(new WebControl[] { ((TextBox)li.FindControl("txtFinalExamDate")), ((TextBox)li.FindControl("txtFinalExamFrom")), ((TextBox)li.FindControl("txtFinalExamTo")) });
        if (DateValidate)
        {
            DataTable DT = DataAccess.UpdateOfferdCourseFinalExamDetails(ID, IsFinalExam, IsFinalEExam, FinalExamDate, FinalExamTimeFrom1, FinalExamTimeTo1, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            ListView1.DataBind();
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");

        }
    }
    protected void BtnSaveAll_Click(object sender, EventArgs e)
    {
        int c = 0, s = 0, f = 0;
        foreach (ListViewItem li in ListView1.Items)
        {
            c++;
            string ID = ((Label)li.FindControl("ID")).Text;
            bool IsFinalExam = ((CheckBox)li.FindControl("cbFinalExam")).Checked;
            bool IsFinalEExam = ((CheckBox)li.FindControl("cbFinalEExam")).Checked;
            string FinalExamDate = ((TextBox)li.FindControl("txtFinalExamDate")).Text;
            string FinalExamTimeFrom1 = ((TextBox)li.FindControl("txtFinalExamFrom")).Text;
            string FinalExamTimeTo1 = ((TextBox)li.FindControl("txtFinalExamTo")).Text;
            bool DateValidate = DateValidateControls(new WebControl[] { ((TextBox)li.FindControl("txtFinalExamDate")), ((TextBox)li.FindControl("txtFinalExamFrom")), ((TextBox)li.FindControl("txtFinalExamTo")) });
            if (DateValidate)
            {
                DataTable DT = DataAccess.UpdateOfferdCourseFinalExamDetails(ID, IsFinalExam, IsFinalEExam, FinalExamDate, FinalExamTimeFrom1, FinalExamTimeTo1, EmployeeID);
                if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                    s++;
                else
                    f++;
            }
            else
                f++;
        }
        ShowToast(this, "تم حفظ " + s + " ولم يتم حفظ " + f + " من أصل " + c, "", (f == 0) ? "success" : "error");
    }
}