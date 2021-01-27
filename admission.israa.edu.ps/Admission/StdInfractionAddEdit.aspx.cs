using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StdInfractionAddEdit : UserPage
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

        bool Validate = ValidateControls(new WebControl[] { ddlInfraction, ddlSemester, txtPenaltyDetails, txtInfractionDetails });
        if (Validate)
        {
            DataTable DT = DataAccess.StdInfractionAddEdit(lblStdInfractionID.Text, ddlSemester.SelectedValue, lblStudentID.Text, ddlInfraction.SelectedValue, txtInfractionDetails.Text, txtPenaltyDetails.Text, EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if ((Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0))
            {
                EmptyControls(new WebControl[] { ddlInfraction, ddlSemester, txtPenaltyDetails, txtInfractionDetails });
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
        lblStdInfractionID.Text = ID;
        DataTable DT = DataAccess.StdInfractionGet(lblStdInfractionID.Text);
        if (DT.Rows.Count > 0)
        {
            ddlInfractionTypeID.SelectedValue = DT.Rows[0]["InfractionTypeID"].ToString();
            ddlInfraction.DataBind();
            ddlInfraction.SelectedValue = DT.Rows[0]["InfractionID"].ToString();
            ddlSemester.SelectedValue = DT.Rows[0]["SemesterID"].ToString();
            txtInfractionDetails.Text = DT.Rows[0]["InfractionDetails"].ToString();
            txtPenaltyDetails.Text = DT.Rows[0]["PenaltyDetails"].ToString();

        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;
        DataTable DT = DataAccess.StdInfractionDelete(ID, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void ddlInfractionTypeID_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlInfraction.DataBind();
    }
}