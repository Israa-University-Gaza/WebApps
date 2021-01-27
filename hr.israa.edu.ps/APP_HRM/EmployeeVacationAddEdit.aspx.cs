using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_EmployeeVacationAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbEmployeeID.Text = UserID;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { ddlVacationType, txtDateTo, txtDateFrom, txtReason });
        bool DateValidate = DateValidateControls(new WebControl[] { txtDateFrom, txtDateTo });
        if (Validate && DateValidate)
        {
            DataTable DT = DataAccess.EmployeeVacationAddEdit(lblID.Text, lbEmployeeID.Text, ddlVacationType.SelectedValue, txtDateFrom.Text, txtDateTo.Text, txtReason.Text, ddlPlace.SelectedValue, lbEmployeeID.Text);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { lblID, txtDateFrom, txtDateTo, ddlPlace, ddlVacationType, txtReason });

                ListView1.DataBind();
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");

        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblID, txtDateFrom, txtDateTo, ddlPlace, ddlVacationType, txtReason });
    }

   

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;
        DataTable DT = DataAccess.EmployeeVacationDelete(ID, lbEmployeeID.Text);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;
        lblID.Text = ID;
        DataTable DT = DataAccess.EmployeeVacationGet(lblID.Text);
        if (DT.Rows.Count > 0)
        {
            ddlVacationType.DataBind();
            ddlVacationType.SelectedValue = DT.Rows[0]["VacationTypeID"].ToString();
            ddlPlace.DataBind();
            ddlPlace.SelectedValue = DT.Rows[0]["VacationPlaceID"].ToString();
            txtDateFrom.Text = DT.Rows[0]["VacationStartDate"].ToString();
            txtDateTo.Text = DT.Rows[0]["VacationEndDate"].ToString();
            txtReason.Text = DT.Rows[0]["VacationReason"].ToString();
        }
    }

     protected void txtDateTo_TextChanged(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { txtDateTo, txtDateFrom });

        bool DateValidate = DateValidateControls(new WebControl[] { txtDateTo, txtDateFrom });
        if (validate && DateValidate)
        {
              DataTable DT = DataAccess.GetEmployeeVacationDay(txtDateFrom.Text, txtDateTo.Text,lbEmployeeID.Text);
            txtVacationCount.Text = DT.Rows[0]["VacationDayCount"].ToString();
        }
    }

    protected void txtDateFrom_TextChanged(object sender, EventArgs e)
    {
        bool validate = ValidateControls(new WebControl[] { txtDateTo, txtDateFrom });

        bool DateValidate = DateValidateControls(new WebControl[] { txtDateTo, txtDateFrom });
        if (validate && DateValidate)
        {
            DataTable DT = DataAccess.GetEmployeeVacationDay(txtDateFrom.Text, txtDateTo.Text,lbEmployeeID.Text);
            txtVacationCount.Text = DT.Rows[0]["VacationDayCount"].ToString();
        }
    }}