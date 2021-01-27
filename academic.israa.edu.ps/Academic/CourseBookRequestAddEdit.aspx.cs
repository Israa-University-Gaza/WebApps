using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_CourseBookRequestAddEdit : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lbEmployeeID.Text = EmployeeID;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool Validate = ValidateControls(new WebControl[] { chklCourse, ddlInstructor });
        if (Validate)
        {
            int c = 0, s = 0, f = 0;
            foreach (ListItem item in chklCourse.Items)
            {
                if (item.Selected && item.Value != "-1")
                {
                    {
                        c++;
                        DataTable DT = DataAccess.CourseBookRequestAddEdit(lblRequestID.Text, ddlInstructor.SelectedValue, ddlSemesterID.SelectedValue, item.Value, EmployeeID);
                        //ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
                        if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                            s++;
                        else
                            f++;
                    }

                }
            }
            ListView1.DataBind();
            ShowMsg1("تم حفظ " + s + " ولم يتم حفظ " + f + " من أصل " + c, (f == 0) ? "success" : "error");

        }
        else
        {
            ShowToast(this, "الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "", "error");

        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ddlProgram.SelectedValue = null;
        ddlCollege.SelectedValue = null;
        ddlDepartment.SelectedValue = null;
        chklCourse.SelectedValue = null;
        ddlInstructor.SelectedValue = null;

    }



    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewItem li = (ListViewItem)((LinkButton)sender).Parent;
        string ID = ((Label)li.FindControl("ID")).Text;
        DataTable DT = DataAccess.CourseBookRequestDelete(ID, EmployeeID);
        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }


    protected void ddlFilterInstructor_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void ddlFilterCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
        divMsg1.Visible = (msg != "");
    }

    protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void ddlFilterProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void ddlFilterCollege_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}