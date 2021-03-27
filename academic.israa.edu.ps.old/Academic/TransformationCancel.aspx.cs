using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Academic_TransformationCancel : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("BlockPage.aspx");
        //EmpID.Text = EmployeeID;

        //string checkAllScript = "$('#selectAll').click(function (e) {$(this).closest('table').find('td input:checkbox').prop('checked', this.checked);});";
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "temp", "<script language='javascript'>" + checkAllScript + "</script>", false);    
}
    protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCollege.DataBind();
        ddlDepartment.DataBind();
        ListView1.DataBind();
    }

    protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
    {

        ddlDepartment.DataBind();
        ListView1.DataBind();
    }

    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void lbEditTransformation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("StudentID")).Text;
        Session["StudentID"] = id;
        Response.Redirect("~/Academic/Student.aspx#tab3");
    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }



    protected void lbCancelTransformation_Click(object sender, EventArgs e)
    {
        ListViewDataItem item = (ListViewDataItem)((LinkButton)sender).Parent;
        string id = ((Label)item.FindControl("StudentID")).Text;
        DataTable DT = DataAccess.TransformationCancel(id, EmployeeID);

        string r = "https://system.israa.edu.ps/app/UpdateGraduationStatusID?studentId=" + id;
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();

        ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        ListView1.DataBind();
    }

    protected void lbCancelAll_Click(object sender, EventArgs e)
    {
        string id = "";
        int c = 0, s = 0, f = 0;
        foreach (ListViewItem li in ListView1.Items)
        {
            c++;
            id = ((Label)li.FindControl("StudentID")).Text;
            if (((CheckBox)li.FindControl("cbAdopt")).Checked)
            {
                DataTable DT = DataAccess.TransformationCancel(id, EmployeeID);
                if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                    s++;
                else
                    f++;
            }
            else
                f++;
        }
        ShowToast(this, "تم ارجاع " + s + " ولم يتم ارجاع " + f + " من أصل " + c, "", (f == 0) ? "success" : "error");

        string r = "https://system.israa.edu.ps/app/UpdateGraduationStatusID?studentId=" + id;
        HttpWebRequest request = WebRequest.Create(r) as HttpWebRequest;
        //optional
        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
        Stream stream = response.GetResponseStream();
        ListView1.DataBind();
    }
}