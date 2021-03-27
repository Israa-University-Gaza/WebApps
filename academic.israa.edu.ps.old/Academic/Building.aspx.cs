using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_Building : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPermissionsContains("Building"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("BuildingID")).Text;
        DataTable DT = DataAccess.BuildingGet(id);
        if (DT.Rows.Count > 0)
        {
            txtBuildingNum.Text = DT.Rows[0]["BuildingNum"].ToString();
            txtName.Text = DT.Rows[0]["Name"].ToString();
            txtNumOfFloors.Text = DT.Rows[0]["NumOfFloors"].ToString();
            cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
            lblBuildingID.Text = id;
            ListView1.DataBind();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("BuildingID")).Text;
        DataTable DT = DataAccess.BuildingDelete(id, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(),"", (DT.Rows[0]["status"].ToString() != "0") ? "success" : "error");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
   
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { txtName, txtBuildingNum , txtNumOfFloors}))
        {
            if (DataAccess.BuildingAddEdit(lblBuildingID.Text, txtBuildingNum.Text, txtName.Text, txtNumOfFloors.Text, cbActive.Checked, EmployeeID) > 0)
            {
                ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                EmptyControls(new WebControl[] { lblBuildingID, txtName, txtNumOfFloors, cbActive, txtBuildingNum });
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
        EmptyControls(new WebControl[] { lblBuildingID, txtName, txtNumOfFloors, cbActive, txtBuildingNum });
    }

    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("BuildingID")).Text;

        if (DataAccess.BuildingActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
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