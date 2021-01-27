using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Instructor_SectionStudentsWorkMarks : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnView_Click(object sender, EventArgs e)
    {
       // Repeater1.DataBind();
        ListView1.DataBind();
    }

    protected void btnSaveMark_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((Button)sender).Parent;
        string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
        TextBox txtMark1 = (TextBox)item.FindControl("txtMark1");
        TextBox txtMark2 = (TextBox)item.FindControl("txtMark2");
        TextBox txtMark3 = (TextBox)item.FindControl("txtMark3");
        TextBox txtMark4 = (TextBox)item.FindControl("txtMark4");
        TextBox txtMark5 = (TextBox)item.FindControl("txtMark5");
        TextBox txtMark6 = (TextBox)item.FindControl("txtMark6");

        ListViewItem li = ListView2.Items[0];
        int lblMark1 = Convert.ToInt16(((Label)li.FindControl("lblMark1")).Text);
        int lblMark2 = Convert.ToInt16(((Label)li.FindControl("lblMark2")).Text);
        int lblMark3 = Convert.ToInt16(((Label)li.FindControl("lblMark3")).Text);
        int lblMark4 = Convert.ToInt16(((Label)li.FindControl("lblMark4")).Text);
        int lblMark5 = Convert.ToInt16(((Label)li.FindControl("lblMark5")).Text);
        int lblMark6 = Convert.ToInt16(((Label)li.FindControl("lblMark6")).Text);

        bool valid1 = ValidateMarks(new TextBox[] { txtMark1, txtMark2, txtMark3, txtMark4, txtMark5, txtMark6 });
        bool valid2 = ValidateMark(txtMark1, lblMark1) & ValidateMark(txtMark2, lblMark2) & ValidateMark(txtMark3, lblMark3) & ValidateMark(txtMark4, lblMark4) & ValidateMark(txtMark5, lblMark5) & ValidateMark(txtMark6, lblMark6);
        if (valid1 && valid2)
        {
            DataTable DT = DataAccess.WorkMarkAddEdit(StdSectionID, txtMark1.Text, txtMark2.Text, txtMark3.Text, txtMark4.Text, txtMark5.Text, txtMark6.Text, EmployeeID);
            ShowMsg(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
            if (DT.Rows[0]["status"].ToString() != "0")
            {
                ListView1.DataBind();
             //   Repeater1.DataBind();
            }
        }
        else
        {
            ShowMsg("الرجاء إدخال العلامة بالشكل الصحيح", "danger");
        }
    }

    protected void btnSaveMarks_Click(object sender, EventArgs e)
    {
        int s = 0, f = 0;
        foreach (ListViewItem item in ListView1.Items)
        {
            string StdSectionID = ((Label)item.FindControl("StdSectionID")).Text;
            TextBox txtMark1 = (TextBox)item.FindControl("txtMark1");
            TextBox txtMark2 = (TextBox)item.FindControl("txtMark2");
            TextBox txtMark3 = (TextBox)item.FindControl("txtMark3");
            TextBox txtMark4 = (TextBox)item.FindControl("txtMark4");
            TextBox txtMark5 = (TextBox)item.FindControl("txtMark5");
            TextBox txtMark6 = (TextBox)item.FindControl("txtMark6");

            ListViewItem li = (ListViewItem)ListView2.Items[0];
            int lblMark1 = Convert.ToInt16(((Label)li.FindControl("lblMark1")).Text);
            int lblMark2 = Convert.ToInt16(((Label)li.FindControl("lblMark2")).Text);
            int lblMark3 = Convert.ToInt16(((Label)li.FindControl("lblMark3")).Text);
            int lblMark4 = Convert.ToInt16(((Label)li.FindControl("lblMark4")).Text);
            int lblMark5 = Convert.ToInt16(((Label)li.FindControl("lblMark5")).Text);
            int lblMark6 = Convert.ToInt16(((Label)li.FindControl("lblMark6")).Text);

            bool valid1 = ValidateMarks(new TextBox[] { txtMark1, txtMark2, txtMark3, txtMark4, txtMark5, txtMark6 });
            bool valid2 = ValidateMark(txtMark1, lblMark1) & ValidateMark(txtMark2, lblMark2) & ValidateMark(txtMark3, lblMark3) & ValidateMark(txtMark4, lblMark4) & ValidateMark(txtMark5, lblMark5) & ValidateMark(txtMark6, lblMark6);
            if (valid1 && valid2)
            {
                DataTable DT = DataAccess.WorkMarkAddEdit(StdSectionID, txtMark1.Text, txtMark2.Text, txtMark3.Text, txtMark4.Text, txtMark5.Text, txtMark6.Text, EmployeeID);
                ShowMsg(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
                if (DT.Rows[0]["status"].ToString() != "0") { s++; } else { f++; }
            }
            else
            {
                f++;
            }
        }

        ShowMsg("تم حفظ " + s + " درجة بنجاح ,,, " + "لم يتم حفظ " + f + " درجة ", (f == 0) ? "success" : "danger");
        if (f == 0)
        {
          //  Repeater1.DataBind();
            ListView1.DataBind();
        }
    }


    protected void btnMarkAccreditation_Click(object sender, EventArgs e)
    {
        DataTable DT = DataAccess.SetWorkMarkAccreditation(ddlSection.SelectedValue, EmployeeID);
        ShowMsg(DT.Rows[0]["msg"].ToString(), (DT.Rows[0]["status"].ToString() != "0") ? "success" : "danger");
        if (DT.Rows[0]["status"].ToString() != "0")
        {
            ListView1.DataBind();
            //Repeater1.DataBind();
        }
    }

    protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSection.DataBind();
       // Repeater1.DataBind();
        ListView1.DataBind();
    }

    protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
    {
       // Repeater1.DataBind();
        ListView1.DataBind();
    }

    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-" + status + " alert-top");
        divMsg.Visible = (msg != "");
    }

    protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCourse.DataBind();
        ddlSection.DataBind();
        ListView1.DataBind();
    }

    public static bool ValidateMark(TextBox txtMark, int MarkValue)
    {
        bool valid = true;
        try
        {
            if (txtMark.Text != "")
            {
                if (Convert.ToDouble(txtMark.Text) >= 0 && Convert.ToDouble(txtMark.Text) <= MarkValue)
                {
                    txtMark.CssClass = txtMark.CssClass.Replace(" isra-error", "");
                }
                else
                {
                    valid = false;
                    txtMark.CssClass += " isra-error";
                }
            }
        }
        catch (Exception ex)
        {
            valid = false;
            txtMark.CssClass += " isra-error";
        }
        return valid;
    }


    public static bool ValidateMarks(TextBox[] txtMarks)
    {
        bool valid = true;

        foreach (TextBox txt in txtMarks)
        {
            if (txt.Visible && txt.Enabled)
            {
                if (txt.Text != "")
                    return valid;
            }
        }

        foreach (TextBox txt in txtMarks)
        {
            if (txt.Visible && txt.Enabled)
            {
                valid = false;
                txt.CssClass += " isra-error";
            }
        }

        return valid;
    }
}