using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admission_SendSMS : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        int count1 = 0, count2 = 0;
        DataTable DT = DataAccess.GetSectionStudentsMobiles(ddlSection.SelectedValue);
        count1 = DT.Rows.Count;
        if (DT.Rows.Count > 0)
        {
            foreach (DataRow item in DT.Rows)
            {
                bool sendStatus = SendSMS(item["Mobile"].ToString(), txtMessage.Text);
                DataAccess.StdMessageAdd(EmployeeID, item["ID"].ToString(), item["Mobile"].ToString(), txtMessage.Text, sendStatus);
                count2 = count2 + ((sendStatus) ? 1 : 0);
            }
            ShowToast(this, "تم ارسال الرسالة للطلبة", "", "success");
        }
        else
        {
            ShowToast(this, "لا يوجد طلاب", "", "error");
        }
        Label1.Text = count2 + "   /   " + count1;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCourse.DataBind();
        ddlSection.DataBind();
    }

    protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCollege.DataBind();
        ddlDepartment.DataBind();
        ddlCourse.DataBind();
        ddlSection.DataBind();
    }

    protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        ddlDepartment.DataBind();
        ddlCourse.DataBind();
        ddlSection.DataBind();
    }

    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        ddlCourse.DataBind();
        ddlSection.DataBind();
    }
}