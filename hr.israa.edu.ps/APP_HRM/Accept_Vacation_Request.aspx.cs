using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APP_HRM_Accept_Vacation_Request : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlEmpCategoryID.SelectedValue = "-1";
            ddlEmpCategoryID2.Visible = true;
            ddlEmpCategoryID2.SelectedValue = "2";
            Empstatus.SelectedValue = "1041";
        }


        EmployeeID.Text = UserID;
        if (!Permissions.Contains("VacationManagerAdoptFollow"))
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    protected void date_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void Empstatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Empstatus.SelectedValue == "1041")
        {
            ddlEmpCategoryID2.DataBind();
            ddlEmpCategoryID2.Visible = true;
            ddlEmpTermenateReason.Visible = false;
            ddlEmpTermenateReason.SelectedValue = "-1";
        }
        else if (Empstatus.SelectedValue == "1043")

        {
            ddlEmpCategoryID2.Visible = false;
            ddlEmpCategoryID2.SelectedValue = "-1";
            ddlEmpTermenateReason.DataBind();
            ddlEmpTermenateReason.Visible = true;


        }

        else
        {
            ddlEmpCategoryID2.Visible = false;
            ddlEmpCategoryID2.SelectedValue = "-1";
            ddlEmpTermenateReason.Visible = false;
            ddlEmpTermenateReason.SelectedValue = "-1";
        }
        ListView1.DataBind();
    }
    protected void ddlEmpCategoryID_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void btnHRAdopt_Click(object sender, EventArgs e)
    {
        ListViewItem ri = (ListViewItem)((Button)sender).Parent;
        
        string id = ((Label)ri.FindControl("VacationID")).Text;
        if (ValidateControls(new WebControl[] { (RadioButton)ri.FindControl("AcceptHR") }) || ValidateControls(new WebControl[] { (RadioButton)ri.FindControl("RefusedHR") }))
        {
       
            if (((RadioButton)ri.FindControl("AcceptHR")).Checked)
            {
                if (DataAccess.Vacation_Adopt_Request(id, UserID, true) > 0)
                {
                    ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                    ListView1.DataBind();
                  
                }
                else
                    ShowToast(this, "عذرًا , لم يتم الحفظ .", "", "error");
             
            }
            else if (((RadioButton)ri.FindControl("RefusedHR")).Checked)
            {
                if (DataAccess.Vacation_Adopt_Request(id, UserID, false) > 0)
                {
                    ShowToast(this, "تم الحفظ بنجاح.", "", "success");
                    ListView1.DataBind();
                 
                }
                else
                    ShowToast(this, "عذرًا , لم يتم الحفظ .", "", "error");
            }

           
        }
        else
        {
            ShowToast(this, "يرجى اختيار الموافقة او الرفض.", "", "error");
        }
    }

    //protected void AdoptHRM_Click(object sender, EventArgs e)
    //{
    //    ListViewItem ri = (ListViewItem)((Button)sender).Parent;
    //    bool adopt = false;
    //    if (ValidateControls(new WebControl[] { (RadioButton)ri.FindControl("RadioButton1") }) || ValidateControls(new WebControl[] { (RadioButton)ri.FindControl("RadioButton2") }))
    //    {
    //        string id = ((Label)ri.FindControl("VacationID")).Text;
    //        if (((RadioButton)ri.FindControl("RadioButton1")).Checked)
    //        {
    //            adopt = true;
    //        }
    //        else if (((RadioButton)ri.FindControl("RadioButton2")).Checked)
    //        {
    //            adopt = false;
    //        }

    //        if (DataAccess.Vacation_Adopt_Request(id, UserID, adopt) > 0)
    //        {
    //            ShowToast(this, "تم الاعتماد بنجاح.", "", "success");
    //            ListView1.DataBind();
            
    //        }
    //        else
    //            ShowToast(this, "عذرًا , لم يتم الاعتماد .", "", "error");
    //    }
    //    else
    //    {
    //        ShowToast(this, "يرجى اختيار الموافقة او الرفض.", "", "error");
    //    }
    //}
    protected void PrintRequest_Click(object sender, EventArgs e)
    {
        ListViewItem ri = (ListViewItem)((Button)sender).Parent;
        string id = ((Label)ri.FindControl("VacationID")).Text;
        //Response.Redirect("../ReportView.aspx?VacationID="+id);

        ArrayList a1 = new ArrayList();
        a1.Add("VacationRequestReport");
        a1.Add("VacationRequestBalanceReport");
        ArrayList a2 = new ArrayList();

        a2.Add(DataAccess.VacationRequestReport(id));
        a2.Add(DataAccess.VacationRequestBalanceReport(id));
        CreatePDF("VacationRequest", @"Reports\VacationRequest.rdlc", a1, a2);

    }

    private void CreatePDF(string fileName, string reportpath, ArrayList dsNameArray, ArrayList DTArray)
    {
        ReportViewer viwer = new ReportViewer();
        Warning[] warnings = null;
        string[] streamIds = null;
        string mimeType = string.Empty;
        string encoding = string.Empty;
        string extension = string.Empty;
        string filetype = string.Empty;

        viwer.SizeToReportContent = true;
        viwer.LocalReport.ReportPath = reportpath;
        viwer.ProcessingMode = ProcessingMode.Local;

        for (int i = 0; i < dsNameArray.Count; i++)
        {
            ReportDataSource rds1 = new ReportDataSource((string)dsNameArray[i], DTArray[i]);
            viwer.LocalReport.DataSources.Add(rds1);
        }

        viwer.LocalReport.Refresh();


        byte[] bytes = viwer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

        // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
        Response.Buffer = true;
        Response.Clear();
        Response.ContentType = mimeType;
        Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
        Response.BinaryWrite(bytes); // create the file
        Response.Flush(); // send it to the client to download
    }


    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)

    {
       
            ListView1.DataBind();
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ListViewItem ri = (ListViewItem)((LinkButton)sender).Parent;
        string id = ((Label)ri.FindControl("VacationID")).Text;
        Response.Redirect("HRVacationsEdit.aspx?VacationID=" + id);
    }

    protected void btnFilter_Click1(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
}