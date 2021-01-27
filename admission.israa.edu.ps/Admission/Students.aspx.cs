using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class Admission_Students : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPermissionsContains("Students"))
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void lbOpenStudent_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Response.Redirect("~/Admission/Student.aspx?id=" + ((Label)item.FindControl("StudentID")).Text );
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("StudentID")).Text;
        if (DataAccess.stdCardRecivedEdit(id, ((CheckBox)item.FindControl("CheckBox1")).Checked) > 0)
        {
            ShowToast(this, "تم حفظ التعديل", "", "success");
            ListView1.DataBind();
        }
        else ShowToast(this, "لم يتم حفظ التعديل", "", "error");
    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("StudentID")).Text;
        if (DataAccess.stdBagRecivedEdit(id, ((CheckBox)item.FindControl("CheckBox2")).Checked) > 0)
        {
            ShowToast(this, "تم حفظ التعديل", "", "success");
            ListView1.DataBind();
        }
        else ShowToast(this, "لم يتم حفظ التعديل", "", "error");
    }


    protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((CheckBox)sender).Parent;
        string id = ((Label)item.FindControl("StudentID")).Text;
        if (DataAccess.StdCertificateRecieved(id, ((CheckBox)item.FindControl("CheckBox3")).Checked) > 0)
        {
            ShowToast(this, "تم حفظ التعديل", "", "success");
            ListView1.DataBind();
        }
        else ShowToast(this, "لم يتم حفظ التعديل", "", "error");
    }

    protected void LinkButtonTest_OnClick(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        Response.Redirect("~/Admission/Student.aspx?id=" + ((Label)item.FindControl("StudentID")).Text + "&tab=1");
    }

    protected void LinkButton1_OnClick(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;

        var TawjehyNo = ((Label)item.FindControl("TawjehyNo")).Text;
        var StudentID = ((Label)item.FindControl("StudentID")).Text;
        var StudentNo = ((Label)item.FindControl("StudentNo")).Text;







        WebClient we = new WebClient();
        we.Encoding = Encoding.UTF8;
        var jason = we.DownloadString("https://system.israa.edu.ps/app/govServices?studentId=" + StudentID);





        Response.Redirect("http://admissionapp.israa.edu.ps?TawjehyNo=" + TawjehyNo + "&StudentNo="+ StudentNo);


    }
}