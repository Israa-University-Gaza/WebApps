using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewLibrary_VisitorAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["VisitorID"] != null)
            {
                lblVisitorID.Text = Session["VisitorID"].ToString();
                Session["VisitorID"] = null;
                DataTable DT = NewDataAccess.VisitorGet(lblVisitorID.Text);
                if (DT.Rows.Count > 0)
                {
                    txtSSN.Text = DT.Rows[0]["SSN"].ToString();
                    txtFullName.Text = DT.Rows[0]["FullName"].ToString();
                    txtEmail.Text = DT.Rows[0]["Email"].ToString();
                    txtPhone.Text = DT.Rows[0]["Phone"].ToString();
                    txtMobile.Text = DT.Rows[0]["Mobile"].ToString();
                    txtAddress.Text = DT.Rows[0]["Address"].ToString();
                    txtNotes.Text = DT.Rows[0]["Notes"].ToString();
                }
            }

        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { txtFullName, txtSSN, txtPhone, txtMobile, txtEmail });
        if (Validate)
        {
            DataTable DT = NewDataAccess.VisitorAddEdit(lblVisitorID.Text, txtSSN.Text, txtFullName.Text, txtEmail.Text, txtPhone.Text, txtMobile.Text, txtAddress.Text, txtNotes.Text, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { txtFullName, txtSSN, txtPhone, txtMobile, txtEmail, txtAddress, txtNotes });
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
        EmptyControls(new WebControl[] { txtFullName, txtSSN, txtPhone, txtMobile, txtEmail, txtAddress, txtNotes });
    }

    protected void lbOpenStudent_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Session["VisitorID"] = ((Label)item.FindControl("VisitorID")).Text;
        Response.Redirect("Visitor.aspx");
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("VisitorID")).Text;
        lblVisitorID.Text = ID;
        DataTable DT = NewDataAccess.VisitorGet(lblVisitorID.Text);
        if (DT.Rows.Count > 0)
        {
            txtSSN.Text = DT.Rows[0]["SSN"].ToString();
            txtFullName.Text = DT.Rows[0]["FullName"].ToString();
            txtEmail.Text = DT.Rows[0]["Email"].ToString();
            txtPhone.Text = DT.Rows[0]["Phone"].ToString();
            txtMobile.Text = DT.Rows[0]["Mobile"].ToString();
            txtAddress.Text = DT.Rows[0]["Address"].ToString();
            txtNotes.Text = DT.Rows[0]["Notes"].ToString();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("VisitorID")).Text;
        DataTable DT = NewDataAccess.VisitorDelete(ID, UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }
}