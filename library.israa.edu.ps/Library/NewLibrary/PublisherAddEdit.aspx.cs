using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewLibrar_PublisherAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        if (ValidateControls(new WebControl[] { txtPublisherName }))
        {
            DataTable dt = NewDataAccess.PublisherAddEdit(lblPublisherID.Text, txtPublisherName.Text, UserID);
            if (dt.Rows.Count > 0)
            {
                ShowToast(this, dt.Rows[0]["msg"].ToString(), "", "success");
                EmptyControls(new WebControl[] { lblPublisherID, txtPublisherName });
                ListView1.DataBind();
            }

            else
            {
                ShowToast(this, dt.Rows[0]["msg"].ToString(), "", "error");
            }
        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");
        }

    }



    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblPublisherID, txtPublisherName });
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;
        DataTable DT = NewDataAccess.PublisherDelete(ID, UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;
        lblPublisherID.Text = ID;
        DataTable DT = NewDataAccess.PublisherGet(lblPublisherID.Text);
        if (DT.Rows.Count > 0)
        {
            txtPublisherName.Text = DT.Rows[0]["Name"].ToString();
        }
    }
}