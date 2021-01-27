using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Instructor_CoursePart : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ValidateControls(new WebControl[] { ddlCourse2, txtPartName }))
        {
            if (DataAccess.CoursePartAddEdit(lblCoursePartID.Text, ddlCourse2.SelectedValue, txtPartName.Text, cbActive.Checked, EmployeeID) > 0)
            {
                ShowMsg2("تم الحفظ بنجاح.", "success");
                EmptyControls(new WebControl[] { lblCoursePartID, ddlCourse2, txtPartName });
                ListView1.DataBind();
            }
            else
            {
                ShowMsg2("عذرًا , لم تتم الحفظ.", "danger");
            }
        }
        else
        {
            ShowMsg2("الرجاء تعبئة الحقول المطلوبة بشكل صحيح.", "danger");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { lblCoursePartID, ddlCourse2, txtPartName });
    }

    protected void cbIsActive_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("CoursePartID")).Text;

        if (DataAccess.CoursePartActivate(id, ((CheckBox)sender).Checked, EmployeeID) > 0)
        {
            ShowMsg1("تمت العملية بنجاح.", "success");
            ListView1.DataBind();
        }
        else
        {
            ShowMsg1("عذرًا , لم تتم العملية.", "error");
        }
    }

    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("CoursePartID")).Text;
        DataTable DT = DataAccess.CoursePartGet(id);
        if (DT.Rows.Count > 0)
        {
            lblCoursePartID.Text = id;
            ddlCourse2.DataBind();
            ddlCourse2.SelectedValue = DT.Rows[0]["CourseID"].ToString();
            txtPartName.Text = DT.Rows[0]["PartName"].ToString();
            cbActive.Checked = Convert.ToBoolean(DT.Rows[0]["IsActive"].ToString());
            ListView1.DataBind();
        }
    }

    protected void lbDelete_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("CoursePartID")).Text;

        if (DataAccess.CoursePartDelete(id, EmployeeID) > 0)
        {
            ShowMsg1("تم الحذف بنجاح.", "success");
            EmptyControls(new WebControl[] { lblCoursePartID, ddlCourse2, txtPartName });
            ListView1.DataBind();
        }
        else
        {
            ShowMsg1("عذرًا , لم تتم الحذف.", "error");
        }
    }

    public void ShowMsg1(string msg = "", string status = "warning")
    {
        lblMsg1.Text = msg;
        divMsg1.Attributes.Add("Class", "alert alert-dismissable alert-top alert-" + status);
        divMsg1.Visible = (msg != "");
    }

    public void ShowMsg2(string msg = "", string status = "warning")
    {
        lblMsg2.Text = msg;
        divMsg2.Attributes.Add("Class", "alert alert-" + status);
        divMsg2.Visible = (msg != "");
    }
}