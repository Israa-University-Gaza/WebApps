using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_FinalMarkDeductionAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                lblEmployeeID.Text = EmployeeID;
                if (Request.QueryString["id"] != null)
                {
                    DataTable DT2 = DataAccess.GetStudentData(Request.QueryString["id"].ToString());
                    lblStdStatusID.Text = DT2.Rows[0]["StdStatusID"].ToString();
                    lblStudentID.Text = Request.QueryString["id"].ToString();

                }
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Admission/Students.aspx");
            }
        }
    }



    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool IntValidate = IntValidateControls(new WebControl[] { txtDeductionValue });
        bool Validate = ValidateControls(new WebControl[] { ddlCourse, ddlDeductionMarkType, ddlSemester, txtNotes, txtDeductionValue });
        if (Validate && IntValidate)
        {
            DataTable DT = DataAccess.MarkDeductionAddEdit(lblFinalMarkDeductionID.Text, lblStudentID.Text, ddlDeductionMarkType.SelectedValue, ddlCourse.SelectedValue, "2", "", txtDeductionValue.Text, txtNotes.Text, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if ((Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0))
            {
                EmptyControls(new WebControl[] { ddlCourse, ddlSemester, txtNotes, txtDeductionValue });
                ListView1.DataBind();
            }
        }
        else
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;
        lblFinalMarkDeductionID.Text = ID;
        DataTable DT = DataAccess.MarkDeductionGet(lblFinalMarkDeductionID.Text);
        if (DT.Rows.Count > 0)
        {
            ddlCourse.SelectedValue = DT.Rows[0]["StdSectionID"].ToString();
            ddlSemester.SelectedValue = DT.Rows[0]["SemesterID"].ToString();
            ddlDeductionMarkType.SelectedValue = DT.Rows[0]["TypeID"].ToString();
            txtNotes.Text = DT.Rows[0]["Notes"].ToString();
            txtDeductionValue.Text = DT.Rows[0]["DeductionValue"].ToString();

        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;
        DataTable DT = DataAccess.MarkDeductionDelete(ID, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }
}