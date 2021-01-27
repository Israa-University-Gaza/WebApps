using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_AcademicSectionsMarks : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Permissions.Contains("AcademicSectionStudentsMarks"))
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void btnMarkAllAccreditation_Click(object sender, EventArgs e)
    {
        ListViewItem item = (ListViewItem)((Button)sender).Parent;
        string SectionID = ((Label)item.FindControl("SectionID")).Text;
        DataTable DT = DataAccess.SetSectionMarkAccreditation(SectionID, EmployeeID, 4);
        ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
    }

    protected void btnMarkAllAccreditation1_Click(object sender, EventArgs e)
    {
        ListViewItem item = (ListViewItem)((Button)sender).Parent;
        string SectionID = ((Label)item.FindControl("SectionID")).Text;
        DataTable DT = DataAccess.SetSectionMarkAccreditation(SectionID, EmployeeID, 3);
        ShowMsg1(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
        }
    }
    protected void BtnSaveAll_Click(object sender, EventArgs e)
    {
        int c = 0, s = 0, f = 0;
        foreach (ListViewItem li in ListView1.Items)
        {
            string SectionID = ((Label)li.FindControl("SectionID")).Text;
            if (((CheckBox)li.FindControl("cbAdopt")).Checked)
            {
                c++;
                DataTable DT = DataAccess.SetSectionMarkAccreditation(SectionID, EmployeeID, 4);
                if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                    s++;
                else
                    f++;
            }
        }
        ShowMsg1("تم اعتماد " + s + " ولم يتم اعتماد " + f + " من أصل " + c, (f == 0) ? "success" : "error");
    }

    protected void BtnSaveAll1_Click(object sender, EventArgs e)
    {
        int c = 0, s = 0, f = 0;
        foreach (ListViewItem li in ListView1.Items)
        {
            string SectionID = ((Label)li.FindControl("SectionID")).Text;
            if (((CheckBox)li.FindControl("cbAdopt")).Checked)
            {
                c++;
                DataTable DT = DataAccess.SetSectionMarkAccreditation(SectionID, EmployeeID, 3);
                if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                    s++;
                else
                    f++;
            }
        }
        ShowMsg1("تم اعتماد " + s + " ولم يتم اعتماد " + f + " من أصل " + c, (f == 0) ? "success" : "error");
    }

    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg1.Visible = (msg != "");
    }
}