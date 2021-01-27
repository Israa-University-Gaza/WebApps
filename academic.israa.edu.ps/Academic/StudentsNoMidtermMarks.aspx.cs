using System;
using Microsoft.Reporting.WebForms;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_StudentsNoMidtermMarks : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            lblEmployeeID.Text = EmployeeID;
            ddlDepartment.DataBind();
            ddlDepartment.Items.Insert(0, new ListItem("الكل", "-1"));

        }

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void btnMarkAcademicUnaccreditation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.SetMarkUnaccreditation(StdSectionID, 4);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();

        }
    }
    protected void btnMarkAcademicAccreditation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.SetMarkAccreditation(StdSectionID, 4, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            //SendSMS(DT.Rows[0]["jawwal"].ToString(), DT.Rows[0]["smstext"].ToString());
            ListView1.DataBind();
        }
    }
    protected void btnMarkUnaccreditation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.SetMarkUnaccreditation(StdSectionID, 3);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();

        }
    }
    protected void btnMarkAccreditation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        DataTable DT = DataAccess.SetMarkAccreditation(StdSectionID, 3, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            //SendSMS(DT.Rows[0]["jawwal"].ToString(), DT.Rows[0]["smstext"].ToString());
            ListView1.DataBind();
        }
    }


    protected void btnAcrreditAll_Click(object sender, EventArgs e)
    {
        int c = 0, s = 0, f = 0;
        List<string> ids = new List<string>();
        foreach (ListViewItem li in ListView1.Items)
        {
            string StdSectionID = ((Label)li.FindControl("StdSectionID")).Text;
            if (((CheckBox)li.FindControl("cbAdopt")).Checked)
            {
                ids.Add(StdSectionID);

            }
        }
        DataTable DT = DataAccess.SetMarkAccreditationAll(ids, 4, EmployeeID);

        c = DT.Rows.Count;
        s = DT.Rows.OfType<DataRow>().Count(x => x.Field<int>("status") == 1);
        f = DT.Rows.OfType<DataRow>().Count(x => x.Field<int>("status") == 0);

        ListView1.DataBind();
        ShowMsg1("تم اعتماد " + s + " ولم يتم اعتماد " + f + " من أصل " + c, (f == 0) ? "success" : "error");
    }

    protected void btnUnAcrreditAll_Click(object sender, EventArgs e)
    {
        int c = 0, s = 0, f = 0;
        List<string> ids = new List<string>();
        foreach (ListViewItem li in ListView1.Items)
        {
            string StdSectionID = ((Label)li.FindControl("StdSectionID")).Text;
            if (((CheckBox)li.FindControl("cbAdopt")).Checked)
            {
                ids.Add(StdSectionID);

            }
        }
        DataTable DT = DataAccess.SetMarkUnAccreditationAll(ids, 4);

        c = DT.Rows.Count;
        s = DT.Rows.OfType<DataRow>().Count(x => x.Field<int>("status") == 1);
        f = DT.Rows.OfType<DataRow>().Count(x => x.Field<int>("status") ==0);

        ListView1.DataBind();
        ShowMsg1("تم ارجاع " + s + " ولم يتم ارجاع " + f + " من أصل " + c, (f == 0) ? "success" : "error");
    }

    protected void btnDeanAcrreditAll_Click(object sender, EventArgs e)
    {
        int c = 0, s = 0, f = 0;
        List<string> ids = new List<string>();
        foreach (ListViewItem li in ListView1.Items)
        {
            string StdSectionID = ((Label)li.FindControl("StdSectionID")).Text;
            if (((CheckBox)li.FindControl("cbAdopt")).Checked)
            {
                ids.Add(StdSectionID);

            }
        }
        DataTable DT = DataAccess.SetMarkAccreditationAll(ids, 3, EmployeeID);

        c = DT.Rows.Count;
        s = DT.Rows.OfType<DataRow>().Count(x => x.Field<int>("status") == 1);
        f = DT.Rows.OfType<DataRow>().Count(x => x.Field<int>("status") == 0);

        ListView1.DataBind();
        ShowMsg1("تم اعتماد " + s + " ولم يتم اعتماد " + f + " من أصل " + c, (f == 0) ? "success" : "error");
    }

  
    protected void btnDeanUnAcrreditAll_Click(object sender, EventArgs e)
    {
        int c = 0, s = 0, f = 0;
        List<string> ids = new List<string>();
        foreach (ListViewItem li in ListView1.Items)
        {
            string StdSectionID = ((Label)li.FindControl("StdSectionID")).Text;
            if (((CheckBox)li.FindControl("cbAdopt")).Checked)
            {
                ids.Add(StdSectionID);

            }
        }
        DataTable DT = DataAccess.SetMarkUnAccreditationAll(ids, 3);

        c = DT.Rows.Count;
        s = DT.Rows.OfType<DataRow>().Count(x => x.Field<int>("status") == 1);
        f = DT.Rows.OfType<DataRow>().Count(x => x.Field<int>("status") == 0);

        ListView1.DataBind();
        ShowMsg1("تم ارجاع " + s + " ولم يتم ارجاع " + f + " من أصل " + c, (f == 0) ? "success" : "error");
    }

    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg1.Visible = (msg != "");
    }

}