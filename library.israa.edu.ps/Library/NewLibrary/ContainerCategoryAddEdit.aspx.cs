using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_NewLibrary_ContainerCategoryAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool DecimalValidate = DecimalValidateControls(new WebControl[] { txtNumberFrom, txtNumberTo });
        bool Validate = ValidateControls(new WebControl[] { txtName, txtNumberFrom, txtNumberTo });
        if (Validate && DecimalValidate)
        {
            DataTable DT = NewDataAccess.ContainerCategoryAddEdit(lblContainerCategoryID.Text, txtName.Text, txtNumberFrom.Text, txtNumberTo.Text, UserID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
            {
                EmptyControls(new WebControl[] { lblContainerCategoryID, txtName, txtNumberFrom, txtNumberTo });
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
        EmptyControls(new WebControl[] { lblContainerCategoryID, txtName, txtNumberFrom, txtNumberTo });
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ContainerCategoryID")).Text;
        lblContainerCategoryID.Text = ID;
        DataTable DT = NewDataAccess.ContainerCategoryGet(lblContainerCategoryID.Text);
        if (DT.Rows.Count > 0)
        {
            txtName.Text = DT.Rows[0]["Name"].ToString();
            txtNumberFrom.Text = DT.Rows[0]["NumberFrom"].ToString();
            txtNumberTo.Text = DT.Rows[0]["NumberTo"].ToString();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ContainerCategoryID")).Text;
        DataTable DT = NewDataAccess.ContainerCategoryDelete(ID, UserID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }
}