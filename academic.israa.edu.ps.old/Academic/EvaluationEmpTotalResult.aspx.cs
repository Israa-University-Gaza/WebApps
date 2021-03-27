using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_EvaluationEmpTotalResult :UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = EmployeeID;
    }
    protected void ExportToExcel(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Evaluation.xls");
        Response.BufferOutput = true;
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        Response.Charset = "UTF-8";
        EnableViewState = false;
        Response.ContentType = "application/vnd.ms-excel";
        HttpContext.Current.Response.Write("<font style='font-size:10.0pt; font-family:Calibri;'>");
        HttpContext.Current.Response.Write("<BR><BR><BR>");
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
        Repeater2.RenderControl(htmlWrite);
        Response.Write("<table>");
        Response.Write(stringWrite.ToString());
        Response.Write("</table>");
        Response.End();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repeater2.DataBind();
    }

    protected void lbAccept_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string EmpID = ((Label)item.FindControl("EmployeeID")).Text;
        if (EmployeeID == "1004")
        {
            DataTable DTAcadmic = DataAccess.EmployeeQAnswerAcadmicAccredit(EmpID, "5", EmployeeID);
            ShowToast(this, DTAcadmic.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DTAcadmic.Rows[0]["status"].ToString()) > 0) ? "success" : "error");

        }
        else
        {
            DataTable DT = DataAccess.EmployeeQAnswerDeanAccredit(EmpID, "5", EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        }
    }
 

    //protected void BtnSaveAll_Click(object sender, EventArgs e)
    //{
    //    int c = 0, s = 0, f = 0;
    //    foreach (ListViewItem li in ListView1.Items)
    //    {
    //        string SectionID = ((Label)li.FindControl("SectionID")).Text;
    //        if (((CheckBox)li.FindControl("cbAdopt")).Checked)
    //        {
    //            c++;
    //            DataTable DT = DataAccess.SetSectionMarkAccreditation(SectionID, EmployeeID, 4);
    //            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
    //                s++;
    //            else
    //                f++;
    //        }
    //    }
    //    ListView1.DataBind();
    //    ShowMsg1("تم اعتماد " + s + " ولم يتم اعتماد " + f + " من أصل " + c, (f == 0) ? "success" : "error");
    //}

    //protected void BtnSaveAll1_Click(object sender, EventArgs e)
    //{
    //    int c = 0, s = 0, f = 0;
    //    foreach (ListViewItem li in ListView1.Items)
    //    {
    //        string SectionID = ((Label)li.FindControl("SectionID")).Text;
    //        if (((CheckBox)li.FindControl("cbAdopt")).Checked)
    //        {
    //            c++;
    //            DataTable DT = DataAccess.SetSectionMarkAccreditation(SectionID, EmployeeID, 3);
    //            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
    //                s++;
    //            else
    //                f++;
    //        }
    //    }
    //    ListView1.DataBind();
    //    ShowMsg1("تم اعتماد " + s + " ولم يتم اعتماد " + f + " من أصل " + c, (f == 0) ? "success" : "error");
    //}

    //public void ShowMsg1(string msg = "", string status = "warning")
    //{
    //    lblMsg1.Text = msg;
    //    divMsg1.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable std-profile-msg");
    //    divMsg1.Visible = (msg != "");
    //}


    protected void btnAcademicAllAccreditation_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string EmpID = ((Label)item.FindControl("EmployeeID")).Text;
        if (EmployeeID == "1004")
        {
            DataTable DTAcadmic = DataAccess.EmployeeQAnswerAcadmicAccredit(EmpID, "5", EmployeeID);
            ShowToast(this, DTAcadmic.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DTAcadmic.Rows[0]["status"].ToString()) > 0) ? "success" : "error");

        }
        else
        {
            ShowToast(this, "الاعتماد يكون من خلال النائب الاكاديمي", "", "error");
        }
       
    }

    protected void btnDeanAllAccreditation1_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((Button)sender).Parent;
        string EmpID = ((Label)item.FindControl("EmployeeID")).Text;
        if (EmployeeID != "1004")
        {
            DataTable DT = DataAccess.EmployeeQAnswerDeanAccredit(EmpID, "5", EmployeeID);
            ShowToast(this, DT.Rows[0]["msg"].ToString(), "", (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "error");
        }
        else
        {
            ShowToast(this, "الاعتماد يكون من خلال العميد", "", "error");
        }
    }
}