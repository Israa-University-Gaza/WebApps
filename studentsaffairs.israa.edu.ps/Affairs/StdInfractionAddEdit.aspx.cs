using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Affairs_StdInfractionAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblEmployeeID.Text = EmployeeID;
            if (Request.QueryString["id"] != null)
            {
                lblStudentID.Text = Request.QueryString["id"].ToString();
                DataTable DT = DataAccess.StudentImageGet(lblStudentID.Text);
                if (DT.Rows.Count > 0)
                {
                    if (!Convert.IsDBNull(DT.Rows[0]["StudentImage"]))
                    {
                        byte[] imgBytes = (byte[])DT.Rows[0]["StudentImage"];
                        string imgString = Convert.ToBase64String(imgBytes);
                        image.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
                    }
                }
            }
            else
            {
                Response.Redirect("Students.aspx");
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        bool Validate = ValidateControls(new WebControl[] { ddlInfraction, ddlSemester, txtPenaltyDetails, txtInfractionDetails, txtInfractionDate,txtNots });
        if (Validate)
        {
            DataTable DT = DataAccess.StdInfractionAddEdit(lblStdInfractionID.Text, ddlSemester.SelectedValue, lblStudentID.Text, ddlInfraction.SelectedValue, txtInfractionDate.Text, txtInfractionDetails.Text, txtPenaltyDetails.Text, txtNots.Text, EmployeeID);
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
            txtInfractionDate.Text = DT.Rows[0]["InfractionDate"].ToString();
            txtNots.Text = DT.Rows[0]["Nots"].ToString();
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